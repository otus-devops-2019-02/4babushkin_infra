# 4babushkin_infra

## Lesson-12 HW ansible-3

[![Build Status](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra.svg?branch=ansible-3)](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra)

### Основное задание 1:
* Создал роли app db. `ansible-galaxy init app` и `ansible-galaxy init db`
* Создал окружения stage prod и перенес в них файл `inventory`. теперь при запуске `ansible-playbook -i environments/prod/inventory deploy.yml` видно с каким окруженим работаем
* Cконфигурировал окружения  stage и prod
* Организовал плейбуки `playbooks`. Перенес то что не относится к текущей конфигурации в каталог `old`
* Добавил в terraform открытие 80 порта. 
* Установил роль jdauphant.nginx из Ansible Galaxy `ansible-galaxy install -r environments/stage/requirements.yml`. Добавил вызов роли `jdauphant.nginx` в плейбук app.yml. 
* Применил `ansible-playbook playbooks/site.yml`. Теперь приложение доступно по 80 порту
* Vault настроил ключ. Шифрую `ansible-vault encrypt environments/prod/credentials.yml` и `ansible-vault encrypt environments/stage/credentials.yml`


### Дополнительное задание *:


## Lesson-11 HW ansible-2

[![Build Status](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra.svg?branch=ansible-2)](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra)

### Основное задание 1:
* `ansible-playbook reddit_app.yml --check --limit db` "пробный прогон" плейбука c ограничиваем группу хостов
* Применим наш плейбук `ansible-playbook reddit_app.yml --limit db`
* `ansible-playbook reddit_app.yml --check --limit app --tags app-tag` "пробный прогон" плейбука c ограничиваем группу хостов
* Один плейбук, несколько сценариев. Применим наш плейбук с тегом `app-tag` для группы хостов app `ansible-playbook reddit_app.yml --limit app --tags app-tag`
* Выполняем деплой `ansible-playbook reddit_app.yml --limit app --tags deploy-tag`
* Несколько плейбуков `app.yml db.yml deploy.yml`. В `site.yml` импортируем их. Запуск `ansible-playbook site.yml`

### Дополнительное задание *:
* Смог нагуглить `plugin: gcp_compute` Потому что все работает из коробки. В других динамических не смог разобратся.
* Полная детализация инвентори `ansible-inventory -i inventory.gcp.yml --list`
- Инфо [How to Use Ansible Gcp compute inventory plugin](http://matthieure.me/2018/12/31/ansible_inventory_plugin.html)

### Основное задание 2: Провижининг в Packer
* Создал два плейбука аналогичные bash-скриптам которые используются в Packer `packer_app.yml` - устанавливает Ruby и Bundler и `packer_db.yml` - добавляет репозиторий MongoDB
* Интегрировал Ansible в Packer и собрал новые образы
* Проверил работу `ansible-playbook site.yml --check` затем применил `ansible-playbook site.yml`




## Lesson-10 HW ansible-1

[![Build Status](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra.svg?branch=ansible-1)](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra)

### Основное задание:
* При запуске плейбука `nsible-playbook clone.yml` плейбук выполнился без ошибок но изменений не произошло, потому что каталог /home/appuser/reddit уже был на appserver.
* При удалении `rm -rf ~/reddit` и запуске плейбука `nsible-playbook clone.yml` плейбук выполнился без ошибок и склонировал наш репозиторий 

### Дополнительное задание 1:
* Создал inventory.json, добился успешного выполнения `ansible all -m ping`
* Добавил параметры в файл ansible.cfg для работы с инвентори в формате JSON

## Lesson-09 HW terraform-2

[![Build Status](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra.svg?branch=terraform-2)](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra)

### Основное задание:
* Определиk ресурс файервола и импортировал существующую инфраструктоуру файервола для 22 порта
* Создал два образа reddit-db-base и reddit-app-base
* Разбил конфиг main.tf на 2 конфига app.tf и db.tf
* Разбил конфигурацию на модули
* Создал и проверил модул vpc который определяет настройки файервола в рамках сети
* Создал две среды Stage и Prod
* Используя модуль [storage-bucket](https://registry.terraform.io/modules/SweetOps/storage-bucket/google/0.2.0) из ресстра модулей создал два баккета `"terraform2-prod", "terraform2-stage"`

### Дополнительное задание 1:
* настроил и првоерил хранение стейт файла в удаленном бекенде для окружений stage и prod

### Дополнительное задание 2:
* Пересобрал образ reddit-db-base с разрешением подлючения к базе со всех ip
* Сделал деплой прилождения в модуле app
* Добавил балансировщик к модулю app `count` - количество инстансов
```
Outputs:

app_external_ip = [
    35.187.165.115,
    34.76.236.136
]
app_frontend_ip = 35.205.146.159
db_external_ip = 35.195.227.86
db_local_ip = 10.132.0.3
```

### info links
  [How to set environment variable in systemd service](https://serverfault.com/questions/413397/how-to-set-environment-variable-in-systemd-service)
  [Template Provider](https://www.terraform.io/docs/providers/template/index.html)



## Lesson-08 HW terraform-1

[![Build Status](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra.svg?branch=terraform-1)](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra)

### Основное задание:
* Установил terraform
* Создал конфигурационные файлы terrraform
* Определил input переменную для приватного ключа и зоны 
* Определил output переменную с внешним IP созданной виртуальной машины (использовал outputs.tf)
* Отформатировал все конфигурационные файлы с помощью команды
```
terraform fmt
```
* Создал файл terraform.tfvars.example

### Дополнительное задание 1:
* Добавил ssh ключи пользователей в метаданные проекта google_compute_project_metadata
* После добавления appuser_web через веб интерфейсе, при выполнении `terraform apply`, пользователь удаляется

### Дополнительное задание 2:
* создан фаил lb.tf с балансировщиком (Проблемма в том что у каждого инстанса своя БД.)
* Добавлена переменаня count -  количество запускаемх инстансов

Пример Output
```
Outputs:

app_external_ip = [
    35.187.97.63,
    34.76.161.148
]
app_frontend_ip = 35.195.23.92

```



## Lesson-07 HW packer
### создания образа VM при помощи Packer

 1) Создал packer шаблон ubuntu16.json
 2) параметризировал созданный шаблон, используя пользовательские переменные variables.json
 3) Создал образы:

  Создаем базовый образ reddit-base (ruby mongo)
  ```
  packer build --var-file variables.json ubuntu16.json
  ```

  Создаем фулл образ reddit-full (ruby mongo app)
  ```
  packer build --var-file variables.json immutable.json
  ```

 4) Для автомотического создания инстанса create-reddit-vm.sh
  
  ```sh
  gcloud compute instances create reddit-full \
  --image=reddit-full-1553653135 \
  --tags puma-server \
  --restart-on-failure \
  --machine-type=f1-micro \
  ```

проверить можно тут http://146.148.24.75:9292


