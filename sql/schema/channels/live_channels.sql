CREATE TABLE live_channels (
channel VARCHAR(100) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
channel_group VARCHAR(30),
extension VARCHAR(100),
channel_data VARCHAR(100)
) ENGINE=MyISAM;
ALTER TABLE live_channels ENGINE=MEMORY;



/* bin/AST_update_AMI2.pl:984 */


/* name: DeleteLiveChannels :exec */
DELETE FROM live_channels where \n\t(" . $trunk_delete_sql . " )



/* bin/AST_update_AMI2.pl:1315 */


/* name: GetLiveChannels :many */
SELECT channel,extension FROM live_channels where server_ip=?/* $server_ip */;
