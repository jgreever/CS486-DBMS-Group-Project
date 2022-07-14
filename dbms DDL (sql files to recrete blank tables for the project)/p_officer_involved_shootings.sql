create table p_officer_involved_shootings
(
    "Officer Fatally Injured"               boolean,
    "Any Officers Injured on Case"          boolean,
    "Case Number"                           text,
    "Date Occurred"                         date,
    "Deadly Force Type"                     text,
    "Did Subject Fire Shots"                text,
    "General Location"                      text,
    "Grand Jury Transcripts link"           text,
    "Initial Call Type"                     text,
    "Internal Affairs Investigation Link"   text,
    "Internal Affairs Investigation Link 2" text,
    "Officer Race"                          text,
    "Officer Sex"                           text,
    "Officer Tenure"                        bigint,
    "Online PDF Link"                       text,
    "RecordID"                              bigint,
    "Subject Age"                           bigint,
    "Subject Name"                          text,
    "Subject Race"                          text,
    "Subject Sex"                           text,
    "Subject Weapon Type"                   text,
    "Was Subject Actually Armed"            boolean,
    "Was Subject Injured"                   boolean,
    "Was Subject Injury Fatal"              boolean,
    "Was Subject Perceived as Armed"        boolean,
    "Number of Officers Injured on Case"    bigint
);

comment on column p_officer_involved_shootings."Subject Weapon Type" is '(NIBRS)';

comment on column p_officer_involved_shootings."Was Subject Actually Armed" is 'all boolean values of <null> in this table mean that either that information was pending release, or it was unknown/unavailable.';

alter table p_officer_involved_shootings
    owner to luserdba;

create index idx_initial_call_type
    on p_officer_involved_shootings ("Initial Call Type");

grant delete, insert, references, select, trigger, truncate, update on p_officer_involved_shootings to dbms;

