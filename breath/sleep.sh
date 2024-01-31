#!/usr/bin/env bash

# Remove the sleep state specialization
sudo sed -i '/State=freeze/d' /etc/systemd/sleep.conf
