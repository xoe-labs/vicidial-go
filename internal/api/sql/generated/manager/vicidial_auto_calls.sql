CREATE TABLE vicidial_auto_calls (
auto_call_id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
server_ip VARCHAR(15) NOT NULL,
campaign_id VARCHAR(20),
`status` ENUM('SENT','RINGING','LIVE','XFER','PAUSED','CLOSER','BUSY','DISCONNECT','IVR') default 'PAUSED',
lead_id INT(9) UNSIGNED NOT NULL,
uniqueid VARCHAR(20),
callerid VARCHAR(20),
channel VARCHAR(100),
phone_code VARCHAR(10),
phone_number VARCHAR(18),
call_time DATETIME,
call_type ENUM('IN','OUT','OUTBALANCE') default 'OUT',
stage VARCHAR(20) default 'START',
last_update_time TIMESTAMP,
alt_dial VARCHAR(6) default 'NONE',
queue_priority TINYINT(2) default '0',
agent_only VARCHAR(20) default '',
agent_grab VARCHAR(20) default '',
queue_position SMALLINT(4) UNSIGNED default '1',
extension VARCHAR(100) default '',
agent_grab_extension VARCHAR(100) default '',
index (uniqueid),
index (callerid),
index (call_time),
index (last_update_time)
) ENGINE=MyISAM;
ALTER TABLE vicidial_auto_calls ENGINE=MEMORY;



/* bin/FastAGI_log.pl:539 */


/* name: GetVicidialAutoCalls :many */
SELECT campaign_id FROM vicidial_auto_calls where callerid=?/* callerid */ limit 1;



/* bin/FastAGI_log.pl:1052 */


/* name: UpdateVicidialAutoCalls :exec */
UPDATE vicidial_auto_calls set status=?/* VDAC_status */ where callerid = ?/* callerid */;



/* bin/FastAGI_log.pl:1066 */


/* name: GetVicidialAutoCalls :many */
SELECT lead_id,callerid,campaign_id,alt_dial,stage,UTC_TIMESTAMP(call_time),uniqueid,status,call_time,phone_code,phone_number,queue_position FROM vicidial_auto_calls where uniqueid = ?/* uniqueid */ or callerid = ?/* callerid */ limit 1;



/* bin/FastAGI_log.pl:1145 */


/* name: DeleteVicidialAutoCalls :exec */
DELETE FROM vicidial_auto_calls where callerid = ?/* callerid */;



/* bin/FastAGI_log.pl:1168 */


/* name: GetVicidialAutoCalls :many */
SELECT lead_id,callerid,campaign_id,alt_dial,stage,UTC_TIMESTAMP(call_time),uniqueid,status,call_time,phone_code,phone_number,queue_position,server_ip,agent_only FROM vicidial_auto_calls where uniqueid = ?/* uniqueid */ or callerid = ?/* callerid */ limit 1;



/* bin/FastAGI_log.pl:1282 */


/* name: DeleteVicidialAutoCalls :exec */
DELETE FROM vicidial_auto_calls where ( ( (status!='IVR') and (uniqueid=?/* uniqueid */ or callerid = ?/* callerid */) ) or ( (status='IVR') and (uniqueid=?/* uniqueid */) ) ) order by call_time desc limit 1;



/* bin/FastAGI_log.pl:1369 */


/* name: GetVicidialAutoCalls :many */
SELECT count(*) FROM vicidial_auto_calls where status = 'LIVE' and campaign_id=?/* VD_campaign_id */ and call_time < ?/* VCLcall_date */;



/* bin/AST_update_AMI2.pl:1105 */


/* name: DeleteVicidialAutoCalls :exec */
DELETE FROM vicidial_auto_calls WHERE callerid IN $auto_delete_sql;
