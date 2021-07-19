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
