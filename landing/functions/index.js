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


async function reCalculate(userId) {
  var day_score = 0;
  var global_score = 0;
  var activity = 0;
  var level = 1;

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
    day_score += doc.get("co2e");
    global_score += doc.get("co2e");
    activity += 1;
  });
  energyActions.forEach(doc => {
    day_score += doc.get("co2e");
    global_score += doc.get("co2e");
    activity += 1;   
  });
  foodActions.forEach(doc => {
    day_score += doc.get("co2e");
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
    
    tmp.day_score = day_score;
    tmp.global_score = global_score;
    tmp.activity = activity;
    tmp.level = level;

    thing.ref.update(tmp);
  });
}


exports.periodicsToActions = functions.region('europe-west6').pubsub.schedule('0 3 * * *').onRun(async (context) => {
    
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