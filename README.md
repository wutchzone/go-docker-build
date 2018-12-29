# GO docker build
This image can help you build your go app for your alpine container. When you run the container you must specifify package manager, sourcecode folder and output folder.

# Available variables

|  ENV VARIABLES  |      |
|-----------------|------|
| PACKAGE_MANAGER | none |
|                 | dep  |

# Usage
```shell
docker container run --rm -it -e PACKAGE_MANAGER="none" -v `pwd`/_example:/go/src -v `pwd`/out:/go/out "wutchzone/go-docker-build"
```
