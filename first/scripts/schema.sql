begin;

create table users (
  id serial primary key,
  fullname varchar(100) not null,
  email varchar(100) not null unique
);

create table status (
    id serial primary key,
    name varchar(50) not null unique
);

insert into status (name) values ('new'), ('in progress'), ('completed');

create table tasks (
  id serial primary key,
  title varchar(100) not null,
  description text,
  status_id integer references status(id) on delete cascade,
  user_id integer references users(id) on delete cascade
);

commit;