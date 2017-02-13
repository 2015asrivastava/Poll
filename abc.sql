--
-- File generated with SQLiteStudio v3.1.1 on Mon Feb 13 01:05:33 2017
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: auth_group
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);

-- Table: auth_group_permissions
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- Table: auth_permission
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id"), "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 2, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 3, 'add_user', 'Can add user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 3, 'change_user', 'Can change user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'delete_user', 'Can delete user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 4, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 4, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 4, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 5, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 5, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 5, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 6, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 6, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 6, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 7, 'add_questions', 'Can add questions');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 7, 'change_questions', 'Can change questions');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 7, 'delete_questions', 'Can delete questions');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 8, 'add_choice', 'Can add choice');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 8, 'change_choice', 'Can change choice');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 8, 'delete_choice', 'Can delete choice');

-- Table: auth_user
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "first_name" varchar(30) NOT NULL, "last_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "username" varchar(150) NOT NULL UNIQUE);
INSERT INTO auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username) VALUES (1, 'pbkdf2_sha256$30000$DSKxB48KJrVJ$gmrjBL+ho7F9ixGJvEDG8xjLdDCaT8hxUEKR380yY/A=', '2017-01-28 08:51:54.797557', 1, '', '', '', 1, 1, '2017-01-17 18:31:05.410521', 'asrivastava');

-- Table: auth_user_groups
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "group_id" integer NOT NULL REFERENCES "auth_group" ("id"));

-- Table: auth_user_user_permissions
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id"));

-- Table: django_admin_log
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id"), "user_id" integer NOT NULL REFERENCES "auth_user" ("id"), "action_time" datetime NOT NULL);
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (1, '1', 'What''s now?', 2, '[{"changed": {"fields": ["pub_date"]}}]', 7, 1, '2017-01-17 18:32:48.251541');
INSERT INTO django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) VALUES (2, '1', 'What''s now?', 2, '[{"changed": {"fields": ["pub_date"]}}]', 7, 1, '2017-01-17 18:40:09.726207');

-- Table: django_content_type
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'polls', 'questions');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'polls', 'choice');

-- Table: django_migrations
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2017-01-17 07:09:31.949439');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2017-01-17 07:09:32.074241');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2017-01-17 07:09:32.167842');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2017-01-17 07:09:32.261443');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2017-01-17 07:09:32.417445');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2017-01-17 07:09:32.511046');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2017-01-17 07:09:32.604647');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_alter_user_username_opts', '2017-01-17 07:09:32.729449');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2017-01-17 07:09:32.838650');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2017-01-17 07:09:32.869851');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2017-01-17 07:09:32.963452');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0008_alter_user_username_max_length', '2017-01-17 07:09:33.041453');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'sessions', '0001_initial', '2017-01-17 07:09:33.150654');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'polls', '0001_initial', '2017-01-17 09:22:10.398670');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'polls', '0002_auto_20170117_2253', '2017-01-17 17:23:56.611821');

-- Table: django_session
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('jxj7by2vggiqj2jj1380oj1mpln657km', 'ZmNlNDllMzMyNmE2NDY4MTFlMDE4MmMwMmQwNWY2MDIzODQ0YWVlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NGU3MDFhY2QwMzM0MTIzYTIzODg4MGYwYmZkZjgyOTgxYWMwNjQxIn0=', '2017-01-31 18:31:41.340529');
INSERT INTO django_session (session_key, session_data, expire_date) VALUES ('92bmahdse201dsjges8l4v67ecx4h8mp', 'ZmNlNDllMzMyNmE2NDY4MTFlMDE4MmMwMmQwNWY2MDIzODQ0YWVlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NGU3MDFhY2QwMzM0MTIzYTIzODg4MGYwYmZkZjgyOTgxYWMwNjQxIn0=', '2017-02-11 08:51:54.827557');

-- Table: polls_choice
CREATE TABLE "polls_choice" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "choice_text" varchar(200) NOT NULL, "votes" integer NOT NULL, "question_id" integer NOT NULL REFERENCES "polls_questions" ("id"));
INSERT INTO polls_choice (id, choice_text, votes, question_id) VALUES (2, 'Nothing', 2, 1);
INSERT INTO polls_choice (id, choice_text, votes, question_id) VALUES (3, 'Hacking', 1, 1);
INSERT INTO polls_choice (id, choice_text, votes, question_id) VALUES (4, 'Hacking', 1, 1);

-- Table: polls_questions
CREATE TABLE "polls_questions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "question_text" varchar(200) NOT NULL, "pub_date" datetime NOT NULL);
INSERT INTO polls_questions (id, question_text, pub_date) VALUES (1, 'What''s now?', '2017-01-17 18:39:59');

-- Index: auth_group_permissions_0e939a4f
CREATE INDEX "auth_group_permissions_0e939a4f" ON "auth_group_permissions" ("group_id");

-- Index: auth_group_permissions_8373b171
CREATE INDEX "auth_group_permissions_8373b171" ON "auth_group_permissions" ("permission_id");

-- Index: auth_group_permissions_group_id_0cd325b0_uniq
CREATE UNIQUE INDEX "auth_group_permissions_group_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- Index: auth_permission_417f1b1c
CREATE INDEX "auth_permission_417f1b1c" ON "auth_permission" ("content_type_id");

-- Index: auth_permission_content_type_id_01ab375a_uniq
CREATE UNIQUE INDEX "auth_permission_content_type_id_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- Index: auth_user_groups_0e939a4f
CREATE INDEX "auth_user_groups_0e939a4f" ON "auth_user_groups" ("group_id");

-- Index: auth_user_groups_e8701ad4
CREATE INDEX "auth_user_groups_e8701ad4" ON "auth_user_groups" ("user_id");

-- Index: auth_user_groups_user_id_94350c0c_uniq
CREATE UNIQUE INDEX "auth_user_groups_user_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");

-- Index: auth_user_user_permissions_8373b171
CREATE INDEX "auth_user_user_permissions_8373b171" ON "auth_user_user_permissions" ("permission_id");

-- Index: auth_user_user_permissions_e8701ad4
CREATE INDEX "auth_user_user_permissions_e8701ad4" ON "auth_user_user_permissions" ("user_id");

-- Index: auth_user_user_permissions_user_id_14a6b632_uniq
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");

-- Index: django_admin_log_417f1b1c
CREATE INDEX "django_admin_log_417f1b1c" ON "django_admin_log" ("content_type_id");

-- Index: django_admin_log_e8701ad4
CREATE INDEX "django_admin_log_e8701ad4" ON "django_admin_log" ("user_id");

-- Index: django_content_type_app_label_76bd3d3b_uniq
CREATE UNIQUE INDEX "django_content_type_app_label_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- Index: django_session_de54fa62
CREATE INDEX "django_session_de54fa62" ON "django_session" ("expire_date");

-- Index: polls_choice_7aa0f6ee
CREATE INDEX "polls_choice_7aa0f6ee" ON "polls_choice" ("question_id");

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
