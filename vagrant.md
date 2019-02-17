Install <b>VAGRANT</b></br>
</br>
<code>VAGRANT='2.2.3'</code></br>
<code>WGET_OPTS='-q -4'</code></br>
<code>wget $WGET_OPTS https://releases.hashicorp.com/vagrant/$VAGRANT/vagrant_$(VAGRANT)_x86_64.deb dpkg -i vagrant_$(VAGRANT)_x86_64.deb</code></br>
</br>
Install <b>vagrant guest plugin</b>
</br>
<code>vagrant plugin install vagrant-vbguest</code></br>
