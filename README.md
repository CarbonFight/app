# CarbonFight

CarbonFight is an OpenSource project. The goal is to reduce user's CO2 footprint.  
Users can measure their footprint, identify actions that creates to much CO2, and find solutions to reduce their footprint.

The project is based on [FlutterFlow (FF)](https://app.flutterflow.io/) and [Google Firebase](https://console.firebase.google.com/).

The root folder contains the mobile app, exported by FlutterFlow.  
The folder "firebase" contains [carbonfight.app](https://carbonfight.app) landing page and serverless functions.

## CarbonFight terms

The users can add **actions** and **periodics** in the app to calculate their CO2 emissions.

**Actions** (Car travel, a coffee, your food this lunch, etc.) : an action is a firestore document. It contains all the parameters of the form, and a CO2 fields which result of a calculation based on fields. As FlutterFlow does not manage subcollections, 3 tables for actions.  
  
**Periodics** (your annual electricity consumption, gaz, water): a priodic action is also a firestore document. Each periodic is transformed every night into an action. Periodics have also parameters, and a CO2 consumption **per day** (annual CO2 divided by 365).

# Cloud Firestore Data model

## transportActions

* **int co2e** : co2e of the action. Calculated with a FF custom function during form submission.
* **timestamp created_time** : created action timestamp.
* **int distance** : usually distance in KMs, or sometimes number of stops (subway)
* **string ownership** : only for cars and scooters : Owner / Short rent / Long rent / Taxi 
* **int passengers** : number of passengers
* **string powertype** : Thermic / Electricity / Hybrid
* **string transport** : car / bus / scooter / metro / train / tramway / bike / moto / flight
* **string userId** : Firebase authentication User ID.

## energyActions 

Every night, a firebase function (periodicsToActions), creates 1 document in energyActions for every document in energyPeriodics. 

All the energyPeriodics parameters +
* **timestamp created_time** : created action timestamp.

## foodActions

* **int co2e** : co2e of the action. Calculated with a FF custom function during form submission.
* **timestamp created_time** : created action timestamp.
* **string food** : starter / main / desert / drinks / cheese / bread / coffee
* **string mainComponent** : Please see custom_functions.dart
* **string sideComponent** : Please see custom_functions.dart
* **string userId** : Firebase authentication User ID.

## energyPeriodics

* **int co2e** : daily co2e of the action. Calculated with a FF custom function during form submission.
* **string energy** : electricity / gas / water
* **int peopleSharing** : number of people in the house
* **string powertype** : Nuclear / Wind turbine (Offshore) / Wind turbine / Hydroelectric / Biomass / Geothermal / Fuel oil / Coal.
* **string userId** : Firebase authentication User ID.
* **int volume** : it can be KiloWatt/Hour (KWH), M3 for water.

## users
This table is managed by FF, with the authentication. It contains some CarbonFight fields auto-updated by a Firebase function :

* **activity** : based on you activity in the app. More you put actions every day, better is your activity.
* **timestamp created_time** : created user timestamp.
* **day_score** : CO2e of the day
* **display_name** : Name given when signup
* **email** : email used when signup
* **global_score** : The main score of the app, based on all the actions you have done.
* **level** : based on activity. Bronze / Silver / Gold
* **month_score** : Month sum of all actions
* **uid** : Firebase authentication User ID
* **week_score**  : Week sum of all actions

# FlutterFlow Custom Functions 

These functions are used in FLutterFlow forms. The results are wrote in the firestore document with form's parameter.

## transportActionsCO2e


Calculate CO2e for all tranport actions.
To see which optional parameter apply to which tranport, please directly look inside the custom function.

## energyPeriodicsCO2e

Calculate CO2e for periodics. Parameters are year based, but CO2e is day based.  
**Example for electricity** : user gives is KWH per YEAR. The function calculates CO2e for 1 year and divide it by 365. This CO2e per day will be copied directly into a new action every day.

## foodActionsCO2e

Calculate CO2e for food. Some of these actions only need "foodType", like "drinks>bottle of water". Some need 2 components, like a main course.

## printScore

In CarbonFight, all CO2e is stored in database in grams (g). But a normal CO2e per day is ~15kg.

This functions is a filter for UI. You can pass the score in parameter in grams, and the result is a human readable score (g / Kg / T).


# Firebase Functions

## resetUsersScores

On every write on energyActions / transportActions / energyActions, recalculates day_score and global_score

## periodicsToActions

Every night, every periodic is converted into action, with the same parameters + timestamp.


# Deploying Firebase landing page & functions

You need to install [Firebase CLI](https://firebase.google.com/docs/cli) and Node.js.

```
# Install dependecies
cd functions
npm install

# Login to firebase
firebase login
firebase deploy --only functions // For functions
firebase deploy --only hosting // For hosting
firebase deploy // For functions & hosting
```

# Local build

You must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.