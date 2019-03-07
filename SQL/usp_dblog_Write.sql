DELIMITER $$
CREATE DEFINER=`YOUR DEFINER`@`HERE` PROCEDURE `usp_dblog_Write`(IN GUID varchar(36), IN SP_NAME varchar(100), IN MESSAGE varchar(100), IN CSV_PARAMS varchar(4000))
BEGIN
    #Input Validation
    SET @GUID = CASE WHEN ISNULL(GUID) THEN 'ERROR' WHEN GUID = '' THEN 'ERROR' ELSE GUID END;
    SET @SP_NAME = CASE WHEN ISNULL(SP_NAME) THEN 'ERROR' WHEN SP_NAME = '' THEN 'ERROR' ELSE SP_NAME END;
	SET @MESSAGE = CASE WHEN ISNULL(MESSAGE) THEN 'ERROR' WHEN MESSAGE = '' THEN 'ERROR' ELSE MESSAGE END;
    SET @CSV_PARAMS = CASE WHEN ISNULL(CSV_PARAMS) THEN 'ERROR' WHEN CSV_PARAMS = '' THEN 'ERROR' ELSE CSV_PARAMS END;
    
    SET @NULL_PARMS = (@GUID='ERROR' AND @SP_NAME='ERROR' AND @MESSAGE='ERROR' AND @CSV_PARAMS='ERROR');
    
    #Get Timestamp
    SET @TS = NOW(3);
    
    IF NOT @NULL_PARMS THEN
		#Build Command
		IF @MESSAGE != 'END' THEN
			SET @COMMAND = CONCAT('CALL `', @SP_NAME, '`(', @CSV_PARAMS, ');'); 
		ELSE
			SET @COMMAND = '';
		END IF;
        
		#insert values into the log table
		INSERT INTO tbl_dblog
		VALUES
		(
			default
            ,@GUID
            ,@TS
			,@SP_NAME
			,@MESSAGE
			,@COMMAND
		);
    ELSE
		#insert values into the log table
		INSERT INTO tbl_dblog
		VALUES
		(
			default
            ,UUID()
            ,@TS
			,@SP_NAME
			,'ERROR IN THIS CALL MESSAGE = ' + @MESSAGE
			,@COMMAND
		);
	END IF;
		
    
END$$
DELIMITER ;
