# Once a student is passed out from a Institute or College, he/she is known as Alumni of the Institute. 
# Alumni’s career growth plays important role in Institute’s ranking and other networking activities. 
# In this project, career choices of alumni of two Universities will be analyzed with respect to their passing year as well as the course they completed. 

# Dataset: Six .csv file (Alumni record of College A and College B) Higher Studies, Self Employed 
# and Service/Job record 

-- College_A_HS ~ Higher Studies Record of College A
-- College_A_SE ~ Self Employed Record of College A
-- College_A_SJ ~ Service/Job Record of College A
-- College_B_HS ~ Higher Studies Record of College B
-- College_B_SE ~ Higher Studies Record of College B
-- College_B_SJ ~ Higher Studies Record of College B
-- Tasks to be performed

# 1. Create new schema as alumni
USE alumni;

# 2. Import all .csv files into MySQL
USE alumni;

# 3. Run SQL command to see the structure of six tables
DESC College_A_HS;
DESC College_A_SE;
DESC College_A_SJ;
DESC College_B_HS;
DESC College_B_SE;
DESC College_B_SJ;

# 4. Display first 1000 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, 
#    College_B_SE, College_B_SJ) with Python.
SELECT * FROM College_A_HS, College_A_SE, College_A_SJ, College_B_HS,College_B_SE, College_B_SJ LIMIT 1000;
-- (For the Above output i have taken output through PYTHON (Jupiter notebook) and attached to the 
--   below files)

# 5. Import first 1500 rows of tables (College_A_HS, College_A_SE, College_A_SJ, College_B_HS, 
#    College_B_SE, College_B_SJ) into MS Excel.
SELECT * FROM College_A_HS, College_A_SE, College_A_SJ, College_B_HS,College_B_SE, College_B_SJ LIMIT 1500;
-- (for the Above output i have taken output through MS EXCEL and taken a Screenshot)

