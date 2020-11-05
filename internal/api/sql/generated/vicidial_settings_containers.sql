CREATE TABLE vicidial_settings_containers (
container_id VARCHAR(40) PRIMARY KEY,
container_notes VARCHAR(255) default '',
container_type VARCHAR(40) default 'OTHER',
user_group VARCHAR(20) default '---ALL---',
container_entry MEDIUMTEXT
) ENGINE=MyISAM CHARSET=utf8 COLLATE=utf8_unicode_ci;



/* bin/FastAGI_log.pl:2107 */


/* name: GetVicidialSettingsContainers :many */
SELECT container_entry FROM vicidial_settings_containers where container_id=?/* VD_call_quota_lead_ranking */;
