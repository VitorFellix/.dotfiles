#!/bin/bash

echo 'setting cpu frequency to performance...'
sudo cpupower frequency-set -g performance
echo 'checking cpu frequency...'
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo 'done'
