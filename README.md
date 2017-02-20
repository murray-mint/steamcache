# Steam Cache Docker Container

## Introduction

This docker container provides a caching proxy server for game download content. For any network with more than one PC gamer in connected this will drastically reduce internet bandwidth consumption.

The primary use case is gaming events, such as LAN parties, which need to be able to cope with hundreds or thousands of computers receiving an unannounced patch - without spending a fortune on internet connectivity. Other uses include smaller networks, such as Internet Cafes and home networks, where the new games are regularly installed on multiple computers; or multiple independent operating systems on the same computer.

This container is designed to support any game that uses HTTP and also supports HTTP range requests (used by Origin). This should make it suitable for:

 - Steam (Valve)
 - Origin (EA Games)
 - Riot Games (League of Legends)
 - Battle.net (Hearthstone, Starcraft 2, Overwatch)
 - Frontier Launchpad (Elite Dangerous, Planet Coaster)
 - Uplay (Ubisoft)
 - Windows Updates

## Usage

You will need to have a DNS server forwarding queries to the machine your docker container is running on. You can use the [steamcache-dns](https://hub.docker.com/r/steamcache/steamcache-dns/) docker image to do this or you can use a DNS service already on your network see the [steamcache-dns github page](https://github.com/steamcache/steamcache-dns) for more information.

Run the origin container using the following to allow TCP port 80 (HTTP) through the host machine. Replace `/tmp/steamcache` with a directory to store downloaded data, such as a dedicated hard-drive.

```
docker run -it --name steamcache -p 80:80 -v /tmp/steamcache:/data kixelated/steamcache:latest
```

Add the `-d` argument to run the docker container in the background. Logs can then be accessed using `docker logs steamcache`.

## Quick Explanation

For a steam cache to function on your network you need two services.
* A depot cache service [This container](https://github.com/steamcache/steamcache)
* A special DNS service [steamcache-dns](https://github.com/steamcache/steamcache-dns)

The cache service transparently proxies your requests for content to the content procider, or serves the content to you if it already has it.

## Running on Startup

Follow the instructions in the Docker documentation to run the container at startup.
[Documentation](https://docs.docker.com/engine/admin/host_integration/)

## License

The MIT License (MIT)

Copyright (c) 2015 Jessica Smith, Robin Lewis, Brian Wojtczak, Jason Rivers

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
