#!/bin/#!/usr/bin/env bash
echo "Installing packages"
# Install modules
sh ./install_packages.sh

echo "Generating synthetic users"
# Generate 2 fake web site users
python user_generator.py --n=10

echo "Generating synthetic events"
rm *.out 2> /dev/null
# Generate 10 events
python batch_event_generator.py --num_e=1000


