CREATE TABLE vicidial_lead_call_quota_counts (
lead_id INT(9) UNSIGNED NOT NULL,
list_id BIGINT(14) UNSIGNED DEFAULT '0',
first_call_date DATETIME,
last_call_date DATETIME,
`status` VARCHAR(6),
called_count SMALLINT(5) UNSIGNED default '0',
session_one_calls TINYINT(3) default '0',
session_two_calls TINYINT(3) default '0',
session_three_calls TINYINT(3) default '0',
session_four_calls TINYINT(3) default '0',
session_five_calls TINYINT(3) default '0',
session_six_calls TINYINT(3) default '0',
day_one_calls TINYINT(3) default '0',
day_two_calls TINYINT(3) default '0',
day_three_calls TINYINT(3) default '0',
day_four_calls TINYINT(3) default '0',
day_five_calls TINYINT(3) default '0',
day_six_calls TINYINT(3) default '0',
day_seven_calls TINYINT(3) default '0',
session_one_today_calls TINYINT(3) default '0',
session_two_today_calls TINYINT(3) default '0',
session_three_today_calls TINYINT(3) default '0',
session_four_today_calls TINYINT(3) default '0',
session_five_today_calls TINYINT(3) default '0',
session_six_today_calls TINYINT(3) default '0',
rank SMALLINT(5) NOT NULL default '0',
modify_date DATETIME,
unique index vlcqc_lead_list (lead_id, list_id),
index(last_call_date),
index(list_id),
index(modify_date)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:2355 */


/* name: GetVicidialLeadCallQuotaCounts :many */
SELECT first_call_date,UTC_TIMESTAMP(first_call_date),last_call_date from vicidial_lead_call_quota_counts where lead_id=?/* VD_lead_id */ and list_id=?/* VLlist_id */;



/* bin/FastAGI_log.pl:2384 */


/* name: UpdateVicidialLeadCallQuotaCounts :exec */
UPDATE vicidial_lead_call_quota_counts SET last_call_date=?/* VDLcall_datetime */,status=?/* temp_status */,called_count=?/* VLcalled_count */,rank=?/* tempVLrank */,modify_date=NOW() ,session_one_calls=(session_one_calls + 1),session_one_today_calls=(session_one_today_calls + 1) $day_updateSQL where lead_id=?/* VD_lead_id */ and list_id=?/* VLlist_id */ and modify_date < NOW();



/* bin/FastAGI_log.pl:2389 */


/* name: UpdateVicidialLeadCallQuotaCounts :exec */
UPDATE vicidial_lead_call_quota_counts SET status=?/* temp_status */,called_count=?/* VLcalled_count */,rank=?/* tempVLrank */,modify_date=NOW() where lead_id=?/* VD_lead_id */ and list_id=?/* VLlist_id */;



/* bin/FastAGI_log.pl:2397 */


/* name: CreateVicidialLeadCallQuotaCounts :execresult */
INSERT INTO vicidial_lead_call_quota_counts SET lead_id=?/* VD_lead_id */,list_id=?/* VLlist_id */,first_call_date=?/* VDLcall_datetime */,last_call_date=?/* VDLcall_datetime */,status=?/* temp_status */,called_count=?/* VLcalled_count */,day_one_calls='1',rank=?/* tempVLrank */,modify_date=NOW() ,session_six_calls='1',session_six_today_calls='1';
