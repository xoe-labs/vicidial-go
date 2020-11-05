CREATE TABLE server_performance (
start_time DATETIME NOT NULL,
server_ip VARCHAR(15) NOT NULL,
sysload INT(6) NOT NULL,
freeram SMALLINT(5) UNSIGNED NOT NULL,
usedram SMALLINT(5) UNSIGNED NOT NULL,
processes SMALLINT(4) UNSIGNED NOT NULL,
channels_total SMALLINT(4) UNSIGNED NOT NULL,
trunks_total SMALLINT(4) UNSIGNED NOT NULL,
clients_total SMALLINT(4) UNSIGNED NOT NULL,
clients_zap SMALLINT(4) UNSIGNED NOT NULL,
clients_iax SMALLINT(4) UNSIGNED NOT NULL,
clients_local SMALLINT(4) UNSIGNED NOT NULL,
clients_sip SMALLINT(4) UNSIGNED NOT NULL,
live_recordings SMALLINT(4) UNSIGNED NOT NULL,
cpu_user_percent SMALLINT(3) UNSIGNED NOT NULL default '0',
cpu_system_percent SMALLINT(3) UNSIGNED NOT NULL default '0',
cpu_idle_percent SMALLINT(3) UNSIGNED NOT NULL default '0',
disk_reads MEDIUMINT(7),
disk_writes MEDIUMINT(7)
) ENGINE=MyISAM;



/* bin/AST_update_AMI2.pl:1231 */


/* name: CreateServerPerformance :execresult */
INSERT INTO server_performance (start_time, server_ip, sysload, freeram, usedram, processes, channels_total, trunks_total, clients_total, clients_zap, clients_iax, clients_local, clients_sip, live_recordings, cpu_user_percent, cpu_system_percent, cpu_idle_percent, disk_reads, disk_writes) values( NOW(), ?/* server_ip */, ?/* server_load */, ?/* mem_free */, ?/* mem_used */, ?/* num_processes */, ?/* channel_counts->{'total'} */, ?/* channel_counts->{'trunks'} */, ?/* channel_counts->{'clients'} */, ?/* channel_counts->{'dahdi'} */, ?/* channel_counts->{'iax'} */, ?/* channel_counts->{'local'} */, ?/* channel_counts->{'sip'} */, '0', ?/* cpu_user_percent */, ?/* cpu_sys_percent */, ?/* cpu_idle_percent */, ?/* reads */, ?/* writes */);
