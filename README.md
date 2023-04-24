# pr0l_infra

Создал настройки SSH для подключения к машинам.
```
MacBook-Air ~ % cat .ssh/config

Host bastion
    User bastion
    Hostname 84.201.167.163
    Port 22
    IdentityFile ~/.ssh/bastion

Host someinternalhost
    User bastion
    Hostname 10.129.0.27
    Port 22
    IdentityFile ~/.ssh/bastion
```


Проверка подключения к внутренней машине через гейт (машину с белым ip).
```
MacBook-Air~ % ssh -J bastion someinternalhost
Enter passphrase for key '~/.ssh/bastion':
Enter passphrase for key '~/.ssh/bastion':
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-147-generic x86_64)
bastion@someinternalhost:~$
```


Тут показываю что нет приватных ключей и каких либо дополнительных настроек.
```
bastion@bastion:~$ ls -la .ssh/
total 20
drwx------ 2 bastion bastion 4096 Apr 24 22:13 .
drwxr-xr-x 4 bastion bastion 4096 Apr 24 22:13 ..
-rw------- 1 bastion bastion  561 Apr 24 21:49 authorized_keys
-rw-r--r-- 1 bastion bastion  222 Apr 24 22:02 known_hosts

bastion@someinternalhost:~/.ssh$ ls -la
total 12
drwx------ 2 bastion bastion 4096 Apr 24 21:58 .
drwxr-xr-x 4 bastion bastion 4096 Apr 24 22:06 ..
-rw------- 1 bastion bastion  561 Apr 24 21:58 authorized_keys
```

Доп задание:

Добавляем ProxyJump в *~/.ssh/config*
```
ProxyJump bastion
```
Получаем:
```
MacBook-Air ~ % cat .ssh/config
Host bastion
    User bastion
    Hostname 84.201.167.163
    Port 22
    IdentityFile ~/.ssh/bastion

Host someinternalhost
    User bastion
    Hostname 10.129.0.27
    Port 22
    IdentityFile ~/.ssh/bastion
    ProxyJump bastion
```

После этого, мы можем подключаться до внутренней машины одной коммандой
```
MacBook-Air ~ % ssh someinternalhost
Enter passphrase for key '~/.ssh/bastion':
Enter passphrase for key '~/.ssh/bastion':
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-147-generic x86_64)
bastion@someinternalhost:~$
```
