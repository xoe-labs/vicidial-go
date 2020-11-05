CREATE TABLE vicidial_cpd_log (
cpd_id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
channel VARCHAR(100) NOT NULL,
uniqueid VARCHAR(20),
callerid VARCHAR(20),
server_ip VARCHAR(15) NOT NULL,
lead_id INT(9) UNSIGNED,
event_date DATETIME,
result VARCHAR(20),
`status` ENUM('NEW','PROCESSED') default 'NEW',
cpd_seconds DECIMAL(7,2) default '0',
index(uniqueid),
index(callerid),
index(lead_id)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1001 */


/* name: GetVicidialCpdLog :many */
SELECT result FROM vicidial_cpd_log where callerid=?/* callerid */ and result NOT IN('Voice','Unknown','???','') order by cpd_id desc limit 1;
