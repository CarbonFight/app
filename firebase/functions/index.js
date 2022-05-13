const functions = require("firebase-functions");
const admin = require('firebase-admin');
const { write } = require("firebase-functions/logger");
admin.initializeApp();



// Setup initial values for new users
exports.createdUserDefaultData = functions.region('europe-west6').auth.user().onCreate(async (user) => {
  
  // Default values for userStats table
  try {
    await admin.firestore().collection('usersStats').add({
      day0: 0,
      day1: 0,
      day2: 0,
      day3: 0,
      day4: 0,
      day5: 0,
      day6: 0,

      week0: 0,
      week1: 0,
      week2: 0,
      week3: 0,

      month0: 0,
      month1: 0,
      month2: 0,
      month3: 0,

      transportDay0: 0,
      energyDay0: 0,
      foodDay0: 0,

      periodics: 0,

      uid: user.uid
    });
  }
  catch (e) {
    console.error(new Error('createdUserDefaultData : Failed initializing default userStats values'));
    throw new Error('createdUserDefaultData : Failed initializing default userStats values');
  }

  // Generates default cache
  try {
    // Timestamp generation
    const timestamp = new Date();
    const day = ((timestamp.getMonth() + 1) + '/' + timestamp.getDate() + '/' + timestamp.getFullYear());

    // Find user Ref and generate new cache
    var intialdata_query = admin.firestore().collection('users').where('uid','==',user.uid);
    intialdata_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(async function(doc) {
        
        // Generate new Cache
        await admin.firestore().collection('actionCache').add({
          co2e: 0,
          date: timestamp,
          day: day,
          user: doc.ref
        });

        // Set default values
        doc.ref.update({global_score: 0});
        doc.ref.update({level: 1});
        doc.ref.update({activity: 0});
        doc.ref.update({rank: 1});
        doc.ref.update({rank_size: 1});
        doc.ref.update({co2target: 12});
      });
    });
  }
  catch (e) {
    console.error(new Error('createdUserDefaultData : Failed createing cache'));
    throw new Error('createdUserDefaultData : Failed createing cache');
  }
});



// When firebase authentication user is deleted, deletes all data : Actions / Periodics / Stats / Users
exports.deletedUserFlushData = functions.region('europe-west6').auth.user().onDelete(async (user) => {
  
  // Generates default cache
  try {
    // Deletes all Transport Action
    var jobskill_query = admin.firestore().collection('transportActions').where('userId','==',user.uid);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });

    // Deletes all Energy Action
    var jobskill_query = admin.firestore().collection('energyActions').where('userId','==',user.uid);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });

    // Deletes all Food Action
    var jobskill_query = admin.firestore().collection('foodActions').where('userId','==',user.uid);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });

    // Deletes all Energy Periodics
    var jobskill_query = admin.firestore().collection('energyPeriodics').where('userId','==',user.uid);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });

    // Deletes all users data
    var jobskill_query = admin.firestore().collection('users').where('uid','==',user.uid);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });

    // Deletes all stats data
    var jobskill_query = admin.firestore().collection('usersStats').where('uid','==',user.uid);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });
  }
  catch (e) {
    console.error(new Error('deletedUserFlushData : cleaning data'));
    throw new Error('deletedUserFlushData : cleaning data');
  }
});


exports.updateRanks = functions.region('europe-west6').firestore.document('/users/{documentId}').onWrite(async (change, context) => {

  try {
    // Retrieve level, before change if delete, after change if update/create.
    const level = change.after.exists ? change.after.data().level : change.before.data().level;

    // Retrieve all users with the same level
    var rank = 1;
    await admin.firestore()      
    .collection('users')
    .where('level', '==', level)
    .orderBy("global_score", "asc")
    .get()
    .then(function(querySnapshot) {
        var rank_size = querySnapshot.size;
        querySnapshot.forEach(function(doc) {
            
            doc.ref.update(
              {rank: rank},
            );
            // Needs refacto
            doc.ref.update(
              {rank_size: rank_size}
            );
            rank++; // Increment rank for next user
        });
    });
  }
  catch (e) {
    console.error(new Error('updateRanks : failed'));
    throw new Error('updateRanks : failed');
  }
});


