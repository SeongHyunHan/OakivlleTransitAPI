-- SET STATEMENT BEHAVIORS ---------------------------------------------------------------------------------
--
SET statement_timeout = 0;
SET lock_timeout = 0;
--SET idle_in_transaction_session_timeout = 0; // pg 9.6+ only
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
SET default_tablespace = '';
SET search_path = public, pg_catalog;

-- CREATE TABLES -----------------------------------------------------------------------

-- agency --
CREATE TABLE agency
(
    agency_id int,
    agency_name varchar(100),
    agency_url varchar(255),
    agency_timezone varchar(100),
    agency_lang varchar(100),
    agency_phone varchar(100),
    agency_fare_url varchar(100),
    CONSTRAINT agency_pkey PRIMARY KEY(agency_id)
);

-- calendar --
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
    end_date date,
    CONSTRAINT calendar_pkey PRIMARY KEY(service_id)
);

-- calendar_dates --
CREATE TABLE calendar_dates
(
    service_id int,
    dates date,
    exception_type int,
    CONSTRAINT calendar_fkey FOREIGN KEY (service_id)
     REFERENCES calendar(service_id) ON DELETE CASCADE
);

-- routes --
CREATE TABLE routes
(
    route_id varchar(10),
    agency_id int,
    route_short_name varchar(10),
    route_long_name varchar(255),
    route_desc int,
    route_type varchar(255),
    route_url varchar(255),
    route_color varchar(50),
    route_text_color varchar(50),
    CONSTRAINT route_pkey PRIMARY KEY(route_id)
);

-- shapes --
CREATE TABLE shapes
(
    shape_id varchar(50),
    shape_pt_lat double precision,
    shape_pt_long double precision,
    shape_pt_sequence int,
    shape_dist_traveled double precision
);

-- stops --
CREATE TABLE stops
(
    stop_id bigint,
    stop_code bigint,
    stop_name varchar(255),
    stop_lat double precision,
    stop_lon double precision,
    wheelchair_boarding int,
    CONSTRAINT stops_pkey PRIMARY KEY (stop_id)
);

-- transfers --
CREATE TABLE transfers
(
    from_stop_id bigint,
    to_stop_id bigint,
    transfer_type int,
    CONSTRAINT from_stop_fkey FOREIGN KEY (from_stop_id)
     REFERENCES stops(stop_id) ON DELETE CASCADE,
    CONSTRAINT to_stop_fkey FOREIGN KEY (to_stop_id)
     REFERENCES stops(stop_id) ON DELETE CASCADE
);

-- trips --
CREATE TABLE trips
(
    trip_id int,
    route_id varchar(10),
    service_id int,
    trip_headsign  varchar(255),
    trip_short_name varchar(50),
    direction_id varchar(10),
    block_id int,
    shape_id varchar(50),
    wheelchair_accessible int,
    bikes_allowed int,
    CONSTRAINT trips_pkey PRIMARY KEY (trip_id),
    CONSTRAINT route_fkey FOREIGN KEY (route_id)
     REFERENCES routes(route_id) ON DELETE CASCADE,
    CONSTRAINT calendar_fkey FOREIGN KEY (service_id)
     REFERENCES calendar(service_id) ON DELETE CASCADE
);

-- stop_times --
CREATE TABLE stop_times
(
    trip_id int,
    arrival_time varchar(50),
    departure_time varchar(50),
    stop_id bigint,
    stop_sequence int,
    stop_headsign int,
    pickup_type int,
    drop_off_type int,
    shape_dist_traveled double precision,
    timepoint int,
    CONSTRAINT trip_fkey FOREIGN KEY (trip_id)
     REFERENCES trips(trip_id) ON DELETE CASCADE,
    CONSTRAINT stop_fkey FOREIGN KEY (stop_id)
     REFERENCES stops(stop_id) ON DELETE CASCADE
);

-- CREATE VIEWS -----------------------------------------------------------------------