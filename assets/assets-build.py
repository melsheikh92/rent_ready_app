#!/usr/bin/env python3
import json
import os
import time
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler
import code
import yaml


def buildYaml():
    with open('pubspec.yaml') as f:
        data = yaml.safe_load(f)

    fileNames = set([])

    fileNames.add("assets/")
    fileNames.add("config/")
    fileNames.add("assets/svg_images/dark/en/")
    fileNames.add("assets/svg_images/dark/ar/")
    fileNames.add("assets/svg_images/light/en/")
    fileNames.add("assets/svg_images/light/ar/")

    foldersNames = filter(lambda item: ".DS_Store" not in item,os.listdir("assets/images"))
    for folderName in foldersNames:
        for fileName in filter(lambda item: ".DS_Store" not in item, os.listdir("assets/images/"+folderName)):
            fileNames.add("assets/images/"+fileName)

    print(fileNames)
    data['flutter']['assets'] = list(fileNames)
    with open('pubspec.yaml', 'w') as f:
        yaml.dump(data, f)


def buildStrings():
    # Remove strings.dart file
    if os.path.exists("lib/resources/strings_generated.dart"):
        os.remove("lib/resources/strings_generated.dart")
    # create new strings.dart file
    newFile = open("lib/resources/strings_generated.dart", "a+")
    # open connection with the english json file
    english_strings_file = open("assets/locale_en.json", "r")

    # start writing imports and class name
    newFile.write(
        "import 'package:rent_ready_app/core/language/GlobalTranslations.dart';" + "\n")
    newFile.write("class AppStrings {" + "\n")
    # read json data
    jsonData = json.load(english_strings_file)
    # parsing
    for key in jsonData:
        varName = ""
        varNameList = key.split("_")
        for idx, val in enumerate(varNameList):
            varName += val.lower() if idx == 0 else val.capitalize()

        if "%s" in jsonData[key]:
            print("build functions")
            newFile.write("static String "+varName + "(List<String> items){"+"\n" +
                          "String str = allTranslations.text(\""+key+"\");"+"\n" +
                          "items.forEach((element) { str=str.replaceFirst(\"%s\", element);});"+"\n" +
                          "return str;}"+"\n")
        else:
            # writing variables
            newFile.write("static String get "+varName +
                          "{return allTranslations.text(\""+key+"\");}"+"\n")

    newFile.write("}")
    # close connections
    newFile.close()
    english_strings_file.close()


def buildImages():
    # Remove strings.dart file
    if os.path.exists("lib/resources/assets_generated.dart"):
        os.remove("lib/resources/assets_generated.dart")
    # create new strings.dart file
    newFile = open("lib/resources/assets_generated.dart", "a+")

    # start writing imports and class name
    newFile.write("import 'package:flutter/material.dart';" + "\n")
    newFile.write("class AppAssets {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/images")

    fileNames = set([])

    for folderName in filter(lambda item: "flags" not in item,foldersNames):
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/images/"+folderName):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const AssetImage " + \
                varName.split(
                    ".")[0]+" = AssetImage(\"assets/images/"+item+"\");"+"\n"
            newFile.write(stringToWrite)

    newFile.write("}")
    # close connections
    newFile.close()


def buildSVGImages():
    # Remove strings.dart file
    if os.path.exists("lib/resources/assets_svg_generated.dart"):
        os.remove("lib/resources/assets_svg_generated.dart")
    # create new strings.dart file
    newFile = open("lib/resources/assets_svg_generated.dart", "a+")
    assetsMap = {}
    fileNamesSet = set([])
    # start writing imports and class name
    newFile.write("""
import 'package:rent_ready_app/di/InjectionContainer.dart';
import 'package:rent_ready_app/utilities/language_manager.dart';
import 'package:flutter/material.dart';
\n
    """)

    newFile.write("""
class AppSVGAssets {\n
    """)
    # iterating all sub directories
    themesFolders = filter(
        lambda item: ".DS_Store" not in item, os.listdir("assets/svg_images"))

    for themeFolder in themesFolders:
        assetsMap[themeFolder] = {}
        for langFolder in filter(lambda item: ".DS_Store" not in item, os.listdir("assets/svg_images/{themeFolder}/".format(themeFolder=themeFolder))):
            assetsMap[themeFolder][langFolder] = {}
            for fileName in filter(lambda item: ".DS_Store" not in item, os.listdir("assets/svg_images/{themeFolder}/{langFolder}/".format(themeFolder=themeFolder, langFolder=langFolder))):
                assetsMap[themeFolder][langFolder][fileName.split(".")[0]] = "assets/svg_images/{themeFolder}/{langFolder}/{fileName}".format(
                    themeFolder=themeFolder, langFolder=langFolder, fileName=fileName)
                fileNamesSet.add(fileName.split(".")[0])

    for fileName in fileNamesSet:
        varName = ""
        nameList = fileName.split("_")
        for idx, val in enumerate(nameList):
            varName += val if idx == 0 else val.capitalize()
        newFile.write("static const " + varName.split(".")
                      [0]+" = \"{fileName}\";\n".format(fileName=fileName))
    newFile.write("\n\n\n")

    newFile.write("static const Map _assetsMap ={assetsDic};".format(
        assetsDic=assetsMap))

    newFile.write("\n\n\n")

    newFile.write("""
static String getImagePath(BuildContext context,
      {@required String imageName}) {
    final String themeKey =
        Theme.of(context).brightness == Brightness.light ? "light" : "dark";
    final String languageKey = getIt<LanguageManager>().isEnglish ? "en" : "ar";
    if ((_assetsMap[themeKey][languageKey] as Map).containsKey(imageName)) {
      return _assetsMap[themeKey][languageKey][imageName] as String;
    } else if ((_assetsMap[themeKey]["en"] as Map).containsKey(imageName)) {
      return _assetsMap[themeKey]["en"][imageName] as String;
    } else if ((_assetsMap["light"][languageKey] as Map)
        .containsKey(imageName)) {
      return _assetsMap["light"][languageKey][imageName] as String;
    } else {
      return _assetsMap["light"]["en"][imageName] as String;
    }
  }
}
    """)

    # close connections
    newFile.close()


def runScripts(data):
    print("recreating assets ...")
    buildStrings()
    buildImages()
    buildSVGImages()
    buildYaml()
    print("assets created")


def main():
    patterns = "*"
    ignore_patterns = ""
    ignore_directories = False
    case_sensitive = True
    runScripts("")
    my_event_handler = PatternMatchingEventHandler(
        patterns, ignore_patterns, ignore_directories, case_sensitive)
    my_event_handler.on_created = runScripts
    my_event_handler.on_deleted = runScripts
    my_event_handler.on_modified = runScripts
    path = "./assets"
    go_recursively = True
    my_observer = Observer()
    my_observer.schedule(my_event_handler, path, recursive=go_recursively)
    my_observer.start()

    code.interact()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        my_observer.stop()
        my_observer.join()


if __name__ == "__main__":
    main()
