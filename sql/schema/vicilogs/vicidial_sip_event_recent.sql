CREATE TABLE vicidial_sip_event_recent ( 
caller_code VARCHAR(20) default '', 
channel VARCHAR(100), 
server_ip VARCHAR(15), 
uniqueid VARCHAR(20), 
invite_date DATETIME(6), 
first_100_date DATETIME(6), 
first_180_date DATETIME(6), 
first_183_date DATETIME(6), 
last_100_date DATETIME(6), 
last_180_date DATETIME(6), 
last_183_date DATETIME(6), 
`200_date` DATETIME(6), 
error_date DATETIME(6), 
processed ENUM('N','Y','U') default 'N', 
index(caller_code), 
index(invite_date), 
index(processed) 
) ENGINE=MyISAM;



/* bin/AST_manager_sip_AMI2.pl:582 */


/* name: CreateVicidialSipEventRecent :execresult */
INSERT INTO vicidial_sip_event_recent SET caller_code =?/* $call_id */, channel=?/* $event_hash{'Channel'} */, server_ip=?/* $event_hash{'ServerIP'} */, uniqueid=?/* $event_hash{'Uniqueid'} */, invite_date = FROM_UNIXTIME( $event_hash{'Timestamp'} )



/* bin/AST_manager_sip_AMI2.pl:635 */


/* name: UpdateVicidialSipEventRecent :exec */
UPDATE vicidial_sip_event_recent SET first_100_date = IF( first_100_date IS NULL, FROM_UNIXTIME( $event_hash{'Timestamp'} ), first_100_date), last_100_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */



/* bin/AST_manager_sip_AMI2.pl:639 */


/* name: UpdateVicidialSipEventRecent :exec */
UPDATE vicidial_sip_event_recent SET first_180_date = IF( first_180_date IS NULL, FROM_UNIXTIME( $event_hash{'Timestamp'} ), first_180_date), last_180_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */



/* bin/AST_manager_sip_AMI2.pl:643 */


/* name: UpdateVicidialSipEventRecent :exec */
UPDATE vicidial_sip_event_recent SET first_183_date = IF( first_183_date IS NULL, FROM_UNIXTIME( $event_hash{'Timestamp'} ), first_183_date), last_183_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */



/* bin/AST_manager_sip_AMI2.pl:647 */


/* name: UpdateVicidialSipEventRecent :exec */
UPDATE vicidial_sip_event_recent SET 200_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */



/* bin/AST_manager_sip_AMI2.pl:651 */


/* name: UpdateVicidialSipEventRecent :exec */
UPDATE vicidial_sip_event_recent SET error_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */
