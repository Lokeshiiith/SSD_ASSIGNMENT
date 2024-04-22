yA database is created  ssd_assignment_2 
which is used in every file  USE ssd_assignment_2; 

Q1: a
 First table hike2022 was created and then imported data from PERSON table where WeightInKgs <50.\
 Then procedure started with UPDATE_HIKE () which updates Newhike and New salary in table hike2022.
 USES CAST , CONCATE , SUBSTRING predefined functions.
 NO changes to PERSON , and Newhike is remain in varchar like "20%""

Q1: b
 Second table PersonJoining was created and then imported data from PERSON table .
 Then procedure started with UPDATE_DATES() which updates 
 DayofJoining uses substring function, 
 MonthofJoining=  monthname(STR_TO_DATE(DateofJoining, '%m/%d/%Y')), 
 YearofJoining uses substring, 
 WorkExpinDays uses DATEDIFF , STR_TO_DATE functions

 NOTE: TABLE CREATE 
 INSETON INTO TABLE 
 AND 
 PROCEDURE ALL ARE SEPARETELY WRITTEN
 
Q1: c
 Third table PersonTransfer  was created and then imported data from PERSON table .
 Then procedure started with UPDATE_Transfer_city() which updates 
 WorkExpinYear  uses DATEDIFF , STR_TO_DATE functions and finally divided by 365.25 considering leap year , where DATAEDIFF substract year from joining to current.
 NewRegion = "DC" or "capitol" where gender 'm' and 'f'
 and there are null entries which show that no new location and they remain to old locations.
 NOTE: TABLE CREATE 
 INSETON INTO TABLE 
 AND 
 PROCEDURE ALL ARE SEPARETELY WRITTEN
 



 Q2:  
  Procedure timeconvert is created 
    two separate tables created source_time_zone and des_time_zone 
     epoc time changes to dae time and then insert into source_time_zone and gmtoffset also inserted with conversion.

       SELECT DISTINCT  d_offset - s_offset , date_add(sourcedatetimestamp, interval (d_offset - s_offset) hour )  as addition

       HERE I have printed distinct , as our aim is to convert according to epox then source to target .
       so less number of rows are printed here
        
        


 Q3:
   Sum aggregator is used which sums at each step and query is filter by case and when 
   STR_TO_DATE( TimeOfBirth, '%h:%i:%s %p' ) is used for comparision.       