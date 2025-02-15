select e.id, e.parent_id, e.title, e.content from events.event e
where e.title = 'Событие 3: Теннисный турнир'
union
select e1.id, e1.parent_id, e1.title, e1.content from events.event e1
join events.event e2 on e1.parent_id = e2.id
where e1.parent_id = (select id from events.event where title = 'Событие 3: Теннисный турнир');