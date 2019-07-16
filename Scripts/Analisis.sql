
/* pagos */
select * from payment limit 100;

select count(*) from payment; --14596
select count(distinct rental_id) from payment; --14592

--listar alquileres que tenga mas de un pago
select rental_id, count(*) from payment group by rental_id having(count(rental_id) > 1); --4591

select * from payment where rental_id in(
select rental_id from payment group by rental_id having(count(rental_id) > 1)
);

/* alquileres */ 
select * from rental limit 100;

select count(*) from rental; --16044
select count(distinct rental_id) from rental; --16044

--listar alquiler id 4591
select alq.*, pag.*
from rental as alq left join payment pag on(alq.rental_id = pag.rental_id)
where alq.rental_id = 4591;

--14596 + 1452
select count(distinct alq.rental_id)
from rental as alq left join payment pag on(alq.rental_id = pag.rental_id)
where pag.rental_id is null;

select count(distinct alq.rental_id)
from rental as alq left join payment pag on(alq.rental_id = pag.rental_id)
--where pag.rental_id is null;