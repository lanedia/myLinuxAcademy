vim /etc/ssh/sshd_config
	search for PermitRootLogin - uncomment to enable this.
systemctl restart sshd
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install -y puppet

vim /etc/puppet/puppet.conf
	server = lanedia3.mylabserver.com


on node
-------
puppet agent -t
puppet agent --waitforcert 60
on server
---------
[root@lanedia3 ~]# puppet cert list
puppet c  "lanedia4.mylabserver.com" (SHA256) 67:CA:FB:6F:13:E5:47:87:56:B9:C2:BD:41:49:DC:26:77:A0:13:5E:18:0A:D8:98:D6:CE:4E:9B:83:AB:D5:E1
e[root@lanedia3 ~]# puppet cert sign "lanedia4.mylabserver.com"
Notice: Signed certificate request for lanedia4.mylabserver.com
Notice: Removing file Puppet::SSL::CertificateRequest lanedia4.mylabserver.com at '/etc/puppetlabs/puppet/ssl/ca/requests/lanedia4.mylabserver.com.pem'





vi /etc/puppetlabs/puppet/manifests/site.pp
look for node default
node default {
	class { 'motd': }
}

