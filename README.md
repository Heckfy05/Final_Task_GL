# Final_Task_GL
ansible-galaxy install jnv.unattended-upgrades

docker run --rm -it -v /Users/ruslankarpyn/Documents/DevOPS/kubespray:/mnt \
  -v /Users/ruslankarpyn/.ssh:/pem \
  quay.io/kubespray/kubespray:v2.20.0 bash

  ansible-playbook -i inventory/mycluster/inventory.ini --private-key /pem/GCP -e ansible_user=root -b  cluster.yml

kubectl run mywp1 --image wordpress:5.1.1-php7.3-apache
s