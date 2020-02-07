# Rate my Bistro

> Don't be a fool: you deserve good food.

An app that supports bistros and their customers to achieve an even more sophisticated food experience.

## Important Note

This is a work in progress - the built artifacts might be unstable.
The author is not responsible for any damages that might arise by this
application.

## 1 Motivation

This is a true story of a really sad repository owner. It all began, when he started
working in this awesome company that bought breakfast and lunch for their employees
from regional producers. Both meals were awesome, healthy and invited the whole company 
to share their most important times - life was good.
Time passed and the owner was about to start his next adventure somewhere else in the world.
His new company offered its employees breakfast and lunch meals, too. At this point, the repository
owner didn't know what he had to expect. When he ate his first meal in the company, he thought
they were kidding him - phewww damn this tastes like shit :O. From this day on, the repository owner
was not happy anymore and consequently thought about possible ways to improve his situation. 

Out of the sudden he came to the conclusion that he had to be the savior for all his colleagues and
started developing an app that tells the bistro how shitty their food is...
 
Et voila: Rate my Bistro was born. :-)

This application lets all employees of a company rate the provided food so that the bistro gets 
feedback about their overall quality.

## 2 Prerequisites

A basic knowledge of mobile development is expected.

You have to install the Flutter SDK and all its dependencies in order to properly
work on this project. 

Even though it is not required, I recommend you to use Android Studio 
including its built in flutter support.

Finally, setup a Virtual Device or connect your own phone for development  

## 3 Development

Flutter supports hot reload - an important feature for developing mobile applications :)

### 3.1 Directory structure

The following table illustrates the repository's structure:

| Level 1     | Level 2    | Description                                      |
| ----------- | ---------- | ------------------------------------------------ |
| android     | -          | Contains android specific configuration          |
| ios         | -          | Contains ios specific configuration              |
| lib         | -          | Contains the application's source code           |
| lib         | actions    | Triggers state changes in the redux store        |
| lib         | reducers   | Dispatches actions and transforms the state      |
| lib         | state      | Models and submodels of the application's state  |
| lib         | middleware | Side effects for actions such as network/logging |
| lib         | pages      | One page represents a fullscreen view in the App |
| lib         | components | A component is a reusable piece inside a page    |
| lib         | theme      | Collection of fonts, themes and colors           |
| lib         | values     | Contains language files and constants            | 
| app_bundle  | -          | Contains release artifacts                       |
| assets      | -          | Contains images and logos                        |
| pubspec.yaml| -          | Common application configuration/dependencies    |

### 3.2 Model View ViewModel 

The application follows two fundamentals:

1) The redux pattern
2) Model View ViewModel

Read about it before you start your journey in this repo :)

### 3.3 Install dependencies

Run the following command to install necessary dependencies:
```shell
flutter pub get
```

### 3.4 Hot Reload

Start a new Device in your emulator (iOS or Android) and connect your Android Studio
with this device.

## 4 Build a release

Run the following command: 
```shell
TODO
```

The built artifacts can be found here:
```shell
TODO
```

## 5 Open Topics

(x) Merge model and state
(x) Connection to a server
(x) Profile
(x) Settings
(x) Comment Menus
(x) Take photo of Menus
(x) Search
(x) Tests 

## 6 Contribution

> Before you start changing things, read the following infos:

1. Please document any new code
2. Express changes in semantic commit messages
3. Align your changes with the existing coding style
4. Better ask first and then start changing
5. Use Templates
 
You found a bug somewhere in the code?

--> Open an Issue

You fixed a bug somewhere in the code?

--> Open a pull request 

You got an awesome idea to improve the project?

You hate your Bistro as much as I do and want to speed up development?

--> The best way to support me in this project starts with a direct contact.
Just send me an email and we will figure out a way on how to split up work :)

--> ansgar.sa@gmail.com

 
