CREATE TABLE vicidial_log (
uniqueid VARCHAR(20) PRIMARY KEY,
lead_id INT(9) UNSIGNED NOT NULL,
list_id BIGINT(14) UNSIGNED,
campaign_id VARCHAR(8),
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
user_group VARCHAR(20),
term_reason  ENUM('CALLER','AGENT','QUEUETIMEOUT','ABANDON','AFTERHOURS','NONE','SYSTEM') default 'NONE',
alt_dial VARCHAR(6) default 'NONE',
called_count SMALLINT(5) UNSIGNED default '0',
index (lead_id),
index (call_date)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1059 */


/* name: UpdateVicidialLog :exec */
UPDATE vicidial_log FORCE INDEX(lead_id) set status=?/* VDL_status */ where lead_id = ?/* CIDlead_id */ and uniqueid LIKE ?/* Euniqueid% */;



/* bin/FastAGI_log.pl:1110 */


/* name: CreateVicidialLog :execresult */
INSERT INTO vicidial_log SET uniqueid=?/* uniqueid */,lead_id=?/* VD_lead_id */,list_id=?/* VD_list_id */,status=?/* VDL_status */,campaign_id=?/* VD_campaign_id */,call_date=?/* VD_call_time */,start_epoch=?/* VD_start_epoch */,phone_code=?/* VD_phone_code */,phone_number=?/* VD_phone_number */,user='VDAD',processed='N',length_in_sec='0',end_epoch=?/* VD_start_epoch */,alt_dial=?/* VD_alt_dial */,called_count=?/* called_count */ ,comments='MANUAL';



/* bin/FastAGI_log.pl:1488 */


/* name: GetVicidialLog :many */
SELECT start_epoch,status,user,term_reason,comments,alt_dial FROM vicidial_log FORCE INDEX(lead_id) where lead_id = ?/* VD_lead_id */ and uniqueid LIKE ?/* Euniqueid% */ limit 1;



/* bin/FastAGI_log.pl:1572 */


/* name: CreateVicidialLog :execresult */
INSERT INTO vicidial_log SET uniqueid=?/* uniqueid */,lead_id=?/* VD_lead_id */,list_id=?/* VD_list_id */,status='PDROP',campaign_id=?/* VD_campaign_id */,call_date=?/* VD_call_time */,start_epoch=?/* VD_start_epoch */,phone_code=?/* VD_phone_code */,phone_number=?/* VD_phone_number */,user='VDAD',processed='N',length_in_sec='0',end_epoch=?/* VD_start_epoch */,alt_dial=?/* VD_alt_dial */,called_count=?/* called_count */;



/* bin/FastAGI_log.pl:1622 */


/* name: UpdateVicidialLog :exec */
UPDATE vicidial_log FORCE INDEX(lead_id) set $SQL_status end_epoch=?/* now_date_epoch */,length_in_sec=?/* VD_seconds */ where lead_id = ?/* VD_lead_id */ and uniqueid LIKE ?/* Euniqueid% */;
