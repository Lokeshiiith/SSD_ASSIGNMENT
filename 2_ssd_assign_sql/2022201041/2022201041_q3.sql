SELECT REGION ,sum(case 
			when(time(STR_TO_DATE( TimeOfBirth, '%h:%i:%s %p' )) >= '00:00:00' and time(STR_TO_DATE( TimeOfBirth, '%h:%i:%s %p' )) <='08:00:59')
					      then 1 
					      else 0 
                    end ) 
					as Num_Employee_born_btw_00_hours_to_800_hours,
               sum(case 
			when(time(STR_TO_DATE( TimeOfBirth, '%h:%i:%s %p' )) >= '08:01:00' and time(STR_TO_DATE( TimeOfBirth, '%h:%i:%s %p' )) <='15:00:00')
                        then 1 
                        else 0
		  end )
			as Num_Employee_born_btw_801_hours_to_1500_hours,
               sum(case 
                       when(time(STR_TO_DATE( TimeOfBirth, '%h:%i:%s %p' )) >= '15:01:00' and time(STR_TO_DATE( TimeOfBirth, '%h:%i:%s %p' )) <='22:59:00') 
                       then 1 
                       else 0 
		   end )
			as Num_Employee_born_btw_1501_hours_to_2259_hours
   FROM PERSON  
     GROUP BY REGION;

