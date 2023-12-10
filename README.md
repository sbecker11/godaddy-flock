# Updating the hosted spexture.com site at godday.com

## copy the relevant content from the local flock-of-postcards project
cd  /Users/sbecker11/workspace-parallax/flock-of-postcards-godaddy/public_html
ln -s /Users/sbecker11/workspace-parallax/flock-of-postcards .
cp flock-of-postcards/index.html .
cp flock-of-postcards/README.md .
cp -R flock-of-postcards/modules .
cp -R flock-of-postcards/static_content  .
cp flock-of-postcards/styles.css .
cp flock-of-postcards/main.mjs .

## login to godaddy.com
open http://goddaddy.com  
use google account scbboston@gmail.com  
go to  My Products / Web Hosting Manage All / cPanel Admin / File Manager / public_html  
use the file uploader  
