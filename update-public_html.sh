#!/bin/bash

FLOCK_DIR=/Users/sbecker11/workspace-parallax/flock-of-postcards
if [ ! -d ${FLOCK_DIR} ]; then
    echo "FLOCK_DIR does not exist: ${FLOCK_DIR}"
    exit 1
fi

GODADDY_PUBLIC_HTML=/Users/sbecker11/workspace-parallax/godaddy-flock-of-postcards/public_html

## backup and re-create the current public_html
if [ -d ${GODADDY_PUBLIC_HTML} ]; then
    tar -czf ${GODADDY_PUBLIC_HTML}.${iso8601}.tar.gz ${GODADDY_PUBLIC_HTML}
    rm -rf ${GODADDY_PUBLIC_HTML}
    mkdir -p ${GODADDY_PUBLIC_HTML}
fi

## fill the new public_html folder from the flock-of-postcards project
cp ${FLOCK_DIR}/static_content/jobs/jobs.mjs ${GODADDY_PUBLIC_HTML}/static_content/jobs/jobs.js
cp ${FLOCK_DIR}/main.mjs ${GODADDY_PUBLIC_HTML}/main.js
cp ${FLOCK_DIR}/modules/focal_point.mjs ${GODADDY_PUBLIC_HTML}/modules/focal_point.js
cp ${FLOCK_DIR}/modules/timeline.mjs ${GODADDY_PUBLIC_HTML}/modules/timeline.js
cp ${FLOCK_DIR}/modules/utils.mjs ${GODADDY_PUBLIC_HTML}/modules/utils.js
cp ${FLOCK_DIR}/modules/monoColor.mjs ${GODADDY_PUBLIC_HTML}/modules/monoColor.js
cp ${FLOCK_DIR}/modules/alerts.mjs ${GODADDY_PUBLIC_HTML}/modules/alerts.js

cp ${FLOCK_DIR}/styles.css ${GODADDY_PUBLIC_HTML}/styles.css
cp ${FLOCK_DIR}/modules/alerts.css ${GODADDY_PUBLIC_HTML}/modules/alerts.css
cp ${FLOCK_DIR}/modules/timeline.css ${GODADDY_PUBLIC_HTML}/modules/timeline.css

cp -R ${FLOCK_DIR}/static_content ${GODADDY_PUBLIC_HTML}/static_content
cp ${FLOCK_DIR}/index.html ${GODADDY_PUBLIC_HTML}/index.html
cp ${FLOCK_DIR}/README.md ${GODADDY_PUBLIC_HTML}/README.md
cp ${FLOCK_DIR}/favicon.ico ${GODADDY_PUBLIC_HTML}/favicon.ico
cp ${FLOCK_DIR}/404.html ${GODADDY_PUBLIC_HTML}/404.html

echo "Done"