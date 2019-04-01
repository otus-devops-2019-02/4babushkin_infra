# 4babushkin_infra

## HW-8 terraform-1

[![Build Status](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra.svg?branch=terraform-1)](https://travis-ci.com/otus-devops-2019-02/4babushkin_infra)

### Основное задание:
* Установил terraform
* Создал конфигурационные файлы terrraform
* Определил input переменную для приватного ключа и зоны 
* Определил output переменную с внешним IP созданной виртуальной машины (использовал outputs.tf)
* Отформатировал все конфигурационные файлы с помощью команды
```
terraform fmt -write=true
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



## HW-7
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


