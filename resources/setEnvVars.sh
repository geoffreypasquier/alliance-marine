
sudo tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF

# PHP environment variables.
export PHP_CONF_MEMORY_LIMIT="2048M"
export PHP_CONF_MAX_POST_SIZE="40M"

# Elasticsearch environment variable
export ES_JAVA_OPTS="-Xms1024m -Xmx1024m"

EOF
