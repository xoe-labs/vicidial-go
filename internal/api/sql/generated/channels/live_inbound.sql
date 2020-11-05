CREATE TABLE live_inbound (
uniqueid VARCHAR(20) NOT NULL,
channel VARCHAR(100) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
caller_id VARCHAR(30),
extension VARCHAR(100),
phone_ext VARCHAR(40),
start_time DATETIME,
acknowledged ENUM('Y','N') default 'N',
inbound_number VARCHAR(20),
comment_a VARCHAR(50),
comment_b VARCHAR(50),
comment_c VARCHAR(50),
comment_d VARCHAR(50),
comment_e VARCHAR(50)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:889 */


/* name: DeleteLiveInbound :exec */
DELETE from live_inbound where uniqueid IN(?/* unique_id */,?/* CALLunique_id */) and server_ip=?/* VARserver_ip */;
