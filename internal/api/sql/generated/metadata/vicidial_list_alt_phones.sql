CREATE TABLE vicidial_list_alt_phones (
alt_phone_id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
lead_id INT(9) UNSIGNED NOT NULL,
phone_code VARCHAR(10),
phone_number VARCHAR(18),
alt_phone_note VARCHAR(30),
alt_phone_count SMALLINT(5) UNSIGNED,
active ENUM('Y','N') default 'Y',
index (lead_id),
index (phone_number)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1941 */


/* name: GetVicidialListAltPhones :many */
SELECT count(*) FROM vicidial_list_alt_phones where lead_id=?/* VD_lead_id */;



/* bin/FastAGI_log.pl:1956 */


/* name: GetVicidialListAltPhones :many */
SELECT alt_phone_id,phone_number,active FROM vicidial_list_alt_phones where lead_id=?/* VD_lead_id */ and alt_phone_count=?/* Xlast */;
