const functions = require("firebase-functions");
const admin = require('firebase-admin');
const { write } = require("firebase-functions/logger");
admin.initializeApp();


exports.updateScoreTransport = functions.region('europe-west6').firestore.document('/transportActions/{documentId}')
     .onWrite(async (change, context) => {

      // Retrieve userId, before change if delete, after change if update/create.
      const userId = change.after.exists ? change.after.data().userId : change.before.data().userId;
      await reCalculate(userId);
});

exports.updateScoreFood = functions.region('europe-west6').firestore.document('/foodActions/{documentId}')
     .onWrite(async (change, context) => {

      // Retrieve userId, before change if delete, after change if update/create.
      const userId = change.after.exists ? change.after.data().userId : change.before.data().userId;
      await reCalculate(userId);
});

exports.updateScoreEnergy = functions.region('europe-west6').firestore.document('/energyActions/{documentId}')
     .onWrite(async (change, context) => {

      // Retrieve userId, before change if delete, after change if update/create.
      const userId = change.after.exists ? change.after.data().userId : change.before.data().userId;
      await reCalculate(userId);
});
// Set initial values for new created users
exports.userInitialValues = functions.region('europe-west6').firestore.document('/users/{documentId}')
    .onCreate(async (snap, context) => {
      snap.ref.update({global_score: 0});
      snap.ref.update({level: 1});
      snap.ref.update({activity: 0});
      snap.ref.update({rank: 1});
      snap.ref.update({rank_size: 1});
      snap.ref.update({co2target: 12});
});


// Setup initial values for new users
exports.createdUserDefaultData = functions.region('europe-west6').auth.user().onCreate(async (user) => {
  await admin.firestore().collection('usersStats').add({
    day0: "0",
    day1: "0",
    day2: "0",
    day3: "0",
    day4: "0",
    day5: "0",
    day6: "0",

    week0: "0",
    week1: "0",
    week2: "0",
    week3: "0",

    month0: "0",
    month1: "0",
    month2: "0",
    month3: "0",

    uid: user.uid
  });
});



// When firebase authentication user is deleted, deletes all data : Actions / Periodics / Stats / Users
exports.deletedUserFlushData = functions.region('europe-west6').auth.user().onDelete(async (user) => {
  
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
  var jobskill_query = admin.firestore().collection('users').where('userId','==',user.uid);
  jobskill_query.get().then(function(querySnapshot) {
    querySnapshot.forEach(function(doc) {
      doc.ref.delete();
    });
  });

  // Deletes all stats data
  var jobskill_query = admin.firestore().collection('usersStats').where('userId','==',user.uid);
  jobskill_query.get().then(function(querySnapshot) {
    querySnapshot.forEach(function(doc) {
      doc.ref.delete();
    });
  });
});


exports.updateRanks = functions.region('europe-west6').firestore.document('/users/{documentId}')
     .onWrite(async (change, context) => {

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
});


async function reCalculate(userId) {
  
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

    if (actionDate >= dateDay0) { day0 += doc.get("co2e"); }
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

    if (actionDate >= dateDay0) { day0 += doc.get("co2e"); }
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

    if (actionDate >= dateDay0) { day0 += doc.get("co2e"); }
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
  const queryUser = await admin.firestore()      
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
    const updateStats = await admin.firestore()      
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

      thing.ref.update(tmp);
    });

}


exports.periodicsToActions = functions.region('europe-west6').pubsub.schedule('0 3 * * *').timeZone('Europe/Paris').onRun(async (context) => {
    
    const energyPeriodicsRef = admin.firestore().collection('energyPeriodics');
    const snapshot = await energyPeriodicsRef.get();
    if (snapshot.empty) {
      console.log('No matching documents.');
      return;
    } 

    snapshot.forEach(async doc => {
      // Writing new Action with Periodics fields
      const writeResult = await admin.firestore().collection('energyActions').add(doc.data());
      // Adding Timestamp which does not exist on periodics
      const timestamp = admin.firestore.Timestamp.now();
      writeResult.update({created_time: timestamp});
    });

    return null;
    });

    // Reset scores every night at midnight (especially day score).
    exports.resetUsersScores = functions.region('europe-west6').pubsub.schedule('0 0 * * *').timeZone('Europe/Paris').onRun(async (context) => {
    
      const usersRef = admin.firestore().collection('users');
      const snapshot = await usersRef.get();
      snapshot.forEach(async doc => {
        // Recalculate score for all users
        
        var userId = doc.get("uid");
        await reCalculate(userId);
      });
  
      return null;
  });