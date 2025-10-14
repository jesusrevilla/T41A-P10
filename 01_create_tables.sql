--
-- PostgreSQL database dump
--
CREATE DATABASE exercises;
\c exercises
CREATE SCHEMA cd;



-- Dumped from database version 9.2.0
-- Dumped by pg_dump version 9.2.0
-- Started on 2013-05-19 16:05:10 BST

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 32769)
-- Name: cd; Type: SCHEMA; Schema: -; Owner: -
--

SET search_path = cd, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 32818)
-- Name: bookings; Type: TABLE; Schema: cd; Owner: -; Tablespace:
--

CREATE TABLE bookings (
    bookid integer NOT NULL,
    facid integer NOT NULL,
    memid integer NOT NULL,
    starttime timestamp without time zone NOT NULL,
    slots integer NOT NULL
);


--
-- TOC entry 169 (class 1259 OID 32770)
-- Name: facilities; Type: TABLE; Schema: cd; Owner: -; Tablespace:
--

CREATE TABLE facilities (
    facid integer NOT NULL,
    name character varying(100) NOT NULL,
    membercost numeric NOT NULL,
    guestcost numeric NOT NULL,
    initialoutlay numeric NOT NULL,
    monthlymaintenance numeric NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 32800)
-- Name: members; Type: TABLE; Schema: cd; Owner: -; Tablespace:
--

CREATE TABLE members (
    memid integer NOT NULL,
    surname character varying(200) NOT NULL,
    firstname character varying(200) NOT NULL,
    address character varying(300) NOT NULL,
    zipcode integer NOT NULL,
    telephone character varying(20) NOT NULL,
    recommendedby integer,
    joindate timestamp without time zone NOT NULL
);




--
-- TOC entry 2196 (class 2606 OID 32822)
-- Name: bookings_pk; Type: CONSTRAINT; Schema: cd; Owner: -; Tablespace:
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pk PRIMARY KEY (bookid);


--
-- TOC entry 2192 (class 2606 OID 32777)
-- Name: facilities_pk; Type: CONSTRAINT; Schema: cd; Owner: -; Tablespace:
--

ALTER TABLE ONLY facilities
    ADD CONSTRAINT facilities_pk PRIMARY KEY (facid);


--
-- TOC entry 2194 (class 2606 OID 32807)
-- Name: members_pk; Type: CONSTRAINT; Schema: cd; Owner: -; Tablespace:
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pk PRIMARY KEY (memid);


--
-- TOC entry 2198 (class 2606 OID 32823)
-- Name: fk_bookings_facid; Type: FK CONSTRAINT; Schema: cd; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT fk_bookings_facid FOREIGN KEY (facid) REFERENCES facilities(facid);


--
-- TOC entry 2199 (class 2606 OID 32828)
-- Name: fk_bookings_memid; Type: FK CONSTRAINT; Schema: cd; Owner: -
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT fk_bookings_memid FOREIGN KEY (memid) REFERENCES members(memid);


--
-- TOC entry 2197 (class 2606 OID 32808)
-- Name: fk_members_recommendedby; Type: FK CONSTRAINT; Schema: cd; Owner: -
--

ALTER TABLE ONLY members
    ADD CONSTRAINT fk_members_recommendedby FOREIGN KEY (recommendedby) REFERENCES members(memid) ON DELETE SET NULL;


-- Completed on 2013-05-19 16:05:12 BST

--
-- PostgreSQL database dump complete
--

CREATE INDEX "bookings.memid_facid"
  ON cd.bookings
  USING btree
  (memid, facid);

CREATE INDEX "bookings.facid_memid"
  ON cd.bookings
  USING btree
  (facid, memid);

CREATE INDEX "bookings.facid_starttime"
  ON cd.bookings
  USING btree
  (facid, starttime);

CREATE INDEX "bookings.memid_starttime"
  ON cd.bookings
  USING btree
  (memid, starttime);

CREATE INDEX "bookings.starttime"
  ON cd.bookings
  USING btree
  (starttime);

CREATE INDEX "members.joindate"
  ON cd.members
  USING btree
  (joindate);

CREATE INDEX "members.recommendedby"
  ON cd.members
  USING btree
  (recommendedby);

ANALYZE;

