#!/bin/sh

#===========================================================================================
GITHUB=wonderfulalice606
WS_DIR=workspace
DOC=Documents
REPO=29_HW_Input_from_Console
RUNNER=Test_Runner

VERSION=1.0
MAIN_CLASS=core.Input_Scanner
#===========================================================================================

if ! which java > /dev/null 2>&1; then echo Java is not installed; return; fi
if ! which mvn > /dev/null 2>&1; then echo Maven is not installed; return; fi
if ! which git > /dev/null 2>&1; then echo Git is not installed; return; fi

if [ -d "$HOME/$DOC/$WS_DIR/" ]; then cd ~/$DOC/$WS_DIR/$RUNNER; else echo $WS_DIR is not exist; return; fi
if [ -d "$HOME/$DOC/$WS_DIR/$RUNNER/$REPO" ]; then rm -rf $HOME/$DOC/$WS_DIR/$RUNNER/$REPO; fi

git clone https://github.com/$GITHUB/$REPO.git
cd ./$REPO

mvn package -Dbuild.version=$VERSION
echo "Executing Java program ...................................."
java -cp $HOME/$DOC/$WS_DIR/$RUNNER/$REPO/target/$REPO-$VERSION-jar-with-dependencies.jar $MAIN_CLASS

echo "$HOME/$DOC/$WS_DIR/$RUNNER/$REPO"
