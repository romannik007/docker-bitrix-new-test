v 1.1 от 11.12.2021
- добавил проброс своего id пользователя для смены id пользователя в контейнере (указывается в .env файле)
тепреь не нужно использовать namespace
- добавил сервис haproxy для запуска нескольких проектов по разным портам (указывается в .env)
- добавил bitrix/bitrix-set/.settings_extra.php для настроки доп. параметров, в частности push and pull уже прописан key,
  а также добавлен файл для настроек p&p через прокси
- оптимизировал файлы dockerfile
- сделал перезапуск node воркеров в push&pull

v 1.2 от 17.12.2021
- добавил docker-compose.override.yml, в нем осуществляется проброс волумов для линукс, все общие правки осуществляются в файле docker-compose.yml

v 1.3 от 20.12.2021
- добавил vsftp сервер (пример использования взял отсюда https://github.com/delfer/docker-alpine-ftp-server)

    `docker-compose -f docker-compose.yml -f ftp.yml`

    при запуске используются внутренние волумы

v 1.4 от 21.12.2021 (master)
- добавил webdav сервер (https://github.com/BytemarkHosting/docker-webdav)

v 1.5 от 07.04.2022 
- убрал haproxy