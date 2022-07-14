create table p_overtime
(
    "Assignment"           text,
    "Backfill"             boolean,
    "Category Description" text,
    "Rank"                 text,
    "Request Date"         date,
    "ID"                   bigint,
    "Paid Hours"           double precision,
    "Work Hours"           double precision
);

alter table p_overtime
    owner to luserdba;

create index idx_rank
    on p_overtime ("Rank");

grant delete, insert, references, select, trigger, truncate, update on p_overtime to dbms;

