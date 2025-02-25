-- zuber_queries.sql
-- Consultas SQL para el análisis de datos en Zuber

------------------------------------------------------------------

-- Obtener el nombre de cada compañía de taxis junto con la cantidad de viajes realizados el 15 y 16 de noviembre de 2017
-- Se asigna el nombre trips_amount al conteo de viajes y se ordena en orden descendente

select
    cabs.company_name as company_name,
    count(trips.trip_id) as trips_amount
from
    cabs
inner join
    trips
on
    trips.cab_id = cabs.cab_id
where
    cast(trips.start_ts as date) between '2017-11-15' and '2017-11-16'
group by
    company_name
order by
    trips_amount desc
;

---------------------------------------------------------------------
-- Obtener la cantidad de viajes de compañías cuyo nombre contiene 'Yellow' o 'Blue' del 1 al 7 de noviembre de 2017
-- Se agrupa por compañía y se ordena en orden descendente

select
    cabs.company_name as company_name,
    count(cabs.company_name) as trips_amounts
from
    cabs
inner join
    trips
    on
    trips.cab_id = cabs.cab_id
where
    (company_name like '%Yellow%' or company_name like '%Blue%')
    and (cast(trips.start_ts as date) between '2017-11-01' and '2017-11-07')
group by
    company_name
order by
    trips_amounts desc
;

---------------------------------------------------------------------
-- Determinar la cantidad de viajes de 'Flash Cab' y 'Taxi Affiliation Services', agrupando las demás empresas como 'Other'
-- Se agrupan los resultados y se ordenan en orden descendente por trips_amount

select
    case
        when cabs.company_name = 'Flash Cab' then 'Flash Cab'
        when cabs.company_name = 'Taxi Affiliation Services' then 'Taxi Affiliation Services'
        else 'Other'
    end as company
    ,count(trips.trip_id) as trips_amount
from
    cabs
inner join trips on trips.cab_id = cabs.cab_id
where
    cast(trips.start_ts as date) between '2017-11-01' and '2017-11-07'
group by company
order by trips_amount desc
;

---------------------------------------------------------------------
-- Obtener los identificadores de los barrios de O'Hare y Loop

select
    neighborhood_id,
    name
from
    neighborhoods
where
    name like '%Hare' or name like 'Loop'
;

---------------------------------------------------------------------
-- Clasificación del clima en 'Good' o 'Bad' según la descripción de la tabla weather_records
-- Se asigna el nombre weather_conditions a la nueva variable categórica

select
    ts,
        case
        when description like '%rain%' or description like '%storm%' then 'Bad'
        else 'Good'
        end as weather_conditions
from weather_records
;

---------------------------------------------------------------------
-- Obtener los viajes que comenzaron en Loop (ID: 50) los sábados y terminaron en O'Hare (ID: 63)
-- Se asocian las condiciones climáticas y la duración de cada viaje

select
    start_ts,
    T.weather_conditions,
    duration_seconds
from
    trips
inner join (
    select
        ts,
        case
            when description like '%rain%' or description like '%storm%' then 'Bad'
            else 'Good'
        end as weather_conditions
    from
        weather_records
) T on T.ts = trips.start_ts
where
    pickup_location_id = 50 and dropoff_location_id = 63 and EXTRACT (DOW from trips.start_ts) = 6
order by trip_id
;
