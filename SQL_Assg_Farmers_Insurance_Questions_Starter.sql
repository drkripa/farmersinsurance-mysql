use ndap;

CREATE SCHEMA IF NOT EXISTS ndap;
-- ----------------------------------------------------------------------------------------------
-- SECTION 1. 
-- SELECT Queries [5 Marks]

-- 	Q1.	Retrieve the names of all states (srcStateName) from the dataset.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >
-- <write your answers in the empty spaces given, the length of solution queries (and the solution writing space) can vary>


###

-- 	Q2.	Retrieve the total number of farmers covered (TotalFarmersCovered) 
-- 		and the sum insured (SumInsured) for each state (srcStateName), ordered by TotalFarmersCovered in descending order.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >


-- ###

-- --------------------------------------------------------------------------------------
-- SECTION 2. 
-- Filtering Data (WHERE) [15 Marks]

-- 	Q3.	Retrieve all records where Year is '2020'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >


-- ###

-- 	Q4.	Retrieve all rows where the TotalPopulationRural is greater than 1 million and the srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >


-- ###

-- 	Q5.	Retrieve the srcStateName, srcDistrictName, and the sum of FarmersPremiumAmount for each district in the year 2018, 
-- 		and display the results ordered by FarmersPremiumAmount in ascending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >


-- ###

-- 	Q6.	Retrieve the total number of farmers covered (TotalFarmersCovered) and the sum of premiums (GrossPremiumAmountToBePaid) for each state (srcStateName) 
-- 		where the insured land area (InsuredLandArea) is greater than 5.0 and the Year is 2018.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >


	  
-- ###
-- ------------------------------------------------------------------------------------------------

-- SECTION 3.
-- Aggregation (GROUP BY) [10 marks]

-- 	Q7. 	Calculate the average insured land area (InsuredLandArea) for each year (srcYear).
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q8. 	Calculate the total number of farmers covered (TotalFarmersCovered) for each district (srcDistrictName) where Insurance units is greater than 0.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q9.	For each state (srcStateName), calculate the total premium amounts (FarmersPremiumAmount, StatePremiumAmount, GOVPremiumAmount) 
-- 		and the total number of farmers covered (TotalFarmersCovered). Only include records where the sum insured (SumInsured) is greater than 500,000 (remember to check for scaling).
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- -------------------------------------------------------------------------------------------------
-- SECTION 4.
-- Sorting Data (ORDER BY) [10 Marks]

-- 	Q10.	Retrieve the top 5 districts (srcDistrictName) with the highest TotalPopulation in the year 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

use ndap
CREATE TABLE IF NOT EXISTS FarmersInsuranceData(
 rowID INT PRIMARY KEY,
 srcYear INT,
 srcStateName VARCHAR(255),
 srcDistrictName VARCHAR(255),
 InsuranceUnits INT,
 TotalFarmersCovered INT,
 ApplicationsLoaneeFarmers INT,
 ApplicationsNonLoaneeFarmers INT,
 InsuredLandArea FLOAT,
 FarmersPremiumAmount FLOAT,
 StatePremiumAmount FLOAT,
 GOVPremiumAmount FLOAT,
 GrossPremiumAmountToBePaid FLOAT,
 SumInsured FLOAT,
 PercentageMaleFarmersCovered FLOAT,
 PercentageFemaleFarmersCovered FLOAT,
 PercentageOthersCovered FLOAT,
 PercentageSCFarmersCovered FLOAT,
 PercentageSTFarmersCovered FLOAT,
 PercentageOBCFarmersCovered FLOAT,
 PercentageGeneralFarmersCovered FLOAT,
 PercentageMarginalFarmers FLOAT,
 PercentageSmallFarmers FLOAT,
 PercentageOtherFarmers FLOAT,
 YearCode INT,
 Year_ VARCHAR(255),
 Country VARCHAR(255),
 StateCode INT,
 DistrictCode INT,
 TotalPopulation INT,
 TotalPopulationUrban INT,
 TotalPopulationRural INT,
 TotalPopulationMale INT,
 TotalPopulationMaleUrban INT,
 TotalPopulationMaleRural INT,
 TotalPopulationFemale INT,
 TotalPopulationFemaleUrban INT,
 TotalPopulationFemaleRural INT,
 NumberOfHouseholds INT,
 NumberOfHouseholdsUrban INT,
 NumberOfHouseholdsRural INT,
 LandAreaUrban FLOAT,
 LandAreaRural FLOAT,
 LandArea FLOAT
);
select * from FarmersInsuranceData

LOAD DATA LOCAL INFILE "/Users/kripa/Downloads/SQL_Assg_PMFBY_Dataset_Starter/Data_PMFBY/data.csv"
INTO TABLE FarmersInsuranceData
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from FarmersInsuranceData

select COUNT(*) FROM FarmersInsuranceData;

SELECT srcDistrictName, TotalPopulation
FROM FarmersInsuranceData
WHERE srcYear = 2020
ORDER BY TotalPopulation DESC
LIMIT 5;

-- Bengaluru Uraban - 9621551
-- Pune - 9429408
-- Thane - 8070032
-- Jaipur - 6626178
-- Nashik - 6107187

