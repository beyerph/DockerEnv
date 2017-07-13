

# Set ENV-Vars for Dinghy
eval $(dinghy env)

# STOP ALL
docker stop $(docker ps -a -q)
#docker rm $(docker ps -a -q)

# START web/worker-container
docker-compose up -d --force-recreate