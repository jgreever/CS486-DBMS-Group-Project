create table p_shootings
(
    "Block Address"       text,
    "Incident Number"     text,
    "Neighborhood"        text,
    "Occur 2hr Time"      text,
    "Occurrence Date"     date,
    "Person Injury"       boolean,
    "Precinct"            text,
    "Open Data Latitude"  double precision,
    "Open Data Longitude" double precision,
    "CasingsRecovered"    bigint,
    "X"                   text,
    "Y"                   text
);

alter table p_shootings
    owner to luserdba;

create index idx_neighborhood
    on p_shootings ("Neighborhood");

grant delete, insert, references, select, trigger, truncate, update on p_shootings to dbms;

