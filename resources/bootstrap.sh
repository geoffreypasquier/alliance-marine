#!/bin/bash

set -e
if [ -f /home/akeneo/presales/vagrant/bootstrap-provision-demo-maker.sh ]; then
    sh /home/akeneo/presales/vagrant/bootstrap-provision-demo-maker.sh || true
fi
