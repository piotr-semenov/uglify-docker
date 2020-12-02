[![uglify-js:3.12.1](https://img.shields.io/badge/uglifyjs-3.12.1-green.svg)](https://www.npmjs.com/package/uglify-js)
[![uglifycss:0.0.29](https://img.shields.io/badge/uglifycss-0.0.29-green.svg)](https://www.npmjs.com/package/uglifycss)
[![semenovp/tiny-uglify:latest](https://img.shields.io/docker/image-size/semenovp/tiny-uglify/latest)](https://hub.docker.com/r/semenovp/tiny-uglify)
[![docker image size](https://img.shields.io/microbadger/layers/semenovp/tiny-uglify/latest)](https://microbadger.com/images/semenovp/tiny-uglify/)
[![docker pulls](https://img.shields.io/docker/pulls/semenovp/tiny-uglify.svg)](https://hub.docker.com/r/semenovp/tiny-uglify/)

# Usage
Just add the following alias to your .bashrc (or .bash_profile in OSX):

```bash
alias uglify='docker run --rm -v `pwd`:/workdir -w /workdir semenovp/tiny-uglify:latest'
```

Its usage: `uglify <command> [input files] [options]`.

These are two obvious commands:

| Command | Description |
|:-------:|:-----------:|
| js | Call `uglifyjs` (see its [usage](https://www.npmjs.com/package/uglify-js#command-line-usage)) |
| css | Call `uglifycss` (see its [usage](https://www.npmjs.com/package/uglifycss#command-line)) |

Now your shell is ready to go.
For example, do like this:

```bash
uglify js --compress --mangle --toplevel --output output.js input.js

uglify css --expand-vars --max-line-len 500 --output output.css input.css
```

# How to build on your own?
```bash
docker build -t semenovp/tiny-uglify:latest .
```

# List of `uglify` images

Review the sizes of another `uglify` images retrieved from [DockerHub](https://hub.docker.com) against current one built on Node.js v15.3.0.
Note, the original [node:alpine](https://hub.docker.com/_/node) is of 37.85Mb / 109Mb.

| REPOSITORY | YYYY-MM-DD | COMPRESSED / UNCOMPRESSED SIZE |
|:-----------|:----------:|:------------------------------:|
| **[semenovp/tiny-uglify:latest](https://hub.docker.com/r/semenovp/tiny-uglify)** | 2020-11-30 | **33.69MB / 94.6MB** |
| [sirehna/uglify:RELEASE-2020-05-05](https://hub.docker.com/r/sirehna/uglify) | 2020-05-05 | 58.24MB / 169MB |
| [olbat/uglify:latest](https://hub.docker.com/r/olbat/uglify) | 2020-11-29 | 142.89MB / 389MB |
| [minty/uglifyjs:2.0](https://hub.docker.com/r/minty/uglifyjs) | 2015-07-24 | 242.10MB / 642MB |
| [davidlartey/uglifyjs:0.1.1](https://hub.docker.com/r/davidlartey/uglifyjs) | 2016-02-26 | 243.72M / 645MB |
| [dmilhdef/uglify-js-smith:latest](https://hub.docker.com/r/dmilhdef/uglify-js-smith) | 2016-09-11 | 245.16M / 656MB |
