#!/usr/bin/env sh

set -o errexit
set -o pipefail
set -o nounset

OPTIONAL_REACT_APP_ENVVAR=${REACT_APP_ENVVAR:-'unspecified'}

echo "Runtime variables that will be used:"
echo REACT_APP_API_URL = $REACT_APP_API_URL
echo REACT_APP_API_KEY = $REACT_APP_API_KEY
echo REACT_APP_BUILD_DATE = $REACT_APP_BUILD_DATE

echo "Replacing environment variables..."
sed -i "s!REACT_APP_API_URL_REPLACE_TOKEN!$REACT_APP_API_URL!g" /usr/share/nginx/html/static/js/main.*.js*
sed -i "s!REACT_APP_API_KEY_REPLACE_TOKEN!$REACT_APP_API_KEY!g" /usr/share/nginx/html/static/js/main.*.js*
sed -i "s!REACT_APP_BUILD_DATE_REPLACE_TOKEN!$REACT_APP_BUILD_DATE!g" /usr/share/nginx/html/static/js/main.*.js*

echo "Starting nginx"
nginx -g "daemon off;"
