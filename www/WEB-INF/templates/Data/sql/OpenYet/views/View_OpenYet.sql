DROP VIEW IF EXISTS oyv_open_yet;
CREATE VIEW oyv_open_yet AS

SELECT vc.*,
ROUND(death/(population/1000000)) as deaths_1m,
ROUND(confirmed/(population/1000000)) as confirmed_1m,
ROUND(totaltestresults/(population/1000000)) as tests_1m
FROM(
  SELECT  date, c.countrycode, c.statecode, c.state, c.county,
  confirmed,death,totaltestresults,
  ROUND((ppositive*100)::numeric,2) as ppositive,
  confd0,confd1,
  ROUND((ppositived0*100)::numeric,2) as ppositived0,
  ROUND((ppositived1*100)::numeric,2) as ppositived1,
  deathd0,deathd1,
  country.population*1000 as country_population,
  CASE
      WHEN county.population is not null THEN county.population
      WHEN state.population is not null THEN state.population
      WHEN country.population is not null THEN country.population*1000
  END as population

  FROM combined c
  JOIN country USING (countrycode)
  LEFT JOIN state ON (statecode = ansi)
  LEFT JOIN county USING (county)
  )vc




/*

SELECT * FROM oyv_open_yet
WHERE county is null
AND state is null
AND countrycode = 'USA'
AND date > (SELECT max(date) FROM combined) - interval '14 days'
AND date > to_date('5/4/2020','mm/dd/yyyy') - interval '14 days'
ORDER BY date;


*//