exports.updateScoreTransport = functions.region('europe-west6').firestore.document('/transportActions/{documentId}').onWrite(async (change, context) => {
  try {
    // Retrieve userId, before change if delete, after change if update/create.
    const userId = change.after.exists ? change.after.data().userId : change.before.data().userId;
    await reCalculateActions(userId);
  }
  catch (e) {
    console.error(new Error('updateScoreTransport : failed'));
    throw new Error('updateScoreTransport : failed');
  }
});

exports.updateScoreFood = functions.region('europe-west6').firestore.document('/foodActions/{documentId}').onWrite(async (change, context) => {
  try {
    // Retrieve userId, before change if delete, after change if update/create.
    const userId = change.after.exists ? change.after.data().userId : change.before.data().userId;
    await reCalculateActions(userId);
  }
  catch (e) {
    console.error(new Error('updateScoreFood : failed'));
    throw new Error('updateScoreFood : failed');
  }
});

exports.updateScoreEnergy = functions.region('europe-west6').firestore.document('/energyActions/{documentId}').onWrite(async (change, context) => {
  try {
    // Retrieve userId, before change if delete, after change if update/create.
    const userId = change.after.exists ? change.after.data().userId : change.before.data().userId;
    await reCalculateActions(userId);
  }
  catch (e) {
    console.error(new Error('updateScoreEnergy : failed'));
    throw new Error('updateScoreEnergy : failed');
  }
});

