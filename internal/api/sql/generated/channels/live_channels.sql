CREATE TABLE live_channels (
channel VARCHAR(100) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
channel_group VARCHAR(30),
extension VARCHAR(100),
channel_data VARCHAR(100)
) ENGINE=MyISAM;
ALTER TABLE live_channels ENGINE=MEMORY;



/* bin/FastAGI_log.pl:1264 */


/* name: GetLiveChannels :many */
SELECT count(*) from live_channels where channel=?/* PC_channel */;



/* bin/AST_update_AMI2.pl:940 */


/* name: CreateLiveChannels :execresult */
INSERT INTO live_channels (channel,server_ip,extension,channel_data) values (?/* channel_ref->{'Channel'} */,?/* server_ip */,?/* extension */,?/* channel_ref->{'ApplicationData'} */);



/* bin/AST_update_AMI2.pl:984 */


/* name: DeleteLiveChannels :exec */
DELETE FROM live_channels where server_ip=?/* server_ip */ and channel=?/* db_trunk->{'channel'} */ and extension=?/* db_trunk->{'extension'} */;



/* bin/AST_update_AMI2.pl:1315 */


/* name: GetLiveChannels :many */
SELECT channel,extension FROM live_channels where server_ip=?/* server_ip */;
