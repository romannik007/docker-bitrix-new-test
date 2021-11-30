Выполнять в следующей последовательности:

Все настройки окружения произведены со страницы *https://dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=32&CHAPTER_ID=020916&LESSON_PATH=3903.4862.20866.20916*

Файлы конфигурации взяты отсюда *https://dev.1c-bitrix.ru/docs/chm_files/redhat8.zip*

7. **Этот пункт только для linux** 
<<<<<<< HEAD
   **Чтобы** работало редактирование файлов в проекте и на хосте и в контейнере:
   - исправляем файл или создаем /etc/docker/daemon.json:
      
      ```al
      {
          "userns-remap": "<свое имя пользователя в системе>"
      }
      ```

      **пример**: у меня пользователь user2
      
      ```al
      {
          "userns-remap": "user2"
      }
      ```

  
   - в /etc/subgid и /etc/subuid
      
      *<свое имя пользователя в системе>:<ID>:65536*

      где *<ID> = id* пользователя в системе минус id пользователя bitrix в контейнере (почти всегда 600)

      **пример**: у меня пользователь user2 uid=1000 и gid=1000
                 
         /etc/subuid
            user2:400:65536 
                     
         /etc/subgid
            user2:400:65536 
=======
 **Чтобы** работало редактирование файлов в проекте и на хосте и в контейнере:
   
   выполним на своей системе id -u

   результат вставим в переменную USER_ID=1000 в файл .env
>>>>>>> test
            
   
   **При ошибке установки пакетов необходимо выполнить**
   https://sylabs.io/guides/3.8/admin-guide/user_namespace.html#user-namespace-requirements

Debian   

```bash
sudo sh -c 'echo kernel.unprivileged_userns_clone=1 \
    >/etc/sysctl.d/90-unprivileged_userns.conf'
sudo sysctl -p /etc/sysctl.d /etc/sysctl.d/90-unprivileged_userns.conf
```

   RHEL/CentOS 7

From 7.4, kernel support is included but must be enabled with:


```bash
sudo sh -c 'echo user.max_user_namespaces=15000 \
    >/etc/sysctl.d/90-max_net_namespaces.conf'
sudo sysctl -p /etc/sysctl.d /etc/sysctl.d/90-max_net_namespaces.conf
```




8. ***sudo service docker restart***
   (все контейнеры и образы, созданные под предыдущим uid и gid, не будут видны)
9. ***`mkdir -m 777 -p ./volumes/mysql`***
    
   ***`mkdir -m 777 -p ./volumes/www`***

10. ***`docker-compose up -d --build --force-recreate`***
11.  **копируем** bitrixsetup.php или restore.php в папку ./volumes/www
    
      **`chmod -R 777 ./volumes/www`**

      **`chmod -R 777 ./volumes/mysql`**
      
      **`chmod -R 777 ./services/push/logs`**

      **`chmod -R 777 ./services/web/logs`**

      Данные для подключения к БД пописаны в .env

      
12. Вэб доступен по http://127.0.0.1 
   
   бесконечная авторизация решается:
   
   **Файлы с сессиями продукта создаются, то PHP не хватает прав, чтобы к ним обратиться. Попробуйте в файле /bitrix/php_interface/dbconn.php закоментировать строку:

//@umask(~BX_DIR_PERMISSIONS);**

Если возникает проблема с авторизацией и BITRIX SESSID ERROR

Дублирование куки PHPSESSID
https://dev.1c-bitrix.ru/learning/cour...670&LES...


Если возникли проблемы с очисткой cookies в браузере и не получается авторизоваться, можно инициировать удаление лишней куки со стороны сервера:

1. Если не используется многосайтовость, а поле «Доменное имя» очищено, то надо удалить куку с точкой в начале. Для этого впишите в любую строку файла dbconn.php следующий код:
setcookie("PHPSESSID", "", 777, '/', '.site.ru');
где site.ru - имя вашего домена.

2. Если используется многосайтовость или не очищено поле «Доменное имя», то впишите код:
setcookie("PHPSESSID", "", 777, '/');
строго без имени домена.



13. в файле .settings.php в проекте прописываем данные для соединения с БД и ключ вставляем такой: 

      ***'signature_key' => 'bVQdNsrRsulOnj9lkI0sPim292jMtrnji0zzEl5MzCBeHT7w1E5HL3aihFb6aiFJfNEIDxmcFrowS3PTLZFDxAfuNNuCN5EcFRaveaUaRZHSThtWKV7Vp5vGbz9kb3cN'***

      ***'path_to_publish' => 'http://nginx:8895/bitrix/pub/'***

      пример .settings.php в папке services/bitrix-set/

      **Если push&pull не работает, необходимо пересохранить настройки в модуле push&pull выбрав 2 пункт  и потом 4-й**
      **для прохождения теста с сокетами в /etc/hosts прописать**

      ***<IP сетевой карты> <домен>***

     **далее заходить по домену**



**Дополнительно**:
- в файле .env содержатся данные для подключения к mysql,
  логин и пароль пользователя bitrix из env используем только при чистой установке битрикс
- в папках **services/web/httpd, services/web/nginx, services/web/php** содержатся файлы для кастомных настроек
- логи apache, nginx и cron в папке **services/<сервис>/logs**
- адрес сервера БД - **mysql** (указываем для подключения)

- ***`docker-compose up -d --build`***  - запуск только первый раз или при изменении конфигов сервисов, далее уже запускаем *docker-compose up -d* или ***`docker-compose start`*** (вэбка доступна по порту 80 или 443, mysql - 3306)
- ***`docker exec -ti <сервис> /bin/bash`*** - подключиться к контенеру в баш )
- 
Setting boundaries for WSL2
We need to set some reasonable resource constraints on what WSL2 can actually use. Fortunately, that’s as simple as going to c:\users\*your your profile name* and creating a .wslconfig file. On my setup, a MSI Prestige 15 with a 10710u 6-core processor and 16GB of RAM, mine looks like this:

```
[wsl2]
memory=4GB # Limits VM memory in WSL 2 to 4 GB
processors=5 # Makes the WSL 2 VM use two virtual processors
```

