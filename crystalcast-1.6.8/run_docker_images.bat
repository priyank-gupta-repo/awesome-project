@ECHO OFF

REM Loads the CrystalCast Docker images into the hosts local repository and
REM then runs them in their own containers using Docker Compose.

REM This batch script should be run from the top-level of the "deployment"
REM folder (in which it is stored).

REM Load the images into the local Docker repository
docker load -i frontend.tar
docker load -i pygom-wrapper.tar
docker load -i emulation.tar
docker load -i mongo.tar
docker load -i mongo-setup.tar
docker load -i database-service.tar

REM Spin-up the images using Docker Compose (for Windows we use root)
SET CURRENT_UID=root

REM Set ports to defaults if variables to already set
CALL :SET_PORT FRONTEND_PORT 8000
CALL :SET_PORT PYGOM_PORT 5000
CALL :SET_PORT EMULATION_PORT 5001
CALL :SET_PORT MONGODB_PORT 27017
CALL :SET_PORT MONGOEXPRESS_PORT 8081

docker-compose up

EXIT /B 0

REM Set the given variable to the given port if the variable is not already defined
:SET_PORT
    @SETLOCAL EnableDelayedExpansion
    @if "!%1!"=="" (
        ECHO '%1' undefined. Defining with value
        ECHO    %2
        ENDLOCAL DisableDelayedExpansion
        goto :DEFINE_VARIABLE
    ) else (
        ECHO '%1' already defined with value
        ECHO    !%1!
        ENDLOCAL DisableDelayedExpansion
    )
    EXIT /B 0

:DEFINE_VARIABLE
    @SET "%1=%2"
    EXIT /B 0