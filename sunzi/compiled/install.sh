#!/bin/bash
set -e

# Load base utility functions like sunzi.mute() and sunzi.install()
source recipes/sunzi.sh

# This line is necessary for automated provisioning for Debian/Ubuntu.
# Remove if you're not on Debian/Ubuntu.
export DEBIAN_FRONTEND=noninteractive

# Add Dotdeb repository. Recommended if you're using Debian. See http://www.dotdeb.org/about/
# source recipes/dotdeb.sh
# source recipes/backports.sh

# Update apt catalog and upgrade installed packages
sunzi.mute "apt-get update"
sunzi.mute "apt-get -y upgrade"

# Install packages
apt-get -y install git-core ntp curl

# Install sysstat, then configure if this is a new install.
if sunzi.install "sysstat"; then
  sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
  /etc/init.d/sysstat restart
fi

source roles/debian.sh
source roles/web.sh
source roles/db.sh
source roles/vim.sh
source roles/concrete5.sh

