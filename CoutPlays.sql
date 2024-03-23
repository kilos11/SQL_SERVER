
select p.id, p.title, COALESCE(r.reserved_tickets,0) from plays p left join (select sum(number_of_tickets) as reserved_tickets,play_id  from reservations group by play_id) r on p.id = r.play_id order by r.reserved_tickets desc, p.id;

