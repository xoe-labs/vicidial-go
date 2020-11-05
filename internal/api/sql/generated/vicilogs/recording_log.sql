CREATE TABLE recording_log (
recording_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
channel VARCHAR(100),
server_ip VARCHAR(15),
extension VARCHAR(100),
start_time DATETIME,
start_epoch INT(10) UNSIGNED,
end_time DATETIME,
end_epoch INT(10) UNSIGNED,
length_in_sec MEDIUMINT(8) UNSIGNED,
length_in_min FLOAT(8,2),
filename VARCHAR(100),
location VARCHAR(255),
lead_id INT(9) UNSIGNED,
user VARCHAR(20),
vicidial_id VARCHAR(20),
index(filename),
index(lead_id),
index(user),
index(vicidial_id)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:838 */


/* name: GetRecordingLog :many */
SELECT recording_id,start_epoch,filename,end_epoch FROM recording_log where vicidial_id=?/* unique_id */ order by start_time desc limit 1;



/* bin/FastAGI_log.pl:856 */


/* name: UpdateRecordingLog :exec */
UPDATE recording_log set end_time=?/* now_date */,end_epoch=?/* now_date_epoch */,length_in_sec=?/* CLlength_in_sec */,length_in_min=?/* CLlength_in_min */ where recording_id=?/* CLrecording_id */;
