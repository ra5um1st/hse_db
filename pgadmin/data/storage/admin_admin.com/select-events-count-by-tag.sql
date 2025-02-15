select t.name, count(et.event_id) as events_count from events.event_tag et
join events.tag t on et.tag_id = t.id
group by t.name;