-- 	Q11.	Retrieve the srcStateName, srcDistrictName, and SumInsured for the 10 districts with the lowest non-zero FarmersPremiumAmount, 
-- 		ordered by insured sum and then the FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT srcStateName, srcDistrictName, SumInsured, FarmersPremiumAmount
FROM FarmersInsuranceData
WHERE FarmersPremiumAmount > 0
ORDER BY SumInsured DESC, FarmersPremiumAmount ASC
LIMIT 10;

-- 'MAHARASHTRA','Bid','275019','7244.42'
-- 'MAHARASHTRA','Latur','238546','4860.57'
-- 'MAHARASHTRA','Latur','231003','4658.48'
-- 'MADHYA PRADESH','Ujjain','218206','3273.09'
-- 'MADHYA PRADESH','Ujjain','216693','4333.87'
-- 'MAHARASHTRA','Nanded','216358','4497.64'
-- 'MADHYA PRADESH','Ujjain','194391','2915.86'
-- 'ANDHRA PRADESH','Kurnool','191969','1.19'
-- 'MAHARASHTRA','Bid','185675','4373.32'
-- 'MAHARASHTRA','Osmanabad','182755','3672.94'

###

-- 	Q12. 	Retrieve the top 3 states (srcStateName) along with the year (srcYear) where the ratio of insured farmers (TotalFarmersCovered) to the total population (TotalPopulation) is highest. 
-- 		Sort the results by the ratio in descending order.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >

SELECT 
    srcStateName,
    srcYear,
    SUM(TotalFarmersCovered) AS TotalFarmersCovered,
    SUM(TotalPopulation) AS TotalPopulation,
    CAST(SUM(TotalFarmersCovered) AS FLOAT) / NULLIF(SUM(TotalPopulation), 0) AS CoverageRatio
FROM FarmersInsuranceData
GROUP BY srcStateName, srcYear
HAVING SUM(TotalPopulation) > 0
ORDER BY CoverageRatio DESC
LIMIT 3;


-- CHHATTISGARH 2021
-- TRIPURA 2020
-- TRIPURA 2021

-- -------------------------------------------------------------------------------------------------

-- SECTION 5.
-- String Functions [6 Marks]

-- 	Q13. 	Create StateShortName by retrieving the first 3 characters of the srcStateName for each unique state.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q14. 	Retrieve the srcDistrictName where the district name starts with 'B'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q15. 	Retrieve the srcStateName and srcDistrictName where the district name contains the word 'pur' at the end.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >


-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 6.
-- Joins [14 Marks]

-- 	Q16. 	Perform an INNER JOIN between the srcStateName and srcDistrictName columns to retrieve the aggregated FarmersPremiumAmount for districts where the district’s Insurance units for an individual year are greater than 10.
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q17.	Write a query that retrieves srcStateName, srcDistrictName, Year, TotalPopulation for each district and the the highest recorded FarmersPremiumAmount for that district over all available years
-- 		Return only those districts where the highest FarmersPremiumAmount exceeds 20 crores.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q18.	Perform a LEFT JOIN to combine the total population statistics with the farmers’ data (TotalFarmersCovered, SumInsured) for each district and state. 
-- 		Return the total premium amount (FarmersPremiumAmount) and the average population count for each district aggregated over the years, where the total FarmersPremiumAmount is greater than 100 crores.
-- 		Sort the results by total farmers' premium amount, highest first.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 7.
-- Subqueries [10 Marks]

-- 	Q19.	Write a query to find the districts (srcDistrictName) where the TotalFarmersCovered is greater than the average TotalFarmersCovered across all records.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- 	Q20.	Write a query to find the srcStateName where the SumInsured is higher than the SumInsured of the district with the highest FarmersPremiumAmount.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- 	Q21.	Write a query to find the srcDistrictName where the FarmersPremiumAmount is higher than the average FarmersPremiumAmount of the state that has the highest TotalPopulation.
-- ###
-- 	[5 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 8.
-- Advanced SQL Functions (Window Functions) [10 Marks]

-- 	Q22.	Use the ROW_NUMBER() function to assign a row number to each record in the dataset ordered by total farmers covered in descending order.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- 	Q23.	Use the RANK() function to rank the districts (srcDistrictName) based on the SumInsured (descending) and partition by alphabetical srcStateName.
-- ###
-- 	[3 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q24.	Use the SUM() window function to calculate a cumulative sum of FarmersPremiumAmount for each district (srcDistrictName), ordered ascending by the srcYear, partitioned by srcStateName.
-- ###
-- 	[4 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 9.
-- Data Integrity (Constraints, Foreign Keys) [4 Marks]

-- 	Q25.	Create a table 'districts' with DistrictCode as the primary key and columns for DistrictName and StateCode. 
-- 		Create another table 'states' with StateCode as primary key and column for StateName.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- 	Q26.	Add a foreign key constraint to the districts table that references the StateCode column from a states table.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- -------------------------------------------------------------------------------------------------

-- SECTION 10.
-- UPDATE and DELETE [6 Marks]

-- 	Q27.	Update the FarmersPremiumAmount to 500.0 for the record where rowID is 1.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >




-- ###

-- 	Q28.	Update the Year to '2021' for all records where srcStateName is 'HIMACHAL PRADESH'.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###

-- 	Q29.	Delete all records where the TotalFarmersCovered is less than 10000 and Year is 2020.
-- ###
-- 	[2 Marks]
-- ###
-- TYPE YOUR CODE BELOW >



-- ###