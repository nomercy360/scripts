#!/bin/bash

if [ -n "$1" ];
then
  ZOZOver="$1"
  echo "Downloaded ver - $ZOZOver"
else
  echo "No parameters found. "
fi

ARTAPIKEY="AKCp5Z32J7mUrGuCtHxWt4yXXKm4p1v2Yvspsv3iji8PvNSQnWHQMqJJX91GNTrGNWJ8zgH9w"
BUILD_VERSION=$ZOZOver

#front
REPO_CATALOG="libs-release-candidates-local"
REPO_SUBCATALOG="bio-video-py"
REPO_SUBCATALOG2="unified-api"
ARTIFACT2="front2-au"
ARTIFACT3="service"
ARTIFACT_NAME_FULL2=$ARTIFACT2-$BUILD_VERSION.zip
ARTIFACT_NAME_FULL3=$ARTIFACT3-$BUILD_VERSION.zip
curl  -H "X-JFrog-Art-Api:${ARTAPIKEY}" -X GET http://repo.i.zozowfm.com/artifactory/$REPO_CATALOG/ru/abcconsulting/$REPO_SUBCATALOG/$REPO_SUBCATALOG2/$ARTIFACT2/"${BUILD_VERSION}"/$ARTIFACT_NAME_FULL2 > /abc/distr/$ARTIFACT_NAME_FULL2
curl  -H "X-JFrog-Art-Api:${ARTAPIKEY}" -X GET http://repo.i.zozowfm.com/artifactory/$REPO_CATALOG/ru/abcconsulting/$REPO_SUBCATALOG/$REPO_SUBCATALOG2/$ARTIFACT3/"${BUILD_VERSION}"/$ARTIFACT_NAME_FULL3  >  /abc/distr/$ARTIFACT_NAME_FULL3

unzip -qq -o /abc/distr/"$ARTIFACT_NAME_FULL2" -d /abc/app/
unzip -qq -o /abc/distr/"$ARTIFACT_NAME_FULL3" -d /abc/app/


sudo reboot