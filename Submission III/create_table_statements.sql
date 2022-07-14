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

create index idx_bias_category
    on p_bias_crime ("Bias Category");

grant delete, insert, references, select, trigger, truncate, update on p_bias_crime to dbms;

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

create index idx_crime_against
    on p_crime_data ("Crime Against");

grant delete, insert, references, select, trigger, truncate, update on p_crime_data to dbms;

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

create index idx_final_call_group
    on p_dispatched_calls ("Final Call Group");

grant delete, insert, references, select, trigger, truncate, update on p_dispatched_calls to dbms;

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

create index idx_initial_call_type
    on p_officer_involved_shootings ("Initial Call Type");

grant delete, insert, references, select, trigger, truncate, update on p_officer_involved_shootings to dbms;

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

create index idx_rank
    on p_overtime ("Rank");

grant delete, insert, references, select, trigger, truncate, update on p_overtime to dbms;

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

create index idx_neighborhood
    on p_shootings ("Neighborhood");

grant delete, insert, references, select, trigger, truncate, update on p_shootings to dbms;

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

create index idx_dow
    on p_use_of_force ("Day of Week");

grant delete, insert, references, select, trigger, truncate, update on p_use_of_force to dbms;