# 6. Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V, 
#    Remove null values. 
CREATE VIEW College_A_HS_V AS(SELECT * FROM College_A_HS WHERE RollNo IS NOT NULL AND LastUpdate 
IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND
Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND HSDegree IS NOT NULL AND
EntranceExam IS NOT NULL AND Institute IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM College_A_HS_V;

# 7. Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V, 
#    Remove null values.
CREATE VIEW College_A_SE_V AS(SELECT * FROM College_A_SE WHERE RollNo IS NOT NULL AND LastUpdate 
IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND
Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND
Location IS NOT NULL);
SELECT * FROM College_A_SE_V;

# 8. Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V, 
#    Remove null values.
CREATE VIEW College_A_SJ_V AS(SELECT * FROM College_A_SJ WHERE RollNo IS NOT NULL AND LastUpdate 
IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND
Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND Organization IS NOT NULL AND
Designation IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM College_A_SJ_V;

# 9. Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V, 
#    Remove null values.
CREATE VIEW College_B_HS_V AS(SELECT * FROM College_B_HS WHERE RollNo IS NOT NULL AND LastUpdate 
IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND
Branch IS NOT NULL AND Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND
HSDegree IS NOT NULL AND EntranceExam IS NOT NULL AND Institute IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM College_B_HS_V;

# 10.Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V, 
#    Remove null values.
CREATE VIEW College_B_SE_V AS(SELECT * FROM College_B_SE WHERE RollNo IS NOT NULL AND LastUpdate 
IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND Branch IS NOT 
NULL AND Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND
 Organization IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM College_B_SE_V;

# 11.Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V,
#    Remove null values.
SELECT * FROM College_B_SJ;
CREATE VIEW College_B_SJ_V AS(SELECT * FROM College_B_SJ WHERE RollNo IS NOT NULL AND LastUpdate 
IS NOT NULL AND Name IS NOT NULL AND FatherName IS NOT NULL AND MotherName IS NOT NULL AND 
Branch IS NOT NULL AND Batch IS NOT NULL AND Degree IS NOT NULL AND PresentStatus IS NOT NULL AND 
Organization IS NOT NULL AND Designation IS NOT NULL AND Location IS NOT NULL);
SELECT * FROM College_B_SJ_V;

# 12.Make procedure to use string function/s for converting record of Name, FatherName, MotherName 
#    into lower case for views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V,
#    College_B_SE_V, College_B_SJ_V) 
 CALL College_A_HS_V();
 CALL College_A_SE_V();
 CALL College_A_SJ_V();
 CALL College_B_HS_V();
 CALL College_B_SE_V();
 CALL College_B_SJ_V();
 
# 13.Import the created views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, 
#    College_B_SE_V, College_B_SJ_V) into MS Excel and make pivot chart for location of Alumni. 

/* ( Procedure of making a Pivot table through MS-Excel)
    (Step- 1: First open Ms-Excel and then go to Data and open MYSql for connection
    step - 2: Next login for MySql data and choose database and then select table then import that particular 
              data by selecting the pivot table and then import then we can find the pivot table along with s
              selected data
              (Choose location for pivot table)
    
-- (HERE iam taken this output through MS-Excel and taken a screenshots of outputs and attached to the 
     below file)*/

# 14.Write a query to create procedure get_name_collegeA using the cursor to fetch names of all 
#    students from college A.
 USE alumni;
DELIMITER $$
CREATE PROCEDURE get_name_collegeA
(
   INOUT LName TEXT(40000)
)
BEGIN
     DECLARE finished INT DEFAULT 0;
     DECLARE Lnamelist VARCHAR(16000) DEFAULT " ";
     DECLARE Lnamedetails CURSOR FOR 
     SELECT name FROM College_a_hs UNION  SELECT name FROM College_a_se UNION 
     SELECT name FROM College_a_sj;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
     OPEN Lnamedetails;
     getname1:LOOP
     FETCH Lnamedetails INTO Lnamelist;
     IF finished = 1 THEN LEAVE getname1;
     END IF;
     SET Lname = CONCAT(Lnamelist, ";", Lname);
     END LOOP getname1;
     CLOSE Lnamedetails;
END $$
DELIMITER ;

SET @name1 = " ";
CALL get_name_collegeA(@name1);
SELECT @Name1 Name;


# 15.Write a query to create procedure get_name_collegeB using the cursor to fetch names of all
#    students from college B.
USE alumni;
DELIMITER $$
CREATE PROCEDURE get_name_collegeB
(
   INOUT FName TEXT(40000)
)
BEGIN
     DECLARE finished INT DEFAULT 0;
     DECLARE Fnamelist VARCHAR(16000) DEFAULT " ";
     DECLARE Fnamedetails CURSOR FOR 
     SELECT name FROM College_a_hs UNION ALL SELECT name FROM College_b_se UNION ALL 
     SELECT name FROM College_b_sj;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
     OPEN Fnamedetails;
     getname2:LOOP
     FETCH Fnamedetails INTO Fnamelist;
     IF finished = 1 THEN LEAVE getname2;
     END IF;
     SET Fname = CONCAT(Fnamelist, ";", Fname);
     END LOOP getname2;
     CLOSE Fnamedetails;
END $$
DELIMITER ;

SET @name2 = " ";
CALL get_name_collegeB(@name2);
SELECT @Name2 Name;

#16.Calculate the percentage of career choice of College A and College B Alumni
--  (w.r.t Higher Studies, Self Employed and Service/Job)
#   Note: Approximate percentages are considered for career choices.
USE alumni;
SELECT "HigherStudies"PresentStatus,
(SELECT COUNT(*) FROM College_A_HS)/((SELECT COUNT(*) FROM College_A_HS)+
(SELECT COUNT(*) FROM College_A_SE)+(SELECT COUNT(*) FROM College_A_SJ))*100 College_A_Percentage,
(SELECT COUNT(*) FROM College_B_HS)/((SELECT COUNT(*) FROM College_B_HS)+
(SELECT COUNT(*) FROM College_B_SE)+(SELECT COUNT(*) FROM College_B_SJ))*100 College_B_Percentage 
UNION
SELECT "Self Employed"PresentStatus,
(SELECT COUNT(*) FROM College_A_SE)/((SELECT COUNT(*) FROM College_A_HS)+
(SELECT COUNT(*) FROM College_A_SE)+(SELECT COUNT(*) FROM College_A_SJ))*100 College_A_Percentage,
(SELECT COUNT(*) FROM College_B_SE)/((SELECT COUNT(*) FROM College_B_HS)+
(SELECT COUNT(*) FROM College_B_SE)+(SELECT COUNT(*) FROM College_B_SJ))*100 College_B_Percentage 
UNION
SELECT "Service Job"PresentStatus,
(SELECT COUNT(*) FROM College_A_SJ)/((SELECT COUNT(*) FROM College_A_HS)+
(SELECT COUNT(*) FROM College_A_SE)+(SELECT COUNT(*) FROM College_A_SJ))*100 College_A_Percentage,
(SELECT COUNT(*) FROM College_B_SJ)/((SELECT COUNT(*) FROM College_B_HS)+
(SELECT COUNT(*) FROM College_B_SE)+(SELECT COUNT(*) FROM College_B_SJ))*100 College_B_Percentage; 
