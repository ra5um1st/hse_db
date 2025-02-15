#!/bin/bash
set -e

export PGPORT=5432
export PGPASSWORD=admin #TODO: change to env var

psql -U"$POSTGRES_USER" -d itm -v ON_ERROR_STOP=1 <<-'EOSQL'
-- Заполняем данными схему users
INSERT INTO users.role (name, description) VALUES ('admin', 'Администратор');
INSERT INTO users.role (name, description) VALUES ('editor', 'Редактор');
INSERT INTO users.role (name, description) VALUES ('viewer', 'Просмотрщик');

INSERT INTO users.permission (name, description) VALUES ('read', 'Чтение');
INSERT INTO users.permission (name, description) VALUES ('write', 'Запись');
INSERT INTO users.permission (name, description) VALUES ('delete', 'Удаление');

INSERT INTO users.role_permission (role_id, permission_id) VALUES (1, 1);
INSERT INTO users.role_permission (role_id, permission_id) VALUES (1, 2);
INSERT INTO users.role_permission (role_id, permission_id) VALUES (1, 3);
INSERT INTO users.role_permission (role_id, permission_id) VALUES (2, 1);
INSERT INTO users.role_permission (role_id, permission_id) VALUES (2, 2);
INSERT INTO users.role_permission (role_id, permission_id) VALUES (3, 1);

INSERT INTO users.user (role_id, username, password, email) VALUES (1, 'admin', decode('cGFzc3dvcmQ=', 'base64'), 'admin@admin.com');

-- Вставляем данные в таблицу events.reaction
INSERT INTO events.reaction (name, gif_url) VALUES ('like', 'https://example.com/gifs/like.gif');
INSERT INTO events.reaction (name, gif_url) VALUES ('dislike', 'https://example.com/gifs/dislike.gif');

-- Вставляем данные в таблицу events.tag
INSERT INTO events.tag (name) VALUES ('новости');
INSERT INTO events.tag (name) VALUES ('спорт');

