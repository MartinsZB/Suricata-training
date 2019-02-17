echo "********** BASIC SETUP **********"
sudo DEBIAN_FRONTEND=noninteractive apt-get update > /dev/null && sudo DEBIAN_FRONTEND=noninteractive apt-get full-upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install curl apt-transport-https build-essential autoconf automake libtool pkg-config make wget unzip git tcpdump tcpreplay -y

echo "*********** SURICATA SETUP **********"
git clone https://github.com/OISF/suricata suricata-build
cd suricata-build/
git clone https://github.com/OISF/libhtp -b 0.5.x
sudo DEBIAN_FRONTEND=noninteractive apt-get install libpcre3 libpcre3-dbg libpcre3-dev libpcap-dev   \
                libnet1-dev libyaml-0-2 libyaml-dev pkg-config zlib1g zlib1g-dev \
                libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev        \
                libnss3-dev libgeoip-dev liblua5.3-dev libluajit-5.1-dev libhiredis-dev libevent-dev \
                python-yaml libhyperscan-dev liblz4-dev python-simplejson -y

curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
#source ~/.bashrc
cd ~/suricata-build
./autogen.sh
./configure --prefix=$HOME/suricata/basic --sysconfdir=/vagrant/config --localstatedir=/vagrant/data --enable-hiredis --enable-luajit --enable-unix-socket --enable-profiling --enable-rust
make -j2
make install
#make install-conf
echo 'export PATH="$HOME/suricata/basic/bin:$PATH"' >> ~/.bashrc
sudo mkdir /var/run/suricata
source ~/.bashrc

echo "*********** SCIRIUS SETUP **********"
cd ~
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip dbconfig-common sqlite3 python-virtualenv
git clone https://github.com/StamusNetworks/scirius
cd scirius
virtualenv ./
source ./bin/activate
pip install -r requirements.txt
pip install pyinotify
pip install gitpython==0.3.1-beta2
pip install gitdb
NODE_VERSION="v10.15.0"
wget -4 -q https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz
tar -xJf node-$NODE_VERSION-linux-x64.tar.xz
mkdir ~/.npm-global
echo 'export PATH=~/.npm-global/bin:$PATH' > ~/.profile
echo "export PATH=$PWD/node-$NODE_VERSION-linux-x64/bin:\$PATH" > ~/.profile
source ~/.profile
npm config set prefix '~/.npm-global'
npm install -g npm@latest webpack@3.11
npm install
cd hunt
npm install
npm run build
cd ..
python manage.py migrate
/home/vagrant/.npm-global/bin/webpack
deactivate
cd ~
