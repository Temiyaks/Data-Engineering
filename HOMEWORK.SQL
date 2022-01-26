
--checking the data
SELECT * FROM
yellow_taxi_trips
LIMIT 6;

--checking the second dataset
SELECT * FROM
zones
--where Zone = 'Jamiaca Bay'
LIMIT 6;


--question 3
SELECT COUNT(1) FROM
yellow_taxi_trips
WHERE CAST(tpep_pickup_datetime AS DATE) = '2021-01-15';

--53024

--question 4
SELECT CAST(tpep_pickup_datetime AS DATE), MAX(tip_amount) FROM
yellow_taxi_trips
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--2021-01-20


--question 5
SELECT CAST(y.tpep_pickup_datetime AS DATE) AS "Day", z."Zone", SUM(y.passenger_count) FROM
yellow_taxi_trips y
JOIN zones z
ON y."PULocationID" = z."LocationID"
WHERE CAST(y.tpep_pickup_datetime AS DATE) = '2021-01-14' AND z."Zone" = 'Central Park'
GROUP BY 1,2
ORDER BY 2 DESC;

-- UNKNOWN 
-- THE DATA IS NOT GIVEN. MORE DATA IS NEEDED TO DERIVE THE INSIGHT


--question 6
SELECT CAST(tpep_pickup_datetime AS DATE) pickup_day,
	--CAST(tpep_dropoff_datetime AS DATE) dropoff_day,
	AVG(total_amount),
	CONCAT(zpu."Zone", ' / ', zdo."Zone") as "Pickup_pair"
FROM 
	yellow_taxi_trips t,
	zones zpu,
	zones zdo
WHERE 
	t."PULocationID" = zpu."LocationID" AND
	t."DOLocationID" = zdo."LocationID"
GROUP BY 1,3
ORDER BY 2 DESC
LIMIT 1;

--Alphabet City/


--JUST TO CONFIRM IF QUESTION 5 IS CORRECT
SELECT CAST(tpep_pickup_datetime AS DATE) pickup_day, zpu."Zone", SUM(t.passenger_count)
	--CAST(tpep_dropoff_datetime AS DATE) dropoff_day,
	--AVG(total_amount),
	--CONCAT(zpu."Zone", ' / ', zdo."Zone") as "Pickup_pair"
FROM 
	yellow_taxi_trips t,
	zones zpu,
	zones zdo
WHERE 
	t."PULocationID" = zpu."LocationID" AND
	t."DOLocationID" = zdo."LocationID"
AND CAST(tpep_pickup_datetime AS DATE) = '2021-01-14' AND zpu."Zone" = 'Central Park'
GROUP BY 1,2
ORDER BY 2 DESC
LIMIT 100;

-- NO DATA FOR DESTINATION
	


