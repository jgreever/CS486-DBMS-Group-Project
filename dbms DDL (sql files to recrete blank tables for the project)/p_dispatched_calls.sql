create table p_dispatched_calls
(
    "Call Number"         bigint,
    "Report Month Year"   text,
    "Report Date Time"    time,
    "Time In Queue sec"   double precision,
    "Travel Time sec"     double precision,
    "Response Time sec"   double precision,
    "Priority"            text,
    "Final Call Group"    text,
    "Final Call Category" text,
    "Neighborhood"        text,
    "Address"             text,
    "Open Data X"         double precision,
    "Open Data Y"         double precision,
    "Open Data Lon"       double precision,
    "Open Data Lat"       double precision
);

alter table p_dispatched_calls
    owner to luserdba;

create index idx_final_call_group
    on p_dispatched_calls ("Final Call Group");

grant delete, insert, references, select, trigger, truncate, update on p_dispatched_calls to dbms;

