CREATE TABLE vicidial_rt_monitor_log (
manager_user VARCHAR(20) NOT NULL,
manager_server_ip VARCHAR(15) NOT NULL,
manager_phone VARCHAR(20) NOT NULL,
manager_ip VARCHAR(15),
agent_user VARCHAR(20),
agent_server_ip VARCHAR(15),
agent_status VARCHAR(10),
agent_session VARCHAR(10),
lead_id INT(9) UNSIGNED,
campaign_id VARCHAR(8),
caller_code VARCHAR(20),
monitor_start_time DATETIME,
monitor_end_time DATETIME,
monitor_sec INT(9) UNSIGNED default '0',
monitor_type ENUM('LISTEN','BARGE','HIJACK','WHISPER') default 'LISTEN',
index (manager_user),
index (agent_user),
unique index (caller_code),
index (monitor_start_time)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:775 */


/* name: GetVicidialRtMonitorLog :many */
SELECT monitor_start_time,UTC_TIMESTAMP(monitor_start_time) from vicidial_rt_monitor_log where caller_code=?/* callerid */ and ( (monitor_end_time is NULL) or (monitor_start_time=monitor_end_time) );



/* bin/FastAGI_log.pl:788 */


/* name: UpdateVicidialRtMonitorLog :exec */
UPDATE vicidial_rt_monitor_log set monitor_sec=?/* monitor_sec */,monitor_end_time=?/* now_date */ where caller_code=?/* callerid */;
