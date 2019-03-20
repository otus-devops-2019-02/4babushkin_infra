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

```conf
bastion_IP = 35.205.160.30
someinternalhost_IP = 10.132.0.3
```

Валидный сертификат https https://35.205.160.30.xip.io/

