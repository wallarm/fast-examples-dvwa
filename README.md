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

Jenkins must be able to run docker-compose

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

The changes ensure the build step does cleanup in case of failure. You may set the wallarm TOKEN in the script or use the jenkins build params

To run jenkins example locally copy the contents of `jenkins_home` into your own jenkins folder
