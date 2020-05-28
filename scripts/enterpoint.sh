#!/bin/bash
supervisord -c /etc/supervisord.conf
redis-server
