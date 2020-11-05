CREATE TABLE vicidial_dtmf_log (
dtmf_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
dtmf_time DATETIME,
channel VARCHAR(100) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
uniqueid VARCHAR(20) default '',
digit VARCHAR(1) default '',
direction ENUM('Received','Sent') default 'Received',
state ENUM('BEGIN','END') default 'BEGIN',
PRIMARY KEY (dtmf_id),
KEY vicidial_dtmf_uniqueid_key (uniqueid)
) ENGINE=MyISAM CHARSET=utf8 COLLATE=utf8_unicode_ci;



/* bin/AST_manager_listen_AMI2.pl:710 */


/* name: CreateVicidialDtmfLog :execresult */
INSERT INTO vicidial_dtmf_log SET dtmf_time=NOW(),channel=?/* event_hash{'Channel'} */,server_ip=?/* event_hash{'ServerIP'} */,uniqueid=?/* event_hash{'Uniqueid'} */,digit=?/* event_hash{'Digit'} */,direction=?/* event_hash{'Direction'} */,state='Begin';



/* bin/AST_manager_listen_AMI2.pl:759 */


/* name: CreateVicidialDtmfLog :execresult */
INSERT INTO vicidial_dtmf_log SET dtmf_time=NOW(),channel=?/* event_hash{'Channel'} */,server_ip=?/* event_hash{'ServerIP'} */,uniqueid=?/* event_hash{'Uniqueid'} */,digit=?/* event_hash{'Digit'} */,direction=?/* event_hash{'Direction'} */,state='End';
