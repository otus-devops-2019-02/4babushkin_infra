# 4babushkin_infra

Подключение к bastion:
```console
ssh -i ~/.ssh/forbabushkin forbabushkin@35.205.160.30
```

Подключение к someinternalhost одной командой (сквозное подключение):
```console
ssh -t -i ~/.ssh/forbabushkin -A forbabushkin@35.205.160.30 ssh 10.132.0.3
```

Вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost
Внести в ~/.ssh/config следующие настройки:

<pre>
Host bastion
    HostName 35.205.160.30
    User forbabushkin
    ForwardAgent yes
    IdentityFile ~/.ssh/forbabushkin

Host someinternalhost
    HostName 10.132.0.3
    User forbabushkin
    IdentityFile ~/.ssh/forbabushkin
    ProxyCommand ssh bastion -W %h:%p
</pre>

После этого можно подключаться к someinternalhost через baston коммандой:
`ssh someinternalhost`


Валидный сертификат https https://35.205.160.30.xip.io/


##gcloud

Создание инстанса :
```bash
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=./startup_script.sh
```


Create instans with scrypt url
```bash
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata startup-script-url=https://gist.githubusercontent.com/4babushkin/61b7790b24f2580e3c5dd53d11548a17/raw/23914173d002d606e195eb7ebd6951b5d12583a3/startup_script.sh
```


#firewall
Создание правила в файрволе:
```bash
gcloud compute firewall-rules create default-puma-server \
--direction=INGRESS \
--priority=1000 \
--network=default \
--action=ALLOW --rules=tcp:9292 \
--source-ranges=0.0.0.0/0 \
--target-tags=puma-server
```

```conf
bastion_IP = 35.205.160.30
someinternalhost_IP = 10.132.0.3

testapp_IP = 34.76.135.9
testapp_port = 9292
```
