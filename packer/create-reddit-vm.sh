yc compute instance create --name reddit-app \
  --hostname reddit-app \
  --memory=4 --cores=2 --core-fraction=5\
  --create-boot-disk image-id=fd881th12lborukr60fg,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key ~/.ssh/bastion.pub
