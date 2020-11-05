CREATE TABLE vicidial_list (
lead_id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
entry_date DATETIME,
modify_date TIMESTAMP,
`status` VARCHAR(6),
user VARCHAR(20),
vendor_lead_code VARCHAR(20),
source_id VARCHAR(50),
list_id BIGINT(14) UNSIGNED NOT NULL DEFAULT '0',
gmt_offset_now DECIMAL(4,2) DEFAULT '0.00',
called_since_last_reset ENUM('Y','N','Y1','Y2','Y3','Y4','Y5','Y6','Y7','Y8','Y9','Y10') default 'N',
phone_code VARCHAR(10),
phone_number VARCHAR(18) NOT NULL,
title VARCHAR(4),
first_name VARCHAR(30),
middle_initial VARCHAR(1),
last_name VARCHAR(30),
address1 VARCHAR(100),
address2 VARCHAR(100),
address3 VARCHAR(100),
city VARCHAR(50),
state VARCHAR(2),
province VARCHAR(50),
postal_code VARCHAR(10),
country_code VARCHAR(3),
gender ENUM('M','F','U') default 'U',
date_of_birth DATE,
alt_phone VARCHAR(12),
email VARCHAR(70),
security_phrase VARCHAR(100),
comments VARCHAR(255),
called_count SMALLINT(5) UNSIGNED default '0',
last_local_call_time DATETIME,
rank SMALLINT(5) NOT NULL default '0',
owner VARCHAR(20) default '',
entry_list_id BIGINT(14) UNSIGNED NOT NULL DEFAULT '0',
index (phone_number),
index (list_id),
index (called_since_last_reset),
index (status),
index (gmt_offset_now),
index (postal_code),
index (last_local_call_time),
index (rank),
index (owner)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1047 */


/* name: UpdateVicidialList :exec */
UPDATE vicidial_list set status=?/* VDL_status */ where lead_id = ?/* CIDlead_id */;



/* bin/FastAGI_log.pl:1094 */


/* name: GetVicidialList :many */
SELECT list_id,called_count FROM vicidial_list where lead_id=?/* VD_lead_id */ limit 1;



/* bin/FastAGI_log.pl:1393 */


/* name: GetVicidialList :one */
SELECT vendor_lead_code,list_id,phone_code,phone_number,title,first_name,middle_initial,last_name,postal_code FROM vicidial_list where lead_id=?/* VD_lead_id */ LIMIT 1;



/* bin/FastAGI_log.pl:1553 */


/* name: GetVicidialList :many */
SELECT list_id,called_count FROM vicidial_list where lead_id=?/* VD_lead_id */ limit 1;



/* bin/FastAGI_log.pl:1568 */


/* name: UpdateVicidialList :exec */
UPDATE vicidial_list SET status='PDROP' where lead_id=?/* VD_lead_id */;



/* bin/FastAGI_log.pl:1609 */


/* name: UpdateVicidialList :exec */
UPDATE vicidial_list set status='DROP' where lead_id = ?/* VD_lead_id */;



/* bin/FastAGI_log.pl:1697 */


/* name: UpdateVicidialList :exec */
UPDATE vicidial_list set called_since_last_reset='N' where lead_id = ?/* VD_lead_id */;



/* bin/FastAGI_log.pl:1756 */


/* name: GetVicidialList :many */
SELECT alt_phone,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* VD_lead_id */;



/* bin/FastAGI_log.pl:1838 */


/* name: GetVicidialList :many */
SELECT address3,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* VD_lead_id */;



/* bin/FastAGI_log.pl:1925 */


/* name: GetVicidialList :many */
SELECT gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* VD_lead_id */;



/* bin/FastAGI_log.pl:2257 */


/* name: GetVicidialList :many */
SELECT list_id,called_count,rank FROM vicidial_list where lead_id=?/* VD_lead_id */;



/* bin/FastAGI_log.pl:2405 */


/* name: UpdateVicidialList :exec */
UPDATE vicidial_list SET rank='0' where lead_id=?/* VD_lead_id */;
