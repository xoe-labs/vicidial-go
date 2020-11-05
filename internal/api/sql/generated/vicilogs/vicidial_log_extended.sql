CREATE TABLE vicidial_log_extended (
uniqueid VARCHAR(50) PRIMARY KEY,
server_ip VARCHAR(15),
call_date DATETIME,
lead_id INT(9) UNSIGNED,
caller_code VARCHAR(30) NOT NULL,
custom_call_id VARCHAR(100),
start_url_processed ENUM('N','Y','U') default 'N',
dispo_url_processed ENUM('N','Y','U','XY','XU') default 'N',
multi_alt_processed ENUM('N','Y','U') default 'N',
noanswer_processed ENUM('N','Y','U') default 'N'
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1115 */


/* name: CreateVicidialLogExtended :execresult */
INSERT IGNORE INTO vicidial_log_extended SET uniqueid=?/* uniqueid */,server_ip=?/* VARserver_ip */,call_date=?/* VD_call_time */,lead_id=?/* VD_lead_id */,caller_code=?/* VD_callerid */,custom_call_id='' ON DUPLICATE KEY UPDATE server_ip=?/* VARserver_ip */,call_date=?/* VD_call_time */,lead_id=?/* VD_lead_id */,caller_code=?/* VD_callerid */;



/* bin/FastAGI_log.pl:1576 */


/* name: CreateVicidialLogExtended :execresult */
INSERT IGNORE INTO vicidial_log_extended SET uniqueid=?/* uniqueid */,server_ip=?/* VARserver_ip */,call_date=?/* VD_call_time */,lead_id=?/* VD_lead_id */,caller_code=?/* VD_callerid */,custom_call_id='' ON DUPLICATE KEY UPDATE server_ip=?/* VARserver_ip */,call_date=?/* VD_call_time */,lead_id=?/* VD_lead_id */,caller_code=?/* VD_callerid */;
