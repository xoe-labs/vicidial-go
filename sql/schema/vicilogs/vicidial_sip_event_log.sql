CREATE TABLE vicidial_sip_event_log ( 
sip_event_id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
caller_code VARCHAR(30) NOT NULL, 
channel VARCHAR(100), 
server_ip VARCHAR(15), 
uniqueid VARCHAR(20), 
sip_call_id VARCHAR(256), 
event_date DATETIME(6), 
sip_event VARCHAR(10), 
index(caller_code), 
index(event_date) 
) ENGINE=MyISAM;



/* bin/AST_manager_sip_AMI2.pl:575 */


/* name: CreateVicidialSipEventLog :execresult */
INSERT INTO vicidial_sip_event_log SET caller_code =?/* $call_id */, channel=?/* $event_hash{'Channel'} */, server_ip=?/* $event_hash{'ServerIP'} */, uniqueid=?/* $event_hash{'Uniqueid'} */, sip_call_id=?/* $event_hash{'SIPCallID'} */, event_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ), sip_event = 'INVITE'



/* bin/AST_manager_sip_AMI2.pl:626 */


/* name: CreateVicidialSipEventLog :execresult */
INSERT INTO vicidial_sip_event_log SET caller_code =?/* $call_id */, channel=?/* $event_hash{'Channel'} */, server_ip=?/* $event_hash{'ServerIP'} */, uniqueid=?/* $event_hash{'Uniqueid'} */, sip_call_id=?/* $event_hash{'SIPCallID'} */, event_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ), sip_event = ?/* $event_hash{'Response'} */
