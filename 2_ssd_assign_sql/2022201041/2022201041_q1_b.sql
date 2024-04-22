        
    --  1.B.---------------------------------------------------------------------
    
					CREATE TABLE PersonJoining (
                       PJoinPK  int AUTO_INCREMENT PRIMARY KEY,
                       EmpIDFK INT ,
                       FirstName varchar(255),
                       LastName varchar(255),
                       DateofBirth varchar(12),
                       Age INT ,
                       DateofJoining varchar(255),
                       DayofJoining varchar(255),
                       MonthofJoining varchar(255),
                       YearofJoining varchar(255),
                       WorkExpinDays varchar(255) ,
                       FOREIGN KEY ( EmpIDFK) REFERENCES PERSON ( EmpID)
                       );
                       
     -- INSERTING FROM TABLE PERSON  TO PERSON JOINING
				INSERT INTO PersonJoining ( EmpIDFK, FirstName, LastName, DateofBirth, DateofJoining )
								     select EmpID,   FirstName, LastName, DOB, 		   DateofJoining
                                          from  PERSON ;
                  
   -- PROCEDURE FOR UPDATE_DATES ---------
					drop PROCEDURE if exists UPDATE_DATES;
				DELIMITER //
					CREATE PROCEDURE UPDATE_DATES()
					BEGIN
						UPDATE PersonJoining
                         SET AGE =(DATEDIFF(CURRENT_DATE, STR_TO_DATE(DateofBirth, '%m/%d/%Y'))/365.25)							
								where PJoinPK != 0 ;  
                                
                       UPDATE PersonJoining
                         SET   DayofJoining =  substring(DateofJoining,length(DateofJoining)-6, 2) 
                          where PJoinPK != 0 ;
                         
					  UPDATE PersonJoining
                         SET    MonthofJoining =  monthname(STR_TO_DATE(DateofJoining, '%m/%d/%Y'))
                          where PJoinPK != 0 ;
                           
					  UPDATE PersonJoining
                         SET   YearofJoining = substring(DateofJoining,length(DateofJoining)-3, length(DateofJoining) )    
                          where PJoinPK != 0 ;
                          
                      UPDATE PersonJoining
                         SET   WorkExpinDays = (DATEDIFF(CURRENT_DATE, STR_TO_DATE(DateofJoining, '%m/%d/%Y')))							
								where PJoinPK != 0 ;    
					
					END  //
				DELIMITER ;					
-- PROCEDURE ENDED

-- EXECUTE AND PRINT HIKE TABLE 
			call `UPDATE_DATES`();
			select * from PersonJoining;
        
