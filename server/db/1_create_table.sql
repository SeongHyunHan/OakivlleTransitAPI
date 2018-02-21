CREATE TABLE agency
(
    agency_id int,
    agency_name varchar(100),
    agency_url varchar(255),
    agency_timezone varchar(100),
    agency_lang varchar(100),
    agency_phone varchar(100),
    agency_fare_url varchar(100)
);

CREATE TABLE calendar_dates
(
    service_id int,
    dates date,
    exception_type int
);

CREATE TABLE calendar
(
    service_id int,
    monday int,
    tuesday int,
    wednesday int,
    thursday int,
    friday int,
    saturday int,
    sunday int,
    start_date date,
    end_date date
);

CREATE TABLE routes
(
    route_id int,
    agency_id int,
    route_short_name int,
    route_long_name varchar(255),
    route_desc varchar(255),
    route_type varchar(255),
    route_url varchar(255)
);

CREATE TABLE shapes
(
    shape_id int,
    shape_pt_lat double precision,
    shape_pt_long double precision,
    shape_pt_sequence int,
    shape_dist_traveled double precision
);

CREATE TABLE stop_times
(
    trip_id int,
    arrival_time time,
    departure_time time,
    stop_id bigint,
    stop_sequence int,
    stop_headsign int,
    pickup_type int,
    drop_off_type int,
    shape_dist_traveled double precision,
    timepoint int
)

CREATE TABLE stops
(
    stop_id bigint,
    stop_code bigint,
    stop_name varchar(255),
    stop_lat double precision,
    stop_lon double precision,
    wheelchair_boarding int
)

CREATE TABLE transfers
(
    from_stop_id bigint,
    to_stop_id bigint,
    transfer_type int
)

CREATE TABLE trips
(
    trip_id varchar(100),
    route_id int,
    service_id bigint,
    trip_headsign 
)