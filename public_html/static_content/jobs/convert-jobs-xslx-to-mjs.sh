#!/bin/bash

# Developer can edit the given jobs.xlsx spreadsheet,
# but changing the columns will require further 
# cevelopment.
# 
# This bash script converts the jobs.xlsx file to a 
# jobs.js file which can be referenced as static content 
# from any html file.
# 
# Details:
# The jobs.xlsx spreadsheet file is converted to a csv file and 
# then to a json file using in2csv and csvjson. These are python 
# utilities that become callable after activating the local 
# python virtual environment using `source venv/bin/activate`.
#
# The jobs.json file is then used to create the jobs.js file
# using standard unix tools.  The `truncate -s -1 jobs.js` line 
# removes the trailing newline character added by
# `echo "const jobs = " > jobs.js`
#
# The new jobs.js file is then referenced from html as any 
# local javascript file using:
#   <script type="text/javascript" src="static_files/jobs.js"></script>
#

if [ -n "$VIRTUAL_ENV" ]; then
    type deactivate &>/dev/null && deactivate
else
    echo "No virtual environment detected."
fi
rm -rf venv
rm -f jobs.csv jobs.json jobs.js venv
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
in2csv jobs.xlsx > jobs.csv
cat jobs.csv | python csv2json.py > jobs.json
echo -n "const jobs = " > jobs.js
cat jobs.json >> jobs.js
truncate -s -1 jobs.js
echo ";" >> jobs.js
type deactivate &>/dev/null && deactivate
rm -f jobs.csv jobs.json
rm -rf venv
echo "done"