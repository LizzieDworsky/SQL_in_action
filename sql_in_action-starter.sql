-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

-- SELECT * FROM intro_sql.final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"
-- EXPECTED OUTPUT: 146

-- SELECT count(id) FROM intro_sql.final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613
-- HINT: "Where" could it be?

-- EXPECTED OUTPUT: Patricia

-- SELECT host_name FROM intro_sql.final_airbnb WHERE host_id = 63613;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighbourhoods listed
-- HINT: This is a "distinct" operation...

-- EXPECTED OUTPUT: 40 neighbourhoods listed

-- SELECT count(distinct neighbourhood) FROM intro_sql.final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>

-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
-- HINT: This can be two different queries.

-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?

-- EXPECTED OUTPUT: Highest = 785, Lowest = 55

-- SELECT * FROM intro_sql.final_airbnb WHERE price = (SELECT max(price) FROM intro_sql.final_airbnb);
-- SELECT * FROM intro_sql.final_airbnb WHERE price = (SELECT min(price) FROM intro_sql.final_airbnb);
-- SELECT * FROM intro_sql.final_airbnb WHERE price = (SELECT min(price) FROM intro_sql.final_airbnb) OR price = (SELECT max(price) FROM intro_sql.final_airbnb);

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...

-- EXPECTED OUTPUT: 165.3904

-- SELECT avg(availability_365) FROM intro_sql.final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL

-- EXPECTED OUTPUT: 6 rows

-- SELECT * FROM intro_sql.final_airbnb WHERE number_of_reviews = 0 or number_of_reviews = null;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!

-- EXPECTED OUTPUT: 58059

-- SELECT id FROM intro_sql.final_airbnb WHERE room_type = "Private room" ORDER BY number_of_reviews DESC LIMIT 1;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood

-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood?

-- SELECT neighbourhood, count(neighbourhood) FROM intro_sql.final_airbnb group by neighbourhood order by count(neighbourhood) desc; 

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.

-- EXPECTED OUTPUT: 58059

-- SELECT id FROM intro_sql.final_airbnb WHERE minimum_nights < 7 order by number_of_reviews desc limit 1;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.

-- EXPECTED OUTPUT: The Box House Hotel with 6 listings

-- SELECT host_name, count(host_name) FROM intro_sql.final_airbnb GROUP BY host_name ORDER BY count(host_name) desc LIMIT 1;
