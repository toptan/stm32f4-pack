#!/bin/bash

PROJECT_NAME=""

while getopts ":n:" opt; do
	case $opt in
		n)
			echo "Generating STM32 project \"$OPTARG\"" >&2
			PROJECT_NAME=$OPTARG
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires project name as argument." >&2
			exit 1
			;;
	esac
done

if [ -z $PROJECT_NAME ]; then
	echo "Usage: create-stm32-project.sh -n <project_name>"
	exit 1
fi
