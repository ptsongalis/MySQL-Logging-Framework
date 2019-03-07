# MySQL_LoggingFramework
Simple SQL function and stored procedure logging framework for debugging and troubleshooting

## USAGE

### tbl_dblog:
Holds the logging_guid, timestamp, sp_name, message, and command for the entry. Most notably the "command" can be copied to a query window and run.

### usp_dblog_Write:
This is the stored procedure that interfaces with tbl_dblog. Currently pretty low on error handling and other capabilities.

### usp_USP_FRAMEWORK:
This is the stored procedure that is used as a framework for all other stored procedures. This framework can be filled out and already includes the necessary configuration for logging to tbl_dblog.
