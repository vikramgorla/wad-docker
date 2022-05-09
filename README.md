[![Docker Build](https://github.com/vikramgorla/wad-docker/actions/workflows/docker-build.yml/badge.svg)](https://github.com/vikramgorla/wad-docker/actions/workflows/docker-build.yml)

# WAD - Web application detector

This is a containerized implementation of [WAD](https://github.com/CERN-CERT/WAD) 

WAD lets you analyze given URL(s) and detect technologies used by web application behind that URL, 
from the OS and web server level, to the programming platform and frameworks, as well as server- and client-side
applications, tools and libraries. 

For example, results of scan of server might include: 

  * OS: Windows, Linux...
  * Web server: Apache, Nginx, IIS...
  * Programming platform: PHP, Python, Ruby, Java...
  * Content management systems: Drupal, WordPress...
  * Frameworks: AngularJS, Ruby on Rails, Django...
  * various databases, analytics tools, javascript libaries, CDNs, comment systems, search engines and many others.

## Getting Started

These instructions will cover usage information and for the docker container 

### Prerequisities


In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

This container exposes wad command as-is from the project, you can use all parmeters of WAD
```shell
    --version             show program's version number and exit
    -h, --help            show this help message and exit
    -u URLS|@FILE, --url=URLS|@FILE
                            list of URLs (comma-separated), or a file with a list
                            of URLs (one per line)
    -l URLMASK, --limit=URLMASK
                            in case of redirections, only include pages with URLs
                            matching this mask - e.g. 'https?://[^/]*\.abc\.com/'
    -x URLMASK, --exclude=URLMASK
                            in case of redirections, exclude pages with URL
                            matching this mask - e.g.
                            'https?://[^/]*/(login|logout)'
    -o FILE, --output=FILE
                            output file for detection results (default: STDOUT)
    -c FILE, --clues=FILE
                            clues for detecting web applications and technologies
    -t TIMEOUT, --timeout=TIMEOUT
                            set timeout (in seconds) for accessing a single URL
    -f FORMAT, --format=FORMAT
                            output format, allowed values: csv, txt, json
                            (default)
    -g, --group           group results (i.e. technologies found on subpages of
                            other scanned URL aren't listed)
    -q, --quiet           be quiet
    -v, --verbose         be verbose
    -d, --debug           be more verbose
    --log=FILE            log to a file instead to standard output
```

### Examples

#### Test if container is working

Container will run WAD on https://www.google.com as a default url, you can test it by just running container without passing any parameters and it display/stdout the output.

```shell
docker run --rm vikramgorla/wad
```

#### Detect technologies on a single URL 

```shell
docker run --rm vikramgorla/wad -u https://www.google.com
```

#### Detect technologies on list of urls listed in a file named `urls.txt` and output it to a file named `tech.json` in the local directory on the machine you are running container on

```shell
docker run -v $(pwd)/:/data --rm vikramgorla/wad -u @urls.txt -o tech.json
```

##### Example urls.txt file content

```shell
http://www.google.com/
http://www.twitter.com
http://www.shopify.com
```

#### Volumes

* `/data` - location of input and output files you will pass to WAD


## Built With

* [Python Base Image](https://hub.docker.com/_/python)
* [WAD](https://github.com/CERN-CERT/WAD) 


## You can see the Dockerfile and dependencies used to build this container at [GitHub](https://github.com/vikramgorla/wad-docker)


## Versioning

The container tag will be matched to the version of WAD, the current version is based on version `0.4.6` of WAD, see the 
[tags on this repository](https://github.com/vikramgorla/wad-docker/tags). 

## Authors

* **Vikram Gorla** - *Initial work* - [Vikram Gorla](https://github.com/vikramgorla/)


## License

This project is licensed under the GNU General Public License v3.0- see the [LICENSE.md](LICENSE.md) file for details.
The License is matched to the one of the WAD project

## Acknowledgments

* Maintainers of [WAD](https://github.com/CERN-CERT/WAD) project,  this container is just a package of the original project, the WAD project is not maintained by the maintainer of this container image, 