async function reCalculateActions(userId) {
  
  // Set Paris Timezone (default is UTC, even if function TimeZone is Paris)
  process.env.TZ = 'Europe/Paris' 

  var global_score = 0;
  var activity = 0;
  var level = 1;

  //// Stats update
  // Initialize
  var day0 = 0;
  var day1 = 0;
  var day2 = 0;
  var day3 = 0;
  var day4 = 0;
  var day5 = 0;
  var day6 = 0;

  var week0 = 0;
  var week1 = 0;
  var week2 = 0;
  var week3 = 0;

  var month0 = 0;
  var month1 = 0;
  var month2 = 0;
  var month3 = 0;

  var transportDay0 = 0;
  var energyDay0 = 0;
  var foodDay0 = 0;

  // Calculate periods
  var dateDay0 = new Date(); dateDay0.setHours(0,0,0,0);
  var dateDay1 = new Date(new Date().setDate(dateDay0.getDate() - 1)); dateDay1.setHours(0,0,0,0)
  var dateDay2 = new Date(new Date().setDate(dateDay0.getDate() - 2)); dateDay2.setHours(0,0,0,0)
  var dateDay3 = new Date(new Date().setDate(dateDay0.getDate() - 3)); dateDay3.setHours(0,0,0,0)
  var dateDay4 = new Date(new Date().setDate(dateDay0.getDate() - 4)); dateDay4.setHours(0,0,0,0)
  var dateDay5 = new Date(new Date().setDate(dateDay0.getDate() - 5)); dateDay5.setHours(0,0,0,0)
  var dateDay6 = new Date(new Date().setDate(dateDay0.getDate() - 6)); dateDay6.setHours(0,0,0,0)
  var dateDay7 = new Date(new Date().setDate(dateDay0.getDate() - 7)); dateDay7.setHours(0,0,0,0)

  var dateweek0 = new Date(new Date().setDate(dateDay0.getDate() - dateDay0.getDay() +1)); dateweek0.setHours(0,0,0,0)
  var dateweek1 = new Date(new Date().setDate(dateweek0.getDate() - 7)); dateweek1.setHours(0,0,0,0)
  var dateweek2 = new Date(new Date().setDate(dateweek0.getDate() - 14)); dateweek2.setHours(0,0,0,0)
  var dateweek3 = new Date(new Date().setDate(dateweek0.getDate() - 21)); dateweek3.setHours(0,0,0,0)

  y = dateDay0.getFullYear(), m = dateDay0.getMonth();
  var datemonth0 = new Date(y, m, 1); datemonth0.setHours(0,0,0,0)
  var datemonth1 = new Date(y, m-1, 1); datemonth1.setHours(0,0,0,0)
  var datemonth2 = new Date(y, m-2, 1); datemonth2.setHours(0,0,0,0)
  var datemonth3 = new Date(y, m-3, 1); datemonth3.setHours(0,0,0,0)


  const tranportActions = await admin.firestore()      
  .collection('transportActions')
  .where('userId', '==', userId)
  .get();

  const energyActions = await admin.firestore()      
  .collection('energyActions')
  .where('userId', '==', userId)
  .get();

  const foodActions = await admin.firestore()      
  .collection('foodActions')
  .where('userId', '==', userId)
  .get();


  // Calculate day_score & global_score
  tranportActions.forEach(doc => {
    actionDate = new Date(doc.get("created_time").toDate());

    if (actionDate >= dateDay0) { 
      day0 += doc.get("co2e");
      transportDay0 += doc.get("co2e");
    }
    else if (actionDate >= dateDay1 && actionDate < dateDay0) { day1 += doc.get("co2e"); }
    else if (actionDate >= dateDay2 && actionDate < dateDay1) { day2 += doc.get("co2e"); }
    else if (actionDate >= dateDay3 && actionDate < dateDay2) { day3 += doc.get("co2e"); }
    else if (actionDate >= dateDay4 && actionDate < dateDay3) { day4 += doc.get("co2e"); }
    else if (actionDate >= dateDay5 && actionDate < dateDay4) { day5 += doc.get("co2e"); }
    else if (actionDate >= dateDay6 && actionDate < dateDay5) { day6 += doc.get("co2e"); }

    if (actionDate >= dateweek0) { week0 += doc.get("co2e"); }
    else if (actionDate >= dateweek1 && actionDate < dateweek0) { week1 += doc.get("co2e"); }
    else if (actionDate >= dateweek2 && actionDate < dateweek1) { week2 += doc.get("co2e"); }
    else if (actionDate >= dateweek3 && actionDate < dateweek2) { week3 += doc.get("co2e"); }

    if (actionDate >= datemonth0) { month0 += doc.get("co2e"); }
    else if (actionDate >= datemonth1 && actionDate < datemonth0) { month1 += doc.get("co2e"); }
    else if (actionDate >= datemonth2 && actionDate < datemonth1) { month2 += doc.get("co2e"); }
    else if (actionDate >= datemonth3 && actionDate < datemonth2) { month3 += doc.get("co2e"); }

    global_score += doc.get("co2e");
    activity += 1;

  });
  energyActions.forEach(doc => {
    actionDate = new Date(doc.get("created_time").toDate());

    if (actionDate >= dateDay0) { 
      day0 += doc.get("co2e");
      energyDay0 += doc.get("co2e");
    }
    else if (actionDate >= dateDay1 && actionDate < dateDay0) { day1 += doc.get("co2e"); }
    else if (actionDate >= dateDay2 && actionDate < dateDay1) { day2 += doc.get("co2e"); }
    else if (actionDate >= dateDay3 && actionDate < dateDay2) { day3 += doc.get("co2e"); }
    else if (actionDate >= dateDay4 && actionDate < dateDay3) { day4 += doc.get("co2e"); }
    else if (actionDate >= dateDay5 && actionDate < dateDay4) { day5 += doc.get("co2e"); }
    else if (actionDate >= dateDay6 && actionDate < dateDay5) { day6 += doc.get("co2e"); }

    if (actionDate >= dateweek0) { week0 += doc.get("co2e"); }
    else if (actionDate >= dateweek1 && actionDate < dateweek0) { week1 += doc.get("co2e"); }
    else if (actionDate >= dateweek2 && actionDate < dateweek1) { week2 += doc.get("co2e"); }
    else if (actionDate >= dateweek3 && actionDate < dateweek2) { week3 += doc.get("co2e"); }

    if (actionDate >= datemonth0) { month0 += doc.get("co2e"); }
    else if (actionDate >= datemonth1 && actionDate < datemonth0) { month1 += doc.get("co2e"); }
    else if (actionDate >= datemonth2 && actionDate < datemonth1) { month2 += doc.get("co2e"); }
    else if (actionDate >= datemonth3 && actionDate < datemonth2) { month3 += doc.get("co2e"); }

    global_score += doc.get("co2e");
    activity += 1;
  });
  foodActions.forEach(doc => {
    actionDate = new Date(doc.get("created_time").toDate());

    if (actionDate >= dateDay0) { 
      day0 += doc.get("co2e");
      foodDay0 += doc.get("co2e");
    }
    else if (actionDate >= dateDay1 && actionDate < dateDay0) { day1 += doc.get("co2e"); }
    else if (actionDate >= dateDay2 && actionDate < dateDay1) { day2 += doc.get("co2e"); }
    else if (actionDate >= dateDay3 && actionDate < dateDay2) { day3 += doc.get("co2e"); }
    else if (actionDate >= dateDay4 && actionDate < dateDay3) { day4 += doc.get("co2e"); }
    else if (actionDate >= dateDay5 && actionDate < dateDay4) { day5 += doc.get("co2e"); }
    else if (actionDate >= dateDay6 && actionDate < dateDay5) { day6 += doc.get("co2e"); }

    if (actionDate >= dateweek0) { week0 += doc.get("co2e"); }
    else if (actionDate >= dateweek1 && actionDate < dateweek0) { week1 += doc.get("co2e"); }
    else if (actionDate >= dateweek2 && actionDate < dateweek1) { week2 += doc.get("co2e"); }
    else if (actionDate >= dateweek3 && actionDate < dateweek2) { week3 += doc.get("co2e"); }

    if (actionDate >= datemonth0) { month0 += doc.get("co2e"); }
    else if (actionDate >= datemonth1 && actionDate < datemonth0) { month1 += doc.get("co2e"); }
    else if (actionDate >= datemonth2 && actionDate < datemonth1) { month2 += doc.get("co2e"); }
    else if (actionDate >= datemonth3 && actionDate < datemonth2) { month3 += doc.get("co2e"); }

    global_score += doc.get("co2e");
    activity += 1;
  });

  // Set Level
  if (activity >= 0 && activity < 10) {
    level = 1
  }
  else if (activity >= 10 && activity < 20) {
    level = 2
  }
  else if (activity >= 20) {
    level = 3
  }

  // Update in user table
  await admin.firestore()      
  .collection('users')
  .where('uid', '==', userId)
  .limit(1)
  .get()
  .then(query => {
    const thing = query.docs[0];
    let tmp = thing.data();
    
    tmp.global_score = global_score;
    tmp.activity = activity;
    tmp.level = level;
    
    thing.ref.update(tmp);
  });

    // Update in user table
    await admin.firestore()      
    .collection('usersStats')
    .where('uid', '==', userId)
    .limit(1)
    .get()
    .then(query => {
      const thing = query.docs[0];
      let tmp = thing.data();
      
      tmp.day0 = day0;
      tmp.day1 = day1;
      tmp.day2 = day2;
      tmp.day3 = day3;
      tmp.day4 = day4;
      tmp.day5 = day5;
      tmp.day6 = day6;

      tmp.week0 = week0;
      tmp.week1 = week1;
      tmp.week2 = week2;
      tmp.week3 = week3;

      tmp.month0 = month0;
      tmp.month1 = month1;
      tmp.month2 = month2;
      tmp.month3 = month3;

      tmp.transportDay0 = transportDay0;
      tmp.energyDay0 = energyDay0;
      tmp.foodDay0 = foodDay0;

      thing.ref.update(tmp);
    });
}

