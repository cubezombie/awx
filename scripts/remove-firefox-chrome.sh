#!/bin/bash

# Define a variable for the applications to be removed
PACKAGES="firefox google-chrome-stable"

# Function to remove packages
remove_packages() {
    if [[ -n "$1" ]]; then
        echo "Removing $PACKAGES..."
        case "$1" in
            "yum" | "dnf")
                sudo $1 remove -y $PACKAGES
                ;;
            "zypper")
                sudo zypper rm -y $PACKAGES
                ;;
            "apt-get")
                sudo apt-get remove --purge -y $PACKAGES
                sudo apt-get autoremove -y
                ;;
            *)
                echo "Unsupported package manager: $1"
                ;;
        esac
    else
        echo "No valid package manager detected."
    fi
}

# Determine the package manager and distribution
if [ -f /etc/redhat-release ]; then
    # For RHEL, CentOS, and Fedora
    if grep -q "release 6" /etc/redhat-release; then
        PKG_MANAGER="yum"
    elif grep -q "release 7\|release 8\|release 9" /etc/redhat-release; then
        PKG_MANAGER="dnf"
    fi
elif [ -f /etc/debian_version ]; then
    # For Ubuntu and Debian
    PKG_MANAGER="apt-get"
elif [ -f /etc/os-release ]; then
    # For SUSE
    if grep -q "SUSE" /etc/os-release; then
        PKG_MANAGER="zypper"
    fi
fi

# Run the removal function based on the detected package manager
if [ -n "$PKG_MANAGER" ]; then
    remove_packages $PKG_MANAGER
else
    echo "Unable to detect package manager or unsupported distribution."
fi

echo "Removal process completed."

