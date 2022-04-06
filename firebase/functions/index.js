const functions = require("firebase-functions");
const admin = require('firebase-admin');
const { write } = require("firebase-functions/logger");
admin.initializeApp();


// // Take the text parameter passed to this HTTP endpoint and insert it into 
// // Firestore under the path /messages/:documentId/original
// exports.addMessage = functions.https.onRequest(async (req, res) => {
//     // Grab the text parameter.
//     const original = req.query.text;
//     // Push the new message into Firestore using the Firebase Admin SDK.
//     const writeResult = await admin.firestore().collection('messages').add({original: original});
//     // Send back a message that we've successfully written the message
//     res.json({result: `Message with ID: ${writeResult.id} added.`});
//   });



// // Listens for new messages added to /messages/:documentId/original and creates an
// // uppercase version of the message to /messages/:documentId/uppercase
// exports.makeUppercase = functions.firestore.document('/messages/{documentId}')
//     .onCreate((snap, context) => {
//       // Grab the current value of what was written to Firestore.
//       const original = snap.data().original;

//       // Access the parameter `{documentId}` with `context.params`
//       functions.logger.log('Uppercasing', context.params.documentId, original);
      
//       const uppercase = original.toUpperCase();
      
//       // You must return a Promise when performing asynchronous tasks inside a Functions such as
//       // writing to Firestore.
//       // Setting an 'uppercase' field in Firestore document returns a Promise.
//       return snap.ref.set({uppercase}, {merge: true});
//     });
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
    .onCreate((snap, context) => {
      snap.ref.update({day_score: 0});
      snap.ref.update({week_score: 0});
      snap.ref.update({month_score: 0});
      snap.ref.update({global_score: 0});
      snap.ref.update({level: 1});
      snap.ref.update({activity: 0});
      snap.ref.update({rank: 1});
      snap.ref.update({rank_size: 1});
      snap.ref.update({co2target: 12});
});

//exports.sendByeEmail = functions.auth.user().onDelete((user) => {
  // ...
//});


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
  
  var day_score = 0;
  var week_score = 0;
  var month_score = 0;
  var global_score = 0;
  var activity = 0;
  var level = 1;

  // Dates used for "day_score", "week_score", "month_score"
  //var dateToday = new Date();
  //var dateTodayStart = dateToday.setHours(0,0,0,0);
  //var dateTodayEnd = dateToday.setHours(23,59,59,999);
  //var date30daysAgo = new Date(new Date().setDate(dateToday.getDate() - 30));
  //var date7daysAgo = new Date(new Date().setDate(dateToday.getDate() - 7));

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

// Calculate periods
var dateDay0 = new Date(); dateDay0.setHours(0,0,0,0);
var dateDay1 = new Date(new Date().setDate(dateDay0.getDate() - 1)); dateDay1.setHours(0,0,0,0)
var dateDay2 = new Date(new Date().setDate(dateDay0.getDate() - 2)); dateDay2.setHours(0,0,0,0)
var dateDay3 = new Date(new Date().setDate(dateDay0.getDate() - 3)); dateDay3.setHours(0,0,0,0)
var dateDay4 = new Date(new Date().setDate(dateDay0.getDate() - 4)); dateDay4.setHours(0,0,0,0)
var dateDay5 = new Date(new Date().setDate(dateDay0.getDate() - 5)); dateDay5.setHours(0,0,0,0)
var dateDay6 = new Date(new Date().setDate(dateDay0.getDate() - 6)); dateDay6.setHours(0,0,0,0)

var dateweek0 = new Date(new Date().setDate(dateDay0.getDate() - dateDay0.getDay() +1)); dateweek0.setHours(0,0,0,0)
var dateweek1 = new Date(new Date().setDate(dateweek0.getDate() - 7)); dateweek1.setHours(0,0,0,0)
var dateweek2 = new Date(new Date().setDate(dateweek0.getDate() - 14)); dateweek2.setHours(0,0,0,0)
var dateweek3 = new Date(new Date().setDate(dateweek0.getDate() - 21)); dateweek3.setHours(0,0,0,0)


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
    
    tmp.day_score = day0;
    tmp.week_score = week0;
    tmp.month_score = month_score;
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