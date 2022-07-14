create table p_use_of_force
(
    "Blunt Object"                                                    text,
    "Category of Force Event - Measured at Event Level"               text,
    "Disposition/Custody"                                             text,
    "Day of Week"                                                     text,
    "Firearm"                                                         text,
    "Firearm - Implied"                                               text,
    "Firearm - Replica"                                               text,
    "Force Applied - 1"                                               text,
    "Force Applied - 2"                                               text,
    "Force Applied - 3"                                               text,
    "Force Applied - 4"                                               text,
    "Force Applied - 5"                                               text,
    "Force Applied - 6"                                               text,
    "Force Applied - 7"                                               text,
    "Force Applied - 8"                                               text,
    "Hour (6Hr)"                                                      text,
    "Initial Call Category"                                           text,
    "Initial Call type"                                               text,
    "Knife / Edged Weapon / Stabbing Instrument"                      text,
    "Mental Health Crisis - Prior to Force, Perceived Lack of Compli" text,
    "Needle / Spit / Bodily Fluids"                                   text,
    "No weapon (unarmed)"                                             text,
    "Officer"                                                         double precision,
    "Officer Precinct"                                                text,
    "Officer Tenure"                                                  double precision,
    "Other Weapon"                                                    text,
    "Record ID"                                                       bigint,
    "Subject"                                                         double precision,
    "Subject - Race"                                                  text,
    "Subject - Sex"                                                   text,
    "Subject - Transient"                                             text,
    "Subject Age"                                                     double precision,
    "Subject Instance"                                                double precision,
    "Subject Resistance - 1"                                          text,
    "Subject Resistance - 2"                                          text,
    "Subject Resistance - 3"                                          text,
    "Subject Resistance - 4"                                          text,
    "Subject Resistance - 5"                                          text,
    "Subject Resistance - 6"                                          text,
    "Subject Resistance - 7"                                          text,
    "Subject Resistance - 8"                                          text,
    "Type of Call"                                                    text,
    "Under the Influence of Alcohol - Prior to Force, Perceived Cond" text,
    "Under the Influence of Drugs - Prior to Force, Perceived Condit" text,
    "Weapon Present or reported but not used or threatened use"       text,
    "Record Count"                                                    bigint,
    "Record Count.1"                                                  bigint,
    "Month-Year"                                                      text
);

alter table p_use_of_force
    owner to luserdba;

create index idx_dow
    on p_use_of_force ("Day of Week");

grant delete, insert, references, select, trigger, truncate, update on p_use_of_force to dbms;

