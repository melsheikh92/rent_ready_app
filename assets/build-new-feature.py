#!/usr/bin/env python3
import os
import io
import zipfile
import shutil

def renameFiles(directory,featureName):
    print("start renaming files")
    for count, filename in enumerate(os.listdir(directory)):
        if filename != ".DS_Store":
            if os.path.isdir(directory+"/"+filename):
                renameFiles(directory+"/"+filename, featureName)
            else:
                modifyFileContent(directory+"/"+filename, featureName)
                if "[feature_name]" in filename:
                    newFileName = filename.replace("[feature_name]",featureName)
                    dst = directory +"/"+ newFileName
                    src = directory+"/"+filename
                    print("source: "+src)
                    print("destenation: "+dst)
                    os.rename(src, dst)


def unzipFile(featureName):
    with zipfile.ZipFile("assets/[feature_name].zip", 'r') as zip_ref:
        zip_ref.extractall("lib/features/"+featureName)
    #removing added folder __MACOSX by macOS after unzip
    if os.path.exists("lib/features/"+featureName+"/"+"__MACOSX/"):
        shutil.rmtree("lib/features/"+featureName+"/"+"__MACOSX/")

def modifyFileContent(filePath,featureName):
    with open(filePath) as f:
        newText=f.read().replace('[feature_name]', featureName)

    with open(filePath, "w") as f:
        f.write(newText)

def main():
    featureName = input('Enter feature name: ')
    unzipFile(featureName)
    renameFiles("lib/features/"+featureName, featureName)

if __name__== "__main__":
    main()
