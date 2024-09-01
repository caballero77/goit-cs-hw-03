-- 1
-- Отримати всі завдання певного користувача. Використайте SELECT для отримання завдань конкретного користувача за його user_id.
select * from tasks
where user_id = 1;

-- 2
-- Вибрати завдання за певним статусом. Використайте підзапит для вибору завдань з конкретним статусом, наприклад, 'new'.
select * from tasks
where status_id = (select id from status where name = 'completed');

-- 3
-- Оновити статус конкретного завдання. Змініть статус конкретного завдання на 'in progress' або інший статус.
update tasks
set status_id = (select id from status where name = 'in progress')
where id = 2;

-- 4
-- Отримати список користувачів, які не мають жодного завдання. Використайте комбінацію SELECT, WHERE NOT IN і підзапит.
select * from users
where id not in (select distinct user_id from tasks);

-- 5
-- Додати нове завдання для конкретного користувача. Використайте INSERT для додавання нового завдання.
insert into tasks (title, description, status_id, user_id)
values ('New task', null, 1, 1);

-- 6
-- Отримати всі завдання, які ще не завершено. Виберіть завдання, чий статус не є 'завершено'.
select tasks.* from tasks
join status on status.id = tasks.status_id 
where status.name <> 'completed';

-- 7
-- Видалити конкретне завдання. Використайте DELETE для видалення завдання за його id.
delete from tasks
where id = 3;

-- 8
-- Знайти користувачів з певною електронною поштою. Використайте SELECT із умовою LIKE для фільтрації за електронною поштою.
select * from users
where email like '%melissa%';

-- 9
-- Оновити ім'я користувача. Змініть ім'я користувача за допомогою UPDATE.
update users
set fullname = 'Rick Astley' -- https://www.youtube.com/watch?v=dQw4w9WgXcQ
where id = 14;

-- 10
-- Отримати кількість завдань для кожного статусу. Використайте SELECT, COUNT, GROUP BY для групування завдань за статусами.
select status.name, count(tasks.id) from tasks
left join status on status.id = tasks.status_id
group by status.name;

-- 11
-- Отримати завдання, які призначені користувачам з певною доменною частиною електронної пошти. Використайте SELECT з умовою LIKE в поєднанні з JOIN, щоб вибрати завдання, призначені користувачам, чия електронна пошта містить певний домен (наприклад, '%@example.com').
select tasks.* from tasks
join users on users.id = tasks.user_id
where users.email like '%example.org';

-- 12
-- Отримати список завдань, що не мають опису. Виберіть завдання, у яких відсутній опис.
select * from tasks
where description is null or description = '';

-- 13
-- Вибрати користувачів та їхні завдання, які є у статусі 'in progress'. Використайте INNER JOIN для отримання списку користувачів та їхніх завдань із певним статусом.
select users.*, tasks.* from users
join tasks on tasks.user_id = users.id
join status on status.id = tasks.status_id 
where status.name = 'in progress'
order by users.id;

-- 14
-- Отримати користувачів та кількість їхніх завдань. Використайте LEFT JOIN та GROUP BY для вибору користувачів та підрахунку їхніх завдань.
select users.id, users.fullname, count(tasks.id) from users
left join tasks on tasks.user_id = users.id
group by users.id, users.fullname;