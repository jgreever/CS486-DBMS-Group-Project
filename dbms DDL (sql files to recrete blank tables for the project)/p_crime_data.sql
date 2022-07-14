create table p_crime_data
(
    "Address"          text,
    "Case Number"      text,
    "Crime Against"    text,
    "Neighborhood"     text,
    "Occur Date"       date,
    "Occur Time"       time,
    "Offense Category" text,
    "Offense Type"     text,
    "Open Data Lat"    double precision,
    "Open Data Lon"    double precision,
    "Report Date"      date,
    "Offense Count"    bigint
);

alter table p_crime_data
    owner to luserdba;

create index idx_crime_against
    on p_crime_data ("Crime Against");

grant delete, insert, references, select, trigger, truncate, update on p_crime_data to dbms;

