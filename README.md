# 4babushkin_infra

## создания образа VM при помощи Packer

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


