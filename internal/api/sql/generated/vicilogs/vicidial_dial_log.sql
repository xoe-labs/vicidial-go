CREATE TABLE vicidial_dial_log (
caller_code VARCHAR(30) NOT NULL,
lead_id INT(9) UNSIGNED default '0',
server_ip VARCHAR(15),
call_date DATETIME,
extension VARCHAR(100) default '',
channel VARCHAR(100) default '',
context VARCHAR(100) default '',
timeout MEDIUMINT(7) UNSIGNED default '0',
outbound_cid VARCHAR(100) default '',
sip_hangup_cause SMALLINT(4) UNSIGNED default '0',
sip_hangup_reason VARCHAR(50) default '',
uniqueid VARCHAR(20) default '',
index (caller_code),
index (lead_id),
index (call_date)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:715 */


/* name: GetVicidialDialLog :many */
SELECT sip_hangup_cause,sip_hangup_reason FROM vicidial_dial_log where lead_id=?/* CIDlead_id */ and server_ip=?/* VARserver_ip */ and caller_code=?/* callerid */ order by call_date desc limit 1;



/* bin/FastAGI_log.pl:739 */


/* name: UpdateVicidialDialLog :exec */
UPDATE vicidial_dial_log SET sip_hangup_cause=?/* sip_hangup_cause */,sip_hangup_reason=?/* sip_hangup_reason */,uniqueid=?/* uniqueid */ where caller_code=?/* callerid */ and server_ip=?/* VARserver_ip */ and lead_id=?/* CIDlead_id */;



/* bin/FastAGI_log.pl:748 */


/* name: GetVicidialDialLog :many */
SELECT sip_hangup_cause,sip_hangup_reason FROM vicidial_dial_log where lead_id=?/* CIDlead_id */ and server_ip=?/* VARserver_ip */ and caller_code=?/* callerid */ order by call_date desc limit 1;



/* bin/FastAGI_log.pl:2286 */


/* name: GetVicidialDialLog :many */
SELECT call_date from vicidial_dial_log where lead_id=?/* VD_lead_id */ and call_date > ?/* CQSQLdate */ and caller_code LIKE ?/* "%$VD_lead_id" */ order by call_date desc limit 1;
