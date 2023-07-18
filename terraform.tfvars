
db_server_name = "deggymacets"

lemmy_external_fqdn = "feddit.deggymacets.uk"

// Container App Images

# NGINX 'hello world' image
helloworld_nginx_image = "897safsacr.azurecr.io/helloworld-nginx:dbk"

# NGINX
# :dbg last 'working' image
nginx_image    = "897safsacr.azurecr.io/lemmy-nginx:dbh"

# Caddy
caddy_image    = "897safsacr.azurecr.io/lemmy-caddy:dbs"

# Lemmy UI
lemmy_ui_image = "897safsacr.azurecr.io/lemmy-ui:dbn"
#lemmy_ui_image = "docker.io/dessalines/lemmy-ui:0.18.2"

# Lemmy backend
lemmy_image    = "897safsacr.azurecr.io/lemmy:dbm"