-- Вставка данных в таблицу events.event
INSERT INTO events.event (parent_id, user_id, location, created, updated, title, content, media_type, media_url)
VALUES 
(NULL, 1, ST_Point(-84.1197, -5.0906), '2023-01-01 12:34:56', '2023-02-01 13:45:00', 'Событие 1: Новости спорта', 'Новости спорта сегодня в Москве', 'image/jpeg', 'http://example.com/media/1.jpg'),
(1, 1, ST_Point(-74.0772, -3.9143), '2023-03-05 14:22:33', '2023-04-06 15:23:44', 'Событие 2: Спортивные достижения', 'Спортивные достижения вчера вечером', 'video/mp4', 'http://example.com/media/2.mp4'),
(NULL, 1, ST_Point(-66.8887, -17.6231), '2023-05-08 16:20:55', '2023-06-09 17:21:48', 'Событие 3: Теннисный турнир', 'Теннисный турнир прошел успешно', 'image/jpeg', 'http://example.com/media/3.jpg'),
(3, 1, ST_Point(-61.0473, -18.4273), '2023-07-10 18:29:58', '2023-08-11 19:35:42', 'Событие 4: Успех в теннисе', 'Успех в теннисе вчера утром', 'image/jpeg', 'http://example.com/media/4.jpg'),
(3, 1, ST_Point(-57.9235, -19.0279), '2023-09-12 20:41:26', '2023-10-13 21:47:10', 'Событие 5: Победа в теннисе', 'Победа в теннисе сегодня днем', 'image/jpeg', 'http://example.com/media/5.jpg'),
(NULL, 1, ST_Point(-54.7489, -18.3973), '2023-11-14 22:53:51', '2023-12-15 23:59:32', 'Событие 6: Теннисные соревнования', 'Теннисные соревнования сегодня ночью', 'image/jpeg', 'http://example.com/media/6.jpg'),
(NULL, 1, ST_Point(-52.3789, -17.1078), '2023-01-01 00:00:00', '2023-02-01 01:00:00', 'Событие 7: Футбольный матч', 'Футбольный матч сегодня утром', 'video/mp4', 'http://example.com/media/7.mp4'),
(NULL, 1, ST_Point(-49.0000, -16.0014), '2023-03-05 02:00:00', '2023-04-06 03:00:00', 'Событие 8: Хоккейный матч', 'Хоккейный матч вчера вечером', 'video/mp4', 'http://example.com/media/8.mp4'),
(NULL, 1, ST_Point(-43.6011, -15.4256), '2023-05-08 04:00:00', '2023-06-09 05:00:00', 'Событие 9: Баскетбольный матч', 'Баскетбольный матч сегодня утром', 'video/mp4', 'http://example.com/media/9.mp4'),
(NULL, 1, ST_Point(-36.9278, -14.0219), '2023-07-10 06:00:00', '2023-08-11 07:00:00', 'Событие 10: Волейбол', 'Волейбол сегодня днем', 'image/jpeg', 'http://example.com/media/10.jpg'),
(NULL, 1, ST_Point(-28.8244, -13.9431), '2023-09-12 08:00:00', '2023-10-13 09:00:00', 'Событие 11: Волейбол продолжается', 'Продолжается волейбол сегодня вечером', 'image/jpeg', 'http://example.com/media/11.jpg'),
(NULL, 1, ST_Point(-24.0719, -12.9716), '2023-11-14 10:00:00', '2023-12-15 11:00:00', 'Событие 12: Завершение волейбола', 'Завершение волейбола сегодня ночью', 'image/jpeg', 'http://example.com/media/12.jpg'),
(NULL, 1, ST_Point(-11.4579, -10.9765), '2023-01-01 12:00:00', '2023-02-01 13:00:00', 'Событие 13: Волейбол продолжается', 'Волейбол продолжается сегодня утром', 'image/jpeg', 'http://example.com/media/13.jpg'),
(NULL, 1, ST_Point(-6.0229, -9.9453), '2023-03-05 14:00:00', '2023-04-06 15:00:00', 'Событие 14: Лыжный спорт', 'Лыжный спорт сегодня вечером', 'video/mp4', 'http://example.com/media/14.mp4'),
(NULL, 1, ST_Point(-2.9535, -10.0248), '2023-05-08 16:00:00', '2023-06-09 17:00:00', 'Событие 15: Горнолыжба', 'Горнолыжба сегодня утром', 'image/jpeg', 'http://example.com/media/15.jpg'),
(NULL, 1, ST_Point(-0.4762, -9.8234), '2023-07-10 18:00:00', '2023-08-11 19:00:00', 'Событие 16: Зимний спорт', 'Зимний спорт сегодня вечером', 'image/jpeg', 'http://example.com/media/16.jpg'),
(NULL, 1, ST_Point(-1.0293, -9.5761), '2023-09-12 20:00:00', '2023-10-13 21:00:00', 'Событие 17: Сноубординг', 'Сноубординг сегодня ночью', 'image/jpeg', 'http://example.com/media/17.jpg'),
(NULL, 1, ST_Point(-3.9177, -10.2769), '2023-11-14 22:00:00', '2023-12-15 23:00:00', 'Событие 18: Катание на лыжах', 'Катание на лыжах сегодня утром', 'image/jpeg', 'http://example.com/media/18.jpg'),
(NULL, 1, ST_Point(-7.5143, -10.1387), '2023-01-01 00:00:00', '2023-02-01 01:00:00', 'Событие 19: Экстремальные виды спорта', 'Экстремальные виды спорта сегодня утром', 'video/mp4', 'http://example.com/media/19.mp4'),
(NULL, 1, ST_Point(-5.9428, -10.0486), '2023-03-05 02:00:00', '2023-04-06 03:00:00', 'Событие 20: Альпинизм', 'Альпинизм сегодня вечером', 'image/jpeg', 'http://example.com/media/20.jpg'),
(NULL, 1, ST_Point(-3.9706, -10.1188), '2023-05-08 04:00:00', '2023-06-09 05:00:00', 'Событие 21: Серфинг', 'Серфинг сегодня утром', 'video/mp4', 'http://example.com/media/21.mp4'),
(NULL, 1, ST_Point(-2.4714, -10.0247), '2023-07-10 06:00:00', '2023-08-11 07:00:00', 'Событие 22: Серфинг продолжается', 'Серфинг продолжается сегодня вечером', 'image/jpeg', 'http://example.com/media/22.jpg'),
(NULL, 1, ST_Point(-0.9258, -9.9736), '2023-09-12 08:00:00', '2023-10-13 09:00:00', 'Событие 23: Парасерфинг', 'Парасерфинг сегодня ночью', 'image/jpeg', 'http://example.com/media/23.jpg'),
(NULL, 1, ST_Point(-0.4786, -9.9746), '2023-11-14 10:00:00', '2023-12-15 11:00:00', 'Событие 24: Кайтсерфинг', 'Кайтсерфинг сегодня утром', 'image/jpeg', 'http://example.com/media/24.jpg'),
(NULL, 1, ST_Point(-0.3817, -10.0246), '2023-01-01 12:00:00', '2023-02-01 13:00:00', 'Событие 25: Велосипедный спорт', 'Велосипедный спорт сегодня утром', 'image/jpeg', 'http://example.com/media/25.jpg');

-- Вставляем данные в таблицу events.event_tag
INSERT INTO events.event_tag (event_id, tag_id) VALUES (1, 1);
INSERT INTO events.event_tag (event_id, tag_id) VALUES (2, 2);
INSERT INTO events.event_tag (event_id, tag_id) VALUES (3, 1);

-- Вставляем данные в таблицу events.event_reaction
INSERT INTO events.event_reaction (event_id, user_id, reaction_id, created) VALUES (1, 1, 1, '2023-07-10 18:29:58');
INSERT INTO events.event_reaction (event_id, user_id, reaction_id, created) VALUES (2, 1, 2, '2023-08-11 19:35:42');

-- Вставляем данные в таблицу events.comment
INSERT INTO events.comment (user_id, event_id, created, content) VALUES (1, 1, '2023-10-13 21:47:10', 'Комментарий к событию 1. Отличная новость!');
INSERT INTO events.comment (user_id, event_id, created, content) VALUES (1, 2, '2023-11-14 22:53:51', 'Комментарий к событию 2. Интересная информация.');
INSERT INTO events.comment (user_id, event_id, created, content) VALUES (1, 3, '2023-12-15 23:59:32', 'Комментарий к событию 3. Замечательно!');

EOSQL