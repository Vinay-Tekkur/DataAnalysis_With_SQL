-- Write a query that displays only the state with the largest amount of fruit supply.
SELECT state, SUM(supply) as total_supply FROM fruit_imports
GROUP BY state
ORDER BY total_supply DESC
LIMIT 1

-- Write a query that returns the most expensive cost_per_unit of every season. 
-- The query should display 2 columns, the season and the cost_per_unit
SELECT season, MAX(cost_per_unit) as total_cost
FROM fruit_imports
GROUP BY season
ORDER BY total_cost DESC

-- Write a query that returns the state that has more than 1 import of the same fruit.
SELECT state, COUNT(name) as fruits_import_count
FROM fruit_imports
GROUP BY state
HAVING COUNT(name) > 1

-- Write a query that returns the seasons that produce either 3 fruits or 4 fruits.
SELECT season, COUNT(name) AS fruit_count
FROM fruit_imports
GROUP BY season
HAVING COUNT(name) >= 3


-- Write a query that takes into consideration the supply and cost_per_unit columns 
-- for determining the total cost and returns the most expensive state with the total cost
SELECT state, SUM(supply * cost_per_unit) AS total_cost
FROM fruit_imports
GROUP BY state
ORDER BY total_cost DESC
LIMIT 1

-- USING COALESCE() funnction
SELECT COUNT(COALESCE(fruit_name, 'NA')) FROM fruits
















