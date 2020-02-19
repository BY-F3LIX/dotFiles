#!/bin/bash
lsof -i :$1 | tail -n +2 | awk '{system("kill -9 " $2)}'
