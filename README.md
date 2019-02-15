Some late night training stuff...

Install vagrant

<code>
VAGRANT='2.2.3' 
WGET_OPTS='-q -4'
wget $WGET_OPTS https://releases.hashicorp.com/vagrant/$VAGRANT/vagrant_$(VAGRANT)_x86_64.deb 
dpkg -i vagrant_$(VAGRANT)_x86_64.deb
</code>




Install vagrant guest plugin

<code>vagrant plugin install vagrant-vbguest<code/>
