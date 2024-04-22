 DELIMITER //
					CREATE PROCEDURE timezoneconvert(sourcedatetimestamp datetime, sourcetimezonecode text, targettimezone text)
					BEGIN
                     
					  CREATE TABLE source_time_zone (
							zonename varchar(35),
							countrycode char(2),
							timezonecode varchar(6),
							timestart datetime,
							s_offset int                 
							);
							
					   CREATE TABLE des_time_zone (
							d_offset int ,
							countrycode2 text
							);
							               
						   truncate table source_time_zone;
						   truncate table des_time_zone; 
               
						INSERT INTO source_time_zone  (  zonename,	countrycode, timezonecode,   timestart,  s_offset )
										 select distinct zonename,	countrycode, timezonecode, (DATE_ADD(from_unixtime(0),interval timestart second)) as timestart,
												 (gmtoffset/3600)
                                                 from  time_zone 
											    WHERE    timezonecode = sourcetimezonecode  ;
											   
						INSERT INTO des_time_zone ( d_offset , countrycode2 )
										select distinct   gmtoffset/3600 ,      countrycode   
                                           from time_zone
											 WHERE timezonecode = targettimezone ;
                                            
                        SELECT DISTINCT  d_offset - s_offset , date_add(sourcedatetimestamp, interval (d_offset - s_offset) hour )  as addition  
                                FROM source_time_zone , des_time_zone 
                                   WHERE timestart < sourcedatetimestamp ;   
					END  //
				DELIMITER ;	
                