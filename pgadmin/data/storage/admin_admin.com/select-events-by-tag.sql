select t.name, e.title, e.content from events.event e
join events.event_tag et on e.id = et.event_id
join events.tag t on et.tag_id = t.id
where t.name = 'новости'