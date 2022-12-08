# Powershell examples for Musala DevOps Academy

## Running the examples with docker
<hr/>

Run command `docker build -t musala-test-lts-7.2-alpine-3.14 .` to create docker image to run powershell scripts. 

Then run `docker run --name musala_poweshell_examples -v <project absolute dir>:/project musala-test-lts-7.2-alpine-3.14` to create container