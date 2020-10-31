CREATE TABLE server_updater (
server_ip VARCHAR(15) NOT NULL,
last_update DATETIME,
db_time TIMESTAMP,
unique index serverip (server_ip)
) ENGINE=MyISAM;
ALTER TABLE server_updater ENGINE=MEMORY;



/* bin/AST_update_AMI2.pl:194 */


/* name: CountServerUpdater :one */
SELECT COUNT(*) FROM server_updater where server_ip=?/* $server_ip */;



/* bin/AST_update_AMI2.pl:205 */


/* name: CreateServerUpdater :execresult */
INSERT INTO server_updater set server_ip=?/* $server_ip */, last_update=NOW();



/* bin/AST_update_AMI2.pl:569 */


/* name: UpdateServerUpdater :exec */
UPDATE server_updater set last_update=NOW() where server_ip=?/* $server_ip */
