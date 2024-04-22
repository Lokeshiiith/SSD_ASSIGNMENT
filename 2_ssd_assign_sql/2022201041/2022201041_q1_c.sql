
 


 -- 1.c ------------>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
				CREATE TABLE PersonTransfer  (
                       PTPK int AUTO_INCREMENT PRIMARY KEY,
                       EmpIDFK INT,
                       FirstName varchar(255),
                       LastName varchar(255),
                       Gender varchar(10),
                       DateofJoining varchar(12),
                       CurrentRegion varchar(255),
                       NewRegion varchar(255), 
                       WorkExpinYear int ,
                       FOREIGN KEY ( EmpIDFK) REFERENCES PERSON ( EmpID)
                       );
						 
	  -- INSERTING FROM TABLE PERSON  TO PERSON JOINING
				INSERT INTO PersonTransfer ( EmpIDFK, FirstName, LastName, Gender, DateofJoining, CurrentRegion )
								      select EmpID,   FirstName, LastName, Gender, DateofJoining, Region
                                          from  PERSON ;
                                          
                                          
                                                                                 
      -- SELECT FROM PERSONJIONING
              SELECT * FROM PersonTransfer ;
              
       
					drop PROCEDURE if exists UPDATE_Transfer_city;
				DELIMITER //
					CREATE PROCEDURE UPDATE_Transfer_city()
					BEGIN
						UPDATE PersonTransfer
                         SET WorkExpinYear = (DATEDIFF(CURRENT_DATE, STR_TO_DATE(DateofJoining, '%m/%d/%Y'))/365.25)
                         where PTPK != 0 ;
                        
                        UPDATE PersonTransfer
                         SET NewRegion = "DC"						
								where PTPK != 0 AND Gender ="F" AND WorkExpinYear >10   ;
                                
                         UPDATE PersonTransfer
                         SET NewRegion = "Capitol"						
								where PTPK != 0 AND Gender ="M" AND WorkExpinYear > 20  ;         
					
					END  //
				DELIMITER ;					
-- PROCEDURE ENDED

-- EXECUTE AND PRINT HIKE TABLE 
			call `UPDATE_Transfer_city`();
			select * from PersonTransfer;
