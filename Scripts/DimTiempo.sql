--generar una secuencia de numeros
select sec.* from generate_series(1, 9) as sec;

--calcular la diferencia entre dos fechas
select '2020-12-31'::date - '2020-01-01'::date;

select * from generate_series(0, '2020-12-31'::date - '2020-01-01'::date);

--generar una
select '2019-01-01'::date + secuencia.dia as fecha
from generate_series (0, '2019-12-31'::date - '2019-01-01'::date) as secuencia (dia)
group by secuencia.dia


create table dim_tiempo (
	id_tiempo int not null,
	fecha date not null,
	anho smallint not null,
	mes smallint not null,
	dia smallint not null
)

select * from dim_tiempo;

/* dim_tiempo */
insert into dim_tiempo
select
	to_char(tiempo.fecha::date, 'yyyymmdd')::int as id_tiempo,
	tiempo.fecha,
	to_char(tiempo.fecha, 'YYYY')::int as anho,
	to_char(tiempo.fecha, 'MM')::int as mes,
	to_char(tiempo.fecha, 'DD')::int as dia
from (
	select '2019-01-01'::date + secuencia.dia as fecha
	from generate_series (0, '2019-12-31'::date - '2019-01-01'::date) as secuencia (dia)
	group by secuencia.dia
) as tiempo
--where tiempo.fecha = '2019-02-29'
order by tiempo.fecha asc


/* dim_tiempo */
select to_char(datum,'yyyymmdd')::int as date_dim_id,
	datum as date_actual,
	extract(epoch from datum) as epoch,
       to_char(datum,'fmddth') as day_suffix,
       to_char(datum,'day') as day_name,
       extract(isodow from datum) as day_of_week,
       extract(day from datum) as day_of_month,
       datum - date_trunc('quarter',datum)::date +1 as day_of_quarter,
       extract(doy from datum) as day_of_year,
       to_char(datum,'w')::int as week_of_month,
       extract(week from datum) as week_of_year,
       to_char(datum,'yyyy"-w"iw-') || extract(isodow from datum) as week_of_year_iso,
       extract(month from datum) as month_actual,
       to_char(datum,'month') as month_name,
       to_char(datum,'mon') as month_name_abbreviated,
       extract(quarter from datum) as quarter_actual,
       case
         when extract(quarter from datum) = 1 then 'first'
         when extract(quarter from datum) = 2 then 'second'
         when extract(quarter from datum) = 3 then 'third'
         when extract(quarter from datum) = 4 then 'fourth'
       end as quarter_name,
       extract(isoyear from datum) as year_actual,
       datum +(1 -extract(isodow from datum))::int as first_day_of_week,
       datum +(7 -extract(isodow from datum))::int as last_day_of_week,
       datum +(1 -extract(day from datum))::int as first_day_of_month,
       (date_trunc('month',datum) +interval '1 month - 1 day')::date as last_day_of_month,
       date_trunc('quarter',datum)::date as first_day_of_quarter,
       (date_trunc('quarter',datum) +interval '3 month - 1 day')::date as last_day_of_quarter,
       to_date(extract(isoyear from datum) || '-01-01','yyyy-mm-dd') as first_day_of_year,
       to_date(extract(isoyear from datum) || '-12-31','yyyy-mm-dd') as last_day_of_year,
       to_char(datum,'mmyyyy') as mmyyyy,
       to_char(datum,'mmddyyyy') as mmddyyyy,
       case
         when extract(isodow from datum) in (6,7) then true
         else false
       end as weekend_indr
from (select '2018-01-01'::date+ sequence.day as datum
      from generate_series (0,29219) as sequence (day)
      group by sequence.day) dq
order by 1;