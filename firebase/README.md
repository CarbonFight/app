# Firebase

This folder contains [carbonfight.app](https://carbonfight.app) landing page and serverless functions.


## Requirements

You need to install [Firebase CLI](https://firebase.google.com/docs/cli).

## Deploy Functions

```
# Install dependecies
cd functions
npm install

# Login to firebase
firebase login
firebase deploy --only functions
```