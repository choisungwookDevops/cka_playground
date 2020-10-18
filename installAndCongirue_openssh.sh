#/bin/bash
useradd -m -s /bin/bash test  # -m: home directory, -s: login shell
useradd -m -s /bin/bash test2  # -m: home directory, -s: login shell
echo -e "toor\ntoor" | passwd test
echo -e "toor\ntoor" | passwd test2
echo -e "toor\ntoor" | passwd # root password
sed  -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service ssh restart