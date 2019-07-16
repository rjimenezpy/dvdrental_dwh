

select * from rental;

select min(rental_date) from rental;
select max(rental_date) from rental;


select count(*) from rental; --16044
select count(*) from rental where rental_date >= '2006-01-01';
select count(*) from rental where rental_date between '2006-01-01' and '2006-12-31';

-- todos los registros del segundo semestre del penultimo anho
select count(*) from rental where rental_date between '2005-07-01' and '2005-12-31';

/* Informe 1 */
select
	--rental_date,
	--to_char(rental_date::date, 'q')
	to_char(rental_date::date, 'q') as trimestre,
	count(*) as cantidad_alq
from
	rental
where
	rental_date >= '2006-01-01'
group by trimestre;

select to_char('2019-04-14'::date, 'q')

/* Informe 2 */
select * from customer;

select
	cli.first_name as cliente,
	count(*) as  cantidad 
from
	rental as alq inner join customer as cli on(alq.customer_id = cli.customer_id)
where
	alq.rental_date between '2005-07-01' and '2005-12-31'
group by cli.first_name
order by cantidad desc
limit 3;