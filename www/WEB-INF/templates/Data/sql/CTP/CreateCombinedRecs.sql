-- roll ctp_statesdaily into combined format

/*
SELECT * FROM combined order by state, date;

*/

ROLLBACK;
BEGIN TRANSACTION;
DELETE FROM combined WHERE sourcecode = 'CTP_DS';
-- commit;

INSERT INTO combined
(
sourcecode,
state,
country,
positive,
positiveincrease,
negative,
negativeincrease,
totaltestresults,
totaltestresultsincrease,
hospitalized,
hospitalizedincrease,
death,
deathincrease,
recovered,
recoveredincrease,
datechecked,
date

)
/*CREATE TABLE combined_v as*/
SELECT
'CTP_SD' as sourcecode,
state,
country,
positive,
positiveincrease,
negative,
negativeincrease,
totaltestresults,
totaltestresultsincrease,
hospitalized,
hospitalizedincrease,
death,
deathincrease,
null as recovered,
null as recoveredincrease,
datechecked,
to_date(substring(datechecked from 1 for 10),'YYYY-MM-DD') as date		-- 2020-03-15T20:00:00Z

FROM ctp_statesdaily;


UPDATE combined SET date = to_date(substring(datechecked from 1 for 10), 'YYYY-MM-DD');