exports.updateScorePeriodics = functions.region('europe-west6').firestore.document('/energyPeriodics/{documentId}').onWrite(async (change, context) => {

  try {
    // Retrieve userId, before change if delete, after change if update/create.
    const userId = change.after.exists ? change.after.data().userId : change.before.data().userId;
    
    var periodics = 0;

    const energyPeriodics = await admin.firestore()      
    .collection('energyPeriodics')
    .where('userId', '==', userId)
    .get();

    // Calculate day_score & global_score
    energyPeriodics.forEach(doc => {
      periodics += doc.get("co2e"); 
    });

    // Update in user table
    await admin.firestore()      
    .collection('usersStats')
    .where('uid', '==', userId)
    .limit(1)
    .get()
    .then(query => {
      const thing = query.docs[0];
      let tmp = thing.data();
      
      tmp.periodics = periodics;

      thing.ref.update(tmp);
    });
  }
  catch (e) {
    console.error(new Error('updateScorePeriodics : failed'));
    throw new Error('updateScorePeriodics : failed');
  }

});


// At midnight : Reset users scores / New Cache / Flush Cache > 7 days (todo)
exports.ResetScoresCachePeriodics = functions.region('europe-west6').pubsub.schedule('0 0 * * *').timeZone('Europe/Paris').onRun(async (context) => {

  try {
    // Set Paris Timezone (default is UTC, even if function TimeZone is Paris)
    process.env.TZ = 'Europe/Paris' 

    // For each user
    const usersRef = admin.firestore().collection('users');   
    const usersSnapshot = await usersRef.get();
    usersSnapshot.forEach(async user => {

      var timestamp = new Date();
      var day = ((timestamp.getMonth() + 1) + '/' + timestamp.getDate() + '/' + timestamp.getFullYear());

      // New Cache
      var cacheRef = await admin.firestore().collection('actionCache').add({
          co2e: 0,
          date: timestamp,
          day: day,
          user: user.ref
      });
      
      // For every periodic, add action and TypeCache
      const energyPeriodicsRef = admin.firestore().collection('energyPeriodics').where('userId', '==', user.get("uid"));
      const energyPeriodicsSnapshot = await energyPeriodicsRef.get();
      energyPeriodicsSnapshot.forEach(async energyPeriodic => {

        // Need to create actions with different timestamps, wait 1sec
        await new Promise(resolve => setTimeout(resolve, 1000));
        var newTimestamp = new Date();
        var day = ((newTimestamp.getMonth() + 1) + '/' + newTimestamp.getDate() + '/' + newTimestamp.getFullYear());

        // Create cacheType
        await admin.firestore().collection('actionTypeCache').add({
          actionCache: admin.firestore().collection('actionCache').doc(cacheRef.id),
          actionType: energyPeriodic.get("energy"),
          date: newTimestamp
        });

        // Create action
        const writeResult = await admin.firestore().collection('energyActions').add(energyPeriodic.data());
        writeResult.update({created_time: newTimestamp});
        writeResult.update({day: day});


        // Recalculated is launched by adding new actions
      }); // end Periodics > Actions
    }); // end Foreach user
  }
  catch (e) {
    console.error(new Error('ResetScoresCachePeriodics : failed'));
    throw new Error('ResetScoresCachePeriodics : failed');
  }
});


