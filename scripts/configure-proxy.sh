#!/bin/zsh

cntlm_conf=/etc/cntlm.conf
proxy_conf=/etc/apt/apt.conf.d/proxy.conf

printf "Enter your username: "; read username
printf "Enter your domain: "; read domain
printf "Enter your proxy: "; read proxy
printf "Enter your password: "; read -s password
printf "\n"

sed -i "/^PassLM.*/d" $cntlm_conf
sed -i "/^PassNT.*/d" $cntlm_conf
sed -i "/^PassNTLMv2.*/d" $cntlm_conf

echo $password | cntlm -u $username -d $domain -H | xargs -0 echo >> $cntlm_conf

sed -i "/^Password.*/d" $cntlm_conf
sed -i "/^Proxy.*/d" $cntlm_conf

sed -i "s/Username.*/Username\t$username/" $cntlm_conf
sed -i "s/Domain.*/Domain\t\t$domain/" $cntlm_conf

echo -e "Proxy\t\t$proxy" >> $cntlm_conf

echo "Acquire {" > $proxy_conf
echo -e "\tHTTP::proxy \"http://127.0.0.1:3128/\";" >> $proxy_conf
echo -e "\tHTTPS::proxy \"http://127.0.0.1:3128/\";" >> $proxy_conf
echo "}" >> $proxy_conf

echo export http_proxy=http://127.0.0.1:3128 >> ~/.bashrc
echo export https_proxy=http://127.0.0.1:3128 >> ~/.bashrc

echo export http_proxy=http://127.0.0.1:3128 >> ~/.zshrc
echo export https_proxy=http://127.0.0.1:3128 >> ~/.zshrc
