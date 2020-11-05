CREATE TABLE parked_channels_recent (
channel VARCHAR(100) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
channel_group VARCHAR(30),
park_end_time DATETIME,
index (channel_group),
index (park_end_time)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1233 */


/* name: GetParkedChannelsRecent :many */
SELECT channel,server_ip from parked_channels_recent where channel_group=?/* callerid */ and park_end_time > ?/* PSQLdate */ order by park_end_time desc limit 1;
