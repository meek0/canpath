CanPath Template
================

Helper project for setting up [OBiBa stack for CanPath](https://portal.canpath.ca/).

0. Prepare

Adapt `docker-compose.yml` file to your needs, and get the docker images.

```
sudo make pull
```

1. Initialize

Launch the docker containers and let them create their application's home.

```
sudo make up
```

Populate when some test data.



2. Customize

Modify applications configurations and restart the docker containers.

```
sudo make install restart
```

3. Repeat

Modify applications configurations.

```
sudo make install
```

Restart the docker containers **if new files have been added**.

```
sudo make restart
```
