CREATE TABLE park_log (
uniqueid VARCHAR(20) default '',
`status` VARCHAR(10),
channel VARCHAR(100),
channel_group VARCHAR(30),
server_ip VARCHAR(15),
parked_time DATETIME,
grab_time DATETIME,
hangup_time DATETIME,
parked_sec INT(10),
talked_sec INT(10),
extension VARCHAR(100),
user VARCHAR(20),
lead_id INT(9) UNSIGNED default '0',
index (parked_time),
index (lead_id)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:894 */


/* name: GetParkLog :one */
SELECT UTC_TIMESTAMP(parked_time),UTC_TIMESTAMP(grab_time) FROM park_log where uniqueid=?/* unique_id */ and server_ip=?/* VARserver_ip */ and (parked_sec is null or parked_sec < 1) order by parked_time desc LIMIT 1;



/* bin/FastAGI_log.pl:923 */


/* name: UpdateParkLog :exec */
UPDATE park_log set status='HUNGUP',hangup_time=?/* now_date */,parked_sec=?/* parked_sec */,talked_sec=?/* talked_sec */ where uniqueid=?/* unique_id */ and server_ip=?/* VARserver_ip */ order by parked_time desc LIMIT 1;
