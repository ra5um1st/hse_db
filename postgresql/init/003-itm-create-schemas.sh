#!/bin/bash
set -e

export PGPORT=5432
export PGPASSWORD=admin #TODO: change to env var

psql -U"$POSTGRES_USER" -d itm -v ON_ERROR_STOP=1 <<-EOSQL
create schema if not exists events;
create schema if not exists users;

-- Create tables

-- schema users

create table if not exists itm.users.role(
	id bigserial primary key,
	name varchar(255) not null unique,
	description varchar(255),
	created timestamptz default now()
);

create table if not exists itm.users.permission(
	id bigserial primary key,
	name varchar(255) not null unique,
	description varchar(255),
	created timestamptz default now()
);

create table if not exists itm.users.role_permission(
	role_id bigint references itm.users.role,
	permission_id bigint references itm.users.permission,
	primary key(role_id, permission_id)
);

create table if not exists itm.users.user(
	id bigserial primary key,
	role_id bigint references itm.users.role,
	username varchar(255) not null unique,
	password bytea not null,
	email varchar(255) unique,
	created timestamptz default now()
);

create index on itm.users.user (role_id);

-- schema events

create table if not exists itm.events.reaction(
	id bigserial primary key,
	name varchar(255) not null unique,
	gif_url varchar(2047)
);

create table if not exists itm.events.tag(
	id bigserial primary key,
	name varchar(31) unique
);

create table if not exists itm.events.event(
	id bigserial primary key,
	parent_id bigint references itm.events.event(id),
	user_id bigint references itm.users.user,
	location geography not null,
	created timestamptz default now(),
	updated timestamptz,
	title varchar(127) not null,
	content varchar(4095) not null,
	media_type varchar(15),
	media_url varchar(2047)
);

create index on itm.events.event (location) using gist;

create table if not exists itm.events.event_tag(
	event_id bigint not null references itm.events.event,
	tag_id bigint not null references itm.events.tag on delete cascade,
	primary key(event_id, tag_id)
);

create table if not exists itm.events.event_reaction(
	event_id bigint not null references itm.events.event,
	user_id bigint not null references itm.users.user,
	reaction_id bigint not null references itm.events.reaction on delete cascade,
	created timestamptz default now(),
	primary key(event_id, user_id, reaction_id)
);

create table if not exists itm.events.comment(
	id bigserial primary key,
	user_id bigint not null references itm.users.user,
	event_id bigint not null references itm.events.event,
	created timestamptz default now(),
	content varchar(4095)
);

create index on itm.events.comment (event_id, user_id);

EOSQL