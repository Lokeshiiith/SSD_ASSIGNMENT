
	 
        DELIMITER //
          CREATE PROCEDURE UPDATE_HIKE()
		BEGIN
		                   CREATE TABLE if not exists hike2022 (
		                    HikePK int AUTO_INCREMENT PRIMARY KEY,
		                    EmpIDFK INT ,
		                    FirstName varchar(255),
		                    LastName varchar(255),
		                    Gender varchar(255),
		                    WeightInKg INT,
		                    LastHike varchar(10),
		                    LastSalary INT,
		                    NewHike varchar(10),
		                    NewSalary INT ,
		                    FOREIGN KEY ( EmpIDFK) REFERENCES PERSON ( EmpID)   
		                    );
			TRUNCATE TABLE hike2022;

 -- INSERTING FROM TABLE PERSON 
                INSERT INTO hike2022 ( EmpIDFK, FirstName, LastName, Gender, WeightInKg,  LastHike, LastSalary )
                                select EmpID,   FirstName, LastName, Gender, WeightInKgs, LastHike, Salary from  PERSON
                                       WHERE WeightInKgs < 50;
 
     
      
  -- PROCEDURE FOR UPDATE_HIKE ---------
            --   	drop PROCEDURE if exists UPDATE_HIKE ;
				
					
						UPDATE hike2022 
							SET NewHike = CONCAT(cast(CAST(substring(LastHike, 1, length(LastHike)-1) AS unsigned) + 2 as char) , "%" )
								where HikePK != 0 ;
					
						UPDATE hike2022
							SET Newsalary = LastSalary  + (LastSalary * CAST(substring(NewHike, 1, length(NewHike)-1) AS unsigned)) / 100 
								where HikePK != 0 ;                             
		END  //
                           
	DELIMITER ;	   
                
-- EXECUTE AND PRINT HIKE TABLE 
                 