// At midnight : Reset users scores / New Cache / Flush Cache > 7 days (todo)
exports.cleanOldActions = functions.region('europe-west6').pubsub.schedule('0 0 * * *').timeZone('Europe/Paris').onRun(async (context) => {

  try {
    // Set Paris Timezone (default is UTC, even if function TimeZone is Paris)
    process.env.TZ = 'Europe/Paris' 

    // Delete cache > 7 days
    // Calculate periods
    var dateDay0 = new Date(); dateDay0.setHours(0,0,0,0);
    var dateDay7 = new Date(new Date().setDate(dateDay0.getDate() - 7)); dateDay7.setHours(0,0,0,0)

    // Deletes all Cache > 7 days
    var jobskill_query = admin.firestore().collection('actionCache').where('date','<=', dateDay7);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });

    // Deletes all actionTypeCache > 7 days
    var jobskill_query = admin.firestore().collection('actionTypeCache').where('date','<=', dateDay7);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });

    // Deletes all actions > 7 days
    var jobskill_query = admin.firestore().collection('foodActions').where('created_time','<', dateDay7);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });
    var jobskill_query = admin.firestore().collection('energyActions').where('created_time','<', dateDay7);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });
    var jobskill_query = admin.firestore().collection('transportActions').where('created_time','<', dateDay7);
    jobskill_query.get().then(function(querySnapshot) {
      querySnapshot.forEach(function(doc) {
        doc.ref.delete();
      });
    });


  }
  catch (e) {
    console.error(new Error('cleanOldActions : failed'));
    throw new Error('cleanOldActions : failed');
  }
});