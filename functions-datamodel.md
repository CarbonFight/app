# Data model

3 tables for **actions** : 
* transportActions
* energyActions (writes only from periodics, user can READ and DELETE)
* foodActions

Fields are described in the custom functions, that calculate CO2e.

1 table for **perdiodics** :
* energyPeriodics

Every night, a **Firebase Function** (periodicsToActions), creates 1 document in energyActions for every document in energyPeriodics. The function adds a "timestamp" field for the action.

1 table for **users** :
* users

This table is used by FF, with the authentication. It contains some CarbonFight fields :

* global_score : The main score of the app, based on all the actions you have done.
* day_score : CO2e of the day
* activity : based on you activity in the app. More you put actions every day, better is your activity.
* level : based on activity. Bronze / Silver / Gold



# Custom Functions (for add action forms)

## transportActionsCO2e

Calculate CO2e for all tranport actions.

Required parameters :

* **String transport** : 
    * car
    * bus
    * scooter
    * metro
    * train
    * tramway
    * bike
    * moto
    * flight


* **int distance** : distance in KMs, or sometimes number of stops (subway)

Optional parameters :

* **int passengers** : number of passengers
* **String ownership** : Only for cars and scooters : Owner / Short rent / Long rent / Taxi 
* **String powertype** : Thermic / Electricity / Hybrid


To see which optional parameter apply to which tranport, please directly look inside the custom function.


## energyPeriodicsCO2e

Calculate CO2e for periodics. Parameters are year based, but CO2e is day based.  
**Example for electricity** : user gives is KWH per YEAR. The function calculates CO2e for 1 year and divide it by 365. This CO2e per day will be copied directly into a new action every day.

Required parameters :

* **String energy** : 
    * electricity
    * gas
    * water

* **int volume** : it can be KiloWatt/Hour (KWH), M3 for water.

Optional parameters :

* **int peopleSharing** : number of people in the house
* **String powertype** : See in the function for electricity and gas.


## foodActionsCO2e

Calculate CO2e for food. Some of these actions only need "foodType", like "drinks>bottle of water". Some need 2 components, like a main course.

Required parameters :

* **food** : 
    * starter
    * main
    * desert
    * drinks
    * cheese
    * bread
    * coffee

Optional parameters :

* **String mainComponent** : See in the function
* **String sideComponent** : See in the function


## printScore

In CarbonFight, all CO2e is stored in database in grams (g). But a normal CO2e per day is ~15kg.

This functions is a filter for UI. You can pass the score in parameter in grams, and the result is a human readable score (g / Kg / T).


# Custom Actions

## updateUserScores (Deprecated)

It should be executed every time a new action is created. Re-calculates and updates global_score and day_scaore for a specific user.

(will be automatic by a custom function)

Required parameters :

* **userId** 