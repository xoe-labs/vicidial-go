CREATE TABLE parked_channels (
channel VARCHAR(100) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
channel_group VARCHAR(30),
extension VARCHAR(100),
parked_by VARCHAR(100),
parked_time DATETIME
) ENGINE=MyISAM;
ALTER TABLE parked_channels ENGINE=MEMORY;



/* bin/FastAGI_log.pl:618 */


/* name: GetParkedChannels :many */
SELECT count(*) from parked_channels where channel_group=?/* callerid */;



/* bin/FastAGI_log.pl:629 */


/* name: GetParkedChannels :many */
SELECT server_ip from parked_channels where channel_group=?/* callerid */;



/* bin/FastAGI_log.pl:1205 */


/* name: GetParkedChannels :many */
SELECT channel from parked_channels where channel_group=?/* callerid */;



/* bin/AST_update_AMI2.pl:1037 */


/* name: DeleteParkedChannels :exec */
DELETE pc1 FROM parked_channels pc1, parked_channels pc2 WHERE pc1.parked_time < pc2.parked_time AND pc1.parked_time <> pc2.parked_time AND pc1.channel = pc2.channel AND pc1.server_ip=?/* server_ip */ and pc2.server_ip=?/* server_ip */;



/* bin/AST_update_AMI2.pl:1042 */


/* name: GetParkedChannels :many */
SELECT channel,extension,parked_time,UTC_TIMESTAMP(parked_time),channel_group FROM parked_channels where server_ip = ?/* server_ip */ order by channel desc, parked_time desc;



/* bin/AST_update_AMI2.pl:1100 */


/* name: DeleteParkedChannels :exec */
DELETE FROM parked_channels WHERE channel=?/* channel */ and extension=?/* extension */; and server_ip=?/* server_ip */;
