# fast-examples-dvwa

Example of Wallarm FAST integration with the DVWA using selenium tests

## How to run tests localy

Install docker and docker-compose

Create your FAST node here and get TOKEN:
https://my.wallarm.com/nodes

Replace TOKEN in ./local.sh and run it

## Intergation with Circle CI

Create a project and pass following ENV variables:
```
TOKEN <YOUR WALLARM NODE TOKEN>
```

Example builds:
https://circleci.com/gh/wallarm/fast-examples-dvwa/

## Jenkins integration example:

Jenkins must have access to `sudo` and be able to run `docker-compose`

Use this repository as the git source (https://github.com/wallarm/fast-examples-dvwa)

Repeat the steps in local run example, but instead of launching the script, copy this modified version into your build step:

```
{
  sudo -E docker-compose build && \
  sudo -E docker-compose up -d dvwa fast selenium && \
  sudo -E docker-compose run test && \
  sudo -E docker-compose down --remove-orphans
} || {
  sudo -E docker-compose down --remove-orphans
  exit 1
}
```

The changes ensure the build step does cleanup in case of failure. You may set the Wallarm TOKEN in the script or use the Jenkins build params

### Jenkins preconfigured local example:

The preconfigured Jenkins example requires Jenkins to have access to `sudo` and `docker-compose`, which are lacking in the official Jenkins images. To ease the running of the provided example, you may use a pre-built image with the required components already present. One such image with startup instructions can be found here: https://github.com/fabianenardon/jenkins-docker-demo (requires installation of github plugin, uses the docker found on the host machine)

To run the local example, execute the following code:
```
git clone https://github.com/wallarm/fast-examples-dvwa
git clone https://github.com/fabianenardon/jenkins-docker-demo
cp fast-examples-dvwa/jenkins_home/jobs jenkins-docker-demo/jenkins_home/jobs -r
cd jenkins-docker-demo
sudo docker-compose build
sudo docker-compose up
```
After these commands have completed, you will have a running Jenkins instance on 8081, with the jenkins:jenkins user set up.

Finally, install the github plugin: https://wiki.jenkins.io/display/JENKINS/Github+Plugin (with restart)

The DVWA example will be ready to run after the github plugin has been installed.

### Jenkins public demo:

A pre-configured Jenkins example is be available to view and run builds with at https://jenkinsfast.demo.wallarm.com/ (user:demo, pass:demo). You may launch builds with your Wallarm TOKEN (and monitor the progress at https://my.wallarm.com/testing).
