#!/bin/bash
set -e


if ! [ -e INSTALL.txt ]; 
	then

		echo >&2 "ProcessMaker not found in $(pwd) - copying now..."
		tar -zxvf /temp/processmaker.tar.gz -C /opt/
		echo >&2 "Complete! ProcessMaker has been successfully copied to $(pwd)"
	fi



if ! [ -e gulliver ]; 
	then
		echo >&2 "Extra configuration..."
		ln -s /opt/processmaker/gulliver/bin/gulliver gulliver
	fi




exec "$@"		