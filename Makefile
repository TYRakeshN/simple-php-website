#!/usr/bin/env php
<?php
/**
* Nextcloud - News
*
* This file is licensed under the Affero General Public License version 3 or
* later. See the COPYING file.
*
* @author Benjamin Brahmer <info@b-brahmer.de>
* @copyright Benjamin Brahmer 2020
*/

if ($argc < 2) {
    echo "This script expects two parameters:\n";
    echo "./file_from_env.php ENV_VAR PATH_TO_FILE\n";
    exit(1);
}

# Read environment variable
$content = getenv($argv[1]);

if (!$content){
    echo "Variable was empty\n";
    exit(1);
}

file_put_contents($argv[2], $content);

echo "Done...\n";

cert_dir=$(HOME)/.nextcloud/certificates
[...]
appstore:
[...]
# export the key and cert to a file
mkdir -p $(cert_dir)
php ./bin/tools/file_from_env.php "app_private_key" "$(cert_dir)/$(app_name).key"
php ./bin/tools/file_from_env.php "app_public_crt" "$(cert_dir)/$(app_name).crt"
[...]
@if [ -f $(cert_dir)/$(app_name).key ]; then \
  echo "Signing app files…"; \
  php ../../occ integrity:sign-app \
    --privateKey=$(cert_dir)/$(app_name).key\
    --certificate=$(cert_dir)/$(app_name).crt\
    --path=$(appstore_sign_dir)/$(app_name); \
  echo "Signing app files ... done"; \
fi
