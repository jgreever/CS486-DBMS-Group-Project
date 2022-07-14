create table p_bias_crime
(
    "Bias Category"               text,
    "Bias Type"                   text,
    "Business as victim"          boolean,
    "Case Type"                   text,
    "Location Type"               text,
    "Open Data Case Number"       text,
    "Primary Offense Type"        text,
    "Report Date"                 date,
    "Suspect Age"                 bigint,
    "Suspect Gender"              text,
    "Suspect Race"                text,
    "Victim Age"                  bigint,
    "Victim Gender"               text,
    "Victim Race"                 text,
    "Victim Suspect Relationship" text
);

comment on column p_bias_crime."Report Date" is 'We can ignore the day value.
It was not present in the original data.
We only need the month and year.';

alter table p_bias_crime
    owner to luserdba;

create index idx_bias_category
    on p_bias_crime ("Bias Category");

grant delete, insert, references, select, trigger, truncate, update on p_bias_crime to dbms;

