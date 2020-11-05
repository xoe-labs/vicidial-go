CREATE TABLE vicidial_carrier_log (
uniqueid VARCHAR(20) PRIMARY KEY,
call_date DATETIME,
server_ip VARCHAR(15) NOT NULL,
lead_id INT(9) UNSIGNED,
hangup_cause TINYINT(1) UNSIGNED default '0',
dialstatus VARCHAR(16),
channel VARCHAR(100),
dial_time SMALLINT(3) UNSIGNED default '0',
answered_time SMALLINT(4) UNSIGNED default '0',
sip_hangup_cause SMALLINT(4) UNSIGNED default '0',
sip_hangup_reason VARCHAR(50) default '',
caller_code VARCHAR(30) default '',
index (call_date),
index (lead_id)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:764 */


/* name: CreateVicidialCarrierLog :execresult */
INSERT IGNORE INTO vicidial_carrier_log set uniqueid=?/* uniqueid */,call_date=?/* now_date */,server_ip=?/* VARserver_ip */,lead_id=?/* CIDlead_id */,hangup_cause=?/* hangup_cause */,dialstatus=?/* dialstatus */,channel=?/* channel */,dial_time=?/* dial_time */,answered_time=?/* answered_time */,sip_hangup_cause=?/* sip_hangup_cause */,sip_hangup_reason=?/* sip_hangup_reason */,caller_code=?/* callerid */;
