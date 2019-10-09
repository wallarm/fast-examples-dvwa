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
