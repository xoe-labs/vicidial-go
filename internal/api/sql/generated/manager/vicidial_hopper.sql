CREATE TABLE vicidial_hopper (
hopper_id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
lead_id INT(9) UNSIGNED NOT NULL,
campaign_id VARCHAR(8),
`status` ENUM('READY','QUEUE','INCALL','DONE','HOLD','DNC') default 'READY',
user VARCHAR(20),
list_id BIGINT(14) UNSIGNED NOT NULL,
gmt_offset_now DECIMAL(4,2) DEFAULT '0.00',
state VARCHAR(2) default '',
alt_dial VARCHAR(6) default 'NONE',
priority TINYINT(2) default '0',
source VARCHAR(1) default '',
vendor_lead_code VARCHAR(20) default '',
index (lead_id)
) ENGINE=MyISAM;
ALTER TABLE vicidial_hopper ENGINE=MEMORY;



/* bin/FastAGI_log.pl:1822 */


/* name: CreateVicidialHopper :execresult */
INSERT INTO vicidial_hopper SET lead_id=?/* VD_lead_id */,campaign_id=?/* VD_campaign_id */,status='READY',list_id=?/* VD_list_id */,gmt_offset_now=?/* VD_gmt_offset_now */,state=?/* VD_state */,alt_dial='ALT',user='',priority='25',source='A';



/* bin/FastAGI_log.pl:1904 */


/* name: CreateVicidialHopper :execresult */
INSERT INTO vicidial_hopper SET lead_id=?/* VD_lead_id */,campaign_id=?/* VD_campaign_id */,status='READY',list_id=?/* VD_list_id */,gmt_offset_now=?/* VD_gmt_offset_now */,state=?/* VD_state */,alt_dial='ADDR3',user='',priority='20',source='A';



/* bin/FastAGI_log.pl:2027 */


/* name: CreateVicidialHopper :execresult */
INSERT INTO vicidial_hopper SET lead_id=?/* VD_lead_id */,campaign_id=?/* VD_campaign_id */,status='READY',list_id=?/* VD_list_id */,gmt_offset_now=?/* VD_gmt_offset_now */,state=?/* VD_state */,alt_dial=?/* "X$Xlast" */,user='',priority='15',source='A';



/* bin/FastAGI_log.pl:2038 */


/* name: CreateVicidialHopper :execresult */
INSERT INTO vicidial_hopper SET lead_id=?/* VD_lead_id */,campaign_id=?/* VD_campaign_id */,status='DNC',list_id=?/* VD_list_id */,gmt_offset_now=?/* VD_gmt_offset_now */,state=?/* VD_state */,alt_dial=?/* "X$Xlast" */,user='',priority='15',source='A';
