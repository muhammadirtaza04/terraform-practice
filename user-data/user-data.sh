		#!/bin/sh
        sudo apt-get update
	    #sudo apt install jq
		#sudo apt install docker
        sudo yum install -y yum-utils
		sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
		sudo yum -y install terraform