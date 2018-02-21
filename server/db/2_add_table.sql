START TRANSACTION;

SET statement_timeout = 0;
SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET client_encoding = 'utf8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET row_security = off;
SET search_path = public, pg_catalog;

-- Insert Table -----------------------------------------------------------------------

-- agency --
\COPY agency  FROM '../../GTFS/agency.txt' DELIMITER ',' HEADER;

-- calendar dates
\COPY calendar_dates  FROM '../../GTFS/calendar_dates.txt' DELIMITER ',' HEADER;

-- calendar -- 
\COPY calendar  FROM '../../GTFS/calendar.txt' DELIMITER ',' HEADER;

-- routes --
\COPY routes  FROM '../../GTFS/routes.txt' DELIMITER ',' HEADER;

-- shapes --
\COPY shapes  FROM '../../GTFS/shapes.txt' DELIMITER ',' HEADER;

-- stop_times --
\COPY stop_times  FROM '../../GTFS/stop_times.txt' DELIMITER ',' HEADER;

-- transfers --
\COPY transfers  FROM '../../GTFS/transfers.txt' DELIMITER ',' HEADER;

-- trips --
\COPY trips  FROM '../../GTFS/trips.txt' DELIMITER ',' HEADER;

COMMIT;