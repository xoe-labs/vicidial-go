CREATE TABLE servers (
server_id VARCHAR(10) NOT NULL,
server_description VARCHAR(255),
server_ip VARCHAR(15) NOT NULL,
active ENUM('Y','N'),
asterisk_version VARCHAR(20) default '1.4.21.2',
max_vicidial_trunks SMALLINT(4) default '23',
telnet_host VARCHAR(20) NOT NULL default 'localhost',
telnet_port INT(5) NOT NULL default '5038',
ASTmgrUSERNAME VARCHAR(20) NOT NULL default 'cron',
ASTmgrSECRET VARCHAR(20) NOT NULL default '1234',
ASTmgrUSERNAMEUPDATE VARCHAR(20) NOT NULL default 'updatecron',
ASTmgrUSERNAMElisten VARCHAR(20) NOT NULL default 'listencron',
ASTmgrUSERNAMEsend VARCHAR(20) NOT NULL default 'sendcron',
local_gmt VARCHAR(6) default '-5.00',
voicemail_dump_exten VARCHAR(20) NOT NULL default '85026666666666',
answer_transfer_agent VARCHAR(20) NOT NULL default '8365',
ext_context VARCHAR(20) NOT NULL default 'default',
sys_perf_log ENUM('Y','N') default 'N',
vd_server_logs ENUM('Y','N') default 'Y',
agi_output ENUM('NONE','STDERR','FILE','BOTH') default 'FILE',
vicidial_balance_active ENUM('Y','N') default 'N',
balance_trunks_offlimits SMALLINT(5) UNSIGNED default '0',
recording_web_link ENUM('SERVER_IP','ALT_IP','EXTERNAL_IP') default 'SERVER_IP',
alt_server_ip VARCHAR(100) default '',
active_asterisk_server ENUM('Y','N') default 'Y',
generate_vicidial_conf ENUM('Y','N') default 'Y',
rebuild_conf_files ENUM('Y','N') default 'Y',
outbound_calls_per_second SMALLINT(3) UNSIGNED default '5',
sysload INT(6) NOT NULL default '0',
channels_total SMALLINT(4) UNSIGNED NOT NULL default '0',
cpu_idle_percent SMALLINT(3) UNSIGNED NOT NULL default '0',
disk_usage VARCHAR(255) default '1',
sounds_UPDATE ENUM('Y','N') default 'N',
vicidial_recording_limit MEDIUMINT(8) default '60',
carrier_logging_active ENUM('Y','N') default 'Y',
vicidial_balance_rank TINYINT(3) UNSIGNED default '0',
rebuild_music_on_hold ENUM('Y','N') default 'Y',
active_agent_login_server ENUM('Y','N') default 'Y',
conf_secret VARCHAR(20) default 'test',
external_server_ip VARCHAR(100) default '',
custom_dialplan_entry TEXT,
active_twin_server_ip VARCHAR(15) default '',
user_group VARCHAR(20) default '---ALL---',
audio_store_purge TEXT,
svn_revision INT(9) default '0',
svn_info TEXT,
system_uptime VARCHAR(255) default '',
auto_restart_asterisk ENUM('Y','N') default 'N',
asterisk_temp_no_restart ENUM('Y','N') default 'N',
voicemail_dump_exten_no_inst VARCHAR(20) default '85026666666667',
gather_asterisk_output ENUM('Y','N') default 'N',
web_socket_url VARCHAR(255) default '',
conf_qualify ENUM('Y','N') default 'Y',
routing_prefix VARCHAR(10) default '13',
external_web_socket_url VARCHAR(255) default ''
) ENGINE=MyISAM;



/* bin/AST_manager_send.pl:369 */


/* name: GetServers :many */
SELECT server_id,server_description,server_ip,active,asterisk_version,max_vicidial_trunks,telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,local_gmt,voicemail_dump_exten,answer_transfer_agent,ext_context,sys_perf_log,vd_server_logs,agi_output,vicidial_balance_active,balance_trunks_offlimits,recording_web_link,alt_server_ip,active_asterisk_server,generate_vicidial_conf,rebuild_conf_files,outbound_calls_per_second,sysload,channels_total,cpu_idle_percent,disk_usage,sounds_update,vicidial_recording_limit,carrier_logging_active,vicidial_balance_rank,rebuild_music_on_hold,active_agent_login_server,conf_secret FROM servers where server_ip = ?/* serverip */;



/* bin/AST_manager_listen_AMI2.pl:129 */


/* name: GetServers :many */
SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* server_ip */;



/* bin/AST_manager_listen_AMI2.pl:331 */


/* name: GetServers :many */
SELECT vd_server_logs FROM servers where server_ip = ?/* server_ip */;



/* bin/FastAGI_log.pl:161 */


/* name: GetServers :many */
SELECT vd_server_logs,asterisk_version FROM servers where server_ip = ?/* VARserver_ip */;



/* bin/FastAGI_log.pl:262 */


/* name: GetServers :many */
SELECT agi_output,asterisk_version FROM servers where server_ip = ?/* VARserver_ip */;



/* bin/FastAGI_log.pl:675 */


/* name: GetServers :many */
SELECT carrier_logging_active FROM servers where server_ip = ?/* VARserver_ip */;



/* bin/AST_manager_kill_hung_congested.pl:121 */


/* name: GetServers :many */
SELECT vd_server_logs FROM servers where server_ip = ?/* VARserver_ip */;



/* bin/AST_update_AMI2.pl:154 */


/* name: GetServers :many */
SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* server_ip */;



/* bin/AST_update_AMI2.pl:1217 */


/* name: UpdateServers :exec */
UPDATE servers SET sysload=?/* server_load */, channels_total=?/* channel_counts->{'total'} */, cpu_idle_percent=?/* cpu_idle_percent */, disk_usage=?/* disk_usage */ where server_ip=?/* server_ip */;



/* bin/AST_update_AMI2.pl:1246 */


/* name: GetServers :many */
SELECT sys_perf_log,vd_server_logs FROM servers where server_ip=?/* server_ip */;



/* bin/AST_manager_sip_AMI2.pl:116 */


/* name: GetServers :many */
SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* server_ip */;



/* bin/AST_manager_sip_AMI2.pl:321 */


/* name: GetServers :many */
SELECT vd_server_logs FROM servers where server_ip = ?/* server_ip */;
