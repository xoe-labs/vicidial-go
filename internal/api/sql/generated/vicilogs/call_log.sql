CREATE TABLE call_log (
uniqueid VARCHAR(20) PRIMARY KEY,
channel VARCHAR(100),
channel_group VARCHAR(30),
type VARCHAR(10),
server_ip VARCHAR(15),
extension VARCHAR(100),
number_dialed VARCHAR(15),
caller_code VARCHAR(20),
start_time DATETIME,
start_epoch INT(10),
end_time DATETIME,
end_epoch INT(10),
length_in_sec INT(10),
length_in_min FLOAT(8,2),
index (caller_code),
index (server_ip),
index (channel)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:596 */


/* name: CreateCallLog :execresult */
INSERT INTO call_log (uniqueid,channel,channel_group,type,server_ip,extension,number_dialed,start_time,start_epoch,end_time,end_epoch,length_in_sec,length_in_min,caller_code) values(?/* unique_id */,?/* channel */,?/* channel_group */,?/* type */,?/* VARserver_ip */,?/* extension */,?/* number_dialed */,?/* now_date */,?/* now_date_epoch */,'','','','',?/* callerid */);



/* bin/FastAGI_log.pl:695 */


/* name: GetCallLog :many */
SELECT uniqueid FROM call_log where uniqueid LIKE ?/* beginUNIQUEID% */ and caller_code LIKE ?/* "%$CIDlead_id" */;



/* bin/FastAGI_log.pl:798 */


/* name: GetCallLog :many */
SELECT uniqueid,start_epoch,channel,end_epoch,channel_group FROM call_log where uniqueid=?/* unique_id */;



/* bin/FastAGI_log.pl:800 */


/* name: GetCallLog :many */
SELECT uniqueid,start_epoch,channel,end_epoch,channel_group FROM call_log where caller_code=?/* callerid */ and channel NOT LIKE 'Local/%';



/* bin/FastAGI_log.pl:829 */


/* name: UpdateCallLog :exec */
UPDATE call_log set end_time=?/* now_date */,end_epoch=?/* now_date_epoch */,length_in_sec=?/* length_in_sec */,length_in_min=?/* length_in_min */,channel=?/* channel */ where uniqueid=?/* unique_id */;



/* bin/FastAGI_log.pl:866 */


/* name: GetCallLog :many */
SELECT start_epoch FROM call_log where uniqueid=?/* DOUBLEunique_id */ and channel_group='DOUBLE_LOG' order by start_time desc limit 1;



/* bin/FastAGI_log.pl:879 */


/* name: UpdateCallLog :exec */
UPDATE call_log set end_time=?/* now_date */,end_epoch=?/* now_date_epoch */,length_in_sec=?/* DOUBLElength_in_sec */,length_in_min=?/* DOUBLElength_in_min */ where uniqueid=?/* DOUBLEunique_id */ and channel_group='DOUBLE_LOG' order by start_time desc limit 1;
