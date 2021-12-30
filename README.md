#

Below there are a few instructions about mandatory commands to be run in order to facilitate the work.

## Required installation

Click [here](https://realpython.com/installing-python/) to find instructions to install python for different operating systems.
## Intall watchdog
Click [here](https://pypi.org/project/watchdog/) for installing python watchdog module for listening and updating assets in interactive way.
 ```bash
 pip3 install watchdog
 ```
## Install pyyaml
 ```bash
 pip3 install pyyaml
 ```
## Linting
It's required as a part of the pipeline to pass all linting instructions so in order to check the issues before pushing to the online repo.
```bash
flutter analyze
```
## Generate DI classes
we use [Injectable](https://pub.dev/packages/injectable) to handle dependency injection through the app and generate dependency classes.

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```
## Generate assets
Under the assets folder, there is assets-build.py script that generates 2 dart files under lib/resources folder for Images and Strings, that mimics R class on Android.

```bash
python3 assets/assets-build.py
```
## Generate new feature
From terminal you can generate the whole feature architecture(Presentation-Domain-Data) by providing a name for the new feature.

```bas
python3 assets/build-new-feature.py
```
