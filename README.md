# Геолокационная социальная сеть

Основное назначение проекта заключается в предоставлении пользователям возможности поиска, просмотра и оценки актуальных событий, происходящих в непосредственной близости от них, в режиме реального времени. Каждое событие отображается на интерактивной карте в виде маркера, при клике на который открывается подробная информация: изображения, видео, аудио, текстовые описания и комментарии других пользователей. Обычные пользователи могут участвовать в активностях, связанных с событием, тогда как авторы имеют расширенные права создания, редактирования и удаления событий.

# PgAdmin

Url: `localhost:5000`\
Login: `admin@admin.com`\
Password: `admin`

# PostgreSQL

Volume: `hse_db_posrgresql`\
Database: `itm`\
Password: `admin`

Примеры запросов в `pgadmin\data\storage\admin_admin.com`.

Скрипты в `postgresql/init` должны иметь окончания LF для успешной работы.

Запуск pgbench: 
```
docker-compose -f docker-compose-pgbench.yml up | docker-compose -f docker-compose-pgbench.yml down
```

Результаты pgbench (i5-3570k, 16Gb DDR3, 1Tb Samsung SSD 860 QVO):
```
pgbench            | progress: 1.0 s, 546.9 tps, lat 44.321 ms stddev 49.081, 0 failed
pgbench            | progress: 2.0 s, 990.0 tps, lat 53.287 ms stddev 59.038, 0 failed
pgbench            | progress: 3.0 s, 950.0 tps, lat 51.966 ms stddev 59.248, 0 failed
pgbench            | progress: 4.0 s, 929.0 tps, lat 55.471 ms stddev 64.823, 0 failed
pgbench            | progress: 5.0 s, 948.0 tps, lat 52.614 ms stddev 52.082, 0 failed
pgbench            | progress: 6.0 s, 900.0 tps, lat 54.214 ms stddev 50.059, 0 failed
pgbench            | progress: 7.0 s, 765.0 tps, lat 65.192 ms stddev 70.956, 0 failed
pgbench            | progress: 8.0 s, 1046.0 tps, lat 47.170 ms stddev 48.651, 0 failed
pgbench            | progress: 9.0 s, 943.9 tps, lat 54.585 ms stddev 56.432, 0 failed
pgbench            | progress: 10.0 s, 969.0 tps, lat 51.813 ms stddev 58.679, 0 failed
pgbench            | progress: 11.0 s, 903.0 tps, lat 54.294 ms stddev 65.235, 0 failed
pgbench            | progress: 12.0 s, 971.0 tps, lat 52.890 ms stddev 60.601, 0 failed
pgbench            | progress: 13.0 s, 980.1 tps, lat 49.950 ms stddev 48.462, 0 failed
pgbench            | progress: 14.0 s, 968.9 tps, lat 51.763 ms stddev 54.523, 0 failed
pgbench            | progress: 15.0 s, 980.1 tps, lat 48.630 ms stddev 49.652, 0 failed
pgbench            | progress: 16.0 s, 925.1 tps, lat 57.294 ms stddev 60.621, 0 failed
pgbench            | progress: 17.0 s, 1009.9 tps, lat 48.865 ms stddev 52.946, 0 failed
pgbench            | progress: 18.0 s, 900.0 tps, lat 55.001 ms stddev 59.715, 0 failed
pgbench            | progress: 19.0 s, 693.0 tps, lat 73.955 ms stddev 78.146, 0 failed
pgbench            | progress: 20.0 s, 817.0 tps, lat 60.604 ms stddev 65.517, 0 failed
pgbench            | progress: 21.0 s, 1009.0 tps, lat 49.414 ms stddev 53.324, 0 failed
pgbench            | progress: 22.0 s, 995.0 tps, lat 51.091 ms stddev 50.943, 0 failed
pgbench            | progress: 23.0 s, 834.0 tps, lat 57.173 ms stddev 66.232, 0 failed
pgbench            | progress: 24.0 s, 846.9 tps, lat 56.278 ms stddev 58.777, 0 failed
pgbench            | progress: 25.0 s, 1050.2 tps, lat 51.894 ms stddev 59.748, 0 failed
pgbench            | progress: 26.0 s, 996.9 tps, lat 49.364 ms stddev 47.310, 0 failed
pgbench            | progress: 27.0 s, 1193.9 tps, lat 42.069 ms stddev 41.451, 0 failed
pgbench            | progress: 28.0 s, 1079.1 tps, lat 44.767 ms stddev 50.731, 0 failed
pgbench            | progress: 29.0 s, 920.0 tps, lat 53.712 ms stddev 59.833, 0 failed
pgbench            | progress: 30.0 s, 929.1 tps, lat 54.115 ms stddev 66.108, 0 failed
pgbench            | progress: 31.0 s, 917.0 tps, lat 55.466 ms stddev 66.344, 0 failed
pgbench            | progress: 32.0 s, 797.0 tps, lat 64.275 ms stddev 71.033, 0 failed
pgbench            | progress: 33.0 s, 1025.9 tps, lat 49.053 ms stddev 52.935, 0 failed
pgbench            | progress: 34.0 s, 902.0 tps, lat 55.342 ms stddev 62.168, 0 failed
pgbench            | progress: 35.0 s, 967.0 tps, lat 50.071 ms stddev 48.291, 0 failed
pgbench            | progress: 36.0 s, 952.0 tps, lat 52.867 ms stddev 55.021, 0 failed
pgbench            | progress: 37.0 s, 926.1 tps, lat 55.167 ms stddev 65.070, 0 failed
pgbench            | progress: 38.0 s, 852.0 tps, lat 58.907 ms stddev 69.069, 0 failed
pgbench            | progress: 39.0 s, 824.8 tps, lat 55.555 ms stddev 58.968, 0 failed
pgbench            | progress: 40.0 s, 1020.2 tps, lat 51.850 ms stddev 62.953, 0 failed
pgbench            | progress: 41.0 s, 867.9 tps, lat 58.022 ms stddev 63.304, 0 failed
pgbench            | progress: 42.0 s, 742.0 tps, lat 64.718 ms stddev 69.623, 0 failed
pgbench            | progress: 43.0 s, 993.0 tps, lat 52.366 ms stddev 59.325, 0 failed
pgbench            | progress: 44.0 s, 860.0 tps, lat 58.311 ms stddev 62.323, 0 failed
pgbench            | progress: 45.0 s, 930.0 tps, lat 54.707 ms stddev 62.302, 0 failed
pgbench            | progress: 46.0 s, 947.0 tps, lat 52.898 ms stddev 49.345, 0 failed
pgbench            | progress: 47.0 s, 844.0 tps, lat 58.599 ms stddev 62.674, 0 failed
pgbench            | progress: 48.0 s, 963.0 tps, lat 50.919 ms stddev 57.404, 0 failed
pgbench            | progress: 49.0 s, 860.0 tps, lat 57.286 ms stddev 58.193, 0 failed
pgbench            | progress: 50.0 s, 980.1 tps, lat 52.877 ms stddev 51.862, 0 failed
pgbench            | progress: 51.0 s, 729.9 tps, lat 61.488 ms stddev 67.040, 0 failed
pgbench            | progress: 52.0 s, 903.0 tps, lat 61.260 ms stddev 84.475, 0 failed
pgbench            | progress: 53.0 s, 880.0 tps, lat 54.406 ms stddev 58.594, 0 failed
pgbench            | progress: 54.0 s, 1025.0 tps, lat 50.238 ms stddev 54.088, 0 failed
pgbench            | progress: 55.0 s, 944.0 tps, lat 52.534 ms stddev 43.302, 0 failed
pgbench            | progress: 56.0 s, 832.0 tps, lat 60.297 ms stddev 63.960, 0 failed
pgbench            | progress: 57.0 s, 898.0 tps, lat 56.342 ms stddev 63.013, 0 failed
pgbench            | progress: 58.0 s, 947.0 tps, lat 52.695 ms stddev 62.432, 0 failed
pgbench            | progress: 59.0 s, 658.0 tps, lat 71.825 ms stddev 85.442, 0 failed
pgbench            | progress: 60.0 s, 885.0 tps, lat 58.052 ms stddev 68.895, 0 failed
```

