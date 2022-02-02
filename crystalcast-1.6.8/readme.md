## Environment

The only prerequisite for building or deploying the system is Docker. Docker is available as a [.deb or .rpm package](https://docs.docker.com/engine/install/) for Linux, or through [Docker Desktop](https://www.docker.com/products/docker-desktop) for Windows. Docker itself will manage the download of images which contain the other dependencies, e.g. Java and MongoDB.

Once installed, it is recommended that WSL 2 is enabled if using Docker Desktop for Windows, otherwise it is important to give Docker access to the files in this project. To do this in Docker Desktop, go to the settings (available by right-clicking the icon in the system tray), select "Resources" > "File Sharing" and then add the top level folder (where this README file is located) to the list. The following mininum resources will also need to be configured if not using WSL 2 (i.e. using Hyper-V):
- CPUs: 3
- Memory: 6.00GB
- Swap: 4GB
- Disk Image size: 64 GB

## Running CrystalCast
To run the CrystalCast software from the built docker images, simply run the following command on Windows:
```
run_docker_images.bat
```
Or when running on Linux hosts:
```
./run_docker_images.sh
```

## Database Export
To export the contents of a mongodb database when you have CrystalCast running, run the following command:
```
archive_database.bat
```
This will export the full database to a compressed archive 'crystalcast.db.gz'. This archive can be used to populate the database on a fresh instance of the docker build.

Please note that this assumes a localhost instance, so ensure no other local instances of mongodb are running.

## Database Import
To restore/import a database into a fresh CrystalCast docker setup you can run the following command which expects a compressed database archive called 'crystalcast.db.gz' to exist in this folder (see above for creating this archive from an existing instance).
```
restore_database.bat
```
This will read in the archive file and populate the currently running docker mongodb instance.

Please note that this assumes a localhost instance, so ensure no other local instances of mongodb are running.