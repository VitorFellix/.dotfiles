#!/bin/bash

killall -g polybar

polybar -r primary &
polybar -r secondary &
