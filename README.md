# Flutter Steps Tracker

Tracking user's activties, specificly walking and continuecely counting footsteps, this project was built using flutter and integrated with Firebase (backend server) 


## Feature Set 

* [x] Authentication Anonymously with Firebase
* [x] Tracking steps in real-time and automaticlly exchange steps with Health Point
* [x] History
* [x] Notifications
* [x] Leaderboard page
* [x] Usable and user-friendly interface
* [x] Multilingual, supports both Arabic and English
* [x] Multi themes, supports the light and dark theme

## UnImplemented 

* [ ] Make the app works on the background


## Screenshots :camera:

| Health  | Leaderboard  | Rewards  | Profile  |
|:----------|:----------|:----------|:----------|
| <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/health_light.jpg" width=300>     | <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/leader_light.jpg" width=300>     | <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/reward_light.jpg" width=300>     | <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/profile_light.jpg" width=300>     |
| <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/health_dark.jpg" width=300>     | <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/leader_dark.jpg" width=300>     | <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/reward_dark.jpg" width=300>     | <img src="https://github.com/D4sh12/flutter-steps-tracker/blob/master/screenshots/profile_dark.jpg" width=300>    |


### Project structure:

```
lib
├───application
│   └───models
├───core
│   ├───constants
│   ├───services
│   └───utils
│       ├───helpers
│       │   └───network
│       └───ui
│           └───animations
├───infrastructure
│   ├───data_sources
│   │   └───remote
│   ├───repositories
│   └───states
├───l10n
└───presentation
    ├───config
    ├───layouts
    ├───pages
    │   ├───auth
    │   │   └───widgets
    │   ├───history
    │   ├───home
    │   │   └───widgets
    │   ├───leaderboard
    │   ├───profile
    │   ├───reward
    │   │   └───widgets
    │   └───splash
    └───widgets

```