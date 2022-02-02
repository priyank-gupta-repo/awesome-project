@ECHO OFF

CALL mongo-tools\mongodump --archive=crystalcast.db.gz --gzip --db=crystalcast --username=root --authenticationDatabase=admin --password=crystalcast --excludeCollection=agents --excludeCollection=diseaseConfigs --excludeCollection=geographicInputs --excludeCollection=templates --excludeCollection=userSettings --excludeCollection=users