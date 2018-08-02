#!/bin/bash

set -e
#set -x

# install latest hub 2017.08.04
git clone -b v2.3.0-pre10 https://github.com/github/hub.git
(cd hub; ./script/build; sudo cp bin/hub /usr/local/bin/)

mkdir -p ~/.config/
echo "github.com:" > ~/.config/hub
echo "- user: k-okada" >> ~/.config/hub
echo "  oauth_token: $GITHUB_ACCESS_TOKEN" >> ~/.config/hub

hub release; sleep 5
hub release create -p -a ROScheatsheet_catkin.pdf -m "$CIRCLE_TAG"$'\n'"Released on `date '+%Y/%m/%d %H:%M:%S'`" $CIRCLE_TAG;

