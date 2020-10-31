CREATE TABLE live_sip_channels (
channel VARCHAR(100) NOT NULL,
server_ip VARCHAR(15) NOT NULL,
channel_group VARCHAR(30),
extension VARCHAR(100),
channel_data VARCHAR(100)
) ENGINE=MyISAM;
ALTER TABLE live_sip_channels ENGINE=MEMORY;



/* bin/AST_manager_kill_hung_congested.pl:139 */


/* name: GetLiveSipChannels :many */
SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE "Local%" LIMIT 99



/* bin/AST_manager_kill_hung_congested.pl:188 */


/* name: GetLiveSipChannels :many */
SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE "Local%" LIMIT 99



/* bin/AST_manager_kill_hung_congested.pl:238 */


/* name: GetLiveSipChannels :many */
SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE "Local%" LIMIT 99



/* bin/AST_manager_kill_hung_congested.pl:289 */


/* name: GetLiveSipChannels :many */
SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE "Local%" LIMIT 99



/* bin/AST_update_AMI2.pl:974 */


/* name: DeleteLiveSipChannels :exec */
DELETE FROM live_sip_channels where \n\t(" . $client_delete_sql . " )



/* bin/AST_update_AMI2.pl:1324 */


/* name: GetLiveSipChannels :many */
SELECT channel,extension FROM live_sip_channels where server_ip=?/* $server_ip */;
