#!/usr/bin/env bash

# Global git configuration
git config --global color.ui true
git config --global diff.csv.wordRegex $'[^,\n]+[,\n]|[,]'

# Setup CSV diff in gitattributes
ATTR_FILE_DIR="${HOME}/.config/git"
ATTR_FILE="${ATTR_FILE_DIR}/attributes"
# Make sure attribute file and directory exist
mkdir -p ${ATTR_FILE_DIR}
touch ${ATTR_FILE}
# Strip out old CSV lines
grep -v '\*.csv' ${ATTR_FILE} > ${ATTR_FILE}-new
# Add CSV config to start of file and append old stripped file
echo -e "*.csv	diff=csv" > ${ATTR_FILE}
cat ${ATTR_FILE}-new >> ${ATTR_FILE}
# Clean up
rm ${ATTR_FILE}-new