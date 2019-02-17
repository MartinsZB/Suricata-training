docker stop <NAME>
docker rm <name>

<b>Docker REDIS</b>
docker run -it --name redis -h redis --network host --restart unless-stopped --user 1000 -v /vagrant/data/redis:/data --log-driver syslog --log-opt tag="redis" redis
