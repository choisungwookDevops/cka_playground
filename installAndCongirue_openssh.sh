#/bin/bash
useradd test
echo -e "toor\ntoor" | passwd test
echo -e "toor\ntoor" | passwd # root password
sed  -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service ssh restart