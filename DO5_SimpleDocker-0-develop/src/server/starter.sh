#!/bin/bash

gcc minisrv.c -lfcgi -o minisrv
spawn-fcgi -p 8080 ./minisrv
nginx -g "daemon off;"
service nginx start

/bin/bash
