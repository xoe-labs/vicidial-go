CREATE TABLE vicidial_drop_log (
uniqueid VARCHAR(50) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
drop_date DATETIME NOT NULL,
lead_id INT(9) UNSIGNED NOT NULL,
phone_code VARCHAR(10),
phone_number VARCHAR(18),
campaign_id VARCHAR(20) NOT NULL,
`status` VARCHAR(6) NOT NULL,
drop_processed ENUM('N','Y','U') default 'N',
index(drop_date),
index(drop_processed)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1582 */


/* name: CreateVicidialDropLog :execresult */
INSERT IGNORE INTO vicidial_drop_log SET uniqueid=?/* uniqueid */,server_ip=?/* VARserver_ip */,drop_date=NOW(),lead_id=?/* VD_lead_id */,campaign_id=?/* VD_campaign_id */,status='PDROP',phone_code=?/* VD_phone_code */,phone_number=?/* VD_phone_number */;



/* bin/FastAGI_log.pl:1707 */


/* name: CreateVicidialDropLog :execresult */
INSERT IGNORE INTO vicidial_drop_log SET uniqueid=?/* uniqueid */,server_ip=?/* VARserver_ip */,drop_date=NOW(),lead_id=?/* VD_lead_id */,campaign_id=?/* VD_campaign_id */,status='DROP',phone_code=?/* VD_phone_code */,phone_number=?/* VD_phone_number */;
