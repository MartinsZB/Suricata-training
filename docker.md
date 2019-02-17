docker stop [NAME]</br>
docker rm [NAME]</br>
</br>
<b>Docker REDIS</b></br>
docker run -itd --name redis -h redis --network host --restart unless-stopped --user 1000 -v /vagrant/data/redis:/data --log-driver syslog --log-opt tag="redis" redis
