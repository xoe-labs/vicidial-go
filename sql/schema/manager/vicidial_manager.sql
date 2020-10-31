CREATE TABLE vicidial_manager (
man_id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
uniqueid VARCHAR(20),
entry_date DATETIME,
`status`  ENUM('NEW','QUEUE','SENT','UPDATED','DEAD'),
response  ENUM('Y','N'),
server_ip VARCHAR(15) NOT NULL,
channel VARCHAR(100),
`action` VARCHAR(20),
callerid VARCHAR(20),
cmd_line_b VARCHAR(100),
cmd_line_c VARCHAR(100),
cmd_line_d VARCHAR(100),
cmd_line_e VARCHAR(100),
cmd_line_f VARCHAR(100),
cmd_line_g VARCHAR(100),
cmd_line_h VARCHAR(100),
cmd_line_i VARCHAR(100),
cmd_line_j VARCHAR(100),
cmd_line_k VARCHAR(100),
index (callerid),
index (uniqueid),
index serverstat(server_ip,status)
) ENGINE=MyISAM;



/* bin/AST_manager_send.pl:135 */


/* name: CountVicidialManager :one */
SELECT COUNT(*) from vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'NEW';



/* bin/AST_manager_send.pl:141 */


/* name: CountVicidialManager :one */
SELECT COUNT(*) from vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'QUEUE';



/* bin/AST_manager_send.pl:151 */


/* name: UpdateVicidialManager :exec */
UPDATE vicidial_manager set status='QUEUE' where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'NEW' order by man_id LIMIT 1;



/* bin/AST_manager_send.pl:167 */


/* name: GetVicidialManager :many */
SELECT man_id,uniqueid,entry_date,status,response,server_ip,channel,action,callerid,cmd_line_b,cmd_line_c,cmd_line_d,cmd_line_e,cmd_line_f,cmd_line_g,cmd_line_h,cmd_line_i,cmd_line_j,cmd_line_k FROM vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'QUEUE' order by man_id LIMIT 1



/* bin/AST_manager_send.pl:200 */


/* name: CountVicidialManager :one */
SELECT COUNT(*) FROM vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and callerid=?/* '" . $vdm->{callerid} . "' */ and status = 'DEAD'



/* bin/AST_manager_send.pl:264 */


/* name: UpdateVicidialManager :exec */
UPDATE vicidial_manager set status='SENT' where man_id=?/* '" . $vdm->{man_id} . "' */



/* bin/AST_manager_send.pl:273 */


/* name: UpdateVicidialManager :exec */
UPDATE vicidial_manager set status='DEAD' where man_id=?/* '" . $vdm->{man_id} . "' */ and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';



/* bin/AST_manager_listen_AMI2.pl:585 */


/* name: UpdateVicidialManager :exec */
UPDATE vicidial_manager set status='DEAD', channel=?/* $event_hash{'Channel'} */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $event_hash{'Uniqueid'} */ and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';



/* bin/AST_manager_listen_AMI2.pl:623 */


/* name: UpdateVicidialManager :exec */
UPDATE vicidial_manager set status='SENT', channel=?/* $event_hash{'Channel'} */, uniqueid = ?/* $event_hash{'Uniqueid'} */ where server_ip = ?/* $event_hash{'ServerIP'} */ and callerid = ?/* $call_id */



/* bin/AST_manager_listen_AMI2.pl:632 */


/* name: UpdateVicidialManager :exec */
UPDATE vicidial_manager set status='UPDATED', channel=?/* $event_hash{'Channel'} */, uniqueid = ?/* $event_hash{'Uniqueid'} */ where server_ip = ?/* $event_hash{'ServerIP'} */ and callerid = ?/* $call_id */ and status != 'NEW'



/* bin/AST_manager_listen_AMI2.pl:675 */


/* name: UpdateVicidialManager :exec */
UPDATE vicidial_manager set status='UPDATED', channel=?/* $event_hash{'Channel'} */, uniqueid = ?/* $event_hash{'Uniqueid'} */ where server_ip = ?/* $event_hash{'ServerIP'} */ and callerid = ?/* $call_id */



/* bin/AST_manager_kill_hung_congested.pl:168 */


/* name: CreateVicidialManager :execresult */
INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')



/* bin/AST_manager_kill_hung_congested.pl:217 */


/* name: CreateVicidialManager :execresult */
INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')



/* bin/AST_manager_kill_hung_congested.pl:267 */


/* name: CreateVicidialManager :execresult */
INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')



/* bin/AST_manager_kill_hung_congested.pl:319 */


/* name: CreateVicidialManager :execresult */
INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')
