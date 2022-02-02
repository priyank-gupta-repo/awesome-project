@ECHO OFF

CALL mongo-tools\mongorestore --gzip --archive=crystalcast.db.gz --nsInclude="crystalcast.*" --username=root --password=crystalcast --authenticationDatabase=admin --nsExclude="crystalcast.agents" --nsExclude="crystalcast.diseaseConfigs" --nsExclude="crystalcast.geographicInputs" --nsExclude="crystalcast.templates" --nsExclude="crystalcast.userSettings" --nsExclude="crystalcast.users"