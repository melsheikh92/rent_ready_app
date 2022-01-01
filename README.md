


# Required installation
Below there are a few instructions about mandatory commands to be run in order to facilitate the work such as using watchdog to build the assets(images/svg-images/strings) as variables such like Android R class and it will work on run time using python watchdog package also I added [feature-name] zip file which contains the main template for easily create a new feature and give it a name via command line and it will hold full feature archtecture(Presentation-Domain-Data) in few seconds.

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

```bash
python3 assets/build-new-feature.py
```
## Multi Variants
Relying on Injectable, I defined Dio object based on the variant (dev/prod).
I inject it on the run method by default as a dev, so It will return the responses from the MockAdapter which will return mocks inside the application.
To connect to Microsoft APIs, define the variant as prod.
## Clean Architecture 

 - Presentation layer (bloc pattern using [flutter_bloc](https://pub.dev/packages/flutter_bloc))
 - Domain layer
 - Data layer
 ![enter image description here](https://github.com/melsheikh92/rent_ready_app/blob/master/ReadMeAssets/feature.png?raw=true)
 ## Responsive design
I realy on handling master-details screen based on the screen size if tablet or web it will open as SplitView but for mobile master screen being handled as list/grid or accounts and when one is selected it opens on another screen used [split_view](https://pub.dev/packages/split_view) to handle it.
Both Mobile or tablet/web are relying on the same bloc to provide the state for them but behaves differently based on the device screen size.
|  ![enter image description here](https://github.com/melsheikh92/rent_ready_app/blob/master/ReadMeAssets/mobile.png?raw=true)|  ![enter image description here](https://github.com/melsheikh92/rent_ready_app/blob/master/ReadMeAssets/web_tablet.png?raw=true)|
|--|--|

## Light/Dark Modes on realtime
Relying on bloc, I started from Material app with Settings Bloc provider to be able to handle the global settings changes like theming on real-time.
|  ![enter image description here](https://github.com/melsheikh92/rent_ready_app/blob/master/ReadMeAssets/mobile_light.png?raw=true)|  ![enter image description here](https://github.com/melsheikh92/rent_ready_app/blob/master/ReadMeAssets/mobile_dark.png?raw=true)|
|--|--|

## Multi-Languages
Relying on bloc, I started from Material app with Settings Bloc provider to be able to handle the global settings changes like change language on real-time.

> I added 2 languages for now English and Arabic.

|  ![enter image description here](https://github.com/melsheikh92/rent_ready_app/blob/master/ReadMeAssets/mobile_light.png?raw=true)|  ![enter image description here](https://github.com/melsheikh92/rent_ready_app/blob/master/ReadMeAssets/mobile_ar.png?raw=true)|
|--|--|

## Testing

Using multiple techniques
 1. [Mockito](https://pub.dev/packages/mockito) for injecting specific reponses from the repository.
 2. [bloc_test](https://pub.dev/packages/bloc_test) for testing the returned states after emitting specific events to the bloc.
 3. [Dart test](https://pub.dev/packages/test) for testing widgets and components.
 
 ## Docker 
Using Docker file step by step:
 4. Pull debian:latest image.
 5. Install apt packages to use them in download and install flutter SDK.
 6. Download Flutter SDK.
 7. Setup the PATH.
 8. Copy the aplication to the container.
 9. Build flutter web.
 10. Install the server image nginx.
 11. Copy the build web directory to the server path.
 
 
building the container via docker command build

    docker build -t rentready .
starting the container on port 1111:80

    docker run -p 1111:80 --name rentready
## Networking
Mainly we have 2 APIs 

 1. Microsoft token API
 2. Accounts API
 
 On splash screen I call the token API to get the token after splash animation.
To generate the token i built an applicationa and generated secret key to loggin using it via [OAuth 2.0](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow).
I created scope URI in order to be able to define the access to the application.
I gave permission to the application and gave the user the permission as admin to be Dynamics CRM app.
I assigned the client secret to the scope to be able to access the application data.

When API returns with Access token, I embed it on Dio headers on order to start calling the second API.
