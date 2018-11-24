# BlackHoodie 2018 Workshop
## Capture The Flag - An Introduction To Binary Exploitation

Slides and challenges for my binary exploitation workshop at [BlackHoodie 2018](https://www.blackhoodie.re/).

Note: The challenges are no longer running on ctf.katharina-maennle.de. See the following instructions to set up your own environment.


### Challenge Setup

To recreate the CTF environment with docker:

```
./docker_build.sh <module_name>
./docker_run.sh <module_name> <port>
```
module_names: {chall0, chall1, chall1c, chall1d}


Connect to the service:
```
nc localhost <port>
```


Use the following command to retrieve the libc used in the docker environment:
```
docker cp chall1:/lib/x86_64-linux-gnu/libc-2.27.so .
```
