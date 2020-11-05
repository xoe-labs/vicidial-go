CREATE TABLE vicidial_closer_log (
closecallid INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
lead_id INT(9) UNSIGNED NOT NULL,
list_id BIGINT(14) UNSIGNED,
campaign_id VARCHAR(20),
call_date DATETIME,
start_epoch INT(10) UNSIGNED,
end_epoch INT(10) UNSIGNED,
length_in_sec INT(10),
`status` VARCHAR(6),
phone_code VARCHAR(10),
phone_number VARCHAR(18),
user VARCHAR(20),
comments VARCHAR(255),
processed ENUM('Y','N'),
queue_seconds DECIMAL(7,2) default '0',
user_group VARCHAR(20),
xfercallid INT(9) UNSIGNED,
term_reason  ENUM('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','HOLDRECALLXFER','HOLDTIME','NOAGENT','NONE','MAXCALLS','ACFILTER','CLOSETIME') default 'NONE',
uniqueid VARCHAR(20) NOT NULL default '',
agent_only VARCHAR(20) default '',
queue_position SMALLINT(4) UNSIGNED default '1',
called_count SMALLINT(5) UNSIGNED default '0',
index (lead_id),
index (call_date),
index (campaign_id),
index (uniqueid)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1338 */


/* name: GetVicidialCloserLog :many */
SELECT queue_position,call_date FROM vicidial_closer_log where uniqueid=?/* unique_id */ and lead_id=?/* CIDlead_id */ and campaign_id=?/* VD_campaign_id */ and call_date > ?/* RSQLdate */ order by closecallid desc limit 1;



/* bin/FastAGI_log.pl:1523 */


/* name: GetVicidialCloserLog :many */
SELECT start_epoch,status,closecallid,user,term_reason,length_in_sec,queue_seconds,comments FROM vicidial_closer_log where lead_id = ?/* VD_lead_id */ and call_date > ?/* RSQLdate */ order by closecallid desc limit 1;



/* bin/FastAGI_log.pl:1675 */


/* name: UpdateVicidialCloserLog :exec */
UPDATE vicidial_closer_log set $VDCLSQL_update end_epoch=?/* now_date_epoch */,length_in_sec=?/* VD_seconds */$LOGuserSQL where closecallid = ?/* VD_closecallid */;
