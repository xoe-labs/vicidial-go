CREATE TABLE phones (
extension VARCHAR(100),
dialplan_number VARCHAR(20),
voicemail_id VARCHAR(10),
phone_ip VARCHAR(15),
computer_ip VARCHAR(15),
server_ip VARCHAR(15),
login VARCHAR(15),
pass VARCHAR(100),
`status` VARCHAR(10),
active ENUM('Y','N'),
phone_type VARCHAR(50),
fullname VARCHAR(50),
company VARCHAR(10),
picture VARCHAR(19),
messages INT(4),
old_messages INT(4),
protocol ENUM('SIP','Zap','IAX2','EXTERNAL') default 'SIP',
local_gmt VARCHAR(6) default '-5.00',
ASTmgrUSERNAME VARCHAR(20) default 'cron',
ASTmgrSECRET VARCHAR(20) default '1234',
login_user VARCHAR(20),
login_pass VARCHAR(100),
login_campaign VARCHAR(10),
park_on_extension VARCHAR(10) default '8301',
conf_on_extension VARCHAR(10) default '8302',
VICIDIAL_park_on_extension VARCHAR(10) default '8301',
VICIDIAL_park_on_filename VARCHAR(10) default 'park',
monitor_prefix VARCHAR(10) default '8612',
recording_exten VARCHAR(10) default '8309',
voicemail_exten VARCHAR(10) default '8501',
voicemail_dump_exten VARCHAR(20) default '85026666666666',
ext_context VARCHAR(20) default 'default',
dtmf_send_extension VARCHAR(100) default 'local/8500998@default',
call_out_number_group VARCHAR(100) default 'Zap/g2/',
client_browser VARCHAR(100) default '/usr/bin/mozilla',
install_directory VARCHAR(100) default '/usr/local/perl_TK',
local_web_callerID_URL VARCHAR(255) default 'http://www.vicidial.org/test_callerid_output.php',
VICIDIAL_web_URL VARCHAR(255) default 'http://www.vicidial.org/test_VICIDIAL_output.php',
AGI_call_logging_enabled ENUM('0','1') default '1',
user_switching_enabled ENUM('0','1') default '1',
conferencing_enabled ENUM('0','1') default '1',
admin_hangup_enabled ENUM('0','1') default '0',
admin_hijack_enabled ENUM('0','1') default '0',
admin_monitor_enabled ENUM('0','1') default '1',
call_parking_enabled ENUM('0','1') default '1',
updater_check_enabled ENUM('0','1') default '1',
AFLogging_enabled ENUM('0','1') default '1',
QUEUE_ACTION_enabled ENUM('0','1') default '1',
CallerID_popup_enabled ENUM('0','1') default '1',
voicemail_button_enabled ENUM('0','1') default '1',
enable_fast_refresh ENUM('0','1') default '0',
fast_refresh_rate INT(5) default '1000',
enable_persistant_mysql ENUM('0','1') default '0',
auto_dial_next_number ENUM('0','1') default '1',
VDstop_rec_after_each_call ENUM('0','1') default '1',
DBX_server VARCHAR(15),
DBX_database VARCHAR(15) default 'asterisk',
DBX_user VARCHAR(15) default 'cron',
DBX_pass VARCHAR(15) default '1234',
DBX_port INT(6) default '3306',
DBY_server VARCHAR(15),
DBY_database VARCHAR(15) default 'asterisk',
DBY_user VARCHAR(15) default 'cron',
DBY_pass VARCHAR(15) default '1234',
DBY_port INT(6) default '3306',
outbound_cid VARCHAR(20),
enable_sipsak_messages ENUM('0','1') default '0',
email VARCHAR(100),
template_id VARCHAR(15) NOT NULL,
conf_override TEXT,
phone_context VARCHAR(20) default 'default',
phone_ring_timeout SMALLINT(3) default '60',
conf_secret VARCHAR(20) default 'test',
delete_vm_after_email ENUM('N','Y') default 'N',
is_webphone ENUM('Y','N','Y_API_LAUNCH') default 'N',
use_external_server_ip ENUM('Y','N') default 'N',
codecs_list VARCHAR(100) default '',
codecs_with_template ENUM('0','1') default '0',
webphone_dialpad ENUM('Y','N','TOGGLE','TOGGLE_OFF') default 'Y',
on_hook_agent ENUM('Y','N') default 'N',
webphone_auto_answer ENUM('Y','N') default 'Y',
voicemail_timezone VARCHAR(30) default 'eastern',
voicemail_options VARCHAR(255) default '',
user_group VARCHAR(20) default '---ALL---',
voicemail_greeting VARCHAR(100) default '',
voicemail_dump_exten_no_inst VARCHAR(20) default '85026666666667',
voicemail_instructions ENUM('Y','N') default 'Y',
on_login_report enum('Y','N') NOT NULL default 'N',
unavail_dialplan_fwd_exten VARCHAR(40) default '',
unavail_dialplan_fwd_context VARCHAR(100) default '',
nva_call_url TEXT,
nva_search_method VARCHAR(40) default 'NONE',
nva_error_filename VARCHAR(255) default '',
nva_new_list_id BIGINT(14) UNSIGNED default '995',
nva_new_phone_code VARCHAR(10) default '1',
nva_new_status VARCHAR(6) default 'NVAINS',
webphone_dialbox ENUM('Y','N') default 'Y',
webphone_mute ENUM('Y','N') default 'Y',
webphone_volume ENUM('Y','N') default 'Y',
webphone_debug ENUM('Y','N') default 'N',
outbound_alt_cid VARCHAR(20) default '',
conf_qualify ENUM('Y','N') default 'Y',
webphone_layout VARCHAR(255) default '',
index (server_ip),
index (voicemail_id),
index (dialplan_number),
unique index extenserver (extension, server_ip)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:445 */


/* name: GetPhones :many */
SELECT count(*) FROM phones where server_ip=?/* VARserver_ip */ and extension=?/* channel_line */ and protocol='Zap';



/* bin/FastAGI_log.pl:469 */


/* name: GetPhones :many */
SELECT count(*) FROM phones where server_ip=?/* VARserver_ip */ and dialplan_number=?/* channel_line */ and protocol='EXTERNAL';



/* bin/AST_update_AMI2.pl:1264 */


/* name: GetPhones :many */
SELECT extension, protocol FROM phones where server_ip=?/* server_ip */ and phone_type NOT LIKE '%trunk%';
