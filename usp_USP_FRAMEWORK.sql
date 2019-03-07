DELIMITER $$
CREATE DEFINER=`YOUR DEFINER`@`HERE` PROCEDURE `usp_USP_FRAMEWORK`(IN GUID varchar(36), IN param1 varchar(100), IN param2 varchar(100))
BEGIN
#### TODO: change usp header to reflect correct name and parameters after the GUID parameter

#Declarations


#Input Validation
#### TODO: change @param1 and @param2 to match actual usp parameters with input validation checking
SET @param1 = param1;
SET @param2 = param2;

#Logging
SET @delimit = ', ';
SET @quote = '\'';
SET @loggingguid = CASE WHEN ISNULL(GUID) THEN UUID() ELSE GUID END;

#### TODO: change @csv_params to match actual usp parameters, use @quote and @delimit to get quotes and commas
SET @csv_params = CONCAT(@quote, @loggingguid, @quote, @delimit, @quote, @param1, @quote, @delimit, @quote, @param2, @quote);

#### TODO: change 'usp_USP_FRAMEWORK' to the name of the usp
CALL `usp_dblog_Write`(@loggingguid, 'usp_USP_FRAMEWORK',  'START', @csv_params);

#Execution



#Outputs


#Logging
#### TODO: change 'usp_USP_FRAMEWORK' to the name of the usp
CALL `usp_dblog_Write`(@loggingguid, 'usp_USP_FRAMEWORK',  'END', '');


END$$
DELIMITER ;
