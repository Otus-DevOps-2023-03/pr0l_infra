#!/bin/sh
#echo 'Соберем свой образ'
#packer build -var-file=variables.json immutable.json
echo 'Посмотреть образы в Ya Cloud -  yc compute image list'
echo 'Мы автоматически берем первый образ, думая что лишнего нет'
echo 'Если у вас другой образ, можно руками заменить переменную image'
echo 'установив свой image-id'
image=`yc compute image list | cut -f 2 -d '|' | head '-4' | tail -n1 |sed s/' '//g`
yc compute instance create --name reddit-app \
  --hostname reddit-app \
  --memory=4 --cores=2 --core-fraction=5\
  --create-boot-disk image-id=$image,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/bastion.pub
