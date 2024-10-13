#!/bin/sh
#
#Upgrade system and packages to the latest version.
dnf5 upgrade [PACKAGE-NAME]

#Search for available packages in the system repository.
dnf5 search [PACKAGE-NAME]

#Install a new package by specifying its name.
dnf5 install [PACKAGE-NAME]

#Remove installed packages by specifying their names.
dnf5 remove [PACKAGE-NAME]

#Synchronize the installed packages with the latest versions available in the repositories for the current Fedora release.
dnf5 distro-sync [PACKAGE-NAME]

#Query information about a specified package from the DNF package repositories.
dnf5 repoquery [PACKAGE-NAME]

#Display information about packages that match the specified package specification.
dnf5 list [PACKAGE-NAME]

#Retrieve detailed information about a specified package.
dnf5 info [PACKAGE-NAME]

#Regenerate the metadata cache for the DNF package manager.
dnf5 makecache

#Display a list of repositories along with information about the number of packages available in each repository.
dnf5 repolist

#Display information about the repositories configured on the system.
dnf5 repoinfo
