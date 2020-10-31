bin/AST_agent_day.pl:166:select count(*) as calls, full_name,vicidial_users.user,sum(talk_sec),sum(pause_sec),sum(wait_sec),sum(dispo_sec) from vicidial_users,$vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $shipdate 00:00:00 */ and vicidial_users.user=$vicidial_agent_log.user and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 group by vicidial_users.user order by full_name limit 10000;
bin/AST_agent_day.pl:243:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $shipdate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time limit 1;
bin/AST_agent_day.pl:252:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $shipdate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time desc limit 1;
bin/AST_expired_list_exporter.pl:194:select * from vicidial_settings_containers where container_id=?/* $container_id */ and container_type='PERL_CLI'
bin/AST_expired_list_exporter.pl:335:select list_id from vicidial_lists where active='N' and campaign_id=?/* $campaign_id */ and list_lastcalldate<=now()-INTERVAL $last_call_date_days_export DAY
bin/AST_expired_list_exporter.pl:405:select * from vicidial_list where list_id=?/* $list_id */ order by lead_id asc
bin/AST_expired_list_exporter.pl:419:select * from custom_".$list_id." where lead_id=?/* $lead_id */
bin/AST_expired_list_exporter.pl:463:select list_id from vicidial_lists where active='N' and campaign_id=?/* $campaign_id */ and list_lastcalldate<=now()-INTERVAL $last_call_date_days_delete DAY
bin/AST_expired_list_exporter.pl:479:delete from vicidial_list where list_id=?/* $list_id */
bin/AST_expired_list_exporter.pl:485:delete from vicidial_lists where list_id=?/* $list_id */
bin/AST_expired_list_exporter.pl:491:delete from vicidial_hopper where list_id=?/* $list_id */
bin/AST_manager_send.pl:135:SELECT count(*) from vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'NEW';
bin/AST_manager_send.pl:141:SELECT count(*) from vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'QUEUE';
bin/AST_manager_send.pl:151:UPDATE vicidial_manager set status='QUEUE' where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'NEW' order by man_id limit 1;
bin/AST_manager_send.pl:167:SELECT man_id,uniqueid,entry_date,status,response,server_ip,channel,action,callerid,cmd_line_b,cmd_line_c,cmd_line_d,cmd_line_e,cmd_line_f,cmd_line_g,cmd_line_h,cmd_line_i,cmd_line_j,cmd_line_k FROM vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and status = 'QUEUE' order by man_id limit 1
bin/AST_manager_send.pl:200:SELECT count(*) FROM vicidial_manager where server_ip = ?/* '" . $conf{VARserver_ip} . "' */ and callerid=?/* '" . $vdm->{callerid} . "' */ and status = 'DEAD'
bin/AST_manager_send.pl:264:UPDATE vicidial_manager set status='SENT' where man_id=?/* '" . $vdm->{man_id} . "' */
bin/AST_manager_send.pl:273:UPDATE vicidial_manager set status='DEAD' where man_id=?/* '" . $vdm->{man_id} . "' */ and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_send.pl:369:SELECT server_id,server_description,server_ip,active,asterisk_version,max_vicidial_trunks,telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,local_gmt,voicemail_dump_exten,answer_transfer_agent,ext_context,sys_perf_log,vd_server_logs,agi_output,vicidial_balance_active,balance_trunks_offlimits,recording_web_link,alt_server_ip,active_asterisk_server,generate_vicidial_conf,rebuild_conf_files,outbound_calls_per_second,sysload,channels_total,cpu_idle_percent,disk_usage,sounds_update,vicidial_recording_limit,carrier_logging_active,vicidial_balance_rank,rebuild_music_on_hold,active_agent_login_server,conf_secret FROM servers where server_ip = ?/* '" . $serverip ."' */;
bin/VD_email_inbound.pl:162:SELECT campaign_id FROM vicidial_campaigns where active='Y' and campaign_allow_inbound='Y';
bin/VD_email_inbound.pl:177:select group_id, next_agent_call from vicidial_inbound_groups where group_handling='EMAIL' and active='Y'
bin/VD_email_inbound.pl:191:select email_row_id, vicidial_xfer_log.lead_id, vicidial_xfer_log.campaign_id, vicidial_inbound_groups.next_agent_call, vicidial_xfer_log.user from vicidial_email_list, vicidial_inbound_groups, vicidial_xfer_log where vicidial_inbound_groups.group_handling='EMAIL' and vicidial_inbound_groups.active='Y' and vicidial_inbound_groups.group_id=vicidial_xfer_log.campaign_id and vicidial_xfer_log.closer='EMAIL_XFER' and vicidial_xfer_log.lead_id=vicidial_email_list.lead_id and vicidial_xfer_log.xfercallid=vicidial_email_list.xfercallid order by queue_priority desc, email_date asc
bin/VD_email_inbound.pl:213:select email_row_id, lead_id, vicidial_email_list.group_id, vicidial_inbound_groups.next_agent_call, vicidial_email_list.user from vicidial_email_list, vicidial_inbound_groups where group_handling='EMAIL' and active='Y' and vicidial_inbound_groups.group_id=vicidial_email_list.group_id and vicidial_email_list.status='NEW' order by queue_priority desc, email_date asc
bin/VD_email_inbound.pl:275:LOCK TABLES vicidial_live_agents WRITE, vicidial_live_inbound_agents WRITE;
bin/VD_email_inbound.pl:278:SELECT vicidial_live_agents.user from vicidial_live_agents, vicidial_live_inbound_agents WHERE vicidial_live_agents.user=vicidial_live_inbound_agents.user and status IN('CLOSER','READY') and lead_id<1 $ADUfindSQL and vicidial_live_inbound_agents.group_id=?/* $group_id */ and last_update_time > ?/* $BDtsSQLdate */ and vicidial_live_agents.user NOT IN($ring_no_answer_agents$vlia_users) and ring_callerid='' $qp_groupWAIT_camp_SQL $agent_call_order limit 1;
bin/VD_email_inbound.pl:306:update vicidial_email_list set status='QUEUE', user=?/* $user */ where email_row_id=?/* $email_row_id */ $user_clause
bin/VD_email_inbound.pl:314:update vicidial_live_agents set status='MQUEUE' where user=?/* $user */
bin/VD_email_inbound.pl:322:UNLOCK TABLES;
bin/VD_email_inbound.pl:327:LOCK TABLES vicidial_live_agents WRITE;
bin/VD_email_inbound.pl:332:SELECT user FROM vicidial_live_agents where status IN('CLOSER','READY') and lead_id<1 $ADUfindSQL and campaign_id IN($INBOUNDcampsSQL) and closer_campaigns LIKE \"% $SQL_group_id %\" and last_update_time > ?/* $BDtsSQLdate */ and vicidial_live_agents.user NOT IN($ring_no_answer_agents) $qp_groupWAIT_SQL $qp_groupWAIT_camp_SQL $agent_call_order limit 1;
bin/VD_email_inbound.pl:359:update vicidial_email_list set status='QUEUE', user=?/* $user */ where email_row_id=?/* $email_row_id */ $user_clause
bin/VD_email_inbound.pl:367:update vicidial_live_agents set status='MQUEUE' where user=?/* $user */
bin/VD_email_inbound.pl:375:UNLOCK TABLES;
bin/AST_DB_action.pl:170:UPDATE vicidial_list set called_since_last_reset='N',rank=90 where list_id IN(?/* $list_idIN */) and called_count < 1;
bin/AST_DB_action.pl:184:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='SERVERS', event_type='OTHER', record_id=?/* $server_ip */, event_code='DB_ACTION', event_sql=?/* $SQLlog */, event_notes='Affected rows: $affected_rows   TOTAL Elapsed time: ".($end_time-$start_time)." sec  |$args|';
bin/ADMIN_purge_log_tables.pl:171:SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = ?/* $databasename */ AND table_name = ?/* $tablename */;
bin/ADMIN_purge_log_tables.pl:406:delete from $vicidb.$tablename where $whereclause <= ?/* $sqldate */;
bin/ADMIN_adjust_GMTnow_on_leads.pl:216:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context FROM servers where server_ip = ?/* $server_ip */;
bin/ADMIN_adjust_GMTnow_on_leads.pl:266:select list_id from vicidial_lists where time_zone_setting='COUNTRY_AND_AREA_CODE';
bin/ADMIN_adjust_GMTnow_on_leads.pl:287:select list_id from vicidial_lists where time_zone_setting='POSTAL_CODE';
bin/ADMIN_adjust_GMTnow_on_leads.pl:308:select list_id from vicidial_lists where time_zone_setting='NANPA_PREFIX';
bin/ADMIN_adjust_GMTnow_on_leads.pl:329:select list_id from vicidial_lists where time_zone_setting='OWNER_TIME_ZONE_CODE';
bin/ADMIN_adjust_GMTnow_on_leads.pl:362:select distinct phone_code from vicidial_list $listSQL $omitlistidSQL;
bin/ADMIN_adjust_GMTnow_on_leads.pl:392:select distinct tz_code,GMT_offset,country_code from vicidial_phone_codes where country_code IN($phone_codes_list);
bin/ADMIN_adjust_GMTnow_on_leads.pl:420:select country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description,tz_code from vicidial_phone_codes;
bin/ADMIN_adjust_GMTnow_on_leads.pl:437:select postal_code,state,GMT_offset,DST,DST_range,country,country_code from vicidial_postal_codes;
bin/ADMIN_adjust_GMTnow_on_leads.pl:457:select areacode,prefix,GMT_offset,DST from vicidial_nanpa_prefix_codes;
bin/ADMIN_adjust_GMTnow_on_leads.pl:515:select count(*) from vicidial_list where phone_code=?/* $match_code_ORIG */ $AC_match $XlistSQL $XomitlistidSQL;
bin/ADMIN_adjust_GMTnow_on_leads.pl:628:select count(*) from vicidial_list where phone_code=?/* $match_code_ORIG */ $AC_match and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL;
bin/ADMIN_adjust_GMTnow_on_leads.pl:645:update vicidial_list set gmt_offset_now=?/* $area_GMT */,modify_date=modify_date where phone_code=?/* $match_code_ORIG */ $AC_match and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL;
bin/ADMIN_adjust_GMTnow_on_leads.pl:696:select count(*) from vicidial_list where phone_code=?/* $match_code_ORIG */ $AC_match $XlistSQL $XomitlistidSQL $POST_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:810:select count(*) from vicidial_list where phone_code=?/* $match_code_ORIG */ $AC_match and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL $POST_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:827:update vicidial_list set gmt_offset_now=?/* $area_GMT */,modify_date=modify_date where phone_code=?/* $match_code_ORIG */ $AC_match and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL $POST_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:878:select count(*) from vicidial_list where phone_code=?/* $match_code_ORIG */ $AC_match $XlistSQL $XomitlistidSQL $NPFX_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:992:select count(*) from vicidial_list where phone_code=?/* $match_code_ORIG */ $AC_match and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL $NPFX_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:1009:update vicidial_list set gmt_offset_now=?/* $area_GMT */,modify_date=modify_date where phone_code=?/* $match_code_ORIG */ $AC_match and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL $NPFX_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:1049:select distinct DST_range from vicidial_phone_codes where tz_code=?/* $tz_codes[$e] */ and country_code=?/* $tz_country[$e] */ order by DST_range desc limit 1;
bin/ADMIN_adjust_GMTnow_on_leads.pl:1060:select count(*) from vicidial_list where owner=?/* $tz_codes[$e] */ and phone_code=?/* $tz_country[$e] */ $XlistSQL $XomitlistidSQL $OWTZ_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:1173:select count(*) from vicidial_list where owner=?/* $tz_codes[$e] */ and phone_code=?/* $tz_country[$e] */ and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL $OWTZ_codes_list;
bin/ADMIN_adjust_GMTnow_on_leads.pl:1190:UPDATE vicidial_list set gmt_offset_now=?/* $area_GMT */,modify_date=modify_date where owner=?/* $tz_codes[$e] */ and phone_code=?/* $tz_country[$e] */ and (gmt_offset_now != ?/* $area_GMT */ or gmt_offset_now IS NULL) $XlistSQL $XomitlistidSQL $OWTZ_codes_list;
bin/nanpa_type_filter.pl:315:INSERT INTO vicidial_nanpa_filter_log SET output_code=?/* $db_output_code */,user=?/* $TRIGGER_user */,status='LAUNCHED',server_ip=?/* $VARserver_ip */,list_id=?/* $list_id */,start_time=NOW(),update_time=NOW(),status_line='Starting...',script_output=\"Starting...\nCELLPHONE LIST ID: $cellphone_list_id\nLANDLINE LIST ID: $landline_list_id\nINVALID LIST ID: $invalid_list_id\nVL FIELD UPDATE: $vl_field_update\nEXCLUDE FIELD: $exclude_field\nEXCLUDE VALUE: $exclude_value\nINCLUDE FIELD: $include_field\nINCLUDE VALUE: $include_value\n\" ON DUPLICATE KEY UPDATE status='LAUNCHED',server_ip=?/* $VARserver_ip */,list_id=?/* $list_id */,update_time=NOW(),status_line=\"Starting...\n\",script_output=CONCAT(script_output,\"Starting...\nCELLPHONE LIST ID: $cellphone_list_id\nLANDLINE LIST ID: $landline_list_id\nINVALID LIST ID: $invalid_list_id\nVL FIELD UPDATE: $vl_field_update\nEXCLUDE FIELD: $exclude_field\nEXCLUDE VALUE: $exclude_value\nINCLUDE FIELD: $include_field\nINCLUDE VALUE: $include_value\n\");
bin/nanpa_type_filter.pl:350:SELECT lead_id,phone_number from vicidial_list $list_idSQL $excludeSQL $includeSQL;
bin/nanpa_type_filter.pl:383:UPDATE vicidial_nanpa_filter_log SET status='LEADS_GATHERED',leads_count=?/* $rec_count */,update_time=NOW(),status_line='Leads Gathered: $rec_count',script_output=CONCAT(script_output,\"Leads Gathered: $rec_count\n\") where output_code=?/* $db_output_code */;
bin/nanpa_type_filter.pl:432:UPDATE vicidial_list SET list_id=$invalid_list_id where lead_id=$lead_ids[$temp_rec];
bin/nanpa_type_filter.pl:434:UPDATE vicidial_list SET list_id=$cellphone_list_id where lead_id=$lead_ids[$temp_rec];
bin/nanpa_type_filter.pl:436:UPDATE vicidial_list SET list_id=$landline_list_id where lead_id=$lead_ids[$temp_rec];
bin/nanpa_type_filter.pl:445:UPDATE vicidial_list SET $vl_field_update=?/* $result_split[0] */ where lead_id=$lead_ids[$temp_rec];
bin/nanpa_type_filter.pl:460:UPDATE vicidial_nanpa_filter_log SET status='NANPA_LOOKUPS',update_time=NOW(),filter_count=?/* $rec_count */,status_line='(INV: $invalid|CEL: $cellphone|LND: $landline)' where output_code=?/* $db_output_code */;
bin/nanpa_type_filter.pl:506:UPDATE vicidial_nanpa_filter_log SET status='COMPLETED',filter_count=?/* $rec_count */,update_time=NOW(),status_line='Process Completed: $secZ seconds',script_output=CONCAT(script_output,\"Process Completed: $secZ seconds\n   INVALID:    $invalid\n   CELLPHONE:  $cellphone\n   LANDLINE:   $landline\n\n\") where output_code=?/* $db_output_code */;
bin/AST_agent_wait_check.pl:235:SELECT container_entry FROM vicidial_settings_containers where container_id = ?/* $container */;
bin/AST_agent_wait_check.pl:359:SELECT user,status,campaign_id,server_ip,UTC_TIMESTAMP(last_state_change) FROM vicidial_live_agents where status IN('CLOSER','READY') and UTC_TIMESTAMP(last_state_change) < ?/* $max_wait_epoch */ $campaignSQL order by last_state_change;
bin/AST_email_web_reportSFTP.pl:294:SELECT container_entry from vicidial_settings_containers where container_id=?/* $container_id */;
bin/AST_email_web_reportSFTP.pl:508:SELECT report_destination,email_from,email_to,email_subject,ftp_server,ftp_user,ftp_pass,ftp_directory,report_url,filename_override from vicidial_automated_reports where report_id=?/* $report_id */;
bin/AST_email_web_reportSFTP.pl:567:SELECT user from vicidial_admin_log where event_section='AUTOREPORTS' and record_id=?/* $report_id */ and event_type IN('ADD','MODIFY','COPY') order by admin_log_id desc limit 1;
bin/AST_email_web_reportSFTP.pl:583:SELECT pass,custom_five from vicidial_users where user=?/* $http_user */;
bin/AST_email_web_reportSFTP.pl:766:UPDATE vicidial_automated_reports set report_last_run=NOW(), report_last_length=?/* $secRUN */ where report_id=?/* $report_id */;
bin/AST_email_web_reportSFTP.pl:772:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $http_user */, ip_address=?/* $server_ip */, event_section='AUTOREPORTS', event_type='EXPORT', record_id=?/* $report_id */, event_code='ADMIN REPORT EXPORT RUN $report_destination', event_sql=?/* $location */, event_notes='Run time: $secRUN seconds. Sent $report_destination';
bin/AST_email_web_reportSFTP.pl:782:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $http_user */, ip_address=?/* $server_ip */, event_section='REPORTS', event_type='EXPORT', record_id='email_web_report', event_code='ADMIN REPORT EXPORT RUN', event_sql=?/* $location */, event_notes='Run time: $secRUN seconds';
bin/AST_DB_lead_status_change.pl:101:UPDATE vicidial_list set status='NEW' where status='NA' and called_count IN('1','2');
bin/ADMIN_audio_store_sync.pl:177:SELECT active_asterisk_server,audio_store_purge FROM servers where server_ip = ?/* $VARserver_ip */;
bin/ADMIN_audio_store_sync.pl:191:SELECT sounds_central_control_active,sounds_web_server,sounds_web_directory,admin_web_directory FROM system_settings;
bin/ADMIN_audio_store_sync.pl:216:UPDATE servers SET sounds_update='N' where server_ip=?/* $VARserver_ip */;
bin/ADMIN_audio_store_sync.pl:228:UPDATE servers SET audio_store_purge='' where server_ip=?/* $VARserver_ip */;
bin/ADMIN_audio_store_sync.pl:437:UPDATE servers SET sounds_update='Y' where server_ip NOT IN(?/* $VARserver_ip */);
bin/ADMIN_audio_store_sync.pl:485:SELECT audio_format,audio_filesize,audio_length FROM audio_store_details where audio_filename = ?/* $filename */;
bin/ADMIN_audio_store_sync.pl:504:UPDATE audio_store_details SET audio_format=?/* $audio_format */,audio_filesize=?/* $filesize */,audio_length=?/* $audio_length */,audio_epoch=?/* $fileepoch */ where audio_filename=?/* $filename */;
bin/ADMIN_audio_store_sync.pl:512:INSERT INTO audio_store_details SET audio_filename=?/* $filename */,audio_format=?/* $audio_format */,audio_filesize=?/* $filesize */,audio_length=?/* $audio_length */,audio_epoch=?/* $fileepoch */;
bin/ADMIN_audio_store_sync.pl:537:UPDATED entries: $update_count\n
bin/ADMIN_audio_store_sync.pl:552:SELECT rebuild_music_on_hold FROM servers where server_ip = ?/* $VARserver_ip */;
bin/ADMIN_audio_store_sync.pl:565:UPDATE servers SET rebuild_music_on_hold='N' where server_ip = ?/* $VARserver_ip */;
bin/ADMIN_audio_store_sync.pl:569:SELECT moh_id FROM vicidial_music_on_hold where remove='Y' and moh_id NOT IN('astdb','sounds','agi-bin','keys');
bin/ADMIN_audio_store_sync.pl:587:DELETE from vicidial_music_on_hold where moh_id=?/* $remove_moh_id[$j] */ and remove='Y' and moh_id NOT IN('astdb','sounds','agi-bin','keys');
bin/ADMIN_audio_store_sync.pl:590:DELETE from vicidial_music_on_hold_files where moh_id=?/* $remove_moh_id[$j] */ and moh_id NOT IN('astdb','sounds','agi-bin','keys');
bin/ADMIN_audio_store_sync.pl:605:SELECT moh_id,moh_name,random FROM vicidial_music_on_hold where active='Y' and moh_id NOT IN('astdb','sounds','agi-bin','keys');
bin/ADMIN_audio_store_sync.pl:647:SELECT filename,rank FROM vicidial_music_on_hold_files where moh_id=?/* $moh_id[$j] */ order by rank;
bin/AST_DB_tz_divide.pl:120:UPDATE vicidial_list set list_id='222' where list_id='111' and gmt_offset_now IN($TZmove);
bin/AST_DB_tz_divide.pl:127:UPDATE vicidial_list set list_id='12021' where list_id='11315' and gmt_offset_now IN($TZmove);
bin/AST_DB_tz_divide.pl:134:UPDATE vicidial_list set list_id='4444' where list_id='3333' and gmt_offset_now IN($TZmove);
bin/AST_DB_tz_divide.pl:143:UPDATE vicidial_list set list_id='111' where list_id='222' and gmt_offset_now IN($TZback);
bin/AST_DB_tz_divide.pl:150:UPDATE vicidial_list set list_id='11315' where list_id='12021' and gmt_offset_now IN($TZback);
bin/AST_DB_tz_divide.pl:157:UPDATE vicidial_list set list_id='3333' where list_id='4444' and gmt_offset_now IN($TZback);
bin/AST_DB_tz_divide.pl:191:UPDATE vicidial_list set list_id='999999' where list_id IN('11315','12021','111','222','3333','4444') and entry_date < \"$XDSQLdate\
bin/AST_DB_tz_divide.pl:198:DELETE from vicidial_list WHERE list_id='999999' and entry_date < ?/* $TDSQLdate */ and status NOT IN('SALE','UPSELL','UPSALE','A1','A2','A3','A4');
bin/AST_reset_mysql_vars.pl:69:UPDATE conferences set extension='' where server_ip=?/* $server_ip */;
bin/AST_reset_mysql_vars.pl:74:UPDATE vicidial_conferences set extension='' where server_ip=?/* $server_ip */;
bin/AST_reset_mysql_vars.pl:84:DELETE from vicidial_manager where server_ip=?/* $server_ip */;
bin/AST_reset_mysql_vars.pl:89:DELETE from vicidial_auto_calls where server_ip=?/* $server_ip */;
bin/AST_reset_mysql_vars.pl:94:DELETE from vicidial_live_agents where server_ip=?/* $server_ip */;
bin/AST_reset_mysql_vars.pl:99:DELETE from vicidial_users where full_name='5555';
bin/AST_reset_mysql_vars.pl:104:DELETE from vicidial_campaign_server_stats where server_ip=?/* $server_ip */;
bin/AST_reset_mysql_vars.pl:109:DELETE from vicidial_hopper where user LIKE \"%_$server_ip\
bin/AST_CRON_audio_3_ftp.pl:436:select recording_id,start_time from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/AST_CRON_audio_3_ftp.pl:558:UPDATE recording_log set location=?/* $VARHTTP_path/$start_date_PATH$ALLfile */ where recording_id=?/* $recording_id */;
bin/AST_settings_container_SQL.pl:148:SELECT container_entry FROM vicidial_settings_containers where container_id = ?/* $container */;
bin/AST_settings_container_SQL.pl:175:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='CONTAINERS', event_type='OTHER', record_id=?/* $container */, event_code='CONTAINER SQL RUN', event_sql=?/* $container_lines[$i] */, event_notes='line $i executed, $affected_rows rows affected';
bin/AST_vm_update.pl:136:SELECT count(*) from system_settings where active_voicemail_server=?/* $server_ip */;
bin/AST_vm_update.pl:156:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_vm_update.pl:192:SELECT distinct voicemail_id from phones;
bin/AST_vm_update.pl:332:SELECT extension,messages,old_messages,server_ip from phones where voicemail_id=?/* $PTvoicemail_ids[$i] */;
bin/AST_vm_update.pl:359:UPDATE phones set messages=?/* $NEW_messages[$i] */, old_messages=?/* $OLD_messages[$i] */ where server_ip=?/* $PTserver_ips[$rec_countX] */ and extension=?/* $PTextensions[$rec_countX] */
bin/AST_vm_update.pl:377:SELECT count(*) from system_settings where active_voicemail_server=?/* $server_ip */;
bin/AST_vm_update.pl:394:SELECT voicemail_id,messages,old_messages from vicidial_voicemail where active='Y';
bin/AST_vm_update.pl:494:UPDATE vicidial_voicemail set messages=?/* $NEW_messages[$i] */,old_messages=?/* $OLD_messages[$i] */ where voicemail_id=?/* $PTvoicemail_ids[$i] */;
bin/AST_email_web_report.pl:293:SELECT container_entry from vicidial_settings_containers where container_id=?/* $container_id */;
bin/AST_email_web_report.pl:497:SELECT report_destination,email_from,email_to,email_subject,ftp_server,ftp_user,ftp_pass,ftp_directory,report_url,filename_override from vicidial_automated_reports where report_id=?/* $report_id */;
bin/AST_email_web_report.pl:556:SELECT user from vicidial_admin_log where event_section='AUTOREPORTS' and record_id=?/* $report_id */ and event_type IN('ADD','MODIFY','COPY') order by admin_log_id desc limit 1;
bin/AST_email_web_report.pl:572:SELECT pass,custom_five from vicidial_users where user=?/* $http_user */;
bin/AST_email_web_report.pl:611:SELECT container_entry from vicidial_settings_containers where container_id=?/* $temp_VARREPORT_host */;
bin/AST_email_web_report.pl:638:UPDATE vicidial_automated_reports SET run_now_trigger='N' where run_now_trigger='Y' and report_server IN(?/* $server_ip */$THISserver_voicemailSQL) and report_id=?/* $report_id */;
bin/AST_email_web_report.pl:778:UPDATE vicidial_automated_reports set report_last_run=NOW(), report_last_length=?/* $secRUN */ where report_id=?/* $report_id */;
bin/AST_email_web_report.pl:784:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $http_user */, ip_address=?/* $server_ip */, event_section='AUTOREPORTS', event_type='EXPORT', record_id=?/* $report_id */, event_code='ADMIN REPORT EXPORT RUN $report_destination', event_sql=?/* $location */, event_notes='Run time: $secRUN seconds. Sent $report_destination';
bin/AST_email_web_report.pl:794:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $http_user */, ip_address=?/* $server_ip */, event_section='REPORTS', event_type='EXPORT', record_id='email_web_report', event_code='ADMIN REPORT EXPORT RUN', event_sql=?/* $location */, event_notes='Run time: $secRUN seconds';
bin/ADMIN_area_code_populate.pl:193:DELETE from vicidial_nanpa_prefix_codes;
bin/ADMIN_area_code_populate.pl:202:insert into vicidial_nanpa_prefix_codes VALUES 
bin/ADMIN_area_code_populate.pl:260:SELECT count(*) FROM vicidial_nanpa_prefix_codes where areacode=?/* $row[0] */ and prefix=?/* $row[1] */;
bin/ADMIN_area_code_populate.pl:292:insert into vicidial_nanpa_prefix_codes VALUES 
bin/ADMIN_area_code_populate.pl:308:insert into vicidial_nanpa_prefix_codes VALUES 
bin/ADMIN_area_code_populate.pl:348:DELETE from vicidial_phone_codes;
bin/ADMIN_area_code_populate.pl:356:insert into vicidial_phone_codes VALUES 
bin/ADMIN_area_code_populate.pl:379:insert into vicidial_phone_codes VALUES 
bin/ADMIN_area_code_populate.pl:389:insert into vicidial_phone_codes VALUES 
bin/ADMIN_area_code_populate.pl:402:DELETE from vicidial_postal_codes;
bin/ADMIN_area_code_populate.pl:410:insert into vicidial_postal_codes VALUES 
bin/ADMIN_area_code_populate.pl:427:insert into vicidial_postal_codes VALUES 
bin/ADMIN_area_code_populate.pl:435:insert into vicidial_postal_codes VALUES 
bin/ADMIN_area_code_populate.pl:448:DELETE from vicidial_country_iso_tld;
bin/ADMIN_area_code_populate.pl:456:insert into vicidial_country_iso_tld VALUES 
bin/ADMIN_area_code_populate.pl:472:insert into vicidial_country_iso_tld VALUES 
bin/ADMIN_area_code_populate.pl:480:insert into vicidial_country_iso_tld VALUES 
bin/AST_VDlist_summary_export_UK.pl:241:select list_id from vicidial_lists where campaign_id IN($campaignSQL);
bin/AST_VDlist_summary_export_UK.pl:257:select region,region_code,post_code_prefix,country_code,list_code_id from vicidial_uk_region_codes order by region_code,post_code_prefix limit 2000;
bin/AST_VDlist_summary_export_UK.pl:323:select count(*),list_id from vicidial_list where postal_code LIKE ?/* $post_code_prefix[$i]% */ and list_id IN($listSQL) and status IN($good_statusesSQL) group by list_id order by list_id,status;
bin/AST_timecheck.pl:200:SELECT frozen_server_call_clear FROM system_settings;
bin/AST_timecheck.pl:211:SELECT su.server_ip,last_update,UTC_TIMESTAMP(last_update),server_description,UTC_TIMESTAMP(db_time),server_id,active FROM server_updater su,servers s where s.server_ip=su.server_ip;
bin/AST_timecheck.pl:246:SELECT count(*) from vicidial_auto_calls where server_ip=?/* $server_ip */;
bin/AST_timecheck.pl:261:DELETE FROM vicidial_auto_calls where server_ip=?/* $server_ip */;
bin/AST_timecheck.pl:268:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address=?/* $server_ip */, event_section='SERVERS', event_type='CLEAR', record_id=?/* $server_id */, event_code='FROZEN SERVER CALL CLEAR', event_sql=?/* $SQL_log */, event_notes=?/* $servercalls_count|$FCaffected_rows|$s_time($u_time|$aryA[2]) */;
bin/AST_VDsales_export_SFTPSSH2.pl:542:SELECT local_gmt FROM servers where server_ip=?/* $server_ip */;
bin/AST_VDsales_export_SFTPSSH2.pl:568:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times FROM vicidial_call_times where call_time_id=?/* $call_time */;
bin/AST_VDsales_export_SFTPSSH2.pl:604:select vicidial_log.user,first_name,last_name,address1,address2,city,state,postal_code,vicidial_list.phone_number,vicidial_list.email,security_phrase,vicidial_list.comments,CONVERT_TZ(call_date,$convert_tz),vicidial_list.lead_id,vicidial_users.full_name,vicidial_log.status,vicidial_list.vendor_lead_code,vicidial_list.source_id,vicidial_log.list_id,title,address3,last_local_call_time,uniqueid,length_in_sec,vicidial_list.list_id,vicidial_list.list_id,UTC_TIMESTAMP(vicidial_log.call_date),vicidial_campaigns.campaign_name,vicidial_campaigns.campaign_cid from vicidial_list,vicidial_log,vicidial_users,vicidial_campaigns where $campaignSQL $sale_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_log.lead_id=vicidial_list.lead_id and vicidial_users.user=vicidial_log.user and vicidial_log.campaign_id=vicidial_campaigns.campaign_id order by call_date;
bin/AST_VDsales_export_SFTPSSH2.pl:607:select vicidial_log.user,8,8,8,8,8,8,8,vicidial_log.phone_number,8,8,8,CONVERT_TZ(call_date,$convert_tz),vicidial_log.lead_id,vicidial_users.full_name,vicidial_log.status,8,8,vicidial_log.list_id,8,8,CONVERT_TZ(call_date,$convert_tz),uniqueid,length_in_sec,vicidial_log.list_id,vicidial_log.list_id,UTC_TIMESTAMP(vicidial_log.call_date),vicidial_campaigns.campaign_name,vicidial_campaigns.campaign_cid from vicidial_log,vicidial_users,vicidial_campaigns where $campaignSQL $sale_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_log.user and vicidial_log.campaign_id=vicidial_campaigns.campaign_id order by call_date;
bin/AST_VDsales_export_SFTPSSH2.pl:664:select vicidial_closer_log.user,first_name,last_name,address1,address2,city,state,postal_code,vicidial_list.phone_number,vicidial_list.email,security_phrase,vicidial_list.comments,CONVERT_TZ(call_date,$convert_tz),vicidial_list.lead_id,vicidial_users.full_name,vicidial_closer_log.status,vicidial_list.vendor_lead_code,vicidial_list.source_id,vicidial_closer_log.list_id,campaign_id,title,address3,last_local_call_time,xfercallid,closecallid,uniqueid,length_in_sec,queue_seconds,vicidial_list.list_id,vicidial_list.list_id,UTC_TIMESTAMP(vicidial_closer_log.call_date),agent_alert_delay from vicidial_list,vicidial_closer_log,vicidial_users,vicidial_inbound_groups where $with_inboundSQL $close_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_closer_log.lead_id=vicidial_list.lead_id and vicidial_users.user=vicidial_closer_log.user and vicidial_inbound_groups.group_id=vicidial_closer_log.campaign_id order by call_date;
bin/AST_VDsales_export_SFTPSSH2.pl:667:select vicidial_closer_log.user,8,8,8,8,8,8,8,vicidial_closer_log.phone_number,8,8,8,CONVERT_TZ(call_date,$convert_tz),vicidial_closer_log.lead_id,vicidial_users.full_name,vicidial_closer_log.status,8,8,vicidial_closer_log.list_id,campaign_id,8,8,CONVERT_TZ(call_date,$convert_tz),xfercallid,closecallid,uniqueid,length_in_sec,queue_seconds,vicidial_closer_log.list_id,vicidial_closer_log.list_id,UTC_TIMESTAMP(vicidial_closer_log.call_date),agent_alert_delay from vicidial_closer_log,vicidial_users,vicidial_inbound_groups where $with_inboundSQL $close_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_closer_log.user and vicidial_inbound_groups.group_id=vicidial_closer_log.campaign_id order by call_date;
bin/AST_VDsales_export_SFTPSSH2.pl:715:select vicidial_xfer_log.user,full_name from vicidial_xfer_log,vicidial_users where lead_id=?/* $lead_id */ and closer=?/* $closer */ and xfercallid=?/* $xfercallid */ and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_xfer_log.user order by call_date desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1008:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ and vicidial_id=?/* $vicidial_id */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by start_time desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1025:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by length_in_sec desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1043:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ order by length_in_sec desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1060:select recording_id,filename,location from recording_log where filename LIKE \"%$phone_number%\" order by length_in_sec desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1093:select recording_id,filename,location from recording_log where vicidial_id=?/* $vicidial_id */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by start_time limit 10;
bin/AST_VDsales_export_SFTPSSH2.pl:1121:select closecallid,length_in_sec,queue_seconds,agent_alert_delay from vicidial_closer_log,vicidial_inbound_groups where lead_id=?/* $lead_id */ and call_date > ?/* $call_date */ and call_date < ?/* $shipdate 23:59:59 */ and campaign_id=group_id order by call_date limit 10;
bin/AST_VDsales_export_SFTPSSH2.pl:1143:select recording_id,filename,location from recording_log where vicidial_id=?/* $closecallid */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by start_time limit 10;
bin/AST_VDsales_export_SFTPSSH2.pl:1182:select did_pattern,did_description,CONVERT_TZ(call_date,$convert_tz) from vicidial_inbound_dids vid,vicidial_did_log vdl where uniqueid=?/* $uniqueid */ and call_date > ?/* $shipdate 00:00:01 */ and call_date <= ?/* $call_date */ and vid.did_id=vdl.did_id order by call_date desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1197:select vc.campaign_cid,vc.campaign_name,CONVERT_TZ(call_date,$convert_tz) from vicidial_campaigns vc,vicidial_log vl where lead_id=?/* $lead_id */ and call_date > ?/* $shipdate 00:00:01 */ and call_date <= ?/* $call_date */ and vc.campaign_id=vl.campaign_id order by call_date desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1384:select CONVERT_TZ(call_date,$convert_tz),order_id,appointment_date,appointment_time,call_notes from vicidial_call_notes where lead_id=?/* $lead_id */ and vicidial_id=?/* $uniqueid */ and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ order by call_date desc limit 1;
bin/AST_VDsales_export_SFTPSSH2.pl:1436:select dispo_sec from vicidial_agent_log where lead_id=?/* $lead_id */ and user=?/* $closer */ and event_time > ?/* $shipdate 00:00:01 */ and event_time < ?/* $shipdate 23:59:59 */ order by event_time desc limit 1;
bin/VICIDIAL_UPDATE_leads_status_file.pl:243:SELECT use_non_latin FROM system_settings;
bin/VICIDIAL_UPDATE_leads_status_file.pl:414:SELECT lead_id,vendor_lead_code,status,phone_number,list_id from vicidial_list where $lookupSQL;
bin/VICIDIAL_UPDATE_leads_status_file.pl:455:UPDATE vicidial_list SET status=?/* $status */ where $lookupSQL;
bin/VICIDIAL_UPDATE_leads_status_file.pl:465:DELETE from vicidial_hopper where lead_id IN($lead_id);
bin/VICIDIAL_UPDATE_leads_status_file.pl:471:DELETE from vicidial_callbacks where lead_id IN($lead_id);
bin/VICIDIAL_UPDATE_leads_status_file.pl:492:INSERT INTO vicidial_list_update_log SET event_date=?/* $SQL_date */,lead_id=?/* $lead_id */,vendor_id=?/* $vendor_lead_code */,phone_number=?/* $phone_number */,status=?/* $status */,old_status=?/* $old_status */,filename=?/* $FILEname */,result=?/* $result */,result_rows=?/* $Uaffected_rows */,list_id=?/* $old_list_id */;
bin/VICIDIAL_UPDATE_leads_status_file.pl:523:UPDATED:              $b\n
bin/QC_gather_records.pl:225:SELECT use_non_latin,qc_last_pull_time FROM system_settings;
bin/QC_gather_records.pl:256:select campaign_id from vicidial_campaigns where qc_enabled='Y' $CLIcampSQLc;
bin/QC_gather_records.pl:273:select group_id from vicidial_inbound_groups where qc_enabled='Y' $CLIcampSQLi;
bin/QC_gather_records.pl:301:select qc_statuses,qc_shift_id,shift_start_time from vicidial_inbound_groups,vicidial_shifts where group_id=?/* $ingroups[$i] */ and qc_shift_id=shift_id;
bin/QC_gather_records.pl:335:select qc_statuses,qc_shift_id,shift_start_time from vicidial_campaigns,vicidial_shifts where campaign_id=?/* $campaigns[$i] */ and qc_shift_id=shift_id;
bin/QC_gather_records.pl:384:SELECT closecallid,lead_id,campaign_id,call_date,length_in_sec,status,user,comments,user_group,term_reason,xfercallid from vicidial_closer_log where campaign_id IN($ingroupSQL) $dateSQL $VCLquerySQL $close_statusesSQL;
bin/QC_gather_records.pl:385:SELECT uniqueid,lead_id,campaign_id,call_date,length_in_sec,status,user,comments,user_group,term_reason from vicidial_log where campaign_id IN($campaignSQL) $dateSQL $VLquerySQL $pull_statusesSQL;
bin/QC_gather_records.pl:450:select count(*) from vicidial_qc_list where vicidial_id=?/* $vicidial_id[$i] */;
bin/QC_gather_records.pl:470:select vendor_lead_code,source_id,list_id,phone_code,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments from vicidial_list where lead_id=?/* $lead_id[$i] */;
bin/QC_gather_records.pl:507:select user from vicidial_xfer_log where xfercallid=?/* $xfercallid[$i] */ limit 1;
bin/QC_gather_records.pl:522:INSERT INTO vicidial_qc_list SET 
bin/QC_gather_records.pl:568:UPDATE system_settings SET qc_last_pull_time = ?/* $qc_this_pull_time */;
bin/AST_VDadapt.pl:308:INSERT IGNORE into vicidial_campaign_stats (campaign_id) select campaign_id from vicidial_campaigns;
bin/AST_VDadapt.pl:313:INSERT IGNORE into vicidial_campaign_stats_debug (campaign_id,server_ip) select campaign_id,'ADAPT' from vicidial_campaigns;
bin/AST_VDadapt.pl:319:SELECT cache_carrier_stats_realtime,ofcom_uk_drop_calc,call_quota_lead_ranking from system_settings;
bin/AST_VDadapt.pl:394:SELECT vd_server_logs,local_gmt FROM servers where server_ip=?/* $VARserver_ip */;
bin/AST_VDadapt.pl:454:SELECT campaign_id,lead_order,hopper_level,auto_dial_level,local_call_time,lead_filter_id,use_internal_dnc,dial_method,available_only_ratio_tally,adaptive_dropped_percentage,adaptive_maximum_level,adaptive_latest_server_time,adaptive_intensity,adaptive_dl_diff_target,UTC_TIMESTAMP(campaign_changedate),campaign_stats_refresh,campaign_allow_inbound,drop_rate_group,UTC_TIMESTAMP(campaign_calldate),realtime_agent_time_stats,available_only_tally_threshold,available_only_tally_threshold_agents,dial_level_threshold,dial_level_threshold_agents,ofcom_uk_drop_calc from vicidial_campaigns where campaign_id=?/* $CLIcampaign */
bin/AST_VDadapt.pl:458:SELECT campaign_id,lead_order,hopper_level,auto_dial_level,local_call_time,lead_filter_id,use_internal_dnc,dial_method,available_only_ratio_tally,adaptive_dropped_percentage,adaptive_maximum_level,adaptive_latest_server_time,adaptive_intensity,adaptive_dl_diff_target,UTC_TIMESTAMP(campaign_changedate),campaign_stats_refresh,campaign_allow_inbound,drop_rate_group,UTC_TIMESTAMP(campaign_calldate),realtime_agent_time_stats,available_only_tally_threshold,available_only_tally_threshold_agents,dial_level_threshold,dial_level_threshold_agents,ofcom_uk_drop_calc from vicidial_campaigns where ( (active='Y') or (campaign_stats_refresh='Y') )
bin/AST_VDadapt.pl:512:SELECT count(*) from vicidial_hopper where campaign_id=?/* $campaign_id[$i] */ and status='READY';
bin/AST_VDadapt.pl:527:SELECT count(*) from vicidial_live_agents where campaign_id=?/* $campaign_id[$i] */ and last_update_time > ?/* $VDL_one */;
bin/AST_VDadapt.pl:585:UPDATE vicidial_campaigns SET campaign_stats_refresh='N' where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDadapt.pl:619:UPDATE vicidial_campaigns SET campaign_stats_refresh='N' where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDadapt.pl:659:SELECT cache_carrier_stats_realtime,ofcom_uk_drop_calc from system_settings;
bin/AST_VDadapt.pl:686:SELECT count(*) from vicidial_inbound_callback_queue where icbq_status='LIVE';
bin/AST_VDadapt.pl:703:SELECT campaign_id FROM vicidial_campaigns where active='Y' and campaign_allow_inbound='Y';
bin/AST_VDadapt.pl:741:SELECT icbq_id,lead_id,icbq_date,group_id,call_date,queue_priority,icbq_phone_number,icbq_phone_code,UTC_TIMESTAMP(icbq_date) from vicidial_inbound_callback_queue where icbq_status='LIVE' order by queue_priority desc,call_date limit 1000;
bin/AST_VDadapt.pl:772:SELECT next_agent_call,queue_priority,active,dial_ingroup_cid,icbq_expiration_hours FROM vicidial_inbound_groups where group_id=?/* $ICBQgroup_id[$r] */;
bin/AST_VDadapt.pl:806:SELECT count(*) FROM vicidial_auto_calls where status = 'LIVE' and campaign_id=?/* $ICBQgroup_id[$r] */ and call_time < ?/* $ICBQcall_date[$r] */ and lead_id != ?/* $ICBQlead_id[$r] */ and queue_priority >= ?/* $ICBQqueue_priority[$r] */ $ADfindSQL;
bin/AST_VDadapt.pl:820:SELECT count(*) FROM vicidial_inbound_callback_queue where icbq_status IN('LIVE','SENDING') and group_id=?/* $ICBQgroup_id[$r] */ and call_date < ?/* $ICBQcall_date[$r] */ and lead_id != ?/* $ICBQlead_id[$r] */ and queue_priority >= ?/* $ICBQqueue_priority[$r] */;
bin/AST_VDadapt.pl:837:SELECT count(*) FROM vicidial_auto_calls where status = 'LIVE' and lead_id != ?/* $ICBQlead_id[$r] */ $ADfindSQL and ( (queue_priority > ?/* $ICBQqueue_priority[$r] */) or (queue_priority = ?/* $ICBQqueue_priority[$r] */ and call_time < ?/* $ICBQcall_date[$r] */) );
bin/AST_VDadapt.pl:851:SELECT count(*) FROM vicidial_inbound_callback_queue where icbq_status IN('LIVE','SENDING') and lead_id != ?/* $ICBQlead_id[$r] */ and ( (queue_priority > ?/* $ICBQqueue_priority[$r] */) or (queue_priority = ?/* $ICBQqueue_priority[$r] */ and call_date < ?/* $ICBQcall_date[$r] */) );
bin/AST_VDadapt.pl:872:SELECT distinct campaign_id FROM vicidial_auto_calls where status = 'LIVE' and lead_id != ?/* $ICBQlead_id[$r] */ $ADfindSQL and ( (queue_priority > ?/* $ICBQqueue_priority[$r] */) or (queue_priority = ?/* $ICBQqueue_priority[$r] */ and call_time < ?/* $ICBQcall_date[$r] */) );
bin/AST_VDadapt.pl:890:SELECT distinct group_id FROM vicidial_inbound_callback_queue where icbq_status IN('LIVE','SENDING') and lead_id != ?/* $ICBQlead_id[$r] */ $ADfindSQL and ( (queue_priority > ?/* $ICBQqueue_priority[$r] */) or (queue_priority = ?/* $ICBQqueue_priority[$r] */ and call_date < ?/* $ICBQcall_date[$r] */) );
bin/AST_VDadapt.pl:926:SELECT agent_grab from vicidial_auto_calls where agent_grab!='';
bin/AST_VDadapt.pl:941:LOCK TABLES vicidial_live_agents WRITE, vicidial_live_inbound_agents WRITE;
bin/AST_VDadapt.pl:947:SELECT distinct user from vicidial_live_inbound_agents where group_id IN($qp_groupWAIT_aco);
bin/AST_VDadapt.pl:975:SELECT vicidial_live_agents.user,vicidial_live_inbound_agents.group_grade,vicidial_live_agents.campaign_grade from vicidial_live_agents, vicidial_live_inbound_agents WHERE vicidial_live_agents.user=vicidial_live_inbound_agents.user and status IN('CLOSER','READY') and lead_id<1 $ADUfindSQL and vicidial_live_inbound_agents.group_id=?/* $ICBQgroup_id[$r] */ and last_update_time > ?/* $BDtsSQLdate */ and vicidial_live_agents.user NOT IN($vlia_users) and ring_callerid='' $qp_groupWAIT_camp_SQL limit 1000;
bin/AST_VDadapt.pl:1013:SELECT vicidial_live_agents.conf_exten,vicidial_live_agents.user,vicidial_live_agents.extension,vicidial_live_agents.server_ip,vicidial_live_inbound_agents.group_weight,ra_user,vicidial_live_agents.campaign_id,on_hook_agent,on_hook_ring_time,vicidial_live_inbound_agents.group_grade,vicidial_live_agents.campaign_grade from vicidial_live_agents, vicidial_live_inbound_agents WHERE vicidial_live_agents.user=?/* $userGRADEchosen */ and vicidial_live_agents.user NOT IN($routed_user_list'') and status IN('CLOSER','READY') limit 1;
bin/AST_VDadapt.pl:1041:SELECT vicidial_live_agents.conf_exten,vicidial_live_agents.user,vicidial_live_agents.extension,vicidial_live_agents.server_ip,vicidial_live_inbound_agents.group_weight,ra_user,vicidial_live_agents.campaign_id,on_hook_agent,on_hook_ring_time,vicidial_live_inbound_agents.group_grade,vicidial_live_agents.campaign_grade from vicidial_live_agents, vicidial_live_inbound_agents WHERE vicidial_live_agents.user=vicidial_live_inbound_agents.user and status IN('CLOSER','READY') and lead_id<1 $ADUfindSQL and vicidial_live_inbound_agents.group_id=?/* $ICBQgroup_id[$r] */ and last_update_time > ?/* $BDtsSQLdate */ and vicidial_live_agents.user NOT IN($routed_user_list$vlia_users) and ring_callerid='' $qp_groupWAIT_camp_SQL $agent_call_order limit 1;
bin/AST_VDadapt.pl:1069:LOCK TABLES vicidial_live_agents WRITE;
bin/AST_VDadapt.pl:1079:SELECT conf_exten,user,extension,server_ip,last_call_time,ra_user,campaign_id,on_hook_agent,on_hook_ring_time FROM vicidial_live_agents where status IN('CLOSER','READY') and lead_id<1 $ADUfindSQL and campaign_id IN($INBOUNDcampsSQL) and closer_campaigns LIKE \"% $SQL_group_id %\" and last_update_time > ?/* $BDtsSQLdate */ and user NOT IN($routed_user_list'') $qp_groupWAIT_SQL $qp_groupWAIT_camp_SQL $agent_call_order limit 1;
bin/AST_VDadapt.pl:1107:UPDATE vicidial_live_agents set external_dial=?/* $ICBQicbq_phone_number[$r]!$ICBQicbq_phone_code[$r]!NO!NO!NO!!$secX!!!$dial_ingroup_cid!!$ICBQlead_id[$r]!!$ICBQgroup_id[$r] */ where user=?/* $VDADuser */ and status IN('CLOSER','READY');
bin/AST_VDadapt.pl:1113:UPDATE vicidial_live_agents SET ring_callerid='' where ring_callerid=?/* $callerid */;
bin/AST_VDadapt.pl:1131:UNLOCK TABLES;
bin/AST_VDadapt.pl:1136:UPDATE vicidial_inbound_callback_queue SET icbq_status='SENDING' where icbq_id=?/* $ICBQicbq_id[$r] */;
bin/AST_VDadapt.pl:1145:UPDATE vicidial_inbound_callback_queue SET icbq_status='EXPIRED' where icbq_id=?/* $ICBQicbq_id[$r] */ and icbq_status!='SENT';
bin/AST_VDadapt.pl:1160:SELECT count(*) from vicidial_inbound_callback_queue where icbq_status='NEW';
bin/AST_VDadapt.pl:1181:SELECT count(*) from vicidial_inbound_callback_queue where icbq_status IN('NEW','LIVE','NOCALLTIME');
bin/AST_VDadapt.pl:1204:SELECT icbq_id,group_id,icbq_phone_number,icbq_phone_code,gmt_offset_now,icbq_status,lead_id from vicidial_inbound_callback_queue where icbq_status IN('NEW','LIVE','NOCALLTIME') order by group_id,call_date limit 1000;
bin/AST_VDadapt.pl:1230:SELECT icbq_call_time_id,icbq_dial_filter FROM vicidial_inbound_groups where group_id=?/* $ICBQgroup_id[$r] */;
bin/AST_VDadapt.pl:1258:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times,ct_holidays FROM vicidial_call_times where call_time_id=?/* $icbq_call_time_id */;
bin/AST_VDadapt.pl:1297:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($Gct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDadapt.pl:1443:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $ICBQicbq_phone_number[$r] */$alt_areacode);
bin/AST_VDadapt.pl:1458:SELECT list_id FROM vicidial_list where lead_id=?/* $ICBQlead_id[$r] */;
bin/AST_VDadapt.pl:1472:SELECT campaign_id FROM vicidial_lists where list_id=?/* $dnc_campaign_list */;
bin/AST_VDadapt.pl:1485:SELECT count(*) FROM vicidial_campaign_dnc where campaign_id=?/* $dnc_campaign */ and phone_number IN(?/* $ICBQicbq_phone_number[$r] */$alt_areacode);
bin/AST_VDadapt.pl:1514:UPDATE vicidial_inbound_callback_queue SET icbq_status=?/* $NEWstatus */ where icbq_id=?/* $ICBQicbq_id[$r] */ and icbq_status!='SENT';
bin/AST_VDadapt.pl:1547:SELECT count(*) from vicidial_inbound_callback_queue where icbq_status IN('SENDING') and modify_date < \"$BDtsSQLdate\
bin/AST_VDadapt.pl:1563:UPDATE vicidial_inbound_callback_queue SET icbq_status='ORPHAN' where icbq_status IN('SENDING') and modify_date < \"$BDtsSQLdate\
bin/AST_VDadapt.pl:1580:SELECT group_id from vicidial_inbound_groups where active='Y' and waiting_call_url_on!='' and waiting_call_url_off!='' and waiting_call_url_on IS NOT NULL and waiting_call_url_off IS NOT NULL order by group_id;
bin/AST_VDadapt.pl:1599:SELECT count(*) from vicidial_auto_calls where campaign_id IN($WCUlist) and status='LIVE';
bin/AST_VDadapt.pl:1619:SELECT waiting_call_url_on,waiting_call_url_off,count(*) from vicidial_inbound_groups where group_id IN($WCUlist) group by waiting_call_url_on,waiting_call_url_off;
bin/AST_VDadapt.pl:1640:SELECT group_id,waiting_call_count from vicidial_inbound_groups where waiting_call_url_on=?/* $WCUon[$wcu] */ and waiting_call_url_off=?/* $WCUoff[$wcu] */ order by group_id;
bin/AST_VDadapt.pl:1661:SELECT campaign_id,count(*) from vicidial_auto_calls where campaign_id IN($WCUlistNF) and status='LIVE' group by campaign_id order by campaign_id;
bin/AST_VDadapt.pl:1696:UPDATE vicidial_inbound_groups SET waiting_call_count=?/* $wcut_new */ where group_id=?/* $WCUgroupNF[$wcunf] */;
bin/AST_VDadapt.pl:1789:SELECT caller_code,lead_id,server_ip,call_date,uniqueid from vicidial_dial_log where call_date > ?/* $NBtsSQLdate */ and call_date < \"$NEtsSQLdate\
bin/AST_VDadapt.pl:1815:SELECT uniqueid from vicidial_log_extended where caller_code=?/* $Mcaller_code[$mvl] */ and lead_id=?/* $Mlead_id[$mvl] */;
bin/AST_VDadapt.pl:1829:UPDATE vicidial_dial_log SET uniqueid=?/* $VLEuniqueid */ where caller_code=?/* $Mcaller_code[$mvl] */ and lead_id=?/* $Mlead_id[$mvl] */ limit 1;
bin/AST_VDadapt.pl:1847:SELECT count(*) from vicidial_log where uniqueid LIKE ?/* $temp_uniquiid% */ and lead_id=?/* $Mlead_id[$mvl] */;
bin/AST_VDadapt.pl:1864:SELECT number_dialed,length_in_sec,end_time,end_epoch from call_log where uniqueid=?/* $Muniqueid[$mvl] */ limit 1;
bin/AST_VDadapt.pl:1881:SELECT list_id,status,phone_code,phone_number,alt_phone,address3,called_count from vicidial_list where lead_id=?/* $Mlead_id[$mvl] */ limit 1;
bin/AST_VDadapt.pl:1903:SELECT campaign_id from vicidial_lists where list_id=?/* $Llist_id */ limit 1;
bin/AST_VDadapt.pl:1925:INSERT INTO vicidial_log SET uniqueid=?/* $Muniqueid[$mvl] */,lead_id=?/* $Mlead_id[$mvl] */,campaign_id=?/* $Lcampaign_id */,call_date=?/* $Mend_time[$mvl] */,start_epoch=?/* $Mend_epoch[$mvl] */,status='NA',phone_code=?/* $Lphone_code */,phone_number=?/* $Lphone_number */,user='VDAD',processed='N',length_in_sec=0,end_epoch=?/* $Mend_epoch[$mvl] */,alt_dial=?/* $Lalt */,list_id=?/* $Llist_id */,called_count=?/* $Lcalled_count */,comments='AUTONA',term_reason='NONE';
bin/AST_VDadapt.pl:1930:INSERT INTO vicidial_log_extended set uniqueid=?/* $Muniqueid[$mvl] */,server_ip=?/* $Mserver_ip[$mvl] */,call_date=?/* $Mend_time[$mvl] */,lead_id = ?/* $Mlead_id[$mvl] */,caller_code=?/* $Mcaller_code[$mvl] */,custom_call_id='';
bin/AST_VDadapt.pl:1936:UPDATE vicidial_list set status='NA' where lead_id=?/* $Mlead_id[$mvl] */;
bin/AST_VDadapt.pl:1944:SELECT call_quota_lead_ranking from vicidial_campaigns where campaign_id=?/* $Lcampaign_id */ limit 1;
bin/AST_VDadapt.pl:2047:UPDATE vicidial_campaign_stats_debug SET entry_time=?/* $now_date */,adapt_output=?/* $adaptive_string */ where campaign_id=?/* $campaign_id[$i] */ and server_ip='ADAPT';
bin/AST_VDadapt.pl:2110:SELECT count(*) from system_settings where timeclock_end_of_day LIKE \"%$current_hourmin%\
bin/AST_VDadapt.pl:2151:SELECT count(*),status from vicidial_live_agents where campaign_id=?/* $campaign_id[$i] */ and last_update_time > ?/* $VDL_one */ group by status;
bin/AST_VDadapt.pl:2167:SELECT count(*) FROM vicidial_auto_calls where campaign_id=?/* $campaign_id[$i] */ and status IN('LIVE');
bin/AST_VDadapt.pl:2208:SELECT count(*) from vicidial_live_agents where campaign_id=?/* $campaign_id[$i] */ and last_update_time > ?/* $VDL_one */ and extension LIKE \"R/%\
bin/AST_VDadapt.pl:2248:SELECT status from vicidial_statuses where human_answered='Y';
bin/AST_VDadapt.pl:2261:SELECT status from vicidial_campaign_statuses where campaign_id=?/* $campaign_id[$i] */ and human_answered='Y';
bin/AST_VDadapt.pl:2284:SELECT status from vicidial_statuses where answering_machine='Y';
bin/AST_VDadapt.pl:2297:SELECT status from vicidial_campaign_statuses where campaign_id=?/* $campaign_id[$i] */ and answering_machine='Y';
bin/AST_VDadapt.pl:2350:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_one */;
bin/AST_VDadapt.pl:2365:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_one */ and status IN($camp_ANS_STAT_SQL);
bin/AST_VDadapt.pl:2377:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_one */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:2424:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_current_hour_date */;
bin/AST_VDadapt.pl:2436:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_current_hour_date */,type='CALLS',next_hour=?/* $VL_next_hour_date */,last_update=NOW(),calls=?/* $VL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_current_hour_calls */;
bin/AST_VDadapt.pl:2444:SELECT count(*) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='CALLS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2460:SELECT sum(calls) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='CALLS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2480:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='CALLS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:2517:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_today $j:00:00 */ and call_date < ?/* $VL_today $j_next:00:00 */;
bin/AST_VDadapt.pl:2530:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_today $j:00:00 */,type='CALLS',next_hour=?/* $VL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_this_hour_calls */;
bin/AST_VDadapt.pl:2549:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VDL_date */;
bin/AST_VDadapt.pl:2569:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_current_hour_date */ and status IN($camp_ANS_STAT_SQL);
bin/AST_VDadapt.pl:2581:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_current_hour_date */,type='ANSWERS',next_hour=?/* $VL_next_hour_date */,last_update=NOW(),calls=?/* $VL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_current_hour_calls */;
bin/AST_VDadapt.pl:2589:SELECT count(*) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='ANSWERS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2605:SELECT sum(calls) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='ANSWERS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2625:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='ANSWERS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:2662:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_today $j:00:00 */ and call_date < ?/* $VL_today $j_next:00:00 */ and status IN($camp_ANS_STAT_SQL);
bin/AST_VDadapt.pl:2675:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_today $j:00:00 */,type='ANSWERS',next_hour=?/* $VL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_this_hour_calls */;
bin/AST_VDadapt.pl:2694:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VDL_date */ and status IN($camp_ANS_STAT_SQL);
bin/AST_VDadapt.pl:2711:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_current_hour_date */ and status IN($camp_AM_STAT_SQL) and user != 'VDAD';
bin/AST_VDadapt.pl:2723:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_current_hour_date */,type='MACHINES',next_hour=?/* $VL_next_hour_date */,last_update=NOW(),calls=?/* $VL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_current_hour_calls */;
bin/AST_VDadapt.pl:2731:SELECT count(*) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='MACHINES' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2747:SELECT sum(calls) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='MACHINES' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2767:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='MACHINES' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:2804:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_today $j:00:00 */ and call_date < ?/* $VL_today $j_next:00:00 */ and status IN($camp_AM_STAT_SQL) and user != 'VDAD';
bin/AST_VDadapt.pl:2817:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_today $j:00:00 */,type='MACHINES',next_hour=?/* $VL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_this_hour_calls */;
bin/AST_VDadapt.pl:2836:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VDL_date */ and status IN($camp_AM_STAT_SQL) and user != 'VDAD';
bin/AST_VDadapt.pl:2853:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_current_hour_date */ and status IN($camp_ANS_STAT_SQL) and user != 'VDAD';
bin/AST_VDadapt.pl:2865:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_current_hour_date */,type='AGENTS',next_hour=?/* $VL_next_hour_date */,last_update=NOW(),calls=?/* $VL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_current_hour_calls */;
bin/AST_VDadapt.pl:2873:SELECT count(*) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='AGENTS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2889:SELECT sum(calls) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='AGENTS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:2909:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='AGENTS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:2946:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_today $j:00:00 */ and call_date < ?/* $VL_today $j_next:00:00 */ and status IN($camp_ANS_STAT_SQL) and user != 'VDAD';
bin/AST_VDadapt.pl:2959:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_today $j:00:00 */,type='AGENTS',next_hour=?/* $VL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_this_hour_calls */;
bin/AST_VDadapt.pl:2978:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VDL_date */ and status IN($camp_ANS_STAT_SQL) and user != 'VDAD';
bin/AST_VDadapt.pl:2995:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_current_hour_date */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:3007:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_current_hour_date */,type='DROPS',next_hour=?/* $VL_next_hour_date */,last_update=NOW(),calls=?/* $VL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_current_hour_calls */;
bin/AST_VDadapt.pl:3015:SELECT count(*) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='DROPS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:3031:SELECT sum(calls) from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='DROPS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:3051:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_campaign_hour_counts where campaign_id=?/* $campaign_id[$i] */ and type='DROPS' and date_hour >= ?/* $VL_day_start_date */ and date_hour < ?/* $VL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:3088:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VL_today $j:00:00 */ and call_date < ?/* $VL_today $j_next:00:00 */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:3100:INSERT IGNORE INTO vicidial_campaign_hour_counts SET campaign_id=?/* $campaign_id[$i] */,date_hour=?/* $VL_today $j:00:00 */,type='DROPS',next_hour=?/* $VL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VL_this_hour_calls */;
bin/AST_VDadapt.pl:3119:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VDL_date */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:3184:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_hour */;
bin/AST_VDadapt.pl:3198:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_hour */ and status IN($camp_ANS_STAT_SQL);
bin/AST_VDadapt.pl:3210:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_hour */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:3229:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_halfhour */;
bin/AST_VDadapt.pl:3243:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_halfhour */ and status IN($camp_ANS_STAT_SQL);
bin/AST_VDadapt.pl:3255:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_halfhour */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:3273:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_five */;
bin/AST_VDadapt.pl:3287:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_five */ and status IN($camp_ANS_STAT_SQL);
bin/AST_VDadapt.pl:3299:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date > ?/* $VDL_five */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:3321:SELECT vsc_id from vicidial_status_categories where tovdad_display='Y' limit 4;
bin/AST_VDadapt.pl:3341:SELECT status from vicidial_statuses where category=?/* $VSCcategory */;
bin/AST_VDadapt.pl:3355:SELECT status from vicidial_campaign_statuses where category=?/* $VSCcategory */ and campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDadapt.pl:3372:SELECT count(*) from $vicidial_log where campaign_id=?/* $campaign_id[$i] */ and call_date >= ?/* $VDL_date */ and status IN($CATstatusesSQL);
bin/AST_VDadapt.pl:3397:SELECT sum(wait_sec + talk_sec + dispo_sec) from vicidial_agent_log where campaign_id=?/* $campaign_id[$i] */ and event_time > ?/* $VDL_date */;
bin/AST_VDadapt.pl:3412:SELECT count(*) from vicidial_auto_calls where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDadapt.pl:3428:SELECT drops_answers_today_pct,calls_today,answers_today,drops_today,answering_machines_today,agenthandled_today from vicidial_drop_rate_groups where group_id=?/* $drop_rate_group[$i] */;
bin/AST_VDadapt.pl:3445:SELECT sum(pause_sec),sum(wait_sec),sum(talk_sec) - sum(dead_sec) as custtalk,sum(dispo_sec) + sum(dead_sec) as acw from vicidial_agent_log where event_time > ?/* $VDL_date */ and campaign_id=?/* $campaign_id[$i] */ and pause_sec < 65000 and wait_sec < 65000 and talk_sec < 65000 and dispo_sec < 65000 and dead_sec < 65000;
bin/AST_VDadapt.pl:3461:SELECT count(*) from vicidial_agent_log where event_time > ?/* $VDL_date */ and campaign_id=?/* $campaign_id[$i] */ and lead_id > 0;
bin/AST_VDadapt.pl:3475:UPDATE vicidial_campaign_stats SET calls_today=?/* $VCScalls_today[$i] */,answers_today=?/* $VCSanswers_today[$i] */,drops_today=?/* $VCSdrops_today[$i] */,drops_today_pct=?/* $VCSdrops_today_pct[$i] */,drops_answers_today_pct=?/* $VCSdrops_answers_today_pct[$i] */,calls_hour=?/* $VCScalls_hour[$i] */,answers_hour=?/* $VCSanswers_hour[$i] */,drops_hour=?/* $VCSdrops_hour[$i] */,drops_hour_pct=?/* $VCSdrops_hour_pct[$i] */,calls_halfhour=?/* $VCScalls_halfhour[$i] */,answers_halfhour=?/* $VCSanswers_halfhour[$i] */,drops_halfhour=?/* $VCSdrops_halfhour[$i] */,drops_halfhour_pct=?/* $VCSdrops_halfhour_pct[$i] */,calls_fivemin=?/* $VCScalls_five[$i] */,answers_fivemin=?/* $VCSanswers_five[$i] */,drops_fivemin=?/* $VCSdrops_five[$i] */,drops_fivemin_pct=?/* $VCSdrops_five_pct[$i] */,calls_onemin=?/* $VCScalls_one[$i] */,answers_onemin=?/* $VCSanswers_one[$i] */,drops_onemin=?/* $VCSdrops_one[$i] */,drops_onemin_pct=?/* $VCSdrops_one_pct[$i] */,agent_non_pause_sec=?/* $VCSagent_nonpause_time[$i] */,agent_calls_today=?/* $VCSagent_calls_today[$i] */,agent_pause_today=?/* $VCSagent_pause_today[$i] */,agent_wait_today=?/* $VCSagent_wait_today[$i] */,agent_custtalk_today=?/* $VCSagent_custtalk_today[$i] */,agent_acw_today=?/* $VCSagent_acw_today[$i] */,answering_machines_today=?/* $VCSam_today[$i] */,agenthandled_today=?/* $VCSagenthandled_today[$i] */,$VSCupdateSQL where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDadapt.pl:3480:UPDATE vicidial_campaign_stats_debug SET entry_time=?/* $now_date */,debug_output=?/* $debug_camp_output */ where campaign_id=?/* $campaign_id[$i] */ and server_ip='ADAPT';
bin/AST_VDadapt.pl:3491:SELECT max_outbound,max_agents,max_remote_agents,total_calls from vicidial_daily_max_stats where campaign_id=?/* $campaign_id[$i] */ and stats_type='CAMPAIGN' and stats_flag='OPEN' order by update_time desc limit 1;
bin/AST_VDadapt.pl:3515:UPDATE vicidial_daily_max_stats SET update_time=NOW()$update_SQL where campaign_id=?/* $campaign_id[$i] */ and stats_type='CAMPAIGN' and stats_flag='OPEN';
bin/AST_VDadapt.pl:3524:INSERT INTO vicidial_daily_max_stats SET stats_date=?/* $file_date */,update_time=NOW(),max_outbound=?/* $VCSlive_calls[$i] */,max_agents=?/* $total_agents[$i] */,max_remote_agents=?/* $total_remote_agents[$i] */,total_calls=?/* $VCScalls_today[$i] */,campaign_id=?/* $campaign_id[$i] */,stats_type='CAMPAIGN',stats_flag='OPEN';
bin/AST_VDadapt.pl:3543:SELECT group_id from vicidial_drop_rate_groups;
bin/AST_VDadapt.pl:3566:SELECT count(*),sum(calls_today),sum(answers_today),sum(drops_today),sum(answering_machines_today),sum(agenthandled_today) from vicidial_campaign_stats vcs, vicidial_campaigns vc where vcs.campaign_id=vc.campaign_id and vc.drop_rate_group=?/* $DRgroup[$dr] */;
bin/AST_VDadapt.pl:3609:UPDATE vicidial_drop_rate_groups SET calls_today=?/* $DRcalls_today */,answers_today=?/* $DRanswers_today */,drops_today=?/* $DRdrops_today */,drops_today_pct=?/* $DRdrops_today_pct */,drops_answers_today_pct=?/* $DRdrops_answers_today_pct */,answering_machines_today=?/* $DRanswering_machines_today */,agenthandled_today=?/* $DRagenthandled_today */ where group_id=?/* $DRgroup[$dr] */;
bin/AST_VDadapt.pl:3613:UPDATE vicidial_campaign_stats vcs, vicidial_campaigns vc SET vcs.drops_answers_today_pct=?/* $DRdrops_answers_today_pct */  where vcs.campaign_id=vc.campaign_id and vc.drop_rate_group=?/* $DRgroup[$dr] */;
bin/AST_VDadapt.pl:3633:SELECT server_ip from servers where active_asterisk_server='Y';
bin/AST_VDadapt.pl:3649:SELECT count(*) from live_sip_channels where server_ip IN($serversSQL);
bin/AST_VDadapt.pl:3661:SELECT count(*) from live_channels where server_ip IN($serversSQL);
bin/AST_VDadapt.pl:3674:SELECT count(*) from live_channels where channel NOT LIKE \"%pseudo%\" and server_ip IN($serversSQL);
bin/AST_VDadapt.pl:3686:SELECT count(*) from vicidial_auto_calls where call_type='IN' and server_ip IN($serversSQL);
bin/AST_VDadapt.pl:3698:SELECT count(*) from vicidial_auto_calls where call_type IN('OUT','OUTBALANCE') and server_ip IN($serversSQL);
bin/AST_VDadapt.pl:3710:SELECT count(*) from vicidial_live_agents where last_update_time > ?/* $VDL_one */ and server_ip IN($serversSQL);
bin/AST_VDadapt.pl:3722:SELECT count(*) from vicidial_live_agents where last_update_time > ?/* $VDL_one */ and extension LIKE \"R/%\" and server_ip IN($serversSQL);
bin/AST_VDadapt.pl:3739:SELECT max_channels,max_calls,max_inbound,max_outbound,max_agents,max_remote_agents from vicidial_daily_max_stats where campaign_id='' and stats_type='TOTAL' and stats_flag='OPEN' order by update_time desc limit 1;
bin/AST_VDadapt.pl:3770:UPDATE vicidial_daily_max_stats SET update_time=NOW()$update_SQL where campaign_id='' and stats_type='TOTAL' and stats_flag='OPEN';
bin/AST_VDadapt.pl:3779:INSERT INTO vicidial_daily_max_stats SET stats_date=?/* $file_date */,update_time=NOW(),max_channels=?/* $tc_count */,max_calls=?/* $tcalls_count */,max_inbound=?/* $incalls_count */,max_outbound=?/* $outcalls_count */,max_agents=?/* $live_agents */,max_remote_agents=?/* $live_remote_agents */,campaign_id='',stats_type='TOTAL',stats_flag='OPEN';
bin/AST_VDadapt.pl:3918:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $CL_current_hour_date */ group by dialstatus;
bin/AST_VDadapt.pl:3937:INSERT IGNORE INTO vicidial_carrier_hour_counts SET date_hour=?/* $CL_current_hour_date */,type=?/* $cTFhour_status[$ctp] */,next_hour=?/* $CL_next_hour_date */,last_update=NOW(),calls=?/* $cTFhour_count[$ctp] */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $cTFhour_count[$ctp] */;
bin/AST_VDadapt.pl:3944:INSERT IGNORE INTO vicidial_carrier_hour_counts SET date_hour=?/* $CL_current_hour_date */,type='ANSWER',next_hour=?/* $CL_next_hour_date */,last_update=NOW(),calls='0',hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls='0';
bin/AST_VDadapt.pl:3962:SELECT count(distinct hr) from vicidial_carrier_hour_counts where date_hour >= ?/* $sCL_first_hour_date */ and date_hour < ?/* $CL_next_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4004:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $sCL_start_hour_date */ and call_date < ?/* $sCL_next_hour_date */ group by dialstatus;
bin/AST_VDadapt.pl:4023:INSERT IGNORE INTO vicidial_carrier_hour_counts SET date_hour=?/* $sCL_start_hour_date */,type=?/* $cTFhour_status[$ctp] */,next_hour=?/* $sCL_next_hour_date */,last_update=NOW(),calls=?/* $cTFhour_count[$ctp] */,hr=?/* $cSHhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $cTFhour_count[$ctp] */;
bin/AST_VDadapt.pl:4030:INSERT IGNORE INTO vicidial_carrier_hour_counts SET date_hour=?/* $sCL_start_hour_date */,type='ANSWER',next_hour=?/* $sCL_next_hour_date */,last_update=NOW(),calls='0',hr=?/* $cSHhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls='0';
bin/AST_VDadapt.pl:4047:SELECT type,sum(calls) from vicidial_carrier_hour_counts where date_hour >= ?/* $sCL_first_hour_date */ and date_hour < ?/* $CL_next_hour_date */ group by type;
bin/AST_VDadapt.pl:4067:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $timeTWENTYFOURhoursAGO */ group by dialstatus;
bin/AST_VDadapt.pl:4117:SELECT type,sum(calls) from vicidial_carrier_hour_counts where date_hour >= ?/* $sxCL_first_hour_date */ and date_hour < ?/* $CL_next_hour_date */ group by type;
bin/AST_VDadapt.pl:4144:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $timeSIXhoursAGO */ group by dialstatus;
bin/AST_VDadapt.pl:4168:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $timeONEhourAGO */ group by dialstatus;
bin/AST_VDadapt.pl:4189:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $timeFIFTEENminutesAGO */ group by dialstatus;
bin/AST_VDadapt.pl:4210:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $timeFIVEminutesAGO */ group by dialstatus;
bin/AST_VDadapt.pl:4231:SELECT dialstatus,count(*) from vicidial_carrier_log where call_date >= ?/* $timeONEminuteAGO */ group by dialstatus;
bin/AST_VDadapt.pl:4316:INSERT IGNORE INTO vicidial_html_cache_stats SET stats_type='carrier_stats',stats_id='ALL',stats_date=NOW(),stats_count=?/* $TFhour_total */,stats_html=?/* $CARRIERstatsHTML */ ON DUPLICATE KEY UPDATE stats_date=NOW(),stats_count=?/* $TFhour_total */,stats_html=\"$CARRIERstatsHTML\
bin/AST_VDadapt.pl:4329:SELECT group_id from vicidial_inbound_groups where active='Y';
bin/AST_VDadapt.pl:4366:SELECT answer_sec_pct_rt_stat_one,answer_sec_pct_rt_stat_two from vicidial_inbound_groups where group_id=?/* $group_id[$p] */;
bin/AST_VDadapt.pl:4380:SELECT status from vicidial_statuses where human_answered='Y';
bin/AST_VDadapt.pl:4393:SELECT distinct(status) from vicidial_campaign_statuses where human_answered='Y';
bin/AST_VDadapt.pl:4430:SELECT count(*) from vicidial_auto_calls where campaign_id=?/* $group_id[$p] */;
bin/AST_VDadapt.pl:4442:SELECT count(*) from vicidial_live_agents where closer_campaigns LIKE \"% $SQL_group_id %\" and last_update_time > ?/* $VDL_one */;
bin/AST_VDadapt.pl:4453:SELECT count(*) from vicidial_live_agents where closer_campaigns LIKE \"% $SQL_group_id %\" and last_update_time > ?/* $VDL_one */ and extension LIKE \"R/%\
bin/AST_VDadapt.pl:4494:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */;
bin/AST_VDadapt.pl:4506:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='CALLS',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:4514:SELECT count(*) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='CALLS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4530:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='CALLS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4550:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='CALLS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:4587:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */;
bin/AST_VDadapt.pl:4600:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='CALLS',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:4619:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */;
bin/AST_VDadapt.pl:4638:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */ and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:4650:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='ANSWERS',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:4658:SELECT count(*) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='ANSWERS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4674:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='ANSWERS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4694:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='ANSWERS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:4731:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */ and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:4744:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='ANSWERS',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:4763:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */ and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:4780:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:4792:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='DROPS',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:4800:SELECT count(*) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='DROPS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4816:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='DROPS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4836:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='DROPS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:4873:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:4886:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='DROPS',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:4905:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:4932:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */ and queue_seconds <= $answer_sec_pct_rt_stat_one and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:4944:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='HOLDSEC1',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:4952:SELECT count(*) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HOLDSEC1' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4968:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HOLDSEC1' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:4988:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HOLDSEC1' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:5025:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */ and queue_seconds <= $answer_sec_pct_rt_stat_one and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5038:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='HOLDSEC1',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:5057:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */ and queue_seconds <= $answer_sec_pct_rt_stat_one and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5073:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */ and queue_seconds <= $answer_sec_pct_rt_stat_two and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5085:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='HOLDSEC2',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:5093:SELECT count(*) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HOLDSEC2' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5109:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HOLDSEC2' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5129:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HOLDSEC2' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:5166:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */ and queue_seconds <= $answer_sec_pct_rt_stat_two and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5179:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='HOLDSEC2',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:5198:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */ and queue_seconds <= $answer_sec_pct_rt_stat_two and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5215:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */ and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5227:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='HDSECANS',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:5235:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECANS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5251:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECANS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5271:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECANS' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:5308:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */ and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5321:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='HDSECANS',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:5340:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */ and status NOT IN('DROP','XDROP','HXFER','QVMAIL','HOLDTO','LIVE','QUEUE','TIMEOT','AFTHRS','NANQUE','INBND','MAXCAL');
bin/AST_VDadapt.pl:5358:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:5370:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='HDSECDRP',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:5378:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECDRP' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5394:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECDRP' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5414:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECDRP' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:5451:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:5464:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='HDSECDRP',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:5483:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */ and status IN('DROP','XDROP');
bin/AST_VDadapt.pl:5501:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */;
bin/AST_VDadapt.pl:5513:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='HDSECALL',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:5521:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECALL' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5537:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECALL' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5557:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='HDSECALL' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:5594:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */;
bin/AST_VDadapt.pl:5607:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='HDSECALL',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:5626:SELECT sum(queue_seconds) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */;
bin/AST_VDadapt.pl:5645:SELECT vsc_id from vicidial_status_categories where tovdad_display='Y' limit 4;
bin/AST_VDadapt.pl:5665:SELECT status from vicidial_statuses where category=?/* $VSCcategory */;
bin/AST_VDadapt.pl:5679:SELECT status from vicidial_campaign_statuses where category=?/* $VSCcategory */;
bin/AST_VDadapt.pl:5700:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_current_hour_date */ and status IN($CATstatusesSQL);
bin/AST_VDadapt.pl:5712:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_current_hour_date */,type='C_$VSCcategory',next_hour=?/* $VCL_next_hour_date */,last_update=NOW(),calls=?/* $VCL_current_hour_calls */,hr=?/* $HRhour_test */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_current_hour_calls */;
bin/AST_VDadapt.pl:5720:SELECT count(*) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='C_$VSCcategory' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5736:SELECT sum(calls) from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='C_$VSCcategory' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour;
bin/AST_VDadapt.pl:5756:SELECT hr,date_hour,next_hour,last_update,calls from vicidial_ingroup_hour_counts where group_id=?/* $group_id[$p] */ and type='C_$VSCcategory' and date_hour >= ?/* $VCL_day_start_date */ and date_hour < ?/* $VCL_current_hour_date */ and last_update > next_hour order by hr;
bin/AST_VDadapt.pl:5793:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date >= ?/* $VCL_today $j:00:00 */ and call_date < ?/* $VCL_today $j_next:00:00 */ and status IN($CATstatusesSQL);
bin/AST_VDadapt.pl:5806:INSERT IGNORE INTO vicidial_ingroup_hour_counts SET group_id=?/* $group_id[$p] */,date_hour=?/* $VCL_today $j:00:00 */,type='C_$VSCcategory',next_hour=?/* $VCL_today $j_next:00:00 */,last_update=NOW(),calls=?/* $VCL_this_hour_calls */,hr=?/* $j */ ON DUPLICATE KEY UPDATE last_update=NOW(),calls=?/* $VCL_this_hour_calls */;
bin/AST_VDadapt.pl:5825:SELECT count(*) from $vicidial_closer_log where campaign_id=?/* $group_id[$p] */ and call_date > ?/* $VDL_date */ and status IN($CATstatusesSQL);
bin/AST_VDadapt.pl:5851:SELECT count(*) from vicidial_campaign_stats where campaign_id=?/* $group_id[$p] */;
bin/AST_VDadapt.pl:5864:INSERT INTO vicidial_campaign_stats (campaign_id) values(?/* $group_id[$p] */);
bin/AST_VDadapt.pl:5869:UPDATE vicidial_campaign_stats SET calls_today=?/* $iVCScalls_today[$p] */,answers_today=?/* $iVCSanswers_today[$p] */,drops_today=?/* $iVCSdrops_today[$p] */,drops_today_pct=?/* $iVCSdrops_today_pct[$p] */,drops_answers_today_pct=?/* $iVCSdrops_answers_today_pct[$p] */,hold_sec_stat_one=?/* $answer_sec_pct_rt_stat_one_PCT[$p] */,hold_sec_stat_two=?/* $answer_sec_pct_rt_stat_two_PCT[$p] */,hold_sec_answer_calls=?/* $hold_sec_answer_calls[$p] */,hold_sec_drop_calls=?/* $hold_sec_drop_calls[$p] */,hold_sec_queue_calls=?/* $hold_sec_queue_calls[$p] */,$VSCupdateSQL where campaign_id=?/* $group_id[$p] */;
bin/AST_VDadapt.pl:5879:INSERT IGNORE INTO vicidial_campaign_stats_debug SET server_ip='INBOUND',campaign_id=?/* $group_id[$p] */,entry_time=?/* $now_date */,debug_output=?/* $debug_ingroup_output */ ON DUPLICATE KEY UPDATE entry_time=?/* $now_date */,debug_output=?/* $debug_ingroup_output */;
bin/AST_VDadapt.pl:5889:SELECT max_inbound,max_agents,max_remote_agents,total_calls from vicidial_daily_max_stats where campaign_id=?/* $group_id[$p] */ and stats_type='INGROUP' and stats_flag='OPEN' order by update_time desc limit 1;
bin/AST_VDadapt.pl:5913:UPDATE vicidial_daily_max_stats SET update_time=NOW()$update_SQL where campaign_id=?/* $group_id[$p] */ and stats_type='INGROUP' and stats_flag='OPEN';
bin/AST_VDadapt.pl:5922:INSERT INTO vicidial_daily_max_stats SET stats_date=?/* $file_date */,update_time=NOW(),max_inbound=?/* $iVCSlive_calls[$p] */,max_agents=?/* $itotal_agents[$p] */,max_remote_agents=?/* $itotal_remote_agents[$p] */,total_calls=?/* $iVCScalls_today[$p] */,campaign_id=?/* $group_id[$p] */,stats_type='INGROUP',stats_flag='OPEN';
bin/AST_VDadapt.pl:5949:SELECT count(*),status from vicidial_live_agents where campaign_id=?/* $campaign_id[$i] */ and last_update_time > ?/* $VDL_one */ group by status;
bin/AST_VDadapt.pl:5998:SELECT differential_onemin,agents_average_onemin from vicidial_campaign_stats where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDadapt.pl:6162:UPDATE vicidial_campaigns SET auto_dial_level=?/* $intensity_dial_level[$i] */ where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDadapt.pl:6181:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $VD_call_quota_lead_ranking */;
bin/AST_VDadapt.pl:6331:SELECT list_id,called_count,rank FROM vicidial_list where lead_id=?/* $CIDlead_id */;
bin/AST_VDadapt.pl:6360:SELECT call_date from vicidial_dial_log where lead_id=?/* $CIDlead_id */ and call_date > ?/* $CQSQLdate */ and caller_code LIKE \"%$CIDlead_id\" order by call_date desc limit 1;
bin/AST_VDadapt.pl:6429:SELECT first_call_date,UTC_TIMESTAMP(first_call_date),last_call_date from vicidial_lead_call_quota_counts where lead_id=?/* $CIDlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDadapt.pl:6458:UPDATE vicidial_lead_call_quota_counts SET last_call_date=?/* $VDLcall_datetime */,status=?/* $temp_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() $session_updateSQL $day_updateSQL where lead_id=?/* $CIDlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDadapt.pl:6463:UPDATE vicidial_lead_call_quota_counts SET status=?/* $temp_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() where lead_id=?/* $CIDlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDadapt.pl:6471:INSERT INTO vicidial_lead_call_quota_counts SET lead_id=?/* $CIDlead_id */,list_id=?/* $VLlist_id */,first_call_date=?/* $VDLcall_datetime */,last_call_date=?/* $VDLcall_datetime */,status=?/* $temp_status */,called_count=?/* $VLcalled_count */,day_one_calls='1',rank=?/* $tempVLrank */,modify_date=NOW() $session_newSQL;
bin/AST_VDadapt.pl:6479:UPDATE vicidial_list SET rank='0' where lead_id=?/* $CIDlead_id */;
bin/AST_droplist_process.pl:181:SELECT enable_drop_lists FROM system_settings;
bin/AST_droplist_process.pl:201:SELECT local_gmt FROM servers where server_ip = ?/* $server_ip */;
bin/AST_droplist_process.pl:217:SELECT closer_campaigns,drop_statuses,duplicate_check,list_id,dl_minutes from vicidial_drop_lists where dl_id=?/* $dl_id */;
bin/AST_droplist_process.pl:272:SELECT user from vicidial_admin_log where event_section='DROPLISTS' and record_id=?/* $dl_id */ and event_type IN('ADD','MODIFY','COPY','DELETE') order by admin_log_id desc limit 1;
bin/AST_droplist_process.pl:295:SELECT campaign_id from vicidial_lists where list_id=?/* $list_id */;
bin/AST_droplist_process.pl:308:SELECT list_id from vicidial_lists where campaign_id=?/* $list_campaign_id */;
bin/AST_droplist_process.pl:338:UPDATE vicidial_drop_log set drop_processed='U' where drop_processed='N' $drop_dateSQL $closer_campaignsSQL $drop_statusesSQL;
bin/AST_droplist_process.pl:342:SELECT lead_id,drop_date,phone_code,phone_number,campaign_id,status,uniqueid from vicidial_drop_log where drop_processed='U' $drop_dateSQL $closer_campaignsSQL $drop_statusesSQL order by drop_date;
bin/AST_droplist_process.pl:367:SELECT group_name from vicidial_inbound_groups where group_id=?/* $Acampaign_id[$q] */;
bin/AST_droplist_process.pl:382:SELECT count(*) from vicidial_list where phone_number=?/* $Aphone_number[$q] */ $duplicate_checkSQL;
bin/AST_droplist_process.pl:400:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $Aphone_code[$q] */ and areacode=?/* $USarea */;
bin/AST_droplist_process.pl:420:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $Aphone_code[$q] */ and areacode=?/* $USarea */;
bin/AST_droplist_process.pl:440:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $Aphone_code[$q] */ and state=?/* $state */;
bin/AST_droplist_process.pl:460:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $Aphone_code[$q] */;
bin/AST_droplist_process.pl:574:SELECT vendor_lead_code,source_id,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,rank,owner from vicidial_list where lead_id=?/* $Alead_id[$q] */;
bin/AST_droplist_process.pl:614:INSERT INTO vicidial_list set entry_date=NOW(),user='',phone_number=?/* $Aphone_number[$q] */,phone_code=?/* $Aphone_code[$q] */,list_id=?/* $list_id */,last_local_call_time=?/* $Adrop_date[$q] */,status='NEW',called_since_last_reset='N',gmt_offset_now=?/* $gmt_offset */,vendor_lead_code=?/* $vendor_lead_code */,source_id=?/* $source_id */,title=?/* $title */,first_name=?/* $first_name */,middle_initial=?/* $middle_initial */,last_name=?/* $last_name */,address1=?/* $address1 */,address2=?/* $address2 */,address3=?/* $address3 */,city=?/* $city */,state=?/* $state */,province=?/* $province */,postal_code=?/* $postal_code */,country_code=?/* $country_code */,gender=?/* $gender */,date_of_birth=?/* $date_of_birth */,alt_phone=?/* $alt_phone */,email=?/* $email */,security_phrase=?/* $security_phrase */,comments=?/* $comments */,rank=?/* $rank */,owner=?/* $owner */;
bin/AST_droplist_process.pl:626:UPDATE vicidial_drop_log set drop_processed='Y' where drop_processed='U' and drop_date=?/* $Adrop_date[$q] */ and uniqueid=?/* $Auniqueid[$q] */;
bin/AST_droplist_process.pl:638:UPDATE vicidial_drop_lists set last_run=NOW(),run_now_trigger='N' where dl_id=?/* $dl_id */;
bin/AST_droplist_process.pl:645:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $http_user */, ip_address=?/* $server_ip */, event_section='DROPLISTS', event_type='EXPORT', record_id=?/* $dl_id */, event_code='ADMIN DROP LIST RUN', event_sql=?/* $SQL_log */, event_notes='Run time: $secRUN seconds. INSERTS: $insert_counter DUPLICATES: $duplicate_counter TOTAL: $q';
bin/Vtiger_IN_new_accounts_file.pl:266:SELECT use_non_latin,vtiger_server_ip,vtiger_dbname,vtiger_login,vtiger_pass FROM system_settings;
bin/Vtiger_IN_new_accounts_file.pl:519:SELECT count(*) from vtiger_account where phone=?/* $phone_number */;
bin/Vtiger_IN_new_accounts_file.pl:534:SELECT count(*) from vtiger_account where siccode=?/* $sic_code */;
bin/Vtiger_IN_new_accounts_file.pl:549:SELECT count(*) from vtiger_account where website=?/* $website */;
bin/Vtiger_IN_new_accounts_file.pl:567:SELECT id from vtiger_users where user_name=?/* $user */;
bin/Vtiger_IN_new_accounts_file.pl:580:SELECT id from vtiger_crmentity_seq;
bin/Vtiger_IN_new_accounts_file.pl:593:UPDATE vtiger_crmentity_seq SET id = ?/* $crm_id */;
bin/Vtiger_IN_new_accounts_file.pl:598:INSERT INTO vtiger_crmentity SET crmid=?/* $crm_id */,smcreatorid=?/* $user_id */,smownerid=?/* $user_id */,modifiedby=?/* $user_id */,setype='Accounts',description='',createdtime=?/* $NOW_TIME */,modifiedtime=?/* $NOW_TIME */, viewedtime=?/* $NOW_TIME */, deleted=?/* $importasdeleted */;
bin/Vtiger_IN_new_accounts_file.pl:603:INSERT INTO vtiger_account SET accountid=?/* $crm_id */,accountname=?/* $account_name */,account_type='Customer',industry='--None--',annualrevenue=?/* $revenue */,rating='--None--',ownership=?/* $ownership */,siccode=?/* $sic_code */,tickersymbol=?/* $ticker_symbol */,phone=?/* $phone_number */,otherphone=?/* $other_phone */,email1=?/* $email */,email2=?/* $other_email */,website=?/* $website */,fax=?/* $fax */,employees=?/* $employees */,emailoptout=?/* $emailoptout */,notify_owner=?/* $notify_owner */;
bin/Vtiger_IN_new_accounts_file.pl:608:INSERT INTO vtiger_accountbillads SET accountaddressid=?/* $crm_id */,bill_city=?/* $city */,bill_code=?/* $post_code */,bill_country=?/* $country */,bill_state=?/* $state */,bill_street=?/* $address */,bill_pobox=?/* $po_box */;
bin/Vtiger_IN_new_accounts_file.pl:613:INSERT INTO vtiger_accountscf SET accountid=?/* $crm_id */;
bin/Vtiger_IN_new_accounts_file.pl:618:INSERT INTO vtiger_accountshipads SET accountaddressid=?/* $crm_id */,ship_city='',ship_code='',ship_country='',ship_state='',ship_street='',ship_pobox='';
bin/Vtiger_IN_new_accounts_file.pl:623:INSERT INTO vtiger_tracker SET user_id=?/* $user_id */,module_name='Accounts',item_id=?/* $crm_id */,item_summary=?/* $account_name */;
bin/Vtiger_IN_new_accounts_file.pl:661:INSERTED:           $b\n
bin/Vtiger_IN_new_accounts_file.pl:662:INSERT STATEMENTS:  $c\n
bin/AST_agent_logout.pl:155:SELECT vd_server_logs,local_gmt FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_agent_logout.pl:176:SELECT user,server_ip,status,lead_id,campaign_id,uniqueid,callerid,channel,last_call_time,UTC_TIMESTAMP(last_update_time),last_call_finish,closer_campaigns,call_server_ip,conf_exten from vicidial_live_agents where campaign_id=?/* $CLIcampaign */
bin/AST_agent_logout.pl:180:SELECT user,server_ip,status,lead_id,campaign_id,uniqueid,callerid,channel,last_call_time,UTC_TIMESTAMP(last_update_time),last_call_finish,closer_campaigns,call_server_ip,conf_exten from vicidial_live_agents
bin/AST_agent_logout.pl:218:SELECT agent_log_id,user,server_ip,event_time,lead_id,campaign_id,pause_epoch,pause_sec,wait_epoch,wait_sec,talk_epoch,talk_sec,dispo_epoch,dispo_sec,status,user_group,comments,sub_status,dead_epoch,dead_sec from vicidial_agent_log where user=?/* $user[$i] */ and campaign_id=?/* $campaign_id[$i] */ order by agent_log_id desc LIMIT 1;
bin/AST_agent_logout.pl:242:UPDATE vicidial_agent_log SET wait_epoch=?/* $now_date_epoch */, pause_sec=?/* $pause_sec */ where agent_log_id=?/* $agent_log_id[$i] */,pause_type='SYSTEM';
bin/AST_agent_logout.pl:249:UPDATE vicidial_agent_log SET talk_epoch=?/* $now_date_epoch */, wait_sec=?/* $wait_sec */ where agent_log_id=?/* $agent_log_id[$i] */;
bin/AST_agent_logout.pl:258:UPDATE vicidial_list SET status='PU' where lead_id=?/* $lead_id[$i] */;
bin/AST_agent_logout.pl:268:UPDATE vicidial_agent_log SET dispo_epoch=?/* $now_date_epoch */, talk_sec=?/* $talk_sec[$i] */$status_update_SQL where agent_log_id=?/* $agent_log_id[$i] */;
bin/AST_agent_logout.pl:275:UPDATE vicidial_agent_log SET dispo_sec=?/* $dispo_sec[$i] */ where agent_log_id=?/* $agent_log_id[$i] */;
bin/AST_agent_logout.pl:287:DELETE from vicidial_live_agents where user=?/* $user[$i] */ and campaign_id=?/* $campaign_id[$i] */ order by live_agent_id LIMIT 1;
bin/AST_agent_logout.pl:297:SELECT user_group FROM vicidial_users where user=?/* $user[$i] */;
bin/AST_agent_logout.pl:309:INSERT INTO vicidial_user_log (user,event,campaign_id,event_date,event_epoch,user_group) values(?/* $user[$i] */,'LOGOUT',?/* $campaign_id[$i] */,?/* $now_date */,?/* $now_date_epoch */,?/* $user_group[$i] */);
bin/AST_agent_logout.pl:320:INSERT INTO vicidial_manager values('','',?/* $NOW_TIME */,'NEW','N',?/* $server_ip[$i] */,'','Originate',?/* $queryCID */,'Channel: $kick_local_channel','Context: $ext_context','Exten: 8300','Priority: 1','Callerid: $queryCID','','','','','');
bin/AST_agent_logout.pl:330:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,queuemetrics_eq_prepend,queuemetrics_loginout,queuemetrics_dispo_pause,queuemetrics_pause_type FROM system_settings;
bin/AST_agent_logout.pl:368:SELECT agent,time_id,data1 FROM queue_log where agent='Agent/$user[$i]' and verb IN('AGENTLOGIN','AGENTCALLBACKLOGIN') and time_id > $check_time order by time_id desc limit 1;
bin/AST_agent_logout.pl:375:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $now_date_epoch */,call_id='NONE',queue='NONE',agent='Agent/$user[$i]',verb='PAUSEREASON',serverid=?/* $queuemetrics_log_id */,data1='LOGOFF'$pause_typeSQL;
bin/AST_agent_logout.pl:381:SELECT agent,time_id,data1 FROM queue_log where agent='Agent/$user[$i]' and verb IN('ADDMEMBER','ADDMEMBER2') and time_id > $check_time order by time_id desc limit 1;
bin/AST_agent_logout.pl:405:SELECT queuemetrics_phone_environment FROM vicidial_campaigns where campaign_id=?/* $campaign_id[$i] */;
bin/AST_agent_logout.pl:416:SELECT distinct queue FROM queue_log where time_id >= $RAWtime_logged_in and agent=?/* $agent_logged_in */ and verb IN('ADDMEMBER','ADDMEMBER2') and queue != ?/* $campaign_id[$i] */ order by time_id desc;
bin/AST_agent_logout.pl:443:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $now_date_epoch */,call_id='NONE',queue=?/* $AMqueue[$qmr] */,agent=?/* $agent_logged_in */,verb='REMOVEMEMBER',data1=?/* $phone_logged_in */,serverid=?/* $queuemetrics_log_id */,data4=?/* $queuemetrics_phone_environment$pe_append */;
bin/AST_agent_logout.pl:454:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $now_date_epoch */,call_id='NONE',queue='NONE',agent=?/* $agent_logged_in */,verb=?/* $QM_LOGOFF */,serverid=?/* $queuemetrics_log_id */,data1=?/* $phone_logged_in */,data2=?/* $time_logged_in */;
bin/AST_agent_logout.pl:471:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='USERS', event_type='OTHER', record_id=?/* $CLIcampaign */, event_code='CLI USERS LOGOUT', event_sql=?/* $output */, event_notes='Users logged out: $i executed';
bin/nanpa_type_preload.pl:323:UPDATE vicidial_list SET $vl_field_update='SF' where $vl_field_update='S' $clausesSQL;
bin/nanpa_type_preload.pl:328:UPDATE vicidial_list SET $vl_field_update='CF' where $vl_field_update='C' $clausesSQL;
bin/nanpa_type_preload.pl:333:UPDATE vicidial_list SET $vl_field_update='IF' where $vl_field_update='I' $clausesSQL;
bin/nanpa_type_preload.pl:339:SELECT lead_id,phone_number from vicidial_list $list_idSQL $excludeSQL $limitSQL;
bin/nanpa_type_preload.pl:463:UPDATE vicidial_list SET list_id=$invalid_list_id where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:465:UPDATE vicidial_list SET list_id=$cellphone_list_id where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:467:UPDATE vicidial_list SET list_id=$landline_list_id where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:478:UPDATE vicidial_list SET $vl_field_update=?/* $type */ where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:506:UPDATE vicidial_list SET list_id=$invalid_list_id where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:508:UPDATE vicidial_list SET list_id=$cellphone_list_id where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:510:UPDATE vicidial_list SET list_id=$landline_list_id where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:521:UPDATE vicidial_list SET $vl_field_update=?/* $type */ where lead_id in ($type_hash{$type});
bin/nanpa_type_preload.pl:535:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='SERVERS', event_type='OTHER', record_id=?/* $server_ip */, event_code='NANPA preload filter run', event_sql='', event_notes=?/* $rec_count / $sthArows (S:$landline | C:$cellphone | I:$invalid) TOTAL Elapsed time: ".($end_time-$start_time)." sec  |$args| */;
bin/nanpa_type_preload.pl:594:select count(*), count(distinct ac_prefix) from nanpa_prefix_exchanges_fast;
bin/nanpa_type_preload.pl:599:select substr(ac_prefix,1,4) as prefix, type, count(*) as ct from nanpa_prefix_exchanges_fast group by prefix, type order by ct desc
bin/nanpa_type_preload.pl:624:select substr(ac_prefix,1,5) as prefix, type, count(*) as ct from nanpa_prefix_exchanges_fast ".$exc_clause_prefix.$exc_clause." group by prefix, type order by ct desc
bin/nanpa_type_preload.pl:651:select substr(ac_prefix,1,6) as prefix, type, count(*) as ct from nanpa_prefix_exchanges_fast ".$exc_clause_prefix.$exc_clause." group by prefix, type order by ct desc
bin/nanpa_type_preload.pl:679:select ac_prefix, type, count(*) as ct from nanpa_prefix_exchanges_fast ".$exc_clause_prefix.$exc_clause." group by ac_prefix, type order by ct desc
bin/nanpa_type_preload.pl:699:select substr(phone,1,6) as prefix, count(*) as ct from nanpa_wired_to_wireless group by prefix order by ct desc
bin/nanpa_type_preload.pl:727:select substr(phone,1,7) as prefix, count(*) as ct from nanpa_wired_to_wireless ".$exc_clause_prefix.$exc_clause." group by prefix order by ct desc
bin/nanpa_type_preload.pl:754:select substr(phone,1,8) as prefix, count(*) as ct from nanpa_wired_to_wireless ".$exc_clause_prefix.$exc_clause." group by prefix order by ct desc
bin/nanpa_type_preload.pl:782:select substr(phone,1,9) as prefix, count(*) as ct from nanpa_wired_to_wireless ".$exc_clause_prefix.$exc_clause." group by prefix order by ct desc
bin/nanpa_type_preload.pl:827:select substr(phone,1,6) as prefix, count(*) as ct from nanpa_wireless_to_wired group by prefix order by ct desc
bin/nanpa_type_preload.pl:855:select substr(phone,1,7) as prefix, count(*) as ct from nanpa_wireless_to_wired ".$exc_clause_prefix.$exc_clause." group by prefix order by ct desc
bin/nanpa_type_preload.pl:882:select substr(phone,1,8) as prefix, count(*) as ct from nanpa_wireless_to_wired ".$exc_clause_prefix.$exc_clause." group by prefix order by ct desc
bin/nanpa_type_preload.pl:910:select substr(phone,1,9) as prefix, count(*) as ct from nanpa_wireless_to_wired ".$exc_clause_prefix.$exc_clause." group by prefix order by ct desc
bin/AST_CRON_audio_1_move_mix.pl:262:select recording_id,length_in_sec from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/AST_CRON_audio_1_move_mix.pl:292:UPDATE recording_log set location=?/* $HTTP://$server_ip/RECORDINGS/$ALLfile */ $lengthSQL where recording_id=?/* $recording_id */;
bin/AST_VDhopper.pl:329:SELECT anyone_callback_inactive_lists FROM system_settings;
bin/AST_VDhopper.pl:341:SELECT vd_server_logs,local_gmt FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_VDhopper.pl:381:DELETE from $vicidial_hopper where campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDhopper.pl:385:DELETE from $vicidial_hopper;
bin/AST_VDhopper.pl:400:SELECT count(*) from $vicidial_hopper where campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDhopper.pl:404:SELECT count(*) from $vicidial_hopper;
bin/AST_VDhopper.pl:429:SELECT list_id FROM vicidial_lists where ( ( (active='N') or ( (active='Y') and (expiration_date < ?/* $file_date */) ) ) and (campaign_id IN(?/* $CLIcampaign */) ) );
bin/AST_VDhopper.pl:433:SELECT list_id FROM vicidial_lists where ( (active='N') or ( (active='Y') and (expiration_date < ?/* $file_date */) ) );
bin/AST_VDhopper.pl:459:DELETE from $vicidial_hopper where list_id IN($inactive_lists) $KEEPanyone_callback_inactive_listsSQL;
bin/AST_VDhopper.pl:479:SELECT count(*) FROM vicidial_callbacks where callback_time <= ?/* $now_date */ and status='ACTIVE' and campaign_id IN(?/* $CLIcampaign */) $vcNOanyone_callback_inactive_listsSQL;
bin/AST_VDhopper.pl:483:SELECT count(*) FROM vicidial_callbacks where callback_time <= ?/* $now_date */ and status='ACTIVE' $vcNOanyone_callback_inactive_listsSQL;
bin/AST_VDhopper.pl:499:SELECT vicidial_callbacks.lead_id,recipient,campaign_id,vicidial_callbacks.list_id,gmt_offset_now,state,vicidial_callbacks.lead_status,vendor_lead_code FROM vicidial_callbacks,vicidial_list where callback_time <= ?/* $now_date */ and vicidial_callbacks.status='ACTIVE' and vicidial_callbacks.lead_id=vicidial_list.lead_id and vicidial_callbacks.campaign_id IN(?/* $CLIcampaign */) $vlNOanyone_callback_inactive_listsSQL;
bin/AST_VDhopper.pl:503:SELECT vicidial_callbacks.lead_id,recipient,campaign_id,vicidial_callbacks.list_id,gmt_offset_now,state,vicidial_callbacks.lead_status,vendor_lead_code FROM vicidial_callbacks,vicidial_list where callback_time <= ?/* $now_date */ and vicidial_callbacks.status='ACTIVE' and vicidial_callbacks.lead_id=vicidial_list.lead_id $vlNOanyone_callback_inactive_listsSQL;
bin/AST_VDhopper.pl:532:UPDATE vicidial_callbacks set status='LIVE' where lead_id IN($update_leads) and status NOT IN('INACTIVE','DEAD','ARCHIVE');
bin/AST_VDhopper.pl:552:SELECT callback_dnc,use_internal_dnc,use_campaign_dnc,use_other_campaign_dnc FROM vicidial_campaigns where campaign_id=?/* $CA_campaign_id[$CAu] */;
bin/AST_VDhopper.pl:570:SELECT phone_number FROM vicidial_list where lead_id=?/* $CA_lead_id[$CAu] */;
bin/AST_VDhopper.pl:587:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_phone_number */,?/* $pth_areacode */);
bin/AST_VDhopper.pl:590:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_phone_number */;
bin/AST_VDhopper.pl:604:UPDATE vicidial_list SET status='DNCL' where lead_id=?/* $CA_lead_id[$CAu] */;
bin/AST_VDhopper.pl:608:UPDATE vicidial_callbacks SET status='DEAD' where lead_id=?/* $CA_lead_id[$CAu] */;
bin/AST_VDhopper.pl:621:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_phone_number */,?/* $pth_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDhopper.pl:624:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_phone_number */ and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDhopper.pl:639:UPDATE vicidial_list SET status='DNCC' where lead_id=?/* $CA_lead_id[$CAu] */;
bin/AST_VDhopper.pl:643:UPDATE vicidial_callbacks SET status='DEAD' where lead_id=?/* $CA_lead_id[$CAu] */;
bin/AST_VDhopper.pl:652:UPDATE vicidial_list set status=?/* $CA_status[$CAu] */, called_since_last_reset='N' where lead_id=?/* $CA_lead_id[$CAu] */;
bin/AST_VDhopper.pl:658:INSERT INTO $vicidial_hopper SET lead_id=?/* $CA_lead_id[$CAu] */,campaign_id=?/* $CA_campaign_id[$CAu] */,list_id=?/* $CA_list_id[$CAu] */,gmt_offset_now=?/* $CA_gmt_offset_now[$CAu] */,user='',state=?/* $CA_state[$CAu] */,priority='50',source='C',vendor_lead_code=\"$CA_vendor_lead_code[$CAu]\
bin/AST_VDhopper.pl:674:SELECT count(*) from $vicidial_hopper where status='DNC' and campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDhopper.pl:678:SELECT count(*) from $vicidial_hopper where status='DNC';
bin/AST_VDhopper.pl:699:SELECT hopper_id,lead_id,alt_dial,campaign_id FROM $vicidial_hopper where status='DNC' and campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDhopper.pl:703:SELECT hopper_id,lead_id,alt_dial,campaign_id FROM $vicidial_hopper where status='DNC';
bin/AST_VDhopper.pl:732:SELECT auto_alt_dial,use_internal_dnc,use_campaign_dnc,use_other_campaign_dnc FROM vicidial_campaigns where campaign_id=?/* $AAD_campaign_id[$aad] */;
bin/AST_VDhopper.pl:753:SELECT alt_phone,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $AAD_lead_id[$aad] */;
bin/AST_VDhopper.pl:776:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_alt_phone */,?/* $alt_areacode */);
bin/AST_VDhopper.pl:779:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_alt_phone */;
bin/AST_VDhopper.pl:800:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_alt_phone */,?/* $alt_areacode */) and campaign_id=?/* $temp_VD_campaign_id */;
bin/AST_VDhopper.pl:803:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_alt_phone */ and campaign_id=?/* $temp_VD_campaign_id */;
bin/AST_VDhopper.pl:817:UPDATE $vicidial_hopper SET status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='ALT',user='',priority='25' where hopper_id=?/* $AAD_hopper_id[$aad] */;
bin/AST_VDhopper.pl:833:SELECT address3,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $AAD_lead_id[$aad] */;
bin/AST_VDhopper.pl:856:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_address3 */,?/* $addr3_areacode */);
bin/AST_VDhopper.pl:859:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_address3 */;
bin/AST_VDhopper.pl:880:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_address3 */,?/* $addr3_areacode */) and campaign_id=?/* $temp_VD_campaign_id */;
bin/AST_VDhopper.pl:883:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_address3 */ and campaign_id=?/* $temp_VD_campaign_id */;
bin/AST_VDhopper.pl:897:UPDATE $vicidial_hopper SET status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='ADDR3',user='',priority='25' where hopper_id=?/* $AAD_hopper_id[$aad] */;
bin/AST_VDhopper.pl:918:SELECT gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $VD_lead_id */;
bin/AST_VDhopper.pl:932:SELECT count(*) FROM vicidial_list_alt_phones where lead_id=?/* $AAD_lead_id[$aad] */;
bin/AST_VDhopper.pl:946:DELETE FROM $vicidial_hopper where hopper_id=?/* $AAD_hopper_id[$aad] */;
bin/AST_VDhopper.pl:954:SELECT alt_phone_id,phone_number,active FROM vicidial_list_alt_phones where lead_id=?/* $VD_lead_id */ and alt_phone_count=?/* $Xlast */;
bin/AST_VDhopper.pl:978:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_altdial_phone */,?/* $ad_areacode */);
bin/AST_VDhopper.pl:981:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_altdial_phone */;
bin/AST_VDhopper.pl:1002:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_altdial_phone */,?/* $ad_areacode */) and campaign_id=?/* $temp_VD_campaign_id */;
bin/AST_VDhopper.pl:1005:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_altdial_phone */ and campaign_id=?/* $temp_VD_campaign_id */;
bin/AST_VDhopper.pl:1021:UPDATE $vicidial_hopper SET status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='X$Xlast',user='',priority='25' where hopper_id=?/* $AAD_hopper_id[$aad] */;
bin/AST_VDhopper.pl:1030:UPDATE $vicidial_hopper SET status='DNC',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='X$Xlast',user='',priority='15' where hopper_id=?/* $AAD_hopper_id[$aad] */;
bin/AST_VDhopper.pl:1041:DELETE FROM $vicidial_hopper where hopper_id=?/* $AAD_hopper_id[$aad] */;
bin/AST_VDhopper.pl:1058:SELECT campaign_id,lead_order,hopper_level,auto_dial_level,local_call_time,lead_filter_id,use_internal_dnc,dial_method,available_only_ratio_tally,adaptive_dropped_percentage,adaptive_maximum_level,dial_statuses,list_order_mix,use_campaign_dnc,drop_lockout_time,no_hopper_dialing,auto_alt_dial_statuses,dial_timeout,auto_hopper_multi,use_auto_hopper,auto_trim_hopper,lead_order_randomize,lead_order_secondary,call_count_limit,hopper_vlc_dup_check,use_other_campaign_dnc,callback_dnc from vicidial_campaigns where campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDhopper.pl:1062:SELECT campaign_id,lead_order,hopper_level,auto_dial_level,local_call_time,lead_filter_id,use_internal_dnc,dial_method,available_only_ratio_tally,adaptive_dropped_percentage,adaptive_maximum_level,dial_statuses,list_order_mix,use_campaign_dnc,drop_lockout_time,no_hopper_dialing,auto_alt_dial_statuses,dial_timeout,auto_hopper_multi,use_auto_hopper,auto_trim_hopper,lead_order_randomize,lead_order_secondary,call_count_limit,hopper_vlc_dup_check,use_other_campaign_dnc,callback_dnc from vicidial_campaigns where active='Y';
bin/AST_VDhopper.pl:1109:SELECT COUNT(*) FROM vicidial_live_agents WHERE campaign_id=?/* $campaign_id[$rec_count] */ and status IN ('READY','QUEUE','INCALL','CLOSER') and last_update_time >= ?/* $VDL_tensec */
bin/AST_VDhopper.pl:1116:SELECT COUNT(*) FROM vicidial_live_agents WHERE campaign_id=?/* $campaign_id[$rec_count] */ and status IN ('PAUSED') and last_update_time >= ?/* $VDL_tensec */ and last_state_change >= ?/* $VDL_one */
bin/AST_VDhopper.pl:1158:UPDATE vicidial_campaigns set auto_hopper_level = ?/* $auto_hopper_level */ where campaign_id=?/* $campaign_id[$rec_count] */
bin/AST_VDhopper.pl:1167:SELECT COUNT(*) FROM $vicidial_hopper WHERE campaign_id=?/* $campaign_id[$rec_count] */ and status IN ('READY') and source IN('S','N');
bin/AST_VDhopper.pl:1183:DELETE FROM $vicidial_hopper WHERE campaign_id=?/* $campaign_id[$rec_count] */ AND source='S' AND status IN ('READY') LIMIT $num_to_delete
bin/AST_VDhopper.pl:1213:SELECT lead_id FROM vicidial_auto_calls where lead_id NOT IN('0');
bin/AST_VDhopper.pl:1226:SELECT lead_id FROM vicidial_live_agents where lead_id NOT IN('0',$live_leads);
bin/AST_VDhopper.pl:1238:SELECT vendor_lead_code FROM vicidial_list where lead_id IN($live_leads) and vendor_lead_code!='';
bin/AST_VDhopper.pl:1266:SELECT count(*) FROM $vicidial_hopper where campaign_id=?/* $campaign_id[$i] */ and status NOT IN('QUEUE','HOLD');
bin/AST_VDhopper.pl:1276:DELETE from $vicidial_hopper where campaign_id=?/* $campaign_id[$i] */ and status NOT IN('QUEUE','HOLD');
bin/AST_VDhopper.pl:1305:SELECT dialable_leads from vicidial_campaign_stats where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDhopper.pl:1343:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times,ct_holidays FROM vicidial_call_times where call_time_id=?/* $local_call_time[$i] */;
bin/AST_VDhopper.pl:1382:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($Gct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDhopper.pl:1559:SELECT state_call_time_id,state_call_time_state,state_call_time_name,state_call_time_comments,sct_default_start,sct_default_stop,sct_sunday_start,sct_sunday_stop,sct_monday_start,sct_monday_stop,sct_tuesday_start,sct_tuesday_stop,sct_wednesday_start,sct_wednesday_stop,sct_thursday_start,sct_thursday_stop,sct_friday_start,sct_friday_stop,sct_saturday_start,sct_saturday_stop,ct_holidays from vicidial_state_call_times where state_call_time_id=?/* $state_rules[$b] */;
bin/AST_VDhopper.pl:1601:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($Sct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDhopper.pl:1607:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id=?/* $holiday_id */ and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDhopper.pl:1864:SELECT recycle_id,campaign_id,status,attempt_delay,attempt_maximum,active from vicidial_lead_recycle where campaign_id=?/* $campaign_id[$i] */ and active='Y';
bin/AST_VDhopper.pl:1956:SELECT count(*) from $vicidial_hopper where campaign_id=?/* $campaign_id[$i] */ and status='READY';
bin/AST_VDhopper.pl:1973:SELECT list_id,active FROM vicidial_lists where campaign_id=?/* $campaign_id[$i] */ and expiration_date >= \"$file_date\
bin/AST_VDhopper.pl:1998:SELECT local_call_time FROM vicidial_lists where list_id = ?/* $cur_list_id */
bin/AST_VDhopper.pl:2007:SELECT count(*) from vicidial_call_times where call_time_id = ?/* $cur_call_time */
bin/AST_VDhopper.pl:2046:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times,ct_holidays FROM vicidial_call_times where call_time_id=?/* $cur_call_time */;
bin/AST_VDhopper.pl:2086:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($Gct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDhopper.pl:2133:SELECT state_call_time_id,state_call_time_state,state_call_time_name,state_call_time_comments,sct_default_start,sct_default_stop,sct_sunday_start,sct_sunday_stop,sct_monday_start,sct_monday_stop,sct_tuesday_start,sct_tuesday_stop,sct_wednesday_start,sct_wednesday_stop,sct_thursday_start,sct_thursday_stop,sct_friday_start,sct_friday_stop,sct_saturday_start,sct_saturday_stop,ct_holidays from vicidial_state_call_times where state_call_time_id=?/* $state_rules[$b] */;
bin/AST_VDhopper.pl:2176:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($Sct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDhopper.pl:2182:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id=?/* $holiday_id */ and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDhopper.pl:2460:DELETE from $vicidial_hopper where campaign_id=?/* $campaign_id[$i] */ and status IN('DONE');
bin/AST_VDhopper.pl:2477:DELETE from $vicidial_hopper where $del_list_id_sql[$i] (campaign_id=?/* $campaign_id[$i] */ and ($del_gmtSQL[$i]));
bin/AST_VDhopper.pl:2497:SELECT vcl_id,vcl_name,list_mix_container,mix_method FROM vicidial_campaigns_list_mix where campaign_id=?/* $campaign_id[$i] */ and status='ACTIVE';
bin/AST_VDhopper.pl:2535:SELECT lead_filter_sql FROM vicidial_lead_filters where lead_filter_id=?/* $lead_filter_id[$i] */;
bin/AST_VDhopper.pl:2590:SELECT count(*) FROM vicidial_list $VLforce_index where called_since_last_reset='N' and status IN($STATUSsql[$i]) and ($list_id_sql[$i]) and ($all_gmtSQL[$i]) $lead_filter_sql[$i] $DLTsql[$i] $CCLsql[$i];
bin/AST_VDhopper.pl:2595:SELECT count(*) FROM vicidial_list $VLforce_index where called_since_last_reset='N' and ($list_mix_dialableSQL) and ($all_gmtSQL[$i]) $lead_filter_sql[$i] $DLTsql[$i] $CCLsql[$i];
bin/AST_VDhopper.pl:2612:SELECT count(*) FROM vicidial_list $VLforce_index where called_since_last_reset='N' and status IN('NEW') and ($list_id_sql[$i]) and ($all_gmtSQL[$i]) $lead_filter_sql[$i] $DLTsql[$i];
bin/AST_VDhopper.pl:2646:UPDATE vicidial_campaign_stats SET dialable_leads='0' where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDhopper.pl:2655:UPDATE vicidial_campaign_stats SET dialable_leads=?/* $campaign_leads_to_call[$i] */ where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDhopper.pl:2676:SELECT lead_id,vendor_lead_code FROM $vicidial_hopper where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDhopper.pl:2755:SELECT lead_id,list_id,gmt_offset_now,phone_number,state,status,modify_date,user,vendor_lead_code FROM vicidial_list $VLforce_index where $recycle_SQL[$i] and ($list_id_sql[$i]) and lead_id NOT IN($lead_id_lists) $vlc_dup_check_SQL and ($all_gmtSQL[$i]) $lead_filter_sql[$i] $CCLsql[$i] $DLTsql[$i] $order_stmt limit $hopper_level[$i];
bin/AST_VDhopper.pl:2811:SELECT lead_id,list_id,gmt_offset_now,phone_number,state,status,modify_date,user,vendor_lead_code FROM vicidial_list $VLforce_index where called_since_last_reset='N' and status IN('NEW') and ($list_id_sql[$i]) and lead_id NOT IN($lead_id_lists) $vlc_dup_check_SQL and ($all_gmtSQL[$i]) $lead_filter_sql[$i] $CCLsql[$i] $DLTsql[$i] $order_stmt limit $NEW_level;
bin/AST_VDhopper.pl:2865:SELECT lead_id,list_id,gmt_offset_now,phone_number,state,status,modify_date,user,vendor_lead_code FROM vicidial_list $VLforce_index where called_since_last_reset='N' and status IN($STATUSsql[$i]) and ($list_id_sql[$i]) and lead_id NOT IN($lead_id_lists) $vlc_dup_check_SQL and ($all_gmtSQL[$i]) $lead_filter_sql[$i] $CCLsql[$i] $DLTsql[$i] $order_stmt limit $OTHER_level;
bin/AST_VDhopper.pl:2968:SELECT lead_id,list_id,gmt_offset_now,phone_number,state,status,modify_date,user,vendor_lead_code FROM vicidial_list $VLforce_index where called_since_last_reset='N' and ($list_mix_dialableSQL) and lead_id NOT IN($lead_id_lists) $vlc_dup_check_SQL and ($all_gmtSQL[$i]) $lead_filter_sql[$i] $CCLsql[$i] $DLTsql[$i] $order_stmt limit $LM_step_goal[$x];
bin/AST_VDhopper.pl:3078:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $phone_to_hopper[$h] */,?/* $pth_areacode */);
bin/AST_VDhopper.pl:3081:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $phone_to_hopper[$h] */;
bin/AST_VDhopper.pl:3095:UPDATE vicidial_list SET status='DNCL' where lead_id=?/* $leads_to_hopper[$h] */;
bin/AST_VDhopper.pl:3108:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $phone_to_hopper[$h] */,?/* $pth_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDhopper.pl:3111:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $phone_to_hopper[$h] */ and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDhopper.pl:3126:UPDATE vicidial_list SET status='DNCC' where lead_id=?/* $leads_to_hopper[$h] */;
bin/AST_VDhopper.pl:3133:SELECT count(*) FROM vicidial_auto_calls where lead_id=?/* $leads_to_hopper[$h] */;
bin/AST_VDhopper.pl:3145:SELECT count(*) FROM vicidial_live_agents where lead_id=?/* $leads_to_hopper[$h] */;
bin/AST_VDhopper.pl:3159:SELECT count(*) FROM $vicidial_hopper where vendor_lead_code=\"$vlc_to_hopper[$h]\
bin/AST_VDhopper.pl:3188:INSERT INTO $vicidial_hopper (lead_id,campaign_id,status,user,list_id,gmt_offset_now,state,priority,source,vendor_lead_code) values(?/* $leads_to_hopper[$h] */,?/* $campaign_id[$i] */,'READY','',?/* $lists_to_hopper[$h] */,?/* $gmt_to_hopper[$h] */,?/* $state_to_hopper[$h] */,'0',?/* $source_to_hopper[$h] */,?/* $vlc_to_hopper[$h] */);
bin/AST_VDhopper.pl:3202:INSERT INTO $vicidial_hopper (lead_id,campaign_id,status,user,list_id,gmt_offset_now,state,priority,source,vendor_lead_code) values(?/* $leads_to_hopper[$h] */,?/* $campaign_id[$i] */,'DNC','',?/* $lists_to_hopper[$h] */,?/* $gmt_to_hopper[$h] */,?/* $state_to_hopper[$h] */,'0',?/* $source_to_hopper[$h] */,?/* $vlc_to_hopper[$h] */);
bin/AST_manager_listen_AMI2.pl:129:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_listen_AMI2.pl:331:SELECT vd_server_logs FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_listen_AMI2.pl:585:UPDATE vicidial_manager set status='DEAD', channel=?/* $event_hash{'Channel'} */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $event_hash{'Uniqueid'} */ and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listen_AMI2.pl:623:UPDATE vicidial_manager set status='SENT', channel=?/* $event_hash{'Channel'} */, uniqueid = ?/* $event_hash{'Uniqueid'} */ where server_ip = ?/* $event_hash{'ServerIP'} */ and callerid = ?/* $call_id */
bin/AST_manager_listen_AMI2.pl:632:UPDATE vicidial_manager set status='UPDATED', channel=?/* $event_hash{'Channel'} */, uniqueid = ?/* $event_hash{'Uniqueid'} */ where server_ip = ?/* $event_hash{'ServerIP'} */ and callerid = ?/* $call_id */ and status != 'NEW'
bin/AST_manager_listen_AMI2.pl:675:UPDATE vicidial_manager set status='UPDATED', channel=?/* $event_hash{'Channel'} */, uniqueid = ?/* $event_hash{'Uniqueid'} */ where server_ip = ?/* $event_hash{'ServerIP'} */ and callerid = ?/* $call_id */
bin/AST_manager_listen_AMI2.pl:710:INSERT INTO vicidial_dtmf_log SET dtmf_time=NOW(),channel=?/* $event_hash{'Channel'} */,server_ip=?/* $event_hash{'ServerIP'} */,uniqueid=?/* $event_hash{'Uniqueid'} */,digit=?/* $event_hash{'Digit'} */,direction=?/* $event_hash{'Direction'} */,state='Begin'
bin/AST_manager_listen_AMI2.pl:759:INSERT INTO vicidial_dtmf_log SET dtmf_time=NOW(),channel=?/* $event_hash{'Channel'} */,server_ip=?/* $event_hash{'ServerIP'} */,uniqueid=?/* $event_hash{'Uniqueid'} */,digit=?/* $event_hash{'Digit'} */,direction=?/* $event_hash{'Direction'} */,state='End'
bin/AST_CRON_purge_recordings.pl:113:SELECT lead_id,recording_id,start_time,filename,location FROM recording_log where start_time < ?/* $TDSQLdate */ and start_time > ?/* $FDSQLdate */ and location IS NOT NULL and location NOT IN('','NOT_FOUND','NOT_FOUND_2','DELETED') LIMIT 5000;
bin/AST_CRON_purge_recordings.pl:136:SELECT status FROM vicidial_list where lead_id=?/* $lead_ids[$i] */;
bin/AST_CRON_purge_recordings.pl:171:UPDATE recording_log set location='DELETED' where recording_id=?/* $recording_ids[$i] */;
bin/AST_CRON_purge_recordings.pl:184:DELETED:   $DELETE\n
bin/ADMIN_qm_sync.pl:246:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id FROM system_settings;
bin/ADMIN_qm_sync.pl:288:SELECT user,full_name from vicidial_users limit 100000;
bin/ADMIN_qm_sync.pl:308:SELECT count(*) FROM agenti_noti where nome_agente='Agent/$Vuser[$i]' and descr_agente=?/* $Vfullname[$i] */;
bin/ADMIN_qm_sync.pl:322:SELECT count(*) FROM agenti_noti where nome_agente='Agent/$Vuser[$i]';
bin/ADMIN_qm_sync.pl:336:INSERT INTO agenti_noti(nome_agente,descr_agente,location,current_terminal,xmpp_address,payroll_code,sys_dt_creazione,sys_user_creazione,sys_dt_modifica,sys_user_modifica,chiave_agente) values('agent/$Vuser[$i]',?/* $Vfullname[$i] */,'7','-','','',NOW(),'32',NOW(),'32','');
bin/ADMIN_qm_sync.pl:349:UPDATE agenti_noti SET descr_agente=?/* $Vfullname[$i] */ where nome_agente='agent/$Vuser[$i]' LIMIT 1;
bin/ADMIN_qm_sync.pl:392:SELECT user_start,number_of_lines,full_name from vicidial_remote_agents vra,vicidial_users vu where vu.user=vra.user_start and number_of_lines > 0 limit 100000;
bin/ADMIN_qm_sync.pl:417:SELECT count(*) FROM agenti_noti where nome_agente='Agent/$Vuser[$i]' and descr_agente=?/* $Vfullname[$i] */;
bin/ADMIN_qm_sync.pl:431:SELECT count(*) FROM agenti_noti where nome_agente='Agent/$Vuser[$i]';
bin/ADMIN_qm_sync.pl:445:INSERT INTO agenti_noti(nome_agente,descr_agente,location,current_terminal,xmpp_address,payroll_code,sys_dt_creazione,sys_user_creazione,sys_dt_modifica,sys_user_modifica,chiave_agente) values('agent/$Vuser[$i]',?/* $Vfullname[$i] */,'7','-','','',NOW(),'32',NOW(),'32','');
bin/ADMIN_qm_sync.pl:458:UPDATE agenti_noti SET descr_agente=?/* $Vfullname[$i] */ where nome_agente='agent/$Vuser[$i]' LIMIT 1;
bin/ADMIN_qm_sync.pl:502:SELECT did_pattern,did_description from vicidial_inbound_dids limit 1000000;
bin/ADMIN_qm_sync.pl:522:SELECT count(*) FROM dnis where dnis_k=?/* $Vdid[$i] */ and dnis_v=?/* $Vdid[$i] - $Vdescription[$i] */;
bin/ADMIN_qm_sync.pl:536:SELECT count(*) FROM dnis where dnis_k=?/* $Vdid[$i] */;
bin/ADMIN_qm_sync.pl:550:INSERT INTO dnis (dnis_k,dnis_v,sys_dt_creazione,sys_user_creazione,sys_dt_modifica,sys_user_modifica,sys_optilock) values(?/* $Vdid[$i] */,?/* $Vdid[$i] - $Vdescription[$i] */,NOW(),'32',NOW(),'32','82946');
bin/ADMIN_qm_sync.pl:563:UPDATE dnis SET dnis_v=?/* $Vdid[$i] - $Vdescription[$i] */ where dnis_k=?/* $Vdid[$i] */ LIMIT 1;
bin/ADMIN_qm_sync.pl:606:SELECT menu_id,menu_name from vicidial_call_menu limit 1000000;
bin/ADMIN_qm_sync.pl:626:SELECT count(*) FROM ivr where ivr_k=?/* $Vivr[$i] */ and ivr_v=?/* $Vivr[$i] - $Vdescription[$i] */;
bin/ADMIN_qm_sync.pl:640:SELECT count(*) FROM ivr where ivr_k=?/* $Vivr[$i] */;
bin/ADMIN_qm_sync.pl:654:INSERT INTO ivr (ivr_k,ivr_v,sys_dt_creazione,sys_user_creazione,sys_dt_modifica,sys_user_modifica,sys_optilock) values(?/* $Vivr[$i] */,?/* $Vivr[$i] - $Vdescription[$i] */,NOW(),'32',NOW(),'32','82946');
bin/ADMIN_qm_sync.pl:667:UPDATE ivr SET ivr_v=?/* $Vivr[$i] - $Vdescription[$i] */ where ivr_k=?/* $Vivr[$i] */ LIMIT 1;
bin/ADMIN_qm_sync.pl:710:SELECT group_id,group_name from vicidial_inbound_groups limit 1000000;
bin/ADMIN_qm_sync.pl:750:SELECT count(*) FROM code_possibili where composizione_coda=?/* $Vid[$i] */ and nome_coda=?/* $Vdescription[$i] */ and q_direction='inbound' $visibility_keySEARCH;
bin/ADMIN_qm_sync.pl:764:SELECT count(*) FROM code_possibili where composizione_coda=?/* $Vid[$i] */;
bin/ADMIN_qm_sync.pl:790:INSERT INTO code_possibili (composizione_coda,nome_coda,q_direction,sys_dt_creazione,sys_user_creazione,sys_dt_modifica,sys_user_modifica $PREvisibility_key) values(?/* $Vid[$i] */,?/* $Vdescription[$i] */,'inbound',NOW(),'32',NOW(),'32'$POSTvisibility_key);
bin/ADMIN_qm_sync.pl:806:SELECT visibility_key FROM code_possibili where composizione_coda=?/* $Vid[$i] */;
bin/ADMIN_qm_sync.pl:853:UPDATE code_possibili SET nome_coda=?/* $Vdescription[$i] */,q_direction='inbound' $visibility_keySQL where composizione_coda=?/* $Vid[$i] */ LIMIT 1;
bin/ADMIN_qm_sync.pl:896:SELECT campaign_id,campaign_name from vicidial_campaigns limit 100000;
bin/ADMIN_qm_sync.pl:916:SELECT count(*) FROM code_possibili where composizione_coda=?/* $Vid[$i] */ and nome_coda=?/* $Vdescription[$i] */ and q_direction='outbound';
bin/ADMIN_qm_sync.pl:930:SELECT count(*) FROM code_possibili where composizione_coda=?/* $Vid[$i] */;
bin/ADMIN_qm_sync.pl:944:INSERT INTO code_possibili (composizione_coda,nome_coda,q_direction,sys_dt_creazione,sys_user_creazione,sys_dt_modifica,sys_user_modifica) values(?/* $Vid[$i] */,?/* $Vdescription[$i] */,'outbound',NOW(),'32',NOW(),'32');
bin/ADMIN_qm_sync.pl:957:UPDATE code_possibili SET nome_coda=?/* $Vdescription[$i] */,q_direction='outbound' where composizione_coda=?/* $Vid[$i] */ LIMIT 1;
bin/ADMIN_qm_sync.pl:1000:SELECT count(*) FROM code_possibili where nome_coda='00 All Queues';
bin/ADMIN_qm_sync.pl:1019:SELECT composizione_coda FROM code_possibili where nome_coda NOT IN('00 All Queues','00 All');
bin/ADMIN_qm_sync.pl:1034:SELECT count(*) FROM code_possibili where composizione_coda=?/* $AAQ_list */ and nome_coda='00 All Queues';
bin/ADMIN_qm_sync.pl:1048:UPDATE code_possibili SET composizione_coda=?/* $AAQ_list */ where nome_coda='00 All Queues' LIMIT 1;
bin/Vtiger_optimize_all_tables.pl:145:SELECT use_non_latin,vtiger_server_ip,vtiger_dbname,vtiger_login,vtiger_pass FROM system_settings;
bin/AST_DB_calltime_change.pl:152:UPDATE vicidial_call_times set call_time_comments='auto-modified $timestamp' $startSQL $stopSQL where call_time_id=?/* $calltime */;
bin/AST_DB_calltime_change.pl:161:INSERT INTO vicidial_admin_log set event_date=?/* $timestamp */, user='VDAD', ip_address='1.1.1.1', event_section='CALLTIMES', event_type='MODIFY', record_id=?/* $calltime */, event_code='ADMIN AUTO MODIFY CALL TIME', event_sql=?/* $SQL_log */, event_notes=?/* $affected_rows updated records */;
bin/AST_output_update.pl:123:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_output_update.pl:271:INSERT INTO vicidial_asterisk_output (server_ip, sip_peers, update_date) VALUES (?/* $server_ip */,?/* $sip_show_peers */,NOW()) ON DUPLICATE KEY UPDATE sip_peers=?/* $sip_show_peers */,update_date=NOW();
bin/AST_output_update.pl:325:UPDATE vicidial_asterisk_output SET iax_peers=?/* $iax_show_peers */,update_date=NOW() where server_ip=?/* $server_ip */;
bin/AST_output_update.pl:365:UPDATE vicidial_asterisk_output SET asterisk=?/* $tail_output */,update_date=NOW() where server_ip=?/* $server_ip */;
bin/VICIDIAL_last_local_call_time_UPDATE.pl:89:select lead_id,list_id,called_count from vicidial_list limit 10000000;
bin/VICIDIAL_last_local_call_time_UPDATE.pl:116:select call_date,start_epoch from vicidial_log where lead_id=?/* $lead_id[$b] */ order by call_date desc LIMIT 1;
bin/VICIDIAL_last_local_call_time_UPDATE.pl:130:select call_date,start_epoch from vicidial_closer_log where lead_id=?/* $lead_id[$b] */ order by closecallid desc LIMIT 1;
bin/VICIDIAL_last_local_call_time_UPDATE.pl:158:UPDATE vicidial_list set last_local_call_time=?/* $NEWcall_date */ $called_since_last_resetSQL where lead_id=?/* $lead_id[$b] */;
bin/AST_DNCcom_filter.pl:123:SELECT container_entry FROM vicidial_settings_containers WHERE container_id = 'DNCDOTCOM';
bin/AST_DNCcom_filter.pl:136:INSERT INTO vicidial_admin_log SET event_date = ?/* $now */, user = 'VDAD', ip_address = '1.1.1.1', event_section = 'LISTS', event_type = 'OTHER', record_id = ?/* $list_id */, event_sql='', event_code='DNC.com SCRUB STARTED', event_notes='DNC.com scrub of list $list_id started at $now';
bin/AST_DNCcom_filter.pl:347:UPDATE vicidial_list SET status = ?/* $up_status */, comments = CONCAT(comments,'!N$leads[$result_count][2]!N$line') where lead_id=$leads[$result_count][0] and phone_number=?/* $leads[$result_count][1] */;
bin/AST_DNCcom_filter.pl:351:UPDATE vicidial_list SET status = ?/* $up_status */ where lead_id=$leads[$result_count][0] and phone_number=?/* $leads[$result_count][1] */;
bin/AST_DNCcom_filter.pl:359:INSERT INTO vicidial_dnccom_filter_log SET lead_id = $leads[$result_count][0], list_id = $leads[$result_count][3], filter_date = ?/* $now */, new_status = ?/* $up_status */, old_status= ?/* $leads[$result_count][2] */, phone_number = ?/* $leads[$result_count][1] */, dnccom_data = ?/* $line */;
bin/AST_DNCcom_filter.pl:387:INSERT INTO vicidial_admin_log SET event_date = ?/* $now */, user = 'VDAD', ip_address = '1.1.1.1', event_section = 'LISTS', event_type = 'OTHER', record_id = ?/* $list_id */, event_sql='', event_code='DNC.com SCRUB ERROR', event_notes='DNC.com scrub of lists $CLIlists had an error: ?/* $error */ after processing $scrub_count leads.';
bin/AST_DNCcom_filter.pl:402:INSERT INTO vicidial_admin_log SET event_date = ?/* $now */, user = 'VDAD', ip_address = '1.1.1.1', event_section = 'LISTS', event_type = 'OTHER', record_id = ?/* $list_id */, event_sql='', event_code='DNC.com SCRUB FAILED', event_notes='DNC.com scrub of lists $CLIlists failed after processing $scrub_count leads due to connection errors.';
bin/AST_DNCcom_filter.pl:417:INSERT INTO vicidial_admin_log SET event_date = ?/* $now */, user = 'VDAD', ip_address = '1.1.1.1', event_section = 'LISTS', event_type = 'OTHER', record_id = ?/* $list_id */, event_sql='', event_code='DNC.com SCRUB FINISHED', event_notes='DNC.com scrub of lists $CLIlists finished after processing $scrub_count leads with the following results:\n$result_str';
bin/Vtiger_IN_notes_activities_file.pl:237:SELECT use_non_latin,vtiger_server_ip,vtiger_dbname,vtiger_login,vtiger_pass FROM system_settings;
bin/Vtiger_IN_notes_activities_file.pl:444:SELECT accountid from vtiger_account where website=?/* $website */;
bin/Vtiger_IN_notes_activities_file.pl:472:SELECT count(*) from vtiger_activity where subject='Old Call: $status' and activitytype='Call' and date_start=?/* $date */ and time_start=?/* $time */ and time_end=?/* $end_time */;
bin/Vtiger_IN_notes_activities_file.pl:486:SELECT count(*) from vtiger_seactivityrel vs, vtiger_activity va where vs.crmid=?/* $vendor_id */ and vs.activityid=va.activityid and subject='Old Call: $status' and activitytype='Call' and date_start=?/* $date */ and time_start=?/* $time */ and time_end=?/* $end_time */;
bin/Vtiger_IN_notes_activities_file.pl:503:SELECT count(*) from vtiger_crmentity where setype='Notes' and description='Old Notes: $status' and createdtime=?/* $date $time */;
bin/Vtiger_IN_notes_activities_file.pl:517:SELECT count(*) from vtiger_senotesrel vn, vtiger_crmentity vc where vn.crmid=?/* $vendor_id */ and vn.notesid=vc.crmid and subject='Old Call: $status' and activitytype='Call' and date_start=?/* $date */ and time_start=?/* $time */ and time_end=?/* $end_time */;
bin/Vtiger_IN_notes_activities_file.pl:536:SELECT id from vtiger_users where user_name=?/* $user */;
bin/Vtiger_IN_notes_activities_file.pl:549:SELECT id from vtiger_crmentity_seq;
bin/Vtiger_IN_notes_activities_file.pl:562:UPDATE vtiger_crmentity_seq SET id = ?/* $crm_id */;
bin/Vtiger_IN_notes_activities_file.pl:569:INSERT INTO vtiger_salesmanactivityrel SET smid=?/* $user_id */,activityid=?/* $crm_id */;
bin/Vtiger_IN_notes_activities_file.pl:574:INSERT INTO vtiger_seactivityrel SET crmid=?/* $vendor_id */,activityid=?/* $crm_id */;
bin/Vtiger_IN_notes_activities_file.pl:579:INSERT INTO vtiger_crmentity SET crmid=?/* $crm_id */,smcreatorid=?/* $user_id */,smownerid=?/* $user_id */,modifiedby=?/* $user_id */,setype='Calendar',description='Old Call: $status',createdtime=?/* $date $time */,modifiedtime=?/* $date $time */, viewedtime=?/* $date $time */;
bin/Vtiger_IN_notes_activities_file.pl:584:INSERT INTO vtiger_activity SET activityid=?/* $crm_id */,subject='Old Call: $status',activitytype='Call',date_start=?/* $date */,due_date=?/* $date */,time_start=?/* $time */,time_end=?/* $end_time */,sendnotification='0',duration_hours='0',duration_minutes=?/* $session_length */,status='',eventstatus='Held',priority='Medium',location='VICIDIAL User $user',notime='0',visibility='Public',recurringtype='--None--';
bin/Vtiger_IN_notes_activities_file.pl:591:INSERT INTO vtiger_crmentity SET crmid=?/* $crm_id */,smcreatorid=?/* $user_id */,smownerid=?/* $user_id */,modifiedby=?/* $user_id */,setype='Notes',description='Old Notes: $status',createdtime=?/* $date $time */,modifiedtime=?/* $date $time */, viewedtime=?/* $date $time */;
bin/Vtiger_IN_notes_activities_file.pl:596:INSERT INTO vtiger_notes SET notesid=?/* $crm_id */,title='Old Notes: $status',notecontent=?/* $notes */;
bin/Vtiger_IN_notes_activities_file.pl:601:INSERT INTO vtiger_senotesrel SET crmid=?/* $vendor_id */,notesid=?/* $crm_id */;
bin/Vtiger_IN_notes_activities_file.pl:642:INSERTED:           $b\n
bin/Vtiger_IN_notes_activities_file.pl:643:INSERT STATEMENTS:  $c\n
bin/AST_agent_daily_SPHfront.pl:212:select full_name,user,user_group from vicidial_users order by user_group,full_name limit 1000;
bin/AST_agent_daily_SPHfront.pl:304:select sum(talk_sec+pause_sec+wait_sec+dispo_sec) from vicidial_agent_log where event_time <= ?/* $enddate */ and event_time >= ?/* $begindate */ and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 and user=?/* $Duser[$i] */ limit 1;
bin/AST_agent_daily_SPHfront.pl:314:select count(*) from vicidial_log where call_date <= ?/* $enddate */ and call_date >= ?/* $begindate */ and status IN('A1','A2','A3','A4','SALE','UPSELL') and user=?/* $Duser[$i] */;
bin/AST_agent_daily_SPHfront.pl:347:select sum(talk_sec+pause_sec+wait_sec+dispo_sec) from vicidial_agent_log where event_time <= ?/* $endmonth */ and event_time >= ?/* $beginmonth */ and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 and user=?/* $Duser[$i] */ limit 1;
bin/AST_agent_daily_SPHfront.pl:357:select count(*) from vicidial_log where call_date <= ?/* $endmonth */ and call_date >= ?/* $beginmonth */ and status IN('A1','A2','A3','A4','SALE','UPSELL') and user=?/* $Duser[$i] */;
bin/AST_agent_daily_SPHfront.pl:611:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $begindate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time limit 1;
bin/AST_agent_daily_SPHfront.pl:620:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $begindate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time desc limit 1;
bin/nanpa_type_populate.pl:216:SELECT count(*) FROM nanpa_wired_to_wireless;
bin/nanpa_type_populate.pl:228:SELECT count(*) FROM nanpa_wireless_to_wired;
bin/nanpa_type_populate.pl:240:SELECT count(*) FROM nanpa_prefix_exchanges_master;
bin/nanpa_type_populate.pl:252:SELECT count(*) FROM nanpa_prefix_exchanges_fast;
bin/nanpa_type_populate.pl:267:DELETE from nanpa_wireless_to_wired;
bin/nanpa_type_populate.pl:278:DELETE from nanpa_wired_to_wireless;
bin/nanpa_type_populate.pl:289:DELETE from nanpa_prefix_exchanges_master;
bin/nanpa_type_populate.pl:300:DELETE from nanpa_prefix_exchanges_fast;
bin/nanpa_type_populate.pl:305:INSERT INTO nanpa_prefix_exchanges_fast (ac_prefix,type) SELECT CONCAT(areacode,prefix),type from nanpa_prefix_exchanges_master;
bin/nanpa_type_populate.pl:314:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='SERVERS', event_type='OTHER', record_id=?/* $VARserver_ip */, event_code='NANPA populate data', event_sql='', event_notes='WIRED2WIRELESS($nanpa_wired_to_wireless_count / $affected_rowsWIREWRLS / $affected_rowsINwirewrls)  WIRELESS2WIRED($nanpa_wireless_to_wired_count / $affected_rowsWRLSWIRE / $affected_rowsINwrlswire)   PREFIX($nanpa_prefix_exchanges_master_count / $nanpa_prefix_exchanges_fast_count / $affected_rowsPRFXMSTR / $affected_rowsINprfxmstr / $affected_rowsPRFXFAST / $affected_rowsINprfxfast)   |$args| TOTAL Elapsed time: ".($end_time-$start_time)." sec';
bin/AST_CRON_audio_3_ftp_FTPSSL.pl:454:select recording_id,start_time from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/AST_CRON_audio_3_ftp_FTPSSL.pl:598:UPDATE recording_log set location=?/* $VARHTTP_path/$start_date_PATH$ALLfile */ where recording_id=?/* $recording_id */;
bin/AST_GDPR_audio_purge.pl:179:select * from recording_log_deletion_queue where date_deleted is null order by date_queued asc
bin/AST_GDPR_audio_purge.pl:199:select substr(start_time, 1, 10) from recording_log where recording_id=?/* $recording_id */
bin/AST_GDPR_audio_purge.pl:229:update recording_log_deletion_queue set date_deleted=now() where recording_id=?/* $recording_id */
bin/AST_GDPR_audio_purge.pl:288:update recording_log_deletion_queue set date_deleted=now() where recording_id=?/* $recording_id */
bin/start_asterisk_boot.pl:109:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/start_asterisk_boot.pl:170:UPDATE servers SET rebuild_conf_files='Y' where server_ip = ?/* $VARserver_ip */;
bin/AST_VDsales_export.pl:641:SELECT local_gmt FROM servers where server_ip=?/* $server_ip */;
bin/AST_VDsales_export.pl:667:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times FROM vicidial_call_times where call_time_id=?/* $call_time */;
bin/AST_VDsales_export.pl:703:select vicidial_log.user,first_name,last_name,address1,address2,city,state,postal_code,vicidial_list.phone_number,vicidial_list.email,security_phrase,vicidial_list.comments,CONVERT_TZ(call_date,$convert_tz),vicidial_list.lead_id,vicidial_users.full_name,vicidial_log.status,vicidial_list.vendor_lead_code,vicidial_list.source_id,vicidial_log.list_id,title,address3,last_local_call_time,uniqueid,length_in_sec,vicidial_list.list_id,vicidial_list.list_id,UTC_TIMESTAMP(vicidial_log.call_date),vicidial_campaigns.campaign_name,vicidial_campaigns.campaign_cid from vicidial_list,vicidial_log,vicidial_users,vicidial_campaigns where $campaignSQL $sale_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate 23:59:59 */ and vicidial_log.lead_id=vicidial_list.lead_id and vicidial_users.user=vicidial_log.user and vicidial_log.campaign_id=vicidial_campaigns.campaign_id order by call_date;
bin/AST_VDsales_export.pl:706:select vicidial_log.user,8,8,8,8,8,8,8,vicidial_log.phone_number,8,8,8,CONVERT_TZ(call_date,$convert_tz),vicidial_log.lead_id,vicidial_users.full_name,vicidial_log.status,8,8,vicidial_log.list_id,8,8,CONVERT_TZ(call_date,$convert_tz),uniqueid,length_in_sec,vicidial_log.list_id,vicidial_log.list_id,UTC_TIMESTAMP(vicidial_log.call_date),vicidial_campaigns.campaign_name,vicidial_campaigns.campaign_cid from vicidial_log,vicidial_users,vicidial_campaigns where $campaignSQL $sale_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_log.user and vicidial_log.campaign_id=vicidial_campaigns.campaign_id order by call_date;
bin/AST_VDsales_export.pl:763:select vicidial_closer_log.user,first_name,last_name,address1,address2,city,state,postal_code,vicidial_list.phone_number,vicidial_list.email,security_phrase,vicidial_list.comments,CONVERT_TZ(call_date,$convert_tz),vicidial_list.lead_id,vicidial_users.full_name,vicidial_closer_log.status,vicidial_list.vendor_lead_code,vicidial_list.source_id,vicidial_closer_log.list_id,campaign_id,title,address3,last_local_call_time,xfercallid,closecallid,uniqueid,length_in_sec,queue_seconds,vicidial_list.list_id,vicidial_list.list_id,UTC_TIMESTAMP(vicidial_closer_log.call_date),agent_alert_delay from vicidial_list,vicidial_closer_log,vicidial_users,vicidial_inbound_groups where $with_inboundSQL $close_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate 23:59:59 */ and vicidial_closer_log.lead_id=vicidial_list.lead_id and vicidial_users.user=vicidial_closer_log.user and vicidial_inbound_groups.group_id=vicidial_closer_log.campaign_id order by call_date;
bin/AST_VDsales_export.pl:766:select vicidial_closer_log.user,8,8,8,8,8,8,8,vicidial_closer_log.phone_number,8,8,8,CONVERT_TZ(call_date,$convert_tz),vicidial_closer_log.lead_id,vicidial_users.full_name,vicidial_closer_log.status,8,8,vicidial_closer_log.list_id,campaign_id,8,8,CONVERT_TZ(call_date,$convert_tz),xfercallid,closecallid,uniqueid,length_in_sec,queue_seconds,vicidial_closer_log.list_id,vicidial_closer_log.list_id,UTC_TIMESTAMP(vicidial_closer_log.call_date),agent_alert_delay from vicidial_closer_log,vicidial_users,vicidial_inbound_groups where $with_inboundSQL $close_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_closer_log.user and vicidial_inbound_groups.group_id=vicidial_closer_log.campaign_id order by call_date;
bin/AST_VDsales_export.pl:814:select vicidial_xfer_log.user,full_name from vicidial_xfer_log,vicidial_users where lead_id=?/* $lead_id */ and closer=?/* $closer */ and xfercallid=?/* $xfercallid */ and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_xfer_log.user order by call_date desc limit 1;
bin/AST_VDsales_export.pl:1072:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ and vicidial_id=?/* $vicidial_id */ and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate 23:59:59 */ order by start_time desc limit 1;
bin/AST_VDsales_export.pl:1089:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate 23:59:59 */ order by length_in_sec desc limit 1;
bin/AST_VDsales_export.pl:1107:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ order by length_in_sec desc limit 1;
bin/AST_VDsales_export.pl:1124:select recording_id,filename,location from recording_log where filename LIKE \"%$phone_number%\" order by length_in_sec desc limit 1;
bin/AST_VDsales_export.pl:1167:select recording_id,filename,location from recording_log where vicidial_id=?/* $vicidial_id */ and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate 23:59:59 */ order by start_time limit 10;
bin/AST_VDsales_export.pl:1206:select closecallid,length_in_sec,queue_seconds,agent_alert_delay from vicidial_closer_log,vicidial_inbound_groups where lead_id=?/* $lead_id */ and call_date >= ?/* $call_date */ and call_date <= ?/* $shipdate 23:59:59 */ and campaign_id=group_id order by call_date limit 10;
bin/AST_VDsales_export.pl:1228:select recording_id,filename,location from recording_log where vicidial_id=?/* $closecallid */ and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate 23:59:59 */ order by start_time limit 10;
bin/AST_VDsales_export.pl:1277:select did_pattern,did_description,CONVERT_TZ(call_date,$convert_tz) from vicidial_inbound_dids vid,vicidial_did_log vdl where uniqueid=?/* $uniqueid */ and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $call_date */ and vid.did_id=vdl.did_id order by call_date desc limit 1;
bin/AST_VDsales_export.pl:1292:select vc.campaign_cid,vc.campaign_name,CONVERT_TZ(call_date,$convert_tz) from vicidial_campaigns vc,vicidial_log vl where lead_id=?/* $lead_id */ and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $call_date */ and vc.campaign_id=vl.campaign_id order by call_date desc limit 1;
bin/AST_VDsales_export.pl:1479:select CONVERT_TZ(call_date,$convert_tz),order_id,appointment_date,appointment_time,call_notes from vicidial_call_notes where lead_id=?/* $lead_id */ and vicidial_id=?/* $uniqueid */ and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate 23:59:59 */ order by call_date desc limit 1;
bin/AST_VDsales_export.pl:1531:select dispo_sec from vicidial_agent_log where lead_id=?/* $lead_id */ and user=?/* $closer */ and event_time >= ?/* $shipdate 00:00:00 */ and event_time <= ?/* $shipdate 23:59:59 */ order by event_time desc limit 1;
bin/AST_DB_dead_cb_purge.pl:136:SELECT status from vicidial_statuses where scheduled_callback='Y' limit 10000000;
bin/AST_DB_dead_cb_purge.pl:148:SELECT status from vicidial_campaign_statuses where scheduled_callback='Y' limit 10000000;
bin/AST_DB_dead_cb_purge.pl:166:SELECT lead_id,status,callback_id from vicidial_callbacks limit 10000000;
bin/AST_DB_dead_cb_purge.pl:194:SELECT status from vicidial_list where lead_id=?/* $lead_ids[$rec_count] */;
bin/AST_DB_dead_cb_purge.pl:214:INSERT INTO vicidial_callbacks_archive SELECT * from vicidial_callbacks where callback_id=?/* $callback_ids[$rec_count] */;
bin/AST_DB_dead_cb_purge.pl:217:DELETE from vicidial_callbacks where callback_id=?/* $callback_ids[$rec_count] */;
bin/AST_DB_dead_cb_purge.pl:239:SELECT lead_id,callback_id from vicidial_callbacks order by lead_id, callback_id desc limit 10000000;
bin/AST_DB_dead_cb_purge.pl:280:INSERT INTO vicidial_callbacks_archive SELECT * from vicidial_callbacks where callback_id=?/* $callback_ids[$rec_count] */;
bin/AST_DB_dead_cb_purge.pl:283:DELETE from vicidial_callbacks where callback_id=?/* $callback_ids[$rec_count] */;
bin/AST_VDremote_agents.pl:183:SELECT sip_event_logging,call_quota_lead_ranking FROM system_settings;
bin/AST_VDremote_agents.pl:197:SELECT vd_server_logs,local_gmt,ext_context FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_VDremote_agents.pl:253:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_VDremote_agents.pl:268:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,queuemetrics_loginout,queuemetrics_addmember_enabled,queuemetrics_pe_phone_append,queuemetrics_pause_type FROM system_settings;
bin/AST_VDremote_agents.pl:293:SELECT user FROM vicidial_live_agents where server_ip=?/* $server_ip */ and status IN('PAUSED') and extension LIKE \"R/%\
bin/AST_VDremote_agents.pl:314:DELETE FROM vicidial_live_agents where user=?/* $VLApausedUSER[$r] */ and server_ip=?/* $server_ip */ and status IN('PAUSED') and extension LIKE \"R/%\
bin/AST_VDremote_agents.pl:317:DELETE FROM vicidial_live_inbound_agents where user=?/* $VLApausedUSER[$r] */;
bin/AST_VDremote_agents.pl:340:SELECT vla.live_agent_id,vla.lead_id,vla.uniqueid,vla.user,vac.call_type,vac.campaign_id,vac.phone_number,vac.alt_dial,vac.callerid,vla.ra_user FROM vicidial_live_agents vla,vicidial_auto_calls vac where vla.server_ip=?/* $server_ip */ and vla.status IN('QUEUE') and vla.extension LIKE \"R/%\" and vla.uniqueid=vac.uniqueid and vla.channel=vac.channel;
bin/AST_VDremote_agents.pl:371:UPDATE vicidial_live_agents set status='INCALL',last_call_time=?/* $SQLdate */,last_inbound_call_time_filtered=?/* $SQLdate */,last_inbound_call_finish_filtered=?/* $SQLdate */,comments='REMOTE',calls_today=(calls_today + 1),last_state_change=?/* $SQLdate */ $licf_SQL where live_agent_id=?/* $QHlive_agent_id[$w] */;
bin/AST_VDremote_agents.pl:374:UPDATE vicidial_list set status='XFER',user=?/* $QHuser[$w] */ where lead_id=?/* $QHlead_id[$w] */;
bin/AST_VDremote_agents.pl:381:SELECT max_inbound_calls,max_inbound_filter_enabled,max_inbound_filter_ingroups FROM vicidial_users where user=?/* $QHuser[$w] */;
bin/AST_VDremote_agents.pl:410:UPDATE vicidial_closer_log set status='XFER',user=?/* $QHuser[$w] */,comments='REMOTE' where lead_id=?/* $QHlead_id[$w] */ and uniqueid=?/* $QHuniqueid[$w] */ and campaign_id=?/* $QHcampaign_id[$w] */ order by closecallid desc limit 1;
bin/AST_VDremote_agents.pl:413:INSERT IGNORE INTO vicidial_live_inbound_agents SET calls_today='1',last_call_time=?/* $SQLdate */,user=?/* $QHuser[$w] */, group_id=?/* $QHcampaign_id[$w] */ $calls_today_filteredSQLnew ON DUPLICATE KEY UPDATE calls_today=(calls_today + 1) $calls_today_filteredSQL;
bin/AST_VDremote_agents.pl:417:INSERT IGNORE INTO vicidial_inbound_group_agents set calls_today=1,user=?/* $QHuser[$w] */,group_id=?/* $QHcampaign_id[$w] */ $calls_today_filteredSQLnewIGA;
bin/AST_VDremote_agents.pl:422:UPDATE vicidial_live_agents set last_inbound_call_time_filtered=?/* $SQLdate */ where live_agent_id=?/* $QHlive_agent_id[$w] */;
bin/AST_VDremote_agents.pl:427:SELECT max_inbound_calls FROM vicidial_campaigns where campaign_id=?/* $QHcampaign_id[$w] */;
bin/AST_VDremote_agents.pl:443:SELECT sum(calls_today),sum(calls_today_filtered) FROM vicidial_inbound_group_agents where user=?/* $QHuser[$w] */ and group_type='C';
bin/AST_VDremote_agents.pl:458:UPDATE vicidial_live_agents set closer_campaigns='' where user=?/* $QHuser[$w] */;
bin/AST_VDremote_agents.pl:461:DELETE FROM vicidial_live_inbound_agents where user=?/* $QHuser[$w] */;
bin/AST_VDremote_agents.pl:464:UPDATE vicidial_remote_agents set closer_campaigns='' where user_start=?/* $QHuser[$w] */;
bin/AST_VDremote_agents.pl:467:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $QHuser[$w] */, ip_address=?/* $VARserver_ip */, event_section='USERS', event_type='MODIFY', record_id=?/* $QHuser[$w] */, event_code='MAX IN CALLS MODIFY REMOTE AGENT', event_sql='DELETE FROM vicidial_live_inbound_agents where user=$QHuser[$w]', event_notes='|$max_inbound_count|$max_inbound_calls|$QHuser[$w]|$QHcall_id[$w]|RA|';
bin/AST_VDremote_agents.pl:476:SELECT start_call_url,'DISABLED' FROM vicidial_inbound_groups where group_id=?/* $QHcampaign_id[$w] */;
bin/AST_VDremote_agents.pl:480:UPDATE vicidial_log set status='XFER',user=?/* $QHuser[$w] */,comments='REMOTE' where uniqueid=?/* $QHuniqueid[$w] */;
bin/AST_VDremote_agents.pl:486:SELECT start_call_url,call_quota_lead_ranking FROM vicidial_campaigns where campaign_id=?/* $QHcampaign_id[$w] */;
bin/AST_VDremote_agents.pl:512:SELECT count(*) FROM vicidial_live_agents where ra_user=?/* $QHra_user[$w] */ and extension LIKE \"R/%\" and status IN('QUEUE','INCALL','DONE');
bin/AST_VDremote_agents.pl:526:SELECT max_calls from vicidial_daily_ra_stats where user=?/* $QHra_user[$w] */ and stats_flag='OPEN' order by update_time desc limit 1;
bin/AST_VDremote_agents.pl:540:UPDATE vicidial_daily_ra_stats SET update_time=NOW(),total_calls=(total_calls + 1)$update_SQL where user=?/* $QHra_user[$w] */ and stats_flag='OPEN';
bin/AST_VDremote_agents.pl:547:INSERT INTO vicidial_daily_ra_stats SET stats_date=?/* $YMD */,update_time=NOW(),max_calls=?/* $incalls_count */,user=?/* $QHra_user[$w] */,stats_flag='OPEN',total_calls=1;
bin/AST_VDremote_agents.pl:636:SELECT remote_agent_id,user_start,number_of_lines,server_ip,conf_exten,status,campaign_id,closer_campaigns,on_hook_agent,on_hook_ring_time FROM vicidial_remote_agents where status IN('ACTIVE') and server_ip=?/* $server_ip */ order by user_start;
bin/AST_VDremote_agents.pl:686:SELECT remote_agent_id,user_start,number_of_lines,server_ip,conf_exten,status,campaign_id,closer_campaigns FROM vicidial_remote_agents where status IN('INACTIVE') and server_ip=?/* $server_ip */ order by user_start;
bin/AST_VDremote_agents.pl:721:SELECT dial_method,queuemetrics_phone_environment FROM vicidial_campaigns where campaign_id=?/* $DBremote_campaign[$h] */;
bin/AST_VDremote_agents.pl:741:SELECT count(*) FROM vicidial_live_agents where user=?/* $DBremote_user[$h] */ and server_ip=?/* $server_ip */ and campaign_id=?/* $DBremote_campaign[$h] */ and conf_exten=?/* $DBremote_conf_exten[$h] */ and closer_campaigns=?/* $DBremote_closer[$h] */ and outbound_autodial=?/* $CAMPAIGN_autodial[$h] */ and on_hook_agent=?/* $DBon_hook_agent[$h] */ and on_hook_ring_time=?/* $DBon_hook_ring_time[$h] */;
bin/AST_VDremote_agents.pl:755:UPDATE vicidial_live_agents set random_id=?/* $DBremote_random[$h] */ where user=?/* $DBremote_user[$h] */ and server_ip=?/* $server_ip */ and campaign_id=?/* $DBremote_campaign[$h] */ and conf_exten=?/* $DBremote_conf_exten[$h] */ and closer_campaigns=?/* $DBremote_closer[$h] */;
bin/AST_VDremote_agents.pl:762:SELECT count(*) FROM vicidial_live_agents where user=?/* $DBremote_user[$h] */ and server_ip=?/* $server_ip */
bin/AST_VDremote_agents.pl:776:UPDATE vicidial_live_agents set random_id=?/* $DBremote_random[$h] */,campaign_id=?/* $DBremote_campaign[$h] */,conf_exten=?/* $DBremote_conf_exten[$h] */,closer_campaigns=?/* $DBremote_closer[$h] */,status='READY',last_state_change=?/* $SQLdate */,outbound_autodial=?/* $CAMPAIGN_autodial[$h] */,on_hook_agent=?/* $DBon_hook_agent[$h] */,on_hook_ring_time=?/* $DBon_hook_ring_time[$h] */ where user=?/* $DBremote_user[$h] */ and server_ip=?/* $server_ip */;
bin/AST_VDremote_agents.pl:802:SELECT user_level FROM vicidial_users where user=?/* $DBuser_start[$h] */;
bin/AST_VDremote_agents.pl:815:INSERT INTO vicidial_live_agents (user,server_ip,conf_exten,extension,status,campaign_id,random_id,last_call_time,last_update_time,last_call_finish,closer_campaigns,channel,uniqueid,callerid,user_level,comments,last_state_change,outbound_autodial,ra_user,on_hook_agent,on_hook_ring_time,last_inbound_call_time,last_inbound_call_finish) values(?/* $DBremote_user[$h] */,?/* $server_ip */,?/* $DBremote_conf_exten[$h] */,'R/$DBremote_user[$h]','READY',?/* $DBremote_campaign[$h] */,?/* $DBremote_random[$h] */,?/* $SQLdate */,?/* $FDtsSQLdate */,?/* $SQLdate */,?/* $DBremote_closer[$h] */,'','','',?/* $DBuser_level[$h] */,'REMOTE',?/* $SQLdate */,?/* $CAMPAIGN_autodial[$h] */,?/* $DBuser_start[$h] */,?/* $DBon_hook_agent[$h] */,?/* $DBon_hook_ring_time[$h] */,?/* $SQLdate */,?/* $SQLdate */);
bin/AST_VDremote_agents.pl:820:SELECT count(*) FROM live_sip_channels where extension LIKE \"%999999999999\" and server_ip=?/* $server_ip */;
bin/AST_VDremote_agents.pl:834:INSERT INTO vicidial_manager values('','',?/* $SQLdate */,'NEW','N',?/* $server_ip */,'','Originate',?/* $SIqueryCID */,'Channel: $local_DEF$DBremote_conf_exten[$h]$local_AMP$ext_context','Context: $ext_context','Exten: 999999999999','Priority: 1','Callerid: $SIqueryCID','','','','','');
bin/AST_VDremote_agents.pl:859:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue=?/* $DBremote_campaign[$h] */,agent='Agent/$DBremote_user[$h]',verb=?/* $QM_LOGIN */,data1=?/* $DBremote_user[$h]$agents */,serverid=?/* $queuemetrics_log_id */,data4=?/* $CAMPAIGN_queuemetrics_phone_environment[$h]$pe_append */;
bin/AST_VDremote_agents.pl:866:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue=?/* $DBremote_campaign[$h] */,agent='Agent/$DBremote_user[$h]',verb='UNPAUSE',serverid=?/* $queuemetrics_log_id */,data4=?/* $CAMPAIGN_queuemetrics_phone_environment[$h]$pe_append */ $pause_typeSQL;
bin/AST_VDremote_agents.pl:871:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue=?/* $DBremote_campaign[$h] */,agent='Agent/$DBremote_user[$h]',verb='ADDMEMBER2',data1=?/* $DBremote_user[$h]$agents */,serverid=?/* $queuemetrics_log_id */,data4=?/* $CAMPAIGN_queuemetrics_phone_environment[$h]$pe_append */;
bin/AST_VDremote_agents.pl:903:SELECT group_weight,calls_today,group_grade,calls_today_filtered FROM vicidial_inbound_group_agents where user=?/* $DBuser_start[$h] */ and group_id=?/* $TEMPingroups[$s] */;
bin/AST_VDremote_agents.pl:917:SELECT count(*) FROM vicidial_live_inbound_agents where user=?/* $DBremote_user[$h] */ and group_id=?/* $TEMPingroups[$s] */ and group_weight=?/* $TEMPagentWEIGHT */ and group_grade=?/* $TEMPagentGRADE */;
bin/AST_VDremote_agents.pl:934:INSERT IGNORE INTO vicidial_live_inbound_agents SET user=?/* $DBremote_user[$h] */, group_id=?/* $TEMPingroups[$s] */, group_weight=?/* $TEMPagentWEIGHT */, calls_today=?/* $TEMPagentCALLS */, calls_today_filtered=?/* $TEMPagentCALLSftl */, last_call_time=?/* $SQLdate */, last_call_time_filtered=?/* $SQLdate */, last_call_finish=?/* $SQLdate */, group_grade=?/* $TEMPagentGRADE */ ON DUPLICATE KEY UPDATE group_weight=?/* $TEMPagentWEIGHT */,group_grade=?/* $TEMPagentGRADE */;
bin/AST_VDremote_agents.pl:940:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue=?/* $TEMPingroups[$s] */,agent='Agent/$DBremote_user[$h]',verb='ADDMEMBER2',data1=?/* $DBremote_user[$h]$agents */,serverid=?/* $queuemetrics_log_id */,data4=?/* $CAMPAIGN_queuemetrics_phone_environment[$h]$pe_append */;
bin/AST_VDremote_agents.pl:959:SELECT user,extension,status,uniqueid,callerid,lead_id,campaign_id,call_server_ip FROM vicidial_live_agents where extension LIKE \"R/%\" and server_ip=?/* $server_ip */ and uniqueid > 10;
bin/AST_VDremote_agents.pl:998:SELECT count(*) FROM vicidial_auto_calls where uniqueid=?/* $VD_uniqueid[$z] */ and server_ip IN(?/* $server_ip */,?/* $VD_call_server_ip[$z] */);
bin/AST_VDremote_agents.pl:1009:SELECT queuemetrics_phone_environment FROM vicidial_campaigns where campaign_id=?/* $VD_campaign_id[$z] */;
bin/AST_VDremote_agents.pl:1028:UPDATE vicidial_live_agents set random_id=?/* $VD_random[$z] */,status='PAUSED', last_call_finish=?/* $SQLdate */,lead_id='',uniqueid='',callerid='',channel='',last_state_change=?/* $SQLdate */ where user=?/* $VD_user[$z] */ and server_ip=?/* $server_ip */;
bin/AST_VDremote_agents.pl:1049:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue='NONE',agent='Agent/$VD_user[$z]',verb='PAUSEALL',serverid=?/* $queuemetrics_log_id */,data4=?/* $USER_queuemetrics_phone_environment[$z]$pe_append */ $pause_typeSQL;
bin/AST_VDremote_agents.pl:1052:SELECT time_id,data1 FROM queue_log where agent='Agent/$VD_user[$z]' and verb IN('AGENTLOGIN','AGENTCALLBACKLOGIN') and time_id > $check_time order by time_id desc limit 1;
bin/AST_VDremote_agents.pl:1074:SELECT time_id,data3 FROM queue_log where agent='Agent/$VD_user[$z]' and verb='PAUSEREASON' and data1='LOGIN' order by time_id desc limit 1;
bin/AST_VDremote_agents.pl:1091:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue='NONE',agent='Agent/$VD_user[$z]',verb='PAUSEREASON',serverid=?/* $queuemetrics_log_id */,data1='LOGOFF' $pause_typeSQL;
bin/AST_VDremote_agents.pl:1094:SELECT distinct queue FROM queue_log where time_id >= $logintime and agent='Agent/$VD_user[$z]' and verb IN('ADDMEMBER','ADDMEMBER2') and queue != ?/* $VD_campaign_id[$z] */ order by time_id desc;
bin/AST_VDremote_agents.pl:1114:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue=?/* $AM_queue[$rec_count] */,agent='Agent/$VD_user[$z]',verb='REMOVEMEMBER',data1=?/* $phone_logged_in */,serverid=?/* $queuemetrics_log_id */,data4=?/* $USER_queuemetrics_phone_environment[$z]$pe_append */;
bin/AST_VDremote_agents.pl:1122:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue=?/* $VD_campaign_id[$z] */,agent='Agent/$VD_user[$z]',verb=?/* $QM_LOGOFF */,data1=?/* $phone_logged_in */,data2=?/* $time_logged_in */,serverid=?/* $queuemetrics_log_id */,data4=?/* $USER_queuemetrics_phone_environment[$z]$pe_append */;
bin/AST_VDremote_agents.pl:1132:UPDATE vicidial_live_agents set random_id=?/* $VD_random[$z] */, last_call_finish=?/* $SQLdate */,lead_id='',uniqueid='',callerid='',channel='',last_state_change=?/* $SQLdate */ where user=?/* $VD_user[$z] */ and server_ip=?/* $server_ip */;
bin/AST_VDremote_agents.pl:1136:UPDATE vicidial_live_agents set status='READY' where user=?/* $VD_user[$z] */ and server_ip=?/* $server_ip */;
bin/AST_VDremote_agents.pl:1151:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue='NONE',agent='Agent/$VD_user[$z]',verb='PAUSEALL',serverid=?/* $queuemetrics_log_id */,data4=?/* $USER_queuemetrics_phone_environment[$z]$pe_append */ $pause_typeSQL;
bin/AST_VDremote_agents.pl:1154:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue='NONE',agent='Agent/$VD_user[$z]',verb='UNPAUSEALL',serverid=?/* $queuemetrics_log_id */,data4=?/* $USER_queuemetrics_phone_environment[$z]$pe_append */ $pause_typeSQL;
bin/AST_VDremote_agents.pl:1356:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $VD_call_quota_lead_ranking */;
bin/AST_VDremote_agents.pl:1506:SELECT list_id,called_count,rank FROM vicidial_list where lead_id=?/* $CIDlead_id */;
bin/AST_VDremote_agents.pl:1535:SELECT call_date from vicidial_dial_log where lead_id=?/* $CIDlead_id */ and call_date > ?/* $CQSQLdate */ and caller_code LIKE \"%$CIDlead_id\" order by call_date desc limit 1;
bin/AST_VDremote_agents.pl:1604:SELECT first_call_date,UTC_TIMESTAMP(first_call_date),last_call_date from vicidial_lead_call_quota_counts where lead_id=?/* $CIDlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDremote_agents.pl:1633:UPDATE vicidial_lead_call_quota_counts SET last_call_date=?/* $VDLcall_datetime */,status=?/* $temp_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() $session_updateSQL $day_updateSQL where lead_id=?/* $CIDlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDremote_agents.pl:1638:UPDATE vicidial_lead_call_quota_counts SET status=?/* $temp_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() where lead_id=?/* $CIDlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDremote_agents.pl:1646:INSERT INTO vicidial_lead_call_quota_counts SET lead_id=?/* $CIDlead_id */,list_id=?/* $VLlist_id */,first_call_date=?/* $VDLcall_datetime */,last_call_date=?/* $VDLcall_datetime */,status=?/* $temp_status */,called_count=?/* $VLcalled_count */,day_one_calls='1',rank=?/* $tempVLrank */,modify_date=NOW() $session_newSQL;
bin/AST_VDremote_agents.pl:1654:UPDATE vicidial_list SET rank='0' where lead_id=?/* $CIDlead_id */;
bin/AST_manager_listenBUFFER.pl:163:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_listenBUFFER.pl:351:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:372:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */ and status='SENT';
bin/AST_manager_listenBUFFER.pl:417:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listenBUFFER.pl:438:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listenBUFFER.pl:450:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listenBUFFER.pl:471:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:487:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:502:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:517:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:535:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:553:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:571:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:589:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:611:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:630:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:650:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:719:INSERT INTO vicidial_cpd_log set channel=?/* $channel */, uniqueid=?/* $uniqueid */, callerid=?/* $callid */, server_ip=?/* $server_ip */, lead_id=?/* $lead_id */, event_date=?/* $now_date */, result=?/* $result */;
bin/AST_manager_listenBUFFER.pl:756:UPDATE vicidial_dial_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */,uniqueid=?/* $uniqueid */ where caller_code=?/* $callid */ and server_ip=?/* $server_ip */ and lead_id=?/* $lead_id */;
bin/AST_manager_listenBUFFER.pl:784:UPDATE vicidial_carrier_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */ where server_ip=?/* $server_ip */ and caller_code=?/* $callid */ and lead_id=?/* $lead_id */ and call_date > ?/* $preCSQLdate */ and call_date < ?/* $postCSQLdate */ order by call_date desc limit 1;
bin/AST_manager_listenBUFFER.pl:821:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_manager_listenBUFFER.pl:835:SELECT last_update FROM server_updater where server_ip = ?/* $server_ip */;
bin/AST_manager_listenBUFFER.pl:993:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:1014:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */ and status='SENT';
bin/AST_manager_listenBUFFER.pl:1059:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listenBUFFER.pl:1093:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:1102:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:1132:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listenBUFFER.pl:1170:INSERT INTO vicidial_dtmf_log SET dtmf_time=NOW(),channel=?/* $channel */,server_ip=?/* $server_ip */,uniqueid=?/* $uniqueid */,digit=?/* $digit */,direction=?/* $direction */,state=?/* $state */
bin/AST_manager_listenBUFFER.pl:1261:INSERT INTO vicidial_cpd_log set channel=?/* $channel */, uniqueid=?/* $uniqueid */, callerid=?/* $callid */, server_ip=?/* $server_ip */, lead_id=?/* $lead_id */, event_date=?/* $now_date */, result=?/* $cpd_result */;
bin/AST_manager_listenBUFFER.pl:1298:UPDATE vicidial_dial_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */,uniqueid=?/* $uniqueid */ where caller_code=?/* $callid */ and server_ip=?/* $server_ip */ and lead_id=?/* $lead_id */;
bin/AST_manager_listenBUFFER.pl:1326:UPDATE vicidial_carrier_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */ where server_ip=?/* $server_ip */ and caller_code=?/* $callid */ and lead_id=?/* $lead_id */ and call_date > ?/* $preCSQLdate */ and call_date < ?/* $postCSQLdate */ order by call_date desc limit 1;
bin/AST_manager_listenBUFFER.pl:1363:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_manager_listenBUFFER.pl:1377:SELECT last_update FROM server_updater where server_ip = ?/* $server_ip */;
bin/AST_agent_daily_SPH.pl:224:select full_name,user,user_group from vicidial_users order by user_group,full_name limit 1000;
bin/AST_agent_daily_SPH.pl:319:select sum(talk_sec+pause_sec+wait_sec+dispo_sec) from vicidial_agent_log where event_time <= ?/* $enddate */ and event_time >= ?/* $begindate */ and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 and user=?/* $Duser[$i] */ $SQLrestrict limit 1;
bin/AST_agent_daily_SPH.pl:329:select count(*) from vicidial_xfer_log vx,vicidial_closer_log vc where vx.call_date <= ?/* $enddate */ and vx.call_date >= ?/* $begindate */ and vc.status IN('A1','A2','A3','A4','SALE','UPSELL') and vx.user=?/* $Duser[$i] */ and vx.xfercallid=vc.xfercallid;
bin/AST_agent_daily_SPH.pl:362:select sum(talk_sec+pause_sec+wait_sec+dispo_sec) from vicidial_agent_log where event_time <= ?/* $endmonth */ and event_time >= ?/* $beginmonth */ and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 and user=?/* $Duser[$i] */ $SQLrestrict limit 1;
bin/AST_agent_daily_SPH.pl:372:select count(*) from vicidial_xfer_log vx,vicidial_closer_log vc where vx.call_date <= ?/* $endmonth */ and vx.call_date >= ?/* $beginmonth */ and vc.status IN('A1','A2','A3','A4','SALE','UPSELL') and vx.user=?/* $Duser[$i] */ and vx.xfercallid=vc.xfercallid;
bin/AST_agent_daily_SPH.pl:385:select sum(talk_sec+pause_sec+wait_sec+dispo_sec) from vicidial_agent_log where event_time <= ?/* $endmonth */ and event_time >= ?/* $TMyear$Ybegin */ and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 and user=?/* $Duser[$i] */ $SQLrestrict limit 1;
bin/AST_agent_daily_SPH.pl:395:select count(*) from vicidial_xfer_log vx,vicidial_closer_log vc where vx.call_date <= ?/* $endmonth */ and vx.call_date >= ?/* $TMyear$Ybegin */ and vc.status IN('A1','A2','A3','A4','SALE','UPSELL') and vx.user=?/* $Duser[$i] */ and vx.xfercallid=vc.xfercallid;
bin/AST_agent_daily_SPH.pl:682:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $begindate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time limit 1;
bin/AST_agent_daily_SPH.pl:691:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $begindate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time desc limit 1;
bin/AST_send_URL.pl:182:SELECT vd_server_logs,local_gmt,ext_context FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_send_URL.pl:199:SELECT start_call_url,add_lead_url,na_call_url,waiting_call_url_on,waiting_call_url_off,enter_ingroup_url FROM vicidial_inbound_groups where group_id=?/* $campaign */;
bin/AST_send_URL.pl:201:SELECT start_call_url,'NONE',na_call_url,'NONE','NONE','NONE' FROM vicidial_campaigns where campaign_id=?/* $campaign */;
bin/AST_send_URL.pl:222:SELECT container_entry from vicidial_settings_containers where container_id=?/* $container */;
bin/AST_send_URL.pl:239:SELECT na_call_url FROM vicidial_lists where list_id=?/* $list_id */;
bin/AST_send_URL.pl:258:SELECT list_name,list_description FROM vicidial_lists where list_id=?/* $list_id */;
bin/AST_send_URL.pl:331:SELECT list_id,phone_code,vendor_lead_code FROM vicidial_list where lead_id=?/* $lead_id */;
bin/AST_send_URL.pl:344:SELECT did_id,extension FROM vicidial_did_log where uniqueid=?/* $uniqueid */;
bin/AST_send_URL.pl:356:SELECT did_pattern,did_description FROM vicidial_inbound_dids where did_id=?/* $VAR_did_id */;
bin/AST_send_URL.pl:368:SELECT closecallid FROM vicidial_closer_log where uniqueid=?/* $uniqueid */ order by closecallid limit 1;
bin/AST_send_URL.pl:381:SELECT list_name,list_description FROM vicidial_lists where list_id=?/* $VAR_list_id */;
bin/AST_send_URL.pl:427:SELECT lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner,phone_code FROM vicidial_list where lead_id=?/* $lead_id */;
bin/AST_send_URL.pl:468:SELECT did_id,extension FROM vicidial_did_log where uniqueid=?/* $uniqueid */;
bin/AST_send_URL.pl:480:SELECT did_pattern,did_description FROM vicidial_inbound_dids where did_id=?/* $VAR_did_id */;
bin/AST_send_URL.pl:495:SELECT custom_one,custom_two,custom_three,custom_four,custom_five,user_group,full_name from vicidial_users where user=?/* $user */;
bin/AST_send_URL.pl:514:SELECT closecallid FROM vicidial_closer_log where uniqueid=?/* $uniqueid */ order by closecallid limit 1;
bin/AST_send_URL.pl:528:SELECT list_name,list_description FROM vicidial_lists where list_id=?/* $VAR_list_id */;
bin/AST_send_URL.pl:616:SELECT lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner,phone_code FROM vicidial_list where lead_id=?/* $lead_id */;
bin/AST_send_URL.pl:657:SELECT custom_one,custom_two,custom_three,custom_four,custom_five,user_group,full_name from vicidial_users where user=?/* $user */;
bin/AST_send_URL.pl:676:SELECT did_id,extension FROM vicidial_did_log where uniqueid=?/* $uniqueid */;
bin/AST_send_URL.pl:688:SELECT did_pattern,did_description FROM vicidial_inbound_dids where did_id=?/* $VAR_did_id */;
bin/AST_send_URL.pl:703:SELECT closecallid FROM vicidial_closer_log where uniqueid=?/* $uniqueid */ order by closecallid limit 1;
bin/AST_send_URL.pl:717:SELECT list_name,list_description FROM vicidial_lists where list_id=?/* $VAR_list_id */;
bin/AST_send_URL.pl:806:SELECT user,status,talk_sec,dead_sec,dispo_epoch from vicidial_agent_log where lead_id=?/* $lead_id */ order by agent_log_id desc limit 1;
bin/AST_send_URL.pl:826:SELECT lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner,phone_code FROM vicidial_list where lead_id=?/* $lead_id */;
bin/AST_send_URL.pl:868:SELECT custom_one,custom_two,custom_three,custom_four,custom_five,user_group,full_name from vicidial_users where user=?/* $user */;
bin/AST_send_URL.pl:887:SELECT did_id,extension FROM vicidial_did_log where uniqueid=?/* $uniqueid */;
bin/AST_send_URL.pl:899:SELECT did_pattern,did_description FROM vicidial_inbound_dids where did_id=?/* $VAR_did_id */;
bin/AST_send_URL.pl:914:SELECT closecallid FROM vicidial_closer_log where uniqueid=?/* $uniqueid */ order by closecallid limit 1;
bin/AST_send_URL.pl:928:SELECT list_name,list_description FROM vicidial_lists where list_id=?/* $VAR_list_id */;
bin/AST_send_URL.pl:1019:SELECT lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner,phone_code FROM vicidial_list where lead_id=?/* $lead_id */;
bin/AST_send_URL.pl:1060:SELECT custom_one,custom_two,custom_three,custom_four,custom_five,user_group,full_name from vicidial_users where user=?/* $user */;
bin/AST_send_URL.pl:1079:SELECT did_id,extension FROM vicidial_did_log where uniqueid=?/* $uniqueid */;
bin/AST_send_URL.pl:1091:SELECT did_pattern,did_description FROM vicidial_inbound_dids where did_id=?/* $VAR_did_id */;
bin/AST_send_URL.pl:1106:SELECT closecallid FROM vicidial_closer_log where uniqueid=?/* $uniqueid */ order by closecallid limit 1;
bin/AST_send_URL.pl:1120:SELECT list_name,list_description FROM vicidial_lists where list_id=?/* $VAR_list_id */;
bin/AST_send_URL.pl:1205:UPDATE vicidial_log_extended set start_url_processed='Y' where uniqueid=?/* $uniqueid */;
bin/AST_send_URL.pl:1215:INSERT INTO vicidial_url_log SET uniqueid=?/* $uniqueid */,url_date=?/* $now_date */,url_type=?/* $url_function */,url=?/* $SQL_log */,url_response='';
bin/AST_send_URL.pl:1217:SELECT LAST_INSERT_ID() LIMIT 1;
bin/AST_send_URL.pl:1276:UPDATE vicidial_url_log SET url_response=?/* $Wdocline_cat|$Wfileline_cat */,response_sec=?/* $response_sec */ where url_log_id=?/* $url_id */;
bin/AST_inbound_email_parser.pl:221:SELECT allow_emails,default_phone_code,enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,queuemetrics_eq_prepend FROM system_settings;
bin/AST_inbound_email_parser.pl:249:SELECT email_account_id,email_account_name,email_account_description,user_group,protocol,email_replyto_address,email_account_server,email_account_user,email_account_pass,pop3_auth_mode,active,email_frequency_check_mins,group_id,default_list_id,call_handle_method,agent_search_method,campaign_id,list_id,email_account_type from vicidial_email_accounts where active='Y'
bin/AST_inbound_email_parser.pl:581:select list_id from vicidial_lists where campaign_id=?/* $campaign_id */
bin/AST_inbound_email_parser.pl:595:select lead_id, list_id from vicidial_list $call_handle_clause limit $limit
bin/AST_inbound_email_parser.pl:603:insert into vicidial_list(list_id, email, comments, status, entry_date, phone_code) values(?/* $default_list_id */, ?/* $email_from */, ?/* '".substr($message,0,255)."' */, ?/* $status */, NOW(), ?/* $SSdefault_phone_code */)
bin/AST_inbound_email_parser.pl:614:insert into vicidial_email_list(lead_id, protocol, email_date, email_to, email_from, email_from_name, subject, mime_type, content_type, content_transfer_encoding, x_mailer, sender_ip, message, email_account_id, group_id, status, direction) values(?/* $lead_id */, 'IMAP', STR_TO_DATE(?/* $email_date */, '%d %b %Y %T'), ?/* $email_to */, ?/* $email_from */, ?/* $email_from_name */, ?/* $subject */, ?/* $mime_type */, ?/* $content_type */, ?/* $content_transfer_encoding */, ?/* $x_mailer */, ?/* $sender_ip */, trim(?/* $message */), ?/* $VARemail_ID */, ?/* $VARemail_groupid */, ?/* $status */, 'INBOUND')
bin/AST_inbound_email_parser.pl:655:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $caller_code */,queue='NONE',agent='NONE',verb='INFO',data1='DID',data2=?/* $VARemail_ID */,serverid=?/* $queuemetrics_log_id */;
bin/AST_inbound_email_parser.pl:658:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $caller_code */,queue='NONE',agent='NONE',verb='INFO',data1='IVRSTART',data2=?/* $VARemail_groupid */,data3=?/* $VARemail_ID */,serverid=?/* $queuemetrics_log_id */;
bin/AST_inbound_email_parser.pl:661:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $caller_code */,queue='NONE',agent='NONE',verb='INFO',data1='IVR',data2=?/* $VARemail_groupid */,serverid=?/* $queuemetrics_log_id */;
bin/AST_inbound_email_parser.pl:956:select list_id from vicidial_lists where campaign_id=?/* $campaign_id */
bin/AST_inbound_email_parser.pl:970:select lead_id from vicidial_list $call_handle_clause limit $limit
bin/AST_inbound_email_parser.pl:977:insert into vicidial_list(list_id, email, comments, status, entry_date, phone_code) values(?/* $default_list_id */, ?/* $email_from */, ?/* '".substr($message,0,255)."' */, ?/* $status */, NOW(), ?/* $SSdefault_phone_code */)
bin/AST_inbound_email_parser.pl:988:insert into vicidial_email_list(lead_id, protocol, email_date, email_to, email_from, email_from_name, subject, mime_type, content_type, content_transfer_encoding, x_mailer, sender_ip, message, email_account_id, group_id, status, direction) values(?/* $lead_id */, 'POP3', STR_TO_DATE(?/* $date */, '%d %b %Y %T'), ?/* $email_to */, ?/* $email_from */, ?/* $email_from_name */, ?/* $subject */, ?/* $mime_type */, ?/* $content_type */, ?/* $content_transfer_encoding */, ?/* $x_mailer */, ?/* $sender_ip */, trim(?/* $message */), ?/* $VARemail_ID */, ?/* $VARemail_groupid */, ?/* $status */, 'INBOUND')
bin/AST_inbound_email_parser.pl:1026:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $caller_code */,queue='NONE',agent='NONE',verb='INFO',data1='DID',data2=?/* $VARemail_ID */,serverid=?/* $queuemetrics_log_id */;
bin/AST_inbound_email_parser.pl:1029:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $caller_code */,queue='NONE',agent='NONE',verb='INFO',data1='IVRSTART',data2=?/* $VARemail_groupid */,data3=?/* $VARemail_ID */,serverid=?/* $queuemetrics_log_id */;
bin/AST_inbound_email_parser.pl:1032:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $caller_code */,queue='NONE',agent='NONE',verb='INFO',data1='IVR',data2=?/* $VARemail_groupid */,serverid=?/* $queuemetrics_log_id */;
bin/AST_agent_week.pl:230:select count(*) as calls, full_name,vicidial_users.user,sum(talk_sec),sum(pause_sec),sum(wait_sec),sum(dispo_sec) from vicidial_users,$vicidial_agent_log where event_time <= ?/* $PAST_date[$h] 23:59:59 */ and event_time >= ?/* $PAST_date[$h] 00:00:00 */ and vicidial_users.user=$vicidial_agent_log.user and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 group by vicidial_users.user order by full_name limit 10000;
bin/AST_agent_week.pl:299:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $PAST_date[$h] 23:59:59 */ and event_time >= ?/* $PAST_date[$h] 00:00:00 */ and user=?/* $aryA[2] */ order by event_time limit 1;
bin/AST_agent_week.pl:306:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $PAST_date[$h] 23:59:59 */ and event_time >= ?/* $PAST_date[$h] 00:00:00 */ and user=?/* $aryA[2] */ order by event_time desc limit 1;
bin/ADMIN_www_languages.pl:188:SELECT count(*) FROM www_phrases;
bin/ADMIN_www_languages.pl:205:DELETE FROM www_phrases;
bin/ADMIN_www_languages.pl:417:SELECT count(*) FROM www_phrases where phrase_text=?/* $temp_QXZval_strSQL */;
bin/ADMIN_www_languages.pl:437:INSERT INTO www_phrases SET phrase_text=?/* $temp_QXZval_strSQL */,php_filename=?/* $FILEparseNAME[$f] */,php_directory=?/* $FILEparseDIR[$f] */,source='www_languages_script',insert_date=NOW();
bin/VICIDIAL_IN_preprocess_leads_file.pl:284:SELECT use_non_latin FROM system_settings;
bin/VICIDIAL_IN_preprocess_leads_file.pl:1286:select cid from vicidial_custom_cid where state=?/* $state */;
bin/VICIDIAL_IN_preprocess_leads_file.pl:1306:select state from vicidial_phone_codes where areacode=?/* $USarea */ and country_code='1';
bin/VICIDIAL_IN_preprocess_leads_file.pl:1318:select cid from vicidial_custom_cid where state=?/* $state */;
bin/AST_chat_timeout_cron.pl:115:select allow_chats, chat_timeout from system_settings
bin/AST_chat_timeout_cron.pl:125:select distinct chat_id from vicidial_chat_participants where vd_agent='N' and ping_date<=now()-INTERVAL ".$chat_timeout." SECOND
bin/AST_chat_timeout_cron.pl:136:insert ignore into vicidial_chat_archive select chat_id, chat_start_time, 'DROP' as status, chat_creator, group_id, lead_id from vicidial_live_chats where chat_id in (".$chat_id_str.")
bin/AST_chat_timeout_cron.pl:138:insert ignore into vicidial_chat_log_archive select * from vicidial_chat_log where chat_id in (".$chat_id_str.")
bin/AST_chat_timeout_cron.pl:141:delete from vicidial_chat_participants where vd_agent='N' and ping_date<=now()-INTERVAL ".$chat_timeout." SECOND and chat_id in (".$chat_id_str.")
bin/AST_chat_timeout_cron.pl:147:select lead_id from vicidial_live_chats where chat_id in (".$chat_id_str.") and status='WAITING' and chat_creator='NONE'
bin/AST_chat_timeout_cron.pl:155:update vicidial_list set status='CDROP' where lead_id in (".$lead_id_str.")
bin/AST_chat_timeout_cron.pl:158:delete from vicidial_live_chats where chat_id in (".$chat_id_str.") and status='WAITING' and chat_creator='NONE'
bin/AST_chat_timeout_cron.pl:161:delete from vicidial_chat_log where chat_id in (".$chat_id_str.")
bin/AST_chat_timeout_cron.pl:166:select lead_id, chat_creator, chat_id from vicidial_live_chats where chat_id in (".$chat_id_str.") and status='LIVE' and chat_creator!='NONE'
bin/AST_chat_timeout_cron.pl:175:insert into vicidial_chat_log(poster, chat_member_name, message_time, message, chat_id, chat_level) select ?/* $chat_creator */, full_name, now(), 'Customer seems to have abandoned chat', ?/* $chat_id */, '1' from vicidial_users where user=?/* $chat_creator */
bin/AST_chat_timeout_cron.pl:187:select user from vicidial_live_agents
bin/AST_chat_timeout_cron.pl:198:insert ignore into vicidial_manager_chat_log_archive select * from vicidial_manager_chat_log where user not in ($agent_str)
bin/AST_chat_timeout_cron.pl:201:delete from vicidial_manager_chat_log where user not in ($agent_str)
bin/AST_chat_timeout_cron.pl:205:select distinct manager_chat_id from vicidial_manager_chat_log
bin/AST_chat_timeout_cron.pl:209:insert ignore into vicidial_manager_chats_archive select * from vicidial_manager_chats
bin/AST_chat_timeout_cron.pl:211:delete from vicidial_manager_chats
bin/AST_chat_timeout_cron.pl:222:insert ignore into vicidial_manager_chats_archive select * from vicidial_manager_chats where manager_chat_id not in ($chat_str)
bin/AST_chat_timeout_cron.pl:224:delete from vicidial_manager_chats where manager_chat_id not in ($chat_str)
bin/AST_chat_timeout_cron.pl:229:insert ignore into vicidial_manager_chat_log_archive select * from vicidial_manager_chat_log
bin/AST_chat_timeout_cron.pl:232:delete from vicidial_manager_chat_log
bin/AST_chat_timeout_cron.pl:236:insert ignore into vicidial_manager_chats_archive select * from vicidial_manager_chats
bin/AST_chat_timeout_cron.pl:238:delete from vicidial_manager_chats
bin/AST_CRON_GSM_SALE_recordings.pl:111:SELECT recording_log.lead_id,recording_id,start_time,filename,location,status FROM recording_log,vicidial_log where start_time > ?/* $BEGINdate */ and start_time < ?/* $ENDdate */ and location IS NOT NULL and location NOT IN('','NOT_FOUND','NOT_FOUND_2','DELETED') and vicidial_log.status IN($save_statusesSQL) and call_date  > ?/* $BEGINdate */ and call_date < ?/* $ENDdate */ and recording_log.lead_id=vicidial_log.lead_id and recording_log.user=vicidial_log.user order by recording_id LIMIT 500000;
bin/AST_CRON_audio_2_compress.pl:307:select recording_id, LEFT(start_time,10) AS file_date from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/AST_CRON_audio_2_compress.pl:347:UPDATE recording_log set location=?/* $HTTP://$server_ip/RECORDINGS/$location$GSMfile */ where recording_id=?/* $recording_id */;
bin/AST_CRON_audio_2_compress.pl:361:UPDATE recording_log set location=?/* $HTTP://$server_ip/RECORDINGS/$location$OGGfile */ where recording_id=?/* $recording_id */;
bin/AST_CRON_audio_2_compress.pl:375:UPDATE recording_log set location=?/* $HTTP://$server_ip/RECORDINGS/$location$MP3file */ where recording_id=?/* $recording_id */;
bin/AST_CRON_audio_2_compress.pl:391:UPDATE recording_log set location=?/* $HTTP://$server_ip/RECORDINGS/$location$GSWfile */ where recording_id=?/* $recording_id */;
bin/AST_dialer_inventory_snapshot.pl:167:SELECT default_local_gmt from system_settings
bin/AST_dialer_inventory_snapshot.pl:173:SELECT distinct gmt_offset_now, gmt_offset_now-($local_offset) from vicidial_list
bin/AST_dialer_inventory_snapshot.pl:190:SELECT shift_id, shift_name, str_to_date(shift_start_time, '%H%i') as shift_start_time, addtime(str_to_date(shift_start_time, '%H%i'), shift_length) as shift_end_time, if(addtime(str_to_date(shift_start_time, '%H%i'), shift_length)>'23:59:59', '1', '0') as day_offset, shift_weekdays from vicidial_shifts where report_option='Y' order by shift_start_time asc
bin/AST_dialer_inventory_snapshot.pl:204:SELECT campaign_id from vicidial_campaigns  where campaign_id in (SELECT distinct campaign_id from vicidial_lists where inventory_report='Y') $campaign_SQL order by campaign_id;
bin/AST_dialer_inventory_snapshot.pl:209:SELECT call_count_limit, call_count_target, dial_statuses, local_call_time, drop_lockout_time from vicidial_campaigns where campaign_id=?/* $group[0] */
bin/AST_dialer_inventory_snapshot.pl:221:SELECT distinct status from vicidial_statuses where completed='N' UNION SELECT distinct status from vicidial_campaign_statuses where completed='N' and campaign_id=?/* $group[0] */
bin/AST_dialer_inventory_snapshot.pl:242:SELECT lead_filter_sql from vicidial_campaigns v, vicidial_lead_filters vlf where v.campaign_id=?/* $group[0] */ and v.lead_filter_id=vlf.lead_filter_id limit 1
bin/AST_dialer_inventory_snapshot.pl:252:SELECT list_id, list_name, list_description, if(list_lastcalldate is null, '*** Not called *** ', list_lastcalldate) as list_lastcalldate from vicidial_lists where (campaign_id=?/* $group[0] */) and inventory_report='Y' $list_SQL order by list_id asc
bin/AST_dialer_inventory_snapshot.pl:295:SELECT distinct gmt_offset_now from vicidial_list where list_id=?/* $list_id */
bin/AST_dialer_inventory_snapshot.pl:345:SELECT count(*) from (SELECT lead_id, count(*) as count from vicidial_log where lead_id in (SELECT lead_id from vicidial_list where $full_dialable_SQL and gmt_offset_now=?/* $gmt_row[0] */ $filter_SQL) $shift_days_SQL group by lead_id) as count_table where count_table.count>=?/* $call_count_target */
bin/AST_dialer_inventory_snapshot.pl:356:insert into dialable_inventory_snapshots(snapshot_time, list_id, list_name, list_description, campaign_id, list_lastcalldate, list_start_inv, dialable_count, dialable_count_nofilter, dialable_count_oneoff, dialable_count_inactive, average_call_count, penetration, shift_data, time_setting) values(?/* $snapshot_time */, ?/* $list_id */, ?/* $list_name */, ?/* $list_description */, ?/* $group[0] */, ?/* $last_calldate */, ?/* $list_start_inv */, ?/* $Xdialable_count */, ?/* $Xdialable_count_nofilter */, ?/* $oneoff_count */, ?/* $Xdialable_inactive_count */, ?/* $average_calls */, ?/* $penetration */, ?/* $shift_data */, ?/* $time_setting */)
bin/AST_dialer_inventory_snapshot.pl:379:SELECT status, called_count, count(*) From vicidial_list where list_id=?/* $list_id */ group by status, called_count order by status, called_count
bin/AST_dialer_inventory_snapshot.pl:430:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times FROM vicidial_call_times where call_time_id=?/* $local_call_time */;
bin/AST_dialer_inventory_snapshot.pl:466:SELECT state_call_time_id,state_call_time_state,state_call_time_name,state_call_time_comments,sct_default_start,sct_default_stop,sct_sunday_start,sct_sunday_stop,sct_monday_start,sct_monday_stop,sct_tuesday_start,sct_tuesday_stop,sct_wednesday_start,sct_wednesday_stop,sct_thursday_start,sct_thursday_stop,sct_friday_start,sct_friday_stop,sct_saturday_start,sct_saturday_stop from vicidial_state_call_times where state_call_time_id=?/* $state_rules[$b] */;
bin/AST_dialer_inventory_snapshot.pl:734:SELECT count(*) FROM vicidial_list where status IN($Dsql) and list_id IN($camp_lists) and ($all_gmtSQL) $CCLsql $DLTsql $fSQL
bin/AST_phone_update.pl:122:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_phone_update.pl:183:SELECT distinct server_phone from vicidial_user_log where server_ip=?/* $server_ip */ and phone_ip='LOOKUP' and event_date > ?/* $BDtsSQLdate */ and extension LIKE \"SIP%\
bin/AST_phone_update.pl:208:SELECT extension,phone_ip,login from phones where server_ip=?/* $server_ip */ and protocol='SIP' $phone_listSQL;
bin/AST_phone_update.pl:305:UPDATE phones set phone_ip=?/* $NEW_IPaddr[$i] */ where server_ip=?/* $server_ip */ and extension=?/* $PTextensions[$i] */;
bin/AST_phone_update.pl:312:UPDATE vicidial_user_log set phone_ip=?/* $NEW_IPaddr[$i] */ where server_phone=?/* $PTlogins[$i] */ and server_ip=?/* $server_ip */ and phone_ip='LOOKUP' and event_date > ?/* $BDtsSQLdate */ and extension LIKE \"SIP%\
bin/AST_phone_update.pl:346:SELECT distinct server_phone from vicidial_user_log where server_ip=?/* $server_ip */ and phone_ip='LOOKUP' and event_date > ?/* $BDtsSQLdate */ and extension LIKE \"IAX%\
bin/AST_phone_update.pl:371:SELECT extension,phone_ip,login from phones where server_ip=?/* $server_ip */ and protocol='IAX2'  $phone_listSQL;
bin/AST_phone_update.pl:468:UPDATE phones set phone_ip=?/* $NEW_IPaddr[$i] */ where server_ip=?/* $server_ip */ and extension=?/* $PTextensions[$i] */;
bin/AST_phone_update.pl:475:UPDATE vicidial_user_log set phone_ip=?/* $NEW_IPaddr[$i] */ where server_phone=?/* $PTlogins[$i] */ and server_ip=?/* $server_ip */ and phone_ip='LOOKUP' and event_date > ?/* $BDtsSQLdate */ and extension LIKE \"IAX%\
bin/AST_inbound_export.pl:339:SELECT lead_id,call_date,length_in_sec,phone_number,status,user,campaign_id from $vicidial_closer_log where call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ $ingroupsSQL;
bin/AST_inbound_export.pl:408:SELECT full_name from vicidial_users where user=?/* $user */;
bin/AST_inbound_export.pl:420:SELECT vendor_lead_code,list_id,first_name,last_name,address1,address2,address3,city,state,country_code,security_phrase from vicidial_list where lead_id=$lead_id;
bin/AST_sourceID_summary_export.pl:239:select source_id,count(*) from vicidial_list where status IN($sale_statusesSQL) and list_id NOT IN($ignore_listsSQL) group by source_id order by source_id;
bin/AST_sourceID_summary_export.pl:261:select source_id,count(*) from vicidial_list where status IN($ni_statusesSQL) and list_id NOT IN($ignore_listsSQL) group by source_id order by source_id;
bin/AST_sourceID_summary_export.pl:283:select source_id,count(*) from vicidial_list where status IN($np_statusesSQL) and list_id NOT IN($ignore_listsSQL) group by source_id order by source_id;
bin/AST_sourceID_summary_export.pl:305:select source_id,count(*) from vicidial_list where list_id NOT IN($ignore_listsSQL) group by source_id order by source_id;
bin/AST_DB_DNC_filter.pl:177:SELECT count(*) from vicidial_dnc;
bin/AST_DB_DNC_filter.pl:191:SELECT count(*),campaign_id from vicidial_campaign_dnc group by campaign_id order by campaign_id;
bin/AST_DB_DNC_filter.pl:236:SELECT phone_number from vicidial_dnc where $removelessSQL $removemoreSQL $remove_nondigitsSQL $protect_areacodesSQL limit 100000000;
bin/AST_DB_DNC_filter.pl:257:DELETE from vicidial_dnc where phone_number=?/* $phone_numbers[$rec_count] */;
bin/AST_DB_DNC_filter.pl:263:INSERT INTO vicidial_dnc_log SET phone_number=?/* $phone_numbers[$rec_count] */, campaign_id='-SYSINT-', action='delete', action_date=NOW(), user='CLIFLTR';
bin/AST_DB_DNC_filter.pl:281:SELECT phone_number,campaign_id from vicidial_campaign_dnc where $removelessSQL $removemoreSQL $remove_nondigitsSQL $protect_areacodesSQL $CLIcampaignSQL limit 100000000;
bin/AST_DB_DNC_filter.pl:303:DELETE from vicidial_campaign_dnc where phone_number=?/* $Cphone_numbers[$rec_count] */ and campaign_id=?/* $Ccampaigns[$rec_count] */;
bin/AST_DB_DNC_filter.pl:309:INSERT INTO vicidial_dnc_log SET phone_number=?/* $Cphone_numbers[$rec_count] */, campaign_id=?/* $Ccampaigns[$rec_count] */, action='delete', action_date=NOW(), user='CLIFLTR';
bin/AST_twoday_tables_control.pl:166:INSERT IGNORE INTO twoday_call_log SELECT * from call_log where start_time > ?/* $HHSQLdate */ ON DUPLICATE KEY UPDATE end_time=VALUES(end_time),end_epoch=VALUES(end_epoch),length_in_sec=VALUES(length_in_sec),length_in_min=VALUES(length_in_min);
bin/AST_twoday_tables_control.pl:173:INSERT IGNORE INTO twoday_vicidial_log SELECT * from vicidial_log where call_date > ?/* $HHSQLdate */ ON DUPLICATE KEY UPDATE end_epoch=VALUES(end_epoch),length_in_sec=VALUES(length_in_sec),status=VALUES(status),user=VALUES(user),comments=VALUES(comments),user_group=VALUES(user_group),term_reason=VALUES(term_reason),alt_dial=VALUES(alt_dial);
bin/AST_twoday_tables_control.pl:180:INSERT IGNORE INTO twoday_vicidial_closer_log SELECT * from vicidial_closer_log where call_date > ?/* $HHSQLdate */ ON DUPLICATE KEY UPDATE list_id=VALUES(list_id),campaign_id=VALUES(campaign_id),end_epoch=VALUES(end_epoch),length_in_sec=VALUES(length_in_sec),status=VALUES(status),user=VALUES(user),comments=VALUES(comments),queue_seconds=VALUES(queue_seconds),user_group=VALUES(user_group),xfercallid=VALUES(xfercallid),term_reason=VALUES(term_reason),uniqueid=VALUES(uniqueid),agent_only=VALUES(agent_only);
bin/AST_twoday_tables_control.pl:187:INSERT IGNORE INTO twoday_recording_log SELECT * from recording_log where start_time > ?/* $HHSQLdate */ ON DUPLICATE KEY UPDATE end_time=VALUES(end_time),end_epoch=VALUES(end_epoch),length_in_sec=VALUES(length_in_sec),length_in_min=VALUES(length_in_min),filename=VALUES(filename),location=VALUES(location),lead_id=VALUES(lead_id),user=VALUES(user),vicidial_id=VALUES(vicidial_id);
bin/AST_twoday_tables_control.pl:194:INSERT IGNORE INTO twoday_vicidial_xfer_log SELECT * from vicidial_xfer_log where call_date > ?/* $HHSQLdate */ ON DUPLICATE KEY UPDATE list_id=VALUES(list_id),campaign_id=VALUES(campaign_id),call_date=VALUES(call_date),user=VALUES(user),closer=VALUES(closer);
bin/AST_twoday_tables_control.pl:201:INSERT IGNORE INTO twoday_vicidial_agent_log SELECT * from vicidial_agent_log where event_time > ?/* $HHSQLdate */ ON DUPLICATE KEY UPDATE lead_id=VALUES(lead_id),campaign_id=VALUES(campaign_id),pause_epoch=VALUES(pause_epoch),pause_sec=VALUES(pause_sec),wait_epoch=VALUES(wait_epoch),wait_sec=VALUES(wait_sec),talk_epoch=VALUES(talk_epoch),talk_sec=VALUES(talk_sec),dispo_epoch=VALUES(dispo_epoch),dispo_sec=VALUES(dispo_sec),status=VALUES(status),user_group=VALUES(user_group),comments=VALUES(comments),sub_status=VALUES(sub_status);
bin/AST_twoday_tables_control.pl:214:DELETE FROM twoday_call_log where start_time < ?/* $YDSQLdate */;
bin/AST_twoday_tables_control.pl:221:DELETE FROM twoday_vicidial_log where call_date < ?/* $YDSQLdate */;
bin/AST_twoday_tables_control.pl:228:DELETE FROM twoday_vicidial_closer_log where call_date < ?/* $YDSQLdate */;
bin/AST_twoday_tables_control.pl:235:DELETE FROM twoday_recording_log where start_time < ?/* $YDSQLdate */;
bin/AST_twoday_tables_control.pl:242:DELETE FROM twoday_vicidial_xfer_log where call_date < ?/* $YDSQLdate */;
bin/AST_twoday_tables_control.pl:249:DELETE FROM twoday_vicidial_agent_log where event_time < ?/* $YDSQLdate */;
bin/AST_flush_DBqueue.pl:220:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_flush_DBqueue.pl:234:SELECT sip_event_logging FROM system_settings limit 1;
bin/AST_flush_DBqueue.pl:250:DELETE from vicidial_manager where entry_date < ?/* $flush_time */;
bin/AST_flush_DBqueue.pl:255:DELETE from vicidial_dtmf_log where dtmf_time < ?/* $flush_time */;
bin/AST_flush_DBqueue.pl:260:DELETE from routing_initiated_recordings where launch_time < ?/* $flush_time */;
bin/AST_flush_DBqueue.pl:265:DELETE from parked_channels_recent where park_end_time < ?/* $flush_time */;
bin/AST_flush_DBqueue.pl:270:DELETE from cid_channels_recent where call_date < ?/* $SQLdate_NEG_2min */;
bin/AST_flush_DBqueue.pl:275:DELETE from vicidial_agent_vmm_overrides where call_date < ?/* $flush_time */;
bin/AST_flush_DBqueue.pl:283:DELETE from vicidial_sip_event_recent where invite_date < ?/* $SQLdate_NEG_2hour */;
bin/AST_flush_DBqueue.pl:461:SELECT server_ip,server_id FROM servers where active='Y' and active_asterisk_server='Y';
bin/AST_flush_DBqueue.pl:490:DELETE from cid_channels_recent_$PADserver_ip[$aas] where call_date < ?/* $SQLdate_NEG_2min */;
bin/AST_flush_DBqueue.pl:515:DELETE from vicidial_sessions_recent where call_date < ?/* $SQLdate_NEG_1hour */;
bin/AST_VDauto_dial_FILL.pl:175:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs FROM servers where server_ip = ?/* $server_ip */;
bin/AST_VDauto_dial_FILL.pl:271:SELECT count(*) FROM servers where vicidial_balance_active = 'Y';
bin/AST_VDauto_dial_FILL.pl:283:SELECT campaign_id,sum(local_trunk_shortage) FROM vicidial_campaign_server_stats where update_time > ?/* $XDSQLdate */ and local_trunk_shortage > 0 group by campaign_id;
bin/AST_VDauto_dial_FILL.pl:302:SELECT outbound_calls_per_second,outbound_autodial_active,disable_auto_dial FROM system_settings;
bin/AST_VDauto_dial_FILL.pl:349:SELECT dial_timeout,dial_prefix,campaign_cid,active,campaign_vdad_exten,omit_phone_code,auto_alt_dial,queue_priority,use_custom_cid,cid_group_id,scheduled_callbacks_auto_reschedule,dial_timeout_lead_container FROM vicidial_campaigns where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:378:SELECT balance_trunk_fill FROM vicidial_campaign_stats where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:389:SELECT count(*) FROM vicidial_auto_calls where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */ and call_type='OUTBALANCE';
bin/AST_VDauto_dial_FILL.pl:412:SELECT server_ip FROM vicidial_campaign_server_stats where update_time > ?/* $XDSQLdate */ and local_trunk_shortage > 0 and campaign_id=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:432:SELECT count(*) FROM servers where vicidial_balance_active = 'Y' and server_ip NOT IN($full_serversSQL);
bin/AST_VDauto_dial_FILL.pl:462:SELECT server_ip,max_vicidial_trunks,balance_trunks_offlimits,vicidial_balance_rank,asterisk_version,routing_prefix FROM servers where vicidial_balance_active = 'Y' and server_ip NOT IN($full_serversSQL) order by vicidial_balance_rank desc, server_ip;
bin/AST_VDauto_dial_FILL.pl:493:SELECT dedicated_trunks,trunk_restriction FROM vicidial_server_trunks where server_ip=?/* $DB_camp_server_server_ip[$server_CIPct] */ and campaign_id=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:506:SELECT sum(dedicated_trunks) FROM vicidial_server_trunks where server_ip=?/* $DB_camp_server_server_ip[$server_CIPct] */ and campaign_id NOT IN(?/* $DBfill_campaign[$camp_CIPct] */);
bin/AST_VDauto_dial_FILL.pl:520:SELECT count(*) FROM vicidial_auto_calls where server_ip=?/* $DB_camp_server_server_ip[$server_CIPct] */ and campaign_id=?/* $DBfill_campaign[$camp_CIPct] */ and call_type='OUTBALANCE';
bin/AST_VDauto_dial_FILL.pl:531:SELECT count(*) FROM vicidial_auto_calls where server_ip=?/* $DB_camp_server_server_ip[$server_CIPct] */ and campaign_id=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:542:SELECT count(*) FROM vicidial_auto_calls where server_ip=?/* $DB_camp_server_server_ip[$server_CIPct] */ and campaign_id!=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:584:SELECT count(*) FROM vicidial_live_agents where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */ and status NOT IN('PAUSED');
bin/AST_VDauto_dial_FILL.pl:616:UPDATE vicidial_hopper set status='QUEUE', user='VDFC_$DB_camp_server_server_ip[$server_CIPct]' where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */ and status='READY' order by priority desc,hopper_id LIMIT $DB_camp_server_trunks_to_dial[$server_CIPct];
bin/AST_VDauto_dial_FILL.pl:626:SELECT lead_id,alt_dial,source FROM vicidial_hopper where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */ and status='QUEUE' and user='VDFC_$DB_camp_server_server_ip[$server_CIPct]' order by priority desc,hopper_id LIMIT 1;
bin/AST_VDauto_dial_FILL.pl:654:UPDATE vicidial_hopper set status='INCALL' where lead_id=?/* $lead_id */;
bin/AST_VDauto_dial_FILL.pl:659:SELECT list_id,gmt_offset_now,called_since_last_reset,phone_code,phone_number,address3,alt_phone,called_count,security_phrase,state,vendor_lead_code,source_id,title,first_name,middle_initial,last_name,address1,address2,city,province,postal_code,country_code,date_of_birth,email,comments,rank,owner FROM vicidial_list where lead_id=?/* $lead_id */;
bin/AST_VDauto_dial_FILL.pl:706:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $DBIPdial_timeout_lead_container[$user_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:813:SELECT campaign_cid_override FROM vicidial_lists where list_id=?/* $list_id */;
bin/AST_VDauto_dial_FILL.pl:866:SELECT phone_code,phone_number FROM vicidial_list_alt_phones where lead_id=?/* $lead_id */ order by alt_phone_count desc limit 1;
bin/AST_VDauto_dial_FILL.pl:872:SELECT phone_code,phone_number FROM vicidial_list_alt_phones where lead_id=?/* $lead_id */ and alt_phone_count=?/* $Talt_dial */;
bin/AST_VDauto_dial_FILL.pl:887:UPDATE vicidial_list set called_since_last_reset=?/* $CSLR */, called_count=?/* $called_count */,user='VDAD',last_local_call_time=?/* $LLCT_DATE */ where lead_id=?/* $lead_id */;
bin/AST_VDauto_dial_FILL.pl:891:UPDATE vicidial_list set called_since_last_reset=?/* $CSLR */, called_count=?/* $called_count */,user='VDAD',last_local_call_time=?/* $LLCT_DATE */ where lead_id=?/* $lead_id */;
bin/AST_VDauto_dial_FILL.pl:909:SELECT callback_id,callback_time,lead_status,list_id FROM vicidial_callbacks where lead_id=?/* $lead_id */ and status='LIVE' and recipient='ANYONE' order by callback_id limit 1;
bin/AST_VDauto_dial_FILL.pl:925:INSERT INTO vicidial_recent_ascb_calls SET call_date=NOW(),callback_date=?/* $PSCBcallback_time */,callback_id=?/* $PSCBcallback_id */,caller_code=?/* $VqueryCID */,lead_id=?/* $lead_id */,server_ip=?/* $DB_camp_server_server_ip[$server_CIPct] */,orig_status=?/* $PSCBlead_status */,reschedule=?/* $DBIPscheduled_callbacks_auto_reschedule[$camp_CIPct] */,list_id=?/* $PSCBlist_id */,rescheduled='U';
bin/AST_VDauto_dial_FILL.pl:930:DELETE FROM vicidial_hopper where lead_id=?/* $lead_id */;
bin/AST_VDauto_dial_FILL.pl:959:SELECT cid_group_type FROM vicidial_cid_groups where cid_group_id=?/* $DBIPcid_group_id[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:977:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBIPcid_group_id[$camp_CIPct] */ and areacode IN(?/* $temp_ac_two */,?/* $temp_ac_three */,?/* $temp_ac_four */,?/* $temp_ac_five */) and active='Y' order by CAST(areacode as SIGNED INTEGER) asc, call_count_today desc limit 100000;
bin/AST_VDauto_dial_FILL.pl:982:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBIPcid_group_id[$camp_CIPct] */ and areacode IN(?/* $temp_state */) and active='Y' order by call_count_today desc limit 100000;
bin/AST_VDauto_dial_FILL.pl:986:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBIPcid_group_id[$camp_CIPct] */ and active='Y' order by call_count_today desc limit 100000;
bin/AST_VDauto_dial_FILL.pl:1002:UPDATE vicidial_campaign_cid_areacodes set call_count_today=(call_count_today + 1) where campaign_id=?/* $DBIPcid_group_id[$camp_CIPct] */ and areacode=?/* $temp_ac */ and outbound_cid=?/* $temp_vcca */;
bin/AST_VDauto_dial_FILL.pl:1007:UPDATE vicidial_cid_groups set cid_auto_rotate_calls=(cid_auto_rotate_calls + 1) where cid_group_id=?/* $DBIPcid_group_id[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:1028:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */ and areacode IN(?/* $temp_ac_two */,?/* $temp_ac_three */,?/* $temp_ac_four */,?/* $temp_ac_five */) and active='Y' order by CAST(areacode as SIGNED INTEGER) asc, call_count_today desc limit 100000;
bin/AST_VDauto_dial_FILL.pl:1043:UPDATE vicidial_campaign_cid_areacodes set call_count_today=(call_count_today + 1) where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */ and areacode=?/* $temp_ac */ and outbound_cid=?/* $temp_vcca */;
bin/AST_VDauto_dial_FILL.pl:1091:INSERT INTO vicidial_manager values('','',?/* $SQLdate */,'NEW','N',?/* $DB_camp_server_server_ip[$server_CIPct] */,'','Originate',?/* $VqueryCID */,'Exten: $VDAD_dial_exten','Context: $ext_context','Channel: $local_DEF$Ndialstring$local_AMP$ext_context','Priority: 1','Callerid: $CIDstring','Timeout: $Local_dial_timeout','','','','VDACnote: $DBfill_campaign[$camp_CIPct]|$lead_id|$phone_code|$phone_number|OUTBALANCE|$alt_dial|$DBIPqueue_priority[$camp_CIPct]|$server_ip')
bin/AST_VDauto_dial_FILL.pl:1098:INSERT INTO vicidial_auto_calls (server_ip,campaign_id,status,lead_id,callerid,phone_code,phone_number,call_time,call_type,alt_dial,queue_priority) values(?/* $DB_camp_server_server_ip[$server_CIPct] */,?/* $DBfill_campaign[$camp_CIPct] */,'SENT',?/* $lead_id */,?/* $VqueryCID */,?/* $phone_code */,?/* $phone_number */,?/* $SQLdate */,'OUTBALANCE',?/* $alt_dial */,?/* $DBIPqueue_priority[$camp_CIPct] */)
bin/AST_VDauto_dial_FILL.pl:1103:INSERT INTO vicidial_dial_log SET caller_code=?/* $VqueryCID */,lead_id=?/* $lead_id */,server_ip=?/* $DB_camp_server_server_ip[$server_CIPct] */,call_date=?/* $SQLdate */,extension=?/* $VDAD_dial_exten */,channel=?/* $local_DEF$Ndialstring$local_AMP$ext_context */,timeout=?/* $Local_dial_timeout */,outbound_cid=?/* $CIDstring */,context=?/* $ext_context */;
bin/AST_VDauto_dial_FILL.pl:1109:INSERT INTO vicidial_manager values('','',?/* $SQLdate */,'NEW','N','XXXXXXXXXXXXXXX','','Originate',?/* $VqueryCID */,'Exten: $VDAD_dial_exten','Context: $ext_context','Channel: $local_DEF$Ndialstring$local_AMP$ext_context','Priority: 1','Callerid: $CIDstring','Timeout: $Local_dial_timeout','','','','VDACnote: $DBfill_campaign[$camp_CIPct]|$lead_id|$phone_code|$phone_number|OUTBALANCE|$alt_dial|$DBIPqueue_priority[$camp_CIPct]|$server_ip')
bin/AST_VDauto_dial_FILL.pl:1111:INSERT INTO vicidial_auto_calls (server_ip,campaign_id,status,lead_id,callerid,phone_code,phone_number,call_time,call_type,alt_dial,queue_priority) values('XXXXXXXXXXXXXXX',?/* $DBfill_campaign[$camp_CIPct] */,'SENT',?/* $lead_id */,?/* $VqueryCID */,?/* $phone_code */,?/* $phone_number */,?/* $SQLdate */,'OUTBALANCE',?/* $alt_dial */,?/* $DBIPqueue_priority[$camp_CIPct] */)
bin/AST_VDauto_dial_FILL.pl:1115:INSERT INTO vicidial_dial_log SET caller_code=?/* $VqueryCID */,lead_id=?/* $lead_id */,server_ip='XXXXXXXXXXXXXXX',call_date=?/* $SQLdate */,extension=?/* $VDAD_dial_exten */,channel=?/* $local_DEF$Ndialstring$local_AMP$ext_context */,timeout=?/* $Local_dial_timeout */,outbound_cid=?/* $CIDstring */,context=?/* $ext_context */;
bin/AST_VDauto_dial_FILL.pl:1157:SELECT count(*),vicidial_balance_rank FROM servers where vicidial_balance_active = 'Y' group by vicidial_balance_rank order by vicidial_balance_rank desc;
bin/AST_VDauto_dial_FILL.pl:1175:SELECT server_ip,asterisk_version,routing_prefix FROM servers where vicidial_balance_rank=?/* $ST_rank[$staggered_rank_ct] */ and vicidial_balance_active = 'Y' order by server_ip LIMIT $ST_count[$staggered_rank_ct];
bin/AST_VDauto_dial_FILL.pl:1282:UPDATE vicidial_campaign_stats SET balance_trunk_fill=?/* $temp_balance_total */ where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:1287:UPDATE vicidial_campaigns SET campaign_calldate=?/* $now_date */ where campaign_id=?/* $DBfill_campaign[$camp_CIPct] */;
bin/AST_VDauto_dial_FILL.pl:1301:UPDATE vicidial_campaign_stats SET balance_trunk_fill='0';
bin/AST_VDauto_dial_FILL.pl:1317:UPDATE vicidial_lists SET list_lastcalldate=?/* $SQLdate */ where list_id IN($lists_update);
bin/AST_VDauto_dial_FILL.pl:1346:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_VDauto_dial_FILL.pl:1360:SELECT max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context FROM servers where server_ip = ?/* $server_ip */;
bin/FastAGI_log.pl:161:SELECT vd_server_logs,asterisk_version FROM servers where server_ip = ?/* $VARserver_ip */;
bin/FastAGI_log.pl:262:SELECT agi_output,asterisk_version FROM servers where server_ip = ?/* $VARserver_ip */;
bin/FastAGI_log.pl:445:SELECT count(*) FROM phones where server_ip=?/* $VARserver_ip */ and extension=?/* $channel_line */ and protocol='Zap';
bin/FastAGI_log.pl:469:SELECT count(*) FROM phones where server_ip=?/* $VARserver_ip */ and dialplan_number=?/* $channel_line */ and protocol='EXTERNAL';
bin/FastAGI_log.pl:514:SELECT cmd_line_b,cmd_line_d FROM vicidial_manager where callerid=?/* $callerid */ limit 1;
bin/FastAGI_log.pl:539:SELECT campaign_id FROM vicidial_auto_calls where callerid=?/* $callerid */ limit 1;
bin/FastAGI_log.pl:557:SELECT opensips_cid_name FROM system_settings
bin/FastAGI_log.pl:573:SELECT opensips_cid_name FROM vicidial_campaigns where campaign_id = ?/* $CAMPCUST */;
bin/FastAGI_log.pl:596:INSERT INTO call_log (uniqueid,channel,channel_group,type,server_ip,extension,number_dialed,start_time,start_epoch,end_time,end_epoch,length_in_sec,length_in_min,caller_code) values(?/* $unique_id */,?/* $channel */,?/* $channel_group */,?/* $type */,?/* $VARserver_ip */,?/* $extension */,?/* $number_dialed */,?/* $now_date */,?/* $now_date_epoch */,'','','','',?/* $callerid */)
bin/FastAGI_log.pl:618:SELECT count(*) from parked_channels where channel_group=?/* $callerid */;
bin/FastAGI_log.pl:629:SELECT server_ip from parked_channels where channel_group=?/* $callerid */;
bin/FastAGI_log.pl:675:SELECT carrier_logging_active FROM servers where server_ip = ?/* $VARserver_ip */;
bin/FastAGI_log.pl:695:SELECT uniqueid FROM call_log where uniqueid LIKE ?/* $beginUNIQUEID% */ and caller_code LIKE \"%$CIDlead_id\
bin/FastAGI_log.pl:715:SELECT sip_hangup_cause,sip_hangup_reason FROM vicidial_dial_log where lead_id=?/* $CIDlead_id */ and server_ip=?/* $VARserver_ip */ and caller_code=?/* $callerid */ order by call_date desc limit 1;
bin/FastAGI_log.pl:739:UPDATE vicidial_dial_log SET sip_hangup_cause=?/* $sip_hangup_cause */,sip_hangup_reason=?/* $sip_hangup_reason */,uniqueid=?/* $uniqueid */ where caller_code=?/* $callerid */ and server_ip=?/* $VARserver_ip */ and lead_id=?/* $CIDlead_id */;
bin/FastAGI_log.pl:748:SELECT sip_hangup_cause,sip_hangup_reason FROM vicidial_dial_log where lead_id=?/* $CIDlead_id */ and server_ip=?/* $VARserver_ip */ and caller_code=?/* $callerid */ order by call_date desc limit 1;
bin/FastAGI_log.pl:764:INSERT IGNORE INTO vicidial_carrier_log set uniqueid=?/* $uniqueid */,call_date=?/* $now_date */,server_ip=?/* $VARserver_ip */,lead_id=?/* $CIDlead_id */,hangup_cause=?/* $hangup_cause */,dialstatus=?/* $dialstatus */,channel=?/* $channel */,dial_time=?/* $dial_time */,answered_time=?/* $answered_time */,sip_hangup_cause=?/* $sip_hangup_cause */,sip_hangup_reason=?/* $sip_hangup_reason */,caller_code=?/* $callerid */;
bin/FastAGI_log.pl:775:SELECT monitor_start_time,UTC_TIMESTAMP(monitor_start_time) from vicidial_rt_monitor_log where caller_code=?/* $callerid */ and ( (monitor_end_time is NULL) or (monitor_start_time=monitor_end_time) );
bin/FastAGI_log.pl:788:UPDATE vicidial_rt_monitor_log set monitor_sec=?/* $monitor_sec */,monitor_end_time=?/* $now_date */ where caller_code=?/* $callerid */;
bin/FastAGI_log.pl:798:SELECT uniqueid,start_epoch,channel,end_epoch,channel_group FROM call_log where uniqueid=?/* $unique_id */;
bin/FastAGI_log.pl:800:SELECT uniqueid,start_epoch,channel,end_epoch,channel_group FROM call_log where caller_code=?/* $callerid */ and channel NOT LIKE \"Local\/%\
bin/FastAGI_log.pl:829:UPDATE call_log set end_time=?/* $now_date */,end_epoch=?/* $now_date_epoch */,length_in_sec=$length_in_sec,length_in_min=?/* $length_in_min */,channel=?/* $channel */ where uniqueid=?/* $unique_id */
bin/FastAGI_log.pl:838:SELECT recording_id,start_epoch,filename,end_epoch FROM recording_log where vicidial_id=?/* $unique_id */ order by start_time desc limit 1;
bin/FastAGI_log.pl:856:UPDATE recording_log set end_time=?/* $now_date */,end_epoch=?/* $now_date_epoch */,length_in_sec=$CLlength_in_sec,length_in_min=?/* $CLlength_in_min */ where recording_id=?/* $CLrecording_id */
bin/FastAGI_log.pl:866:SELECT start_epoch FROM call_log where uniqueid=?/* $DOUBLEunique_id */ and channel_group='DOUBLE_LOG' order by start_time desc limit 1;
bin/FastAGI_log.pl:879:UPDATE call_log set end_time=?/* $now_date */,end_epoch=?/* $now_date_epoch */,length_in_sec=$DOUBLElength_in_sec,length_in_min=?/* $DOUBLElength_in_min */ where uniqueid=?/* $DOUBLEunique_id */ and channel_group='DOUBLE_LOG' order by start_time desc limit 1
bin/FastAGI_log.pl:889:DELETE from live_inbound where uniqueid IN(?/* $unique_id */,?/* $CALLunique_id */) and server_ip=?/* $VARserver_ip */
bin/FastAGI_log.pl:894:SELECT UTC_TIMESTAMP(parked_time),UTC_TIMESTAMP(grab_time) FROM park_log where uniqueid=?/* $unique_id */ and server_ip=?/* $VARserver_ip */ and (parked_sec is null or parked_sec < 1) order by parked_time desc LIMIT 1;
bin/FastAGI_log.pl:923:UPDATE park_log set status='HUNGUP',hangup_time=?/* $now_date */,parked_sec=?/* $parked_sec */,talked_sec=?/* $talked_sec */ where uniqueid=?/* $unique_id */ and server_ip=?/* $VARserver_ip */ order by parked_time desc LIMIT 1
bin/FastAGI_log.pl:962:SELECT enhanced_disconnect_logging FROM system_settings;
bin/FastAGI_log.pl:1001:SELECT result FROM vicidial_cpd_log where callerid=?/* $callerid */ and result NOT IN('Voice','Unknown','???','') order by cpd_id desc limit 1;
bin/FastAGI_log.pl:1047:UPDATE vicidial_list set status=?/* $VDL_status */ where lead_id = ?/* $CIDlead_id */;
bin/FastAGI_log.pl:1052:UPDATE vicidial_auto_calls set status=?/* $VDAC_status */ where callerid = ?/* $callerid */;
bin/FastAGI_log.pl:1059:UPDATE vicidial_log FORCE INDEX(lead_id) set status=?/* $VDL_status */ where lead_id = ?/* $CIDlead_id */ and uniqueid LIKE \"$Euniqueid%\
bin/FastAGI_log.pl:1066:SELECT lead_id,callerid,campaign_id,alt_dial,stage,UTC_TIMESTAMP(call_time),uniqueid,status,call_time,phone_code,phone_number,queue_position FROM vicidial_auto_calls where uniqueid = ?/* $uniqueid */ or callerid = ?/* $callerid */ limit 1;
bin/FastAGI_log.pl:1094:SELECT list_id,called_count FROM vicidial_list where lead_id=?/* $VD_lead_id */ limit 1;
bin/FastAGI_log.pl:1110:INSERT INTO vicidial_log SET uniqueid=?/* $uniqueid */,lead_id=?/* $VD_lead_id */,list_id=?/* $VD_list_id */,status=?/* $VDL_status */,campaign_id=?/* $VD_campaign_id */,call_date=?/* $VD_call_time */,start_epoch=?/* $VD_start_epoch */,phone_code=?/* $VD_phone_code */,phone_number=?/* $VD_phone_number */,user='VDAD',processed='N',length_in_sec='0',end_epoch=?/* $VD_start_epoch */,alt_dial=?/* $VD_alt_dial */,called_count=?/* $called_count */ $vl_commentsSQL;
bin/FastAGI_log.pl:1115:INSERT IGNORE INTO vicidial_log_extended SET uniqueid=?/* $uniqueid */,server_ip=?/* $VARserver_ip */,call_date=?/* $VD_call_time */,lead_id=?/* $VD_lead_id */,caller_code=?/* $VD_callerid */,custom_call_id='' ON DUPLICATE KEY UPDATE server_ip=?/* $VARserver_ip */,call_date=?/* $VD_call_time */,lead_id=?/* $VD_lead_id */,caller_code=?/* $VD_callerid */;
bin/FastAGI_log.pl:1124:SELECT call_quota_lead_ranking FROM vicidial_campaigns where campaign_id=?/* $VD_campaign_id */;
bin/FastAGI_log.pl:1145:DELETE FROM vicidial_auto_calls where callerid = ?/* $callerid */;
bin/FastAGI_log.pl:1168:SELECT lead_id,callerid,campaign_id,alt_dial,stage,UTC_TIMESTAMP(call_time),uniqueid,status,call_time,phone_code,phone_number,queue_position,server_ip,agent_only FROM vicidial_auto_calls where uniqueid = ?/* $uniqueid */ or callerid = ?/* $callerid */ limit 1;
bin/FastAGI_log.pl:1205:SELECT channel from parked_channels where channel_group=?/* $callerid */;
bin/FastAGI_log.pl:1233:SELECT channel,server_ip from parked_channels_recent where channel_group=?/* $callerid */ and park_end_time > ?/* $PSQLdate */ order by park_end_time desc limit 1;
bin/FastAGI_log.pl:1264:SELECT count(*) from live_channels where channel=?/* $PC_channel */;
bin/FastAGI_log.pl:1282:DELETE FROM vicidial_auto_calls where ( ( (status!='IVR') and (uniqueid=?/* $uniqueid */ or callerid = ?/* $callerid */) ) or ( (status='IVR') and (uniqueid=?/* $uniqueid */) ) ) order by call_time desc limit 1;
bin/FastAGI_log.pl:1286:UPDATE vicidial_live_agents SET ring_callerid='' where ring_callerid=?/* $callerid */;
bin/FastAGI_log.pl:1291:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,queuemetrics_socket,queuemetrics_socket_url FROM system_settings;
bin/FastAGI_log.pl:1338:SELECT queue_position,call_date FROM vicidial_closer_log where uniqueid=?/* $unique_id */ and lead_id=?/* $CIDlead_id */ and campaign_id=?/* $VD_campaign_id */ and call_date > ?/* $RSQLdate */ order by closecallid desc limit 1;
bin/FastAGI_log.pl:1350:SELECT agent,data4 from queue_log where call_id=?/* $VD_callerid */ and verb='CONNECT' order by time_id desc limit 1;
bin/FastAGI_log.pl:1369:SELECT count(*) FROM vicidial_auto_calls where status = 'LIVE' and campaign_id=?/* $VD_campaign_id */ and call_time < ?/* $VCLcall_date */;
bin/FastAGI_log.pl:1380:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $VD_callerid */,queue=?/* $VD_campaign_id */,agent=?/* $VD_agent */,verb='ABANDON',data1=?/* $current_position */,data2=?/* $queue_position */,data3=?/* $VD_stage */,serverid=?/* $queuemetrics_log_id */,data4=?/* $data_four */;
bin/FastAGI_log.pl:1385:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $VD_callerid */,queue=?/* $VD_campaign_id */,agent=?/* $VD_agent */,verb='COMPLETECALLER',data1=?/* $VD_stage */,data2=?/* $VD_call_length */,data3=?/* $queue_position */,serverid=?/* $queuemetrics_log_id */,data4=?/* $data_four */;
bin/FastAGI_log.pl:1393:SELECT vendor_lead_code,list_id,phone_code,phone_number,title,first_name,middle_initial,last_name,postal_code FROM vicidial_list where lead_id=?/* $VD_lead_id */ LIMIT 1;
bin/FastAGI_log.pl:1470:SELECT enable_drop_lists,call_quota_lead_ranking,timeclock_end_of_day FROM system_settings;
bin/FastAGI_log.pl:1488:SELECT start_epoch,status,user,term_reason,comments,alt_dial FROM vicidial_log FORCE INDEX(lead_id) where lead_id = ?/* $VD_lead_id */ and uniqueid LIKE ?/* $Euniqueid% */ limit 1;
bin/FastAGI_log.pl:1523:SELECT start_epoch,status,closecallid,user,term_reason,length_in_sec,queue_seconds,comments FROM vicidial_closer_log where lead_id = ?/* $VD_lead_id */ and call_date > ?/* $RSQLdate */ order by closecallid desc limit 1;
bin/FastAGI_log.pl:1553:SELECT list_id,called_count FROM vicidial_list where lead_id=?/* $VD_lead_id */ limit 1;
bin/FastAGI_log.pl:1568:UPDATE vicidial_list SET status='PDROP' where lead_id=?/* $VD_lead_id */;
bin/FastAGI_log.pl:1572:INSERT INTO vicidial_log SET uniqueid=?/* $uniqueid */,lead_id=?/* $VD_lead_id */,list_id=?/* $VD_list_id */,status='PDROP',campaign_id=?/* $VD_campaign_id */,call_date=?/* $VD_call_time */,start_epoch=?/* $VD_start_epoch */,phone_code=?/* $VD_phone_code */,phone_number=?/* $VD_phone_number */,user='VDAD',processed='N',length_in_sec='0',end_epoch=?/* $VD_start_epoch */,alt_dial=?/* $VD_alt_dial */,called_count=?/* $called_count */;
bin/FastAGI_log.pl:1576:INSERT IGNORE INTO vicidial_log_extended SET uniqueid=?/* $uniqueid */,server_ip=?/* $VARserver_ip */,call_date=?/* $VD_call_time */,lead_id=?/* $VD_lead_id */,caller_code=?/* $VD_callerid */,custom_call_id='' ON DUPLICATE KEY UPDATE server_ip=?/* $VARserver_ip */,call_date=?/* $VD_call_time */,lead_id=?/* $VD_lead_id */,caller_code=?/* $VD_callerid */;
bin/FastAGI_log.pl:1582:INSERT IGNORE INTO vicidial_drop_log SET uniqueid=?/* $uniqueid */,server_ip=?/* $VARserver_ip */,drop_date=NOW(),lead_id=?/* $VD_lead_id */,campaign_id=?/* $VD_campaign_id */,status='PDROP',phone_code=?/* $VD_phone_code */,phone_number=?/* $VD_phone_number */;
bin/FastAGI_log.pl:1609:UPDATE vicidial_list set status='DROP' where lead_id = ?/* $VD_lead_id */;
bin/FastAGI_log.pl:1622:UPDATE vicidial_log FORCE INDEX(lead_id) set $SQL_status end_epoch=?/* $now_date_epoch */,length_in_sec=?/* $VD_seconds */ where lead_id = ?/* $VD_lead_id */ and uniqueid LIKE \"$Euniqueid%\
bin/FastAGI_log.pl:1675:UPDATE vicidial_closer_log set $VDCLSQL_update end_epoch=?/* $now_date_epoch */,length_in_sec=?/* $VD_seconds */$LOGuserSQL where closecallid = ?/* $VD_closecallid */;
bin/FastAGI_log.pl:1683:SELECT drop_lead_reset FROM vicidial_inbound_groups where group_id=?/* $VD_campaign_id */;
bin/FastAGI_log.pl:1697:UPDATE vicidial_list set called_since_last_reset='N' where lead_id = ?/* $VD_lead_id */;
bin/FastAGI_log.pl:1707:INSERT IGNORE INTO vicidial_drop_log SET uniqueid=?/* $uniqueid */,server_ip=?/* $VARserver_ip */,drop_date=NOW(),lead_id=?/* $VD_lead_id */,campaign_id=?/* $VD_campaign_id */,status='DROP',phone_code=?/* $VD_phone_code */,phone_number=?/* $VD_phone_number */;
bin/FastAGI_log.pl:1717:SELECT auto_alt_dial,auto_alt_dial_statuses,use_internal_dnc,use_campaign_dnc,use_other_campaign_dnc,call_quota_lead_ranking FROM vicidial_campaigns where campaign_id=?/* $VD_campaign_id */;
bin/FastAGI_log.pl:1756:SELECT alt_phone,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $VD_lead_id */;
bin/FastAGI_log.pl:1781:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_alt_phone */,?/* $alt_areacode */);
bin/FastAGI_log.pl:1784:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_alt_phone */;
bin/FastAGI_log.pl:1805:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_alt_phone */,?/* $alt_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/FastAGI_log.pl:1808:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_alt_phone */ and campaign_id=?/* $temp_campaign_id */;
bin/FastAGI_log.pl:1822:INSERT INTO vicidial_hopper SET lead_id=?/* $VD_lead_id */,campaign_id=?/* $VD_campaign_id */,status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='ALT',user='',priority='25',source='A';
bin/FastAGI_log.pl:1838:SELECT address3,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $VD_lead_id */;
bin/FastAGI_log.pl:1863:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_address3 */,?/* $addr3_areacode */);
bin/FastAGI_log.pl:1866:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_address3 */;
bin/FastAGI_log.pl:1887:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_address3 */,?/* $alt_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/FastAGI_log.pl:1890:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_address3 */ and campaign_id=?/* $temp_campaign_id */;
bin/FastAGI_log.pl:1904:INSERT INTO vicidial_hopper SET lead_id=?/* $VD_lead_id */,campaign_id=?/* $VD_campaign_id */,status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='ADDR3',user='',priority='20',source='A';
bin/FastAGI_log.pl:1925:SELECT gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $VD_lead_id */;
bin/FastAGI_log.pl:1941:SELECT count(*) FROM vicidial_list_alt_phones where lead_id=?/* $VD_lead_id */;
bin/FastAGI_log.pl:1956:SELECT alt_phone_id,phone_number,active FROM vicidial_list_alt_phones where lead_id=?/* $VD_lead_id */ and alt_phone_count=?/* $Xlast */;
bin/FastAGI_log.pl:1982:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_altdial_phone */,?/* $ad_areacode */);
bin/FastAGI_log.pl:1985:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_altdial_phone */;
bin/FastAGI_log.pl:2007:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_altdial_phone */,?/* $ap_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/FastAGI_log.pl:2010:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_altdial_phone */ and campaign_id=?/* $temp_campaign_id */;
bin/FastAGI_log.pl:2027:INSERT INTO vicidial_hopper SET lead_id=?/* $VD_lead_id */,campaign_id=?/* $VD_campaign_id */,status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='X$Xlast',user='',priority='15',source='A';
bin/FastAGI_log.pl:2038:INSERT INTO vicidial_hopper SET lead_id=?/* $VD_lead_id */,campaign_id=?/* $VD_campaign_id */,status='DNC',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='X$Xlast',user='',priority='15',source='A';
bin/FastAGI_log.pl:2107:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $VD_call_quota_lead_ranking */;
bin/FastAGI_log.pl:2257:SELECT list_id,called_count,rank FROM vicidial_list where lead_id=?/* $VD_lead_id */;
bin/FastAGI_log.pl:2286:SELECT call_date from vicidial_dial_log where lead_id=?/* $VD_lead_id */ and call_date > ?/* $CQSQLdate */ and caller_code LIKE \"%$VD_lead_id\" order by call_date desc limit 1;
bin/FastAGI_log.pl:2355:SELECT first_call_date,UTC_TIMESTAMP(first_call_date),last_call_date from vicidial_lead_call_quota_counts where lead_id=?/* $VD_lead_id */ and list_id=?/* $VLlist_id */;
bin/FastAGI_log.pl:2384:UPDATE vicidial_lead_call_quota_counts SET last_call_date=?/* $VDLcall_datetime */,status=?/* $temp_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() $session_updateSQL $day_updateSQL where lead_id=?/* $VD_lead_id */ and list_id=?/* $VLlist_id */ and modify_date < NOW();
bin/FastAGI_log.pl:2389:UPDATE vicidial_lead_call_quota_counts SET status=?/* $temp_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() where lead_id=?/* $VD_lead_id */ and list_id=?/* $VLlist_id */;
bin/FastAGI_log.pl:2397:INSERT INTO vicidial_lead_call_quota_counts SET lead_id=?/* $VD_lead_id */,list_id=?/* $VLlist_id */,first_call_date=?/* $VDLcall_datetime */,last_call_date=?/* $VDLcall_datetime */,status=?/* $temp_status */,called_count=?/* $VLcalled_count */,day_one_calls='1',rank=?/* $tempVLrank */,modify_date=NOW() $session_newSQL;
bin/FastAGI_log.pl:2405:UPDATE vicidial_list SET rank='0' where lead_id=?/* $VD_lead_id */;
bin/Vtiger_KILL_slow_queries.pl:176:SELECT use_non_latin,vtiger_server_ip,vtiger_dbname,vtiger_login,vtiger_pass FROM system_settings;
bin/AST_recordings_export.pl:647:SELECT local_gmt FROM servers where server_ip=?/* $server_ip */;
bin/AST_recordings_export.pl:673:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times FROM vicidial_call_times where call_time_id=?/* $call_time */;
bin/AST_recordings_export.pl:711:SELECT lead_id,user,vicidial_id,vicidial_id,length_in_sec,UTC_TIMESTAMP(start_time) from recording_log where $with_inboundSQL and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate_end 23:59:59 */ order by start_time;
bin/AST_recordings_export.pl:741:SELECT lead_id,user,vicidial_id,vicidial_id,length_in_sec,UTC_TIMESTAMP(start_time) from recording_log_archive where $archive_with_inboundSQL and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate_end 23:59:59 */ order by start_time;
bin/AST_recordings_export.pl:775:SELECT vicidial_list.lead_id,uniqueid,length_in_sec,UTC_TIMESTAMP(vicidial_log.call_date) from vicidial_list,vicidial_log where $campaignSQL $sale_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ and vicidial_log.lead_id=vicidial_list.lead_id order by call_date;
bin/AST_recordings_export.pl:804:SELECT vicidial_list.lead_id,uniqueid,length_in_sec,UTC_TIMESTAMP(vicidial_log_archive.call_date) from vicidial_list,vicidial_log_archive where $archive_campaignSQL $archive_sale_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ and vicidial_log_archive.lead_id=vicidial_list.lead_id order by call_date;
bin/AST_recordings_export.pl:837:SELECT vicidial_list.lead_id,xfercallid,closecallid,uniqueid,length_in_sec,UTC_TIMESTAMP(vicidial_closer_log.call_date) from vicidial_list,vicidial_closer_log where $with_inboundSQL $close_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ and vicidial_closer_log.lead_id=vicidial_list.lead_id order by call_date;
bin/AST_recordings_export.pl:867:SELECT vicidial_list.lead_id,xfercallid,closecallid,uniqueid,length_in_sec,UTC_TIMESTAMP(vicidial_closer_log_archive.call_date) from vicidial_list,vicidial_closer_log_archive where $archive_with_inboundSQL $archive_close_statusesSQL and call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ and vicidial_closer_log_archive.lead_id=vicidial_list.lead_id order by call_date;
bin/AST_recordings_export.pl:1102:SELECT recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ and vicidial_id=?/* $vicidial_id */ and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate_end 23:59:59 */ order by start_time desc limit 100;
bin/AST_recordings_export.pl:1129:SELECT recording_id,filename,location from recording_log_archive where lead_id=?/* $lead_id */ and vicidial_id=?/* $vicidial_id */ and start_time >= ?/* $shipdate 00:00:00 */ and start_time <= ?/* $shipdate_end 23:59:59 */ order by start_time desc limit 100;
bin/AST_CRON_audio_2_encrypt.pl:324:select recording_id from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/AST_CRON_audio_2_encrypt.pl:352:UPDATE recording_log set location=?/* $HTTP://$server_ip/RECORDINGS/GPG/$GPGfile */ where recording_id=?/* $recording_id */;
bin/AST_send_URLbasic.pl:132:SELECT vd_server_logs,local_gmt,ext_context FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_send_URLbasic.pl:148:SELECT url FROM vicidial_url_log where url_log_id=?/* $url_id */;
bin/AST_send_URLbasic.pl:210:UPDATE vicidial_url_log SET url_response=?/* $Wdocline_cat|$Wfileline_cat */,response_sec=?/* $response_sec */ where url_log_id=?/* $url_id */;
bin/VICIDIAL_fix_list_statuses.pl:156:select lead_id,list_id from vicidial_list where status='NOUSE';
bin/VICIDIAL_fix_list_statuses.pl:186:select status,start_epoch from vicidial_log where lead_id=?/* $lead_id[$b] */ order by call_date desc LIMIT 1;
bin/VICIDIAL_fix_list_statuses.pl:200:select status,start_epoch from vicidial_closer_log where lead_id=?/* $lead_id[$b] */ order by closecallid desc LIMIT 1;
bin/VICIDIAL_fix_list_statuses.pl:217:select status,start_epoch from vicidial_log_archive where lead_id=?/* $lead_id[$b] */ order by call_date desc LIMIT 1;
bin/VICIDIAL_fix_list_statuses.pl:231:select status,start_epoch from vicidial_closer_log_archive where lead_id=?/* $lead_id[$b] */ order by closecallid desc LIMIT 1;
bin/VICIDIAL_fix_list_statuses.pl:270:UPDATE vicidial_list set status=?/* $NEWstatus */ where lead_id=?/* $lead_id[$b] */;
bin/AST_manager_kill_hung_congested.pl:121:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_manager_kill_hung_congested.pl:139:SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE \"Local%\" limit 99
bin/AST_manager_kill_hung_congested.pl:168:INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')
bin/AST_manager_kill_hung_congested.pl:188:SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE \"Local%\" limit 99
bin/AST_manager_kill_hung_congested.pl:217:INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')
bin/AST_manager_kill_hung_congested.pl:238:SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE \"Local%\" limit 99
bin/AST_manager_kill_hung_congested.pl:267:INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')
bin/AST_manager_kill_hung_congested.pl:289:SELECT channel FROM live_sip_channels where server_ip = ?/* $server_ip */ and extension = 'CONGEST' and channel LIKE \"Local%\" limit 99
bin/AST_manager_kill_hung_congested.pl:319:INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Hangup',?/* $KCqueryCID */,'Channel: $congest_kill[$i]','','','','','','','','','')
bin/AST_cleanup_agent_log.pl:449:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,queuemetrics_eq_prepend,queuemetrics_loginout,queuemetrics_dispo_pause,queuemetrics_pause_type FROM system_settings;
bin/AST_cleanup_agent_log.pl:476:SELECT call_date,lead_id,uniqueid,user,status from vicidial_log $VDCL_SQL_time_where and user NOT IN('','VDAC','VDAD') order by call_date;
bin/AST_cleanup_agent_log.pl:507:SELECT count(*) from vicidial_agent_log where user=?/* $dup_user[$i] */ and lead_id=?/* $dup_lead[$i] */ and uniqueid=?/* $dup_uniqueid[$i] */ and event_time >= ?/* $dup_date[$i] 00:00:00 */ and event_time <= \"$dup_date[$i] 23:59:59\
bin/AST_cleanup_agent_log.pl:519:SELECT uniqueid from vicidial_agent_log where user=?/* $dup_user[$i] */ and lead_id=?/* $dup_lead[$i] */ and event_time >= ?/* $dup_date[$i] 00:00:00 */ and event_time <= \"$dup_date[$i] 23:59:59\
bin/AST_cleanup_agent_log.pl:592:SELECT user,parked_time,UTC_TIMESTAMP(parked_time),parked_sec,lead_id,uniqueid from park_log where parked_sec > 0 $VDP_SQL_time;
bin/AST_cleanup_agent_log.pl:616:SELECT talk_epoch,agent_log_id from vicidial_agent_log where lead_id=?/* $Vlead_id[$i] */ and uniqueid=?/* $Vuniqueid[$i] */ and user=?/* $Vuser[$i] */ and talk_epoch >= ?/* $Vpark_epoch[$i] */ $VDAD_SQL_time;
bin/AST_cleanup_agent_log.pl:634:SELECT start_epoch,length_in_sec,queue_seconds from vicidial_closer_log where lead_id=?/* $Vlead_id[$i] */ and uniqueid=?/* $Vuniqueid[$i] */ and user=?/* $Vuser[$i] */ $VDCL_SQL_time;
bin/AST_cleanup_agent_log.pl:651:SELECT start_epoch,length_in_sec from vicidial_log where lead_id=?/* $Vlead_id[$i] */ and uniqueid=?/* $Vuniqueid[$i] */ and user=?/* $Vuser[$i] */ $VDCL_SQL_time;
bin/AST_cleanup_agent_log.pl:674:UPDATE $Vagent_log_id[$i]  ---  $Vold_talk_epoch[$i]($Vpark_epoch[$i]) with $Vagent_talk_epoch[$i]($Vagent_talk_epochROUND[$i])\n
bin/AST_cleanup_agent_log.pl:677:UPDATE vicidial_agent_log SET talk_epoch=?/* $Vagent_talk_epochROUND[$i] */ where agent_log_id=?/* $Vagent_log_id[$i] */;
bin/AST_cleanup_agent_log.pl:719:SELECT user,agent_log_id,pause_epoch,wait_epoch,talk_epoch,dispo_epoch,UTC_TIMESTAMP(event_time),server_ip,campaign_id,user_group from vicidial_agent_log where sub_status='LAGGED' $VDAD_SQL_time;
bin/AST_cleanup_agent_log.pl:762:SELECT count(*) from vicidial_agent_log where user=?/* $Vuser[$i] */ and pause_epoch=?/* $Vlast_epoch[$i] */ $VDAD_SQL_time;
bin/AST_cleanup_agent_log.pl:770:INSERT INTO vicidial_agent_log SET user=?/* $Vuser[$i] */,event_time=?/* $Vlast_date[$i] */,pause_epoch=?/* $Vlast_epoch[$i] */,wait_epoch=?/* $Vlast_epoch[$i] */,pause_sec='0',user_group=?/* $Vuser_group[$i] */,campaign_id=?/* $Vcampaign_id[$i] */,server_ip=?/* $Vserver_ip[$i] */,sub_status='LOGOUT',pause_type='SYSTEM';
bin/AST_cleanup_agent_log.pl:812:SELECT time_id,agent FROM queue_log where verb='PAUSEREASON' and data1 NOT IN('LAGGED') $QM_SQL_time_H order by time_id;
bin/AST_cleanup_agent_log.pl:837:SELECT time_id FROM queue_log where agent=?/* $agent[$h] */ and time_id <= ?/* $time_id[$h] */ and time_id > ?/* $temp_8hours_prev_time */ and verb='PAUSEALL' and agent=?/* $agent[$h] */ order by time_id desc limit 1;
bin/AST_cleanup_agent_log.pl:849:SELECT time_id FROM queue_log where agent=?/* $agent[$h] */ and time_id >= ?/* $time_id[$h] */ and time_id < ?/* $temp_8hours_next_time */ and verb IN('UNPAUSEALL') and agent=?/* $agent[$h] */ order by time_id limit 1;
bin/AST_cleanup_agent_log.pl:861:SELECT time_id FROM queue_log where agent=?/* $agent[$h] */ and time_id >= ?/* $time_id[$h] */ and time_id < ?/* $temp_8hours_next_time */ and verb IN('AGENTLOGOFF') and agent=?/* $agent[$h] */ order by time_id limit 1;
bin/AST_cleanup_agent_log.pl:876:SELECT time_id FROM queue_log where agent=?/* $agent[$h] */ and time_id >= ?/* $time_id[$h] */ and time_id < ?/* $temp_8hours_next_time */ and verb IN('AGENTLOGIN') and agent=?/* $agent[$h] */ order by time_id limit 1;
bin/AST_cleanup_agent_log.pl:891:SELECT time_id FROM queue_log where agent=?/* $agent[$h] */ and time_id >= ?/* $time_id[$h] */ and time_id < ?/* $temp_8hours_next_time */ and verb IN('PAUSEALL') and agent=?/* $agent[$h] */ order by time_id limit 1;
bin/AST_cleanup_agent_log.pl:913:SELECT time_id,data1 FROM queue_log where agent=?/* $agent[$h] */ and time_id >= ?/* $PAUSEtime */ and time_id <= ?/* $UNPAUSEtime */ and verb='PAUSEREASON' and agent=?/* $agent[$h] */ and data1 NOT IN('LAGGED') order by time_id limit 100;
bin/AST_cleanup_agent_log.pl:951:DELETE from queue_log where agent=?/* $agent[$h] */ and time_id=?/* $PAUSEREASONtime[$pr] */ and data1=?/* $PAUSEREASONdata1[$pr] */ and verb='PAUSEREASON' limit 1;
bin/AST_cleanup_agent_log.pl:983:SELECT time_id,call_id,queue,verb,serverid FROM queue_log where verb IN('ENTERQUEUE','CALLOUTBOUND') and serverid=?/* $queuemetrics_log_id */ $QM_SQL_time_H order by time_id;
bin/AST_cleanup_agent_log.pl:1008:SELECT count(*) FROM queue_log where verb IN('CONNECT','ABANDON','COMPLETEAGENT','COMPLETECALLER','CALLSTATUS','EXITWITHKEY','EXITWITHTIMEOUT') and call_id=?/* $call_id[$h] */;
bin/AST_cleanup_agent_log.pl:1026:SELECT count(*) FROM vicidial_auto_calls where callerid=?/* $call_id[$h] */;
bin/AST_cleanup_agent_log.pl:1037:SELECT count(*) FROM vicidial_live_agents where callerid=?/* $call_id[$h] */;
bin/AST_cleanup_agent_log.pl:1068:SELECT queue_position,queue_seconds FROM vicidial_closer_log where lead_id=?/* $lead_id[$h] */ and campaign_id=?/* $queue[$h] */ and call_date > ?/* $RSQLdate */ order by closecallid desc limit 1;
bin/AST_cleanup_agent_log.pl:1082:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $newtimeABANDON */,call_id=?/* $call_id[$h] */,queue=?/* $queue[$h] */,agent='NONE',verb='ABANDON',data1='1',data2=?/* $queue_position */,data3=?/* $queue_seconds */,serverid=?/* $serverid[$h] */;
bin/AST_cleanup_agent_log.pl:1102:SELECT time_id,agent FROM queue_log where verb='PAUSEREASON' and data1='LAGGED' $QM_SQL_time_H order by time_id;
bin/AST_cleanup_agent_log.pl:1125:SELECT time_id,verb,queue,call_id FROM queue_log where agent=?/* $agent[$h] */ and time_id > ?/* $time_id[$h] */ order by time_id limit 1;
bin/AST_cleanup_agent_log.pl:1145:UPDATE queue_log SET time_id=?/* $NEXTtimePAUSE */ where agent=?/* $agent[$h] */ and time_id=?/* $time_id[$h] */ and verb='PAUSEREASON' and data1='LAGGED' limit 1;
bin/AST_cleanup_agent_log.pl:1165:SELECT time_id,agent FROM queue_log where verb IN('AGENTLOGOFF','AGENTCALLBACKLOGOFF') $QM_SQL_time_H order by time_id;
bin/AST_cleanup_agent_log.pl:1188:SELECT time_id,verb,queue,call_id FROM queue_log where agent=?/* $agent[$h] */ and time_id > ?/* $time_id[$h] */ order by time_id limit 1;
bin/AST_cleanup_agent_log.pl:1208:UPDATE queue_log SET time_id=?/* $NEXTtimeLOGOFF */ where agent=?/* $agent[$h] */ and time_id=?/* $time_id[$h] */ and verb IN('AGENTLOGOFF','AGENTCALLBACKLOGOFF') limit 1;
bin/AST_cleanup_agent_log.pl:1228:SELECT time_id,agent FROM queue_log where verb IN('CONNECT') $QM_SQL_time_H order by time_id;
bin/AST_cleanup_agent_log.pl:1248:SELECT count(*) FROM queue_log where agent=?/* $agent[$h] */ and time_id=?/* $time_id[$h] */ and verb IN('PAUSEALL','UNPAUSEALL');
bin/AST_cleanup_agent_log.pl:1265:UPDATE queue_log SET time_id=?/* $NEXTtime */ where agent=?/* $agent[$h] */ and time_id=?/* $time_id[$h] */ and verb IN('CONNECT','UNPAUSEALL') limit 2;
bin/AST_cleanup_agent_log.pl:1303:SELECT time_id,agent,verb,serverid FROM queue_log where verb IN('AGENTLOGIN','AGENTCALLBACKLOGIN') and serverid=?/* $queuemetrics_log_id */ $QM_SQL_time order by time_id;
bin/AST_cleanup_agent_log.pl:1326:SELECT count(*) FROM queue_log where verb='PAUSEREASON' and time_id=?/* $PRtimecheck */ and agent=?/* $agent[$h] */;
bin/AST_cleanup_agent_log.pl:1343:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $PRtimecheck */,call_id='NONE',queue='NONE',agent=?/* $agent[$h] */,verb='PAUSEREASON',data1='LOGIN',serverid=?/* $serverid[$h] */$pause_typeSQL;
bin/AST_cleanup_agent_log.pl:1366:SELECT count(*) as tally,lead_id,end_epoch from vicidial_log $VDCL_SQL_time_where group by lead_id,end_epoch order by tally desc;
bin/AST_cleanup_agent_log.pl:1395:SELECT uniqueid,start_epoch,user,status,length_in_sec from vicidial_log $VDCL_SQL_time_where and lead_id=?/* $dup_lead[$h] */ and end_epoch=?/* $dup_end[$h] */ order by start_epoch;
bin/AST_cleanup_agent_log.pl:1428:DELETE FROM vicidial_log where lead_id=?/* $dup_lead[$h] */ and end_epoch=?/* $dup_end[$h] */ and uniqueid=?/* $del_uniqueid */ and start_epoch=?/* $del_start_epoch */;
bin/AST_cleanup_agent_log.pl:1452:SELECT * from ((SELECT user, pause_epoch, count(*) as ct from vicidial_agent_log where ( (pause_sec > 0) or (wait_sec > 0) or (talk_sec > 0) or (dispo_sec > 0) ) $VDAD_SQL_time group by user, pause_epoch) as dupes) where ct>1;
bin/AST_cleanup_agent_log.pl:1484:SELECT agent_log_id,lead_id,pause_sec,wait_epoch,wait_sec,talk_epoch,talk_sec,dispo_epoch,dispo_sec,status,uniqueid,comments from vicidial_agent_log where user=?/* $dup_user[$h] */ and pause_epoch=?/* $dup_pause_epoch[$h] */;
bin/AST_cleanup_agent_log.pl:1512:DELETE FROM vicidial_agent_log where agent_log_id IN($VAL_agent_log_id);
bin/AST_cleanup_agent_log.pl:1535:SELECT uniqueid,lead_id,start_epoch,end_epoch,length_in_sec from vicidial_log $VDCL_SQL_time_where and ( (length_in_sec > 86400) or (length_in_sec < -86400) ) order by call_date;
bin/AST_cleanup_agent_log.pl:1562:UPDATE vicidial_log SET length_in_sec=?/* $new_length */ where uniqueid=?/* $LONG_uniqueid[$h] */ and lead_id=?/* $LONG_lead_id[$h] */;
bin/AST_cleanup_agent_log.pl:1576:SELECT closecallid,lead_id,start_epoch,end_epoch,length_in_sec from vicidial_closer_log $VDCL_SQL_time_where and ( (length_in_sec > 86400) or (length_in_sec < -86400) ) order by call_date;
bin/AST_cleanup_agent_log.pl:1603:UPDATE vicidial_closer_log SET length_in_sec=?/* $new_length */ where closecallid=?/* $LONG_closecallid[$h] */ and lead_id=?/* $LONG_lead_id[$h] */;
bin/AST_cleanup_agent_log.pl:1627:SELECT agent_log_id,pause_epoch,wait_epoch from vicidial_agent_log where pause_sec>43999 $VDAD_SQL_time;
bin/AST_cleanup_agent_log.pl:1657:UPDATE vicidial_agent_log set pause_sec=?/* $pause_sec[$h] */ where agent_log_id=?/* $agent_log_id[$h] */;
bin/AST_cleanup_agent_log.pl:1673:SELECT agent_log_id,wait_epoch,talk_epoch from vicidial_agent_log where wait_sec>43999 $VDAD_SQL_time;
bin/AST_cleanup_agent_log.pl:1702:UPDATE vicidial_agent_log set wait_sec=?/* $wait_sec[$h] */ where agent_log_id=?/* $agent_log_id[$h] */;
bin/AST_cleanup_agent_log.pl:1718:SELECT agent_log_id,talk_epoch,dispo_epoch from vicidial_agent_log where talk_sec>43999 $VDAD_SQL_time;
bin/AST_cleanup_agent_log.pl:1747:UPDATE vicidial_agent_log set talk_sec=?/* $talk_sec[$h] */ where agent_log_id=?/* $agent_log_id[$h] */;
bin/AST_cleanup_agent_log.pl:1763:UPDATE vicidial_agent_log set dispo_sec='0' where dispo_sec>43999 $VDAD_SQL_time;
bin/AST_cleanup_agent_log.pl:1774:UPDATE vicidial_closer_log set length_in_sec=(end_epoch - start_epoch) where length_in_sec < 1 and end_epoch > 1000 $VDCL_SQL_time;
bin/AST_cleanup_agent_log.pl:1803:SELECT distinct user from vicidial_agent_log where user != '' $VDAD_SQL_time order by user;
bin/AST_cleanup_agent_log.pl:1822:SELECT agent_log_id,pause_epoch,pause_sec,wait_epoch,wait_sec,talk_epoch,talk_sec,dispo_epoch,dispo_sec,dead_epoch,dead_sec,event_time from vicidial_agent_log where user=?/* $Vuser[$i] */ $VDAD_SQL_time order by event_time, agent_log_id;
bin/AST_cleanup_agent_log.pl:1907:SELECT count(*) from vicidial_user_log where user=?/* $Vuser[$i] */ and event_date<=?/* $Vpause_date */ and event_date > ?/* $VFpause_date */ and event='LOGIN';
bin/AST_cleanup_agent_log.pl:1914:SELECT UTC_TIMESTAMP(event_date),event_date from vicidial_user_log where user=?/* $Vuser[$i] */ and event_date < ?/* $Vpause_date */ and event_date > ?/* $Vpause_dayB */ and event='LOGOUT' order by event_date desc limit 1;
bin/AST_cleanup_agent_log.pl:2023:UPDATE vicidial_agent_log set $corrections_SQL where agent_log_id=?/* $Vagent_log_id[$r] */;
bin/AST_cleanup_agent_log.pl:2068:SELECT time_id,call_id,queue,agent,verb,serverid FROM queue_log where verb IN('ENTERQUEUE','CALLOUTBOUND') and serverid=?/* $queuemetrics_log_id */ $QM_SQL_time order by time_id;
bin/AST_cleanup_agent_log.pl:2091:SELECT time_id,call_id,queue,agent,verb,serverid,data1 FROM queue_log where verb='CONNECT' and call_id=?/* $call_id[$h] */ $QM_SQL_time;
bin/AST_cleanup_agent_log.pl:2111:SELECT time_id,call_id,queue,agent,verb,serverid,data4 FROM queue_log where verb='CALLSTATUS' and call_id=?/* $call_id[$h] */ and agent=?/* $Cagent[$h] */;
bin/AST_cleanup_agent_log.pl:2133:SELECT count(*) FROM queue_log where verb IN('COMPLETEAGENT','COMPLETECALLER') and call_id=?/* $call_id[$h] */ and agent=?/* $Cagent[$h] */;
bin/AST_cleanup_agent_log.pl:2146:SELECT count(*) FROM queue_log where verb IN('COMPLETEAGENT','COMPLETECALLER') and call_id=?/* $call_id[$h] */ and agent=?/* $Cagent[$h] */ and queue=?/* $queue[$h] */;
bin/AST_cleanup_agent_log.pl:2158:UPDATE queue_log SET queue=?/* $queue[$h] */ where verb IN('COMPLETEAGENT','COMPLETECALLER') and call_id=?/* $call_id[$h] */ and agent=?/* $Cagent[$h] */;
bin/AST_cleanup_agent_log.pl:2171:SELECT time_id FROM queue_log where call_id=?/* $call_id[$h] */ and verb='PAUSEREASON' and data1=?/* $queuemetrics_dispo_pause */ and agent=?/* $Cagent[$h] */;
bin/AST_cleanup_agent_log.pl:2198:SELECT queue_position,queue_seconds FROM vicidial_closer_log where lead_id=?/* $Slead_id[$h] */ and campaign_id=?/* $Squeue[$h] */ and call_date > ?/* $RSQLdate */ order by closecallid desc limit 1;
bin/AST_cleanup_agent_log.pl:2212:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $Stime_id[$h] */,call_id=?/* $Scall_id[$h] */,queue=?/* $Squeue[$h] */,agent=?/* $Sagent[$h] */,verb='COMPLETEAGENT',data1=?/* $Cdata1[$h] */,data2=?/* $CALLtime[$h] */,data3=?/* $queue_position */,serverid=?/* $Sserverid[$h] */,data4=?/* $Sdata4[$h] */;
bin/AST_cleanup_agent_log.pl:2226:SELECT time_id,call_id,queue,agent,verb,serverid,data4 FROM queue_log where verb IN('COMPLETEAGENT','COMPLETECALLER') and call_id=?/* $call_id[$h] */ and agent=?/* $Cagent[$h] */;
bin/AST_cleanup_agent_log.pl:2247:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $Stime_id[$h] */,call_id=?/* $Scall_id[$h] */,queue=?/* $Cqueue[$h] */,agent=?/* $Sagent[$h] */,verb='CALLSTATUS',data1='PU',serverid=?/* $Sserverid[$h] */;
bin/AST_cleanup_agent_log.pl:2268:SELECT pause_epoch,wait_epoch,talk_epoch,dispo_epoch,status FROM vicidial_agent_log where lead_id=?/* $search_lead_id */ and user=?/* $VALuser */ and pause_epoch > ?/* $search_sec_BEGIN */ and pause_epoch < ?/* $search_sec_END */ order by pause_epoch desc;
bin/AST_cleanup_agent_log.pl:2313:SELECT queue_position,queue_seconds FROM vicidial_closer_log where lead_id=?/* $Clead_id[$h] */ and campaign_id=?/* $Cqueue[$h] */ and call_date > ?/* $RSQLdate */ order by closecallid desc limit 1;
bin/AST_cleanup_agent_log.pl:2327:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $Stime_id[$h] */,call_id=?/* $Ccall_id[$h] */,queue=?/* $Cqueue[$h] */,agent=?/* $Cagent[$h] */,verb='COMPLETEAGENT',data1=?/* $Cdata1[$h] */,data2=?/* $CALLtime[$h] */,data3=?/* $queue_position */,serverid=?/* $Cserverid[$h] */,data4=?/* $Sdata4[$h] */;
bin/AST_cleanup_agent_log.pl:2336:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $Stime_id[$h] */,call_id=?/* $Ccall_id[$h] */,queue=?/* $Cqueue[$h] */,agent=?/* $Cagent[$h] */,verb='CALLSTATUS',data1=?/* $VALstatus */,serverid=?/* $Cserverid[$h] */;
bin/AST_cleanup_agent_log.pl:2386:SELECT time_id,call_id,queue,agent,serverid,data4 FROM queue_log where verb='COMPLETEAGENT' and serverid=?/* $queuemetrics_log_id */ $QM_SQL_time order by time_id;
bin/AST_cleanup_agent_log.pl:2412:SELECT queue FROM queue_log WHERE verb='CONNECT' and serverid=?/* $queuemetrics_log_id */ and call_id=?/* $call_id[$h] */ and agent=?/* $agent[$h] */;
bin/AST_cleanup_agent_log.pl:2424:UPDATE queue_log SET queue=?/* $CAQqueue[$h] */ WHERE verb='COMPLETEAGENT' and serverid=?/* $queuemetrics_log_id */ and time_id=?/* $time_id[$h] */ and call_id=?/* $call_id[$h] */;
bin/AST_cleanup_agent_log.pl:2439:SELECT call_id, count(*) FROM queue_log WHERE verb IN('COMPLETEAGENT','COMPLETECALLER','TRANSFER') and serverid=?/* $queuemetrics_log_id */ $QM_SQL_time_H GROUP BY call_id HAVING count(*)>1 ORDER BY count(*) DESC;
bin/AST_cleanup_agent_log.pl:2457:DELETE FROM queue_log WHERE call_id=?/* $CDcall_id[$h] */ and verb IN('COMPLETEAGENT','COMPLETECALLER','TRANSFER') ORDER BY unique_row_count DESC LIMIT 1;
bin/AST_cleanup_agent_log.pl:2467:SELECT call_id, time_id FROM queue_log WHERE verb IN('COMPLETEAGENT') and data2 < '0' and serverid=?/* $queuemetrics_log_id */ $QM_SQL_time_H;
bin/AST_cleanup_agent_log.pl:2486:SELECT time_id FROM queue_log WHERE verb IN('CONNECT') and call_id=?/* $CNcall_id[$h] */;
bin/AST_cleanup_agent_log.pl:2499:SELECT time_id FROM queue_log WHERE verb IN('CALLSTATUS') and call_id=?/* $CNcall_id[$h] */;
bin/AST_cleanup_agent_log.pl:2514:UPDATE queue_log SET time_id=?/* $CCNtime_id[$h] */ WHERE call_id=?/* $CNcall_id[$h] */ and verb IN('CALLSTAUTS') LIMIT 1;
bin/AST_cleanup_agent_log.pl:2522:UPDATE queue_log SET time_id=?/* $CCNtime_id[$h] */,data2='0' WHERE call_id=?/* $CNcall_id[$h] */ and verb IN('COMPLETEAGENT') LIMIT 1;
bin/AST_cleanup_agent_log.pl:2537:SELECT time_id,call_id,queue,agent,serverid,data4 FROM queue_log where verb='COMPLETECALLER' and serverid=?/* $queuemetrics_log_id */ $QM_SQL_time order by time_id;
bin/AST_cleanup_agent_log.pl:2563:SELECT time_id FROM queue_log WHERE verb='UNPAUSEALL' and serverid=?/* $queuemetrics_log_id */ and agent=?/* $agent[$h] */ and time_id >= $time_id[$h] order by time_id limit 1;
bin/AST_cleanup_agent_log.pl:2575:SELECT count(*) FROM queue_log WHERE verb='PAUSEREASON' and serverid=?/* $queuemetrics_log_id */ and agent=?/* $agent[$h] */ and time_id >= $time_id[$h] and  time_id <= $unpause_time_id[$h];
bin/AST_cleanup_agent_log.pl:2592:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $time_id[$h] */,call_id=?/* $call_id[$h] */,queue='NONE',agent=?/* $agent[$h] */,verb='PAUSEREASON',data1=?/* $queuemetrics_dispo_pause */,serverid=?/* $Cserverid[$h] */$pause_typeSQL;
bin/ADMIN_archive_log_tables.pl:382:SELECT sip_event_logging FROM system_settings;
bin/ADMIN_archive_log_tables.pl:413:SELECT count(*) from call_log_archive;
bin/ADMIN_archive_log_tables.pl:429:DELETE FROM call_log_archive WHERE start_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:442:SELECT count(*) from vicidial_log_extended_archive;
bin/ADMIN_archive_log_tables.pl:458:DELETE FROM vicidial_log_extended_archive WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:473:SELECT count(*) from vicidial_log_extended_sip_archive;
bin/ADMIN_archive_log_tables.pl:489:DELETE FROM vicidial_log_extended_sip_archive WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:503:SELECT count(*) from vicidial_drop_log_archive;
bin/ADMIN_archive_log_tables.pl:519:DELETE FROM vicidial_drop_log_archive WHERE drop_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:532:SELECT count(*) from vicidial_dial_log_archive;
bin/ADMIN_archive_log_tables.pl:548:DELETE FROM vicidial_dial_log_archive WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:566:SELECT count(*) from vicidial_carrier_log_archive;
bin/ADMIN_archive_log_tables.pl:582:DELETE FROM vicidial_carrier_log_archive WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:595:SELECT count(*) from vicidial_api_log_archive;
bin/ADMIN_archive_log_tables.pl:611:DELETE FROM vicidial_api_log_archive WHERE api_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:622:SELECT count(*) from vicidial_api_urls_archive;
bin/ADMIN_archive_log_tables.pl:638:DELETE FROM vicidial_api_urls_archive WHERE api_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:651:SELECT count(*) from vicidial_rt_monitor_log_archive;
bin/ADMIN_archive_log_tables.pl:667:DELETE FROM vicidial_rt_monitor_log_archive WHERE monitor_start_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:685:SELECT count(*) from vicidial_log_archive;
bin/ADMIN_archive_log_tables.pl:701:DELETE FROM vicidial_log_archive WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:714:SELECT count(*) from vicidial_agent_log_archive;
bin/ADMIN_archive_log_tables.pl:730:DELETE FROM vicidial_agent_log_archive WHERE event_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:743:SELECT count(*) from vicidial_closer_log_archive;
bin/ADMIN_archive_log_tables.pl:759:DELETE FROM vicidial_closer_log_archive WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:772:SELECT count(*) from vicidial_xfer_log_archive;
bin/ADMIN_archive_log_tables.pl:788:DELETE FROM vicidial_xfer_log_archive WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:817:SELECT count(*) from call_log;
bin/ADMIN_archive_log_tables.pl:828:SELECT count(*) from call_log_archive;
bin/ADMIN_archive_log_tables.pl:840:INSERT IGNORE INTO call_log_archive SELECT * from call_log;
bin/ADMIN_archive_log_tables.pl:849:DELETE FROM call_log WHERE start_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:863:SELECT count(*) from vicidial_log_extended;
bin/ADMIN_archive_log_tables.pl:874:SELECT count(*) from vicidial_log_extended_archive;
bin/ADMIN_archive_log_tables.pl:886:INSERT IGNORE INTO vicidial_log_extended_archive SELECT * from vicidial_log_extended;
bin/ADMIN_archive_log_tables.pl:896:DELETE FROM vicidial_log_extended WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:912:SELECT count(*) from vicidial_log_extended_sip;
bin/ADMIN_archive_log_tables.pl:923:SELECT count(*) from vicidial_log_extended_sip_archive;
bin/ADMIN_archive_log_tables.pl:935:INSERT IGNORE INTO vicidial_log_extended_sip_archive SELECT * from vicidial_log_extended_sip;
bin/ADMIN_archive_log_tables.pl:945:DELETE FROM vicidial_log_extended_sip WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:960:SELECT count(*) from vicidial_drop_log;
bin/ADMIN_archive_log_tables.pl:971:SELECT count(*) from vicidial_drop_log_archive;
bin/ADMIN_archive_log_tables.pl:983:INSERT IGNORE INTO vicidial_drop_log_archive SELECT * from vicidial_drop_log;
bin/ADMIN_archive_log_tables.pl:993:DELETE FROM vicidial_drop_log WHERE drop_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1007:SELECT count(*) from vicidial_dial_log;
bin/ADMIN_archive_log_tables.pl:1018:SELECT count(*) from vicidial_dial_log_archive;
bin/ADMIN_archive_log_tables.pl:1030:INSERT IGNORE INTO vicidial_dial_log_archive SELECT * from vicidial_dial_log;
bin/ADMIN_archive_log_tables.pl:1040:DELETE FROM vicidial_dial_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1054:SELECT count(*) from vicidial_api_log;
bin/ADMIN_archive_log_tables.pl:1065:SELECT count(*) from vicidial_api_log_archive;
bin/ADMIN_archive_log_tables.pl:1077:INSERT IGNORE INTO vicidial_api_log_archive SELECT * from vicidial_api_log;
bin/ADMIN_archive_log_tables.pl:1087:DELETE FROM vicidial_api_log WHERE api_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1105:SELECT count(*) from vicidial_api_urls;
bin/ADMIN_archive_log_tables.pl:1116:SELECT count(*) from vicidial_api_urls_archive;
bin/ADMIN_archive_log_tables.pl:1128:INSERT IGNORE INTO vicidial_api_urls_archive SELECT * from vicidial_api_urls;
bin/ADMIN_archive_log_tables.pl:1138:DELETE FROM vicidial_api_urls WHERE api_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1158:SELECT count(*) from vicidial_carrier_log;
bin/ADMIN_archive_log_tables.pl:1169:SELECT count(*) from vicidial_carrier_log_archive;
bin/ADMIN_archive_log_tables.pl:1181:INSERT IGNORE INTO vicidial_carrier_log_archive SELECT * from vicidial_carrier_log;
bin/ADMIN_archive_log_tables.pl:1191:DELETE FROM vicidial_carrier_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1212:SELECT count(*) from vicidial_log;
bin/ADMIN_archive_log_tables.pl:1223:SELECT count(*) from vicidial_log_archive;
bin/ADMIN_archive_log_tables.pl:1235:INSERT IGNORE INTO vicidial_log_archive SELECT * from vicidial_log;
bin/ADMIN_archive_log_tables.pl:1245:DELETE FROM vicidial_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1262:SELECT count(*) from vicidial_amd_log;
bin/ADMIN_archive_log_tables.pl:1273:SELECT count(*) from vicidial_amd_log_archive;
bin/ADMIN_archive_log_tables.pl:1285:INSERT IGNORE INTO vicidial_amd_log_archive SELECT * from vicidial_amd_log;
bin/ADMIN_archive_log_tables.pl:1295:DELETE FROM vicidial_amd_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1329:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,queuemetrics_eq_prepend,queuemetrics_loginout,queuemetrics_dispo_pause FROM system_settings;
bin/ADMIN_archive_log_tables.pl:1356:SELECT count(*) from queue_log;
bin/ADMIN_archive_log_tables.pl:1367:SELECT count(*) from queue_log_archive;
bin/ADMIN_archive_log_tables.pl:1379:INSERT IGNORE INTO queue_log_archive SELECT * from queue_log;
bin/ADMIN_archive_log_tables.pl:1388:DELETE FROM queue_log WHERE time_id < $del_epoch;
bin/ADMIN_archive_log_tables.pl:1402:SELECT count(*) from call_log;
bin/ADMIN_archive_log_tables.pl:1413:SELECT count(*) from call_log_archive;
bin/ADMIN_archive_log_tables.pl:1425:INSERT IGNORE INTO call_log_archive SELECT * from call_log;
bin/ADMIN_archive_log_tables.pl:1435:DELETE FROM call_log;
bin/ADMIN_archive_log_tables.pl:1437:DELETE FROM call_log WHERE start_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1447:DELETE from call_log_archive where channel LIKE 'Local/9%' and extension not IN('8365','8366','8367','8368','8369','8370','8371','8372','8373','8374') and caller_code LIKE 'V%' and length_in_sec < 75 and start_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1460:SELECT count(*) from vicidial_log;
bin/ADMIN_archive_log_tables.pl:1471:SELECT count(*) from vicidial_log_archive;
bin/ADMIN_archive_log_tables.pl:1483:INSERT IGNORE INTO vicidial_log_archive SELECT * from vicidial_log;
bin/ADMIN_archive_log_tables.pl:1494:DELETE FROM vicidial_log;
bin/ADMIN_archive_log_tables.pl:1496:DELETE FROM vicidial_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1513:SELECT count(*) from vicidial_closer_log;
bin/ADMIN_archive_log_tables.pl:1524:SELECT count(*) from vicidial_closer_log_archive;
bin/ADMIN_archive_log_tables.pl:1536:INSERT IGNORE INTO vicidial_closer_log_archive SELECT * from vicidial_closer_log;
bin/ADMIN_archive_log_tables.pl:1547:DELETE FROM vicidial_closer_log;
bin/ADMIN_archive_log_tables.pl:1549:DELETE FROM vicidial_closer_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1566:SELECT count(*) from vicidial_xfer_log;
bin/ADMIN_archive_log_tables.pl:1577:SELECT count(*) from vicidial_xfer_log_archive;
bin/ADMIN_archive_log_tables.pl:1589:INSERT IGNORE INTO vicidial_xfer_log_archive SELECT * from vicidial_xfer_log;
bin/ADMIN_archive_log_tables.pl:1600:DELETE FROM vicidial_xfer_log;
bin/ADMIN_archive_log_tables.pl:1602:DELETE FROM vicidial_xfer_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1619:SELECT count(*) from vicidial_log_extended;
bin/ADMIN_archive_log_tables.pl:1630:SELECT count(*) from vicidial_log_extended_archive;
bin/ADMIN_archive_log_tables.pl:1642:INSERT IGNORE INTO vicidial_log_extended_archive SELECT * from vicidial_log_extended;
bin/ADMIN_archive_log_tables.pl:1653:DELETE FROM vicidial_log_extended;
bin/ADMIN_archive_log_tables.pl:1655:DELETE FROM vicidial_log_extended WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1674:SELECT count(*) from vicidial_log_extended_sip;
bin/ADMIN_archive_log_tables.pl:1685:SELECT count(*) from vicidial_log_extended_sip_archive;
bin/ADMIN_archive_log_tables.pl:1697:INSERT IGNORE INTO vicidial_log_extended_sip_archive SELECT * from vicidial_log_extended_sip;
bin/ADMIN_archive_log_tables.pl:1708:DELETE FROM vicidial_log_extended_sip;
bin/ADMIN_archive_log_tables.pl:1710:DELETE FROM vicidial_log_extended_sip WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1728:SELECT count(*) from vicidial_drop_log;
bin/ADMIN_archive_log_tables.pl:1739:SELECT count(*) from vicidial_drop_log_archive;
bin/ADMIN_archive_log_tables.pl:1751:INSERT IGNORE INTO vicidial_drop_log_archive SELECT * from vicidial_drop_log;
bin/ADMIN_archive_log_tables.pl:1762:DELETE FROM vicidial_drop_log;
bin/ADMIN_archive_log_tables.pl:1764:DELETE FROM vicidial_drop_log WHERE drop_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1781:SELECT count(*) from vicidial_dial_log;
bin/ADMIN_archive_log_tables.pl:1792:SELECT count(*) from vicidial_dial_log_archive;
bin/ADMIN_archive_log_tables.pl:1804:INSERT IGNORE INTO vicidial_dial_log_archive SELECT * from vicidial_dial_log;
bin/ADMIN_archive_log_tables.pl:1815:DELETE FROM vicidial_dial_log;
bin/ADMIN_archive_log_tables.pl:1817:DELETE FROM vicidial_dial_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1835:SELECT count(*) from vicidial_api_log;
bin/ADMIN_archive_log_tables.pl:1846:SELECT count(*) from vicidial_api_log_archive;
bin/ADMIN_archive_log_tables.pl:1858:INSERT IGNORE INTO vicidial_api_log_archive SELECT * from vicidial_api_log;
bin/ADMIN_archive_log_tables.pl:1869:DELETE FROM vicidial_api_log;
bin/ADMIN_archive_log_tables.pl:1871:DELETE FROM vicidial_api_log WHERE api_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1888:SELECT count(*) from vicidial_api_urls;
bin/ADMIN_archive_log_tables.pl:1899:SELECT count(*) from vicidial_api_urls_archive;
bin/ADMIN_archive_log_tables.pl:1911:INSERT IGNORE INTO vicidial_api_urls_archive SELECT * from vicidial_api_urls;
bin/ADMIN_archive_log_tables.pl:1922:DELETE FROM vicidial_api_urls;
bin/ADMIN_archive_log_tables.pl:1924:DELETE FROM vicidial_api_urls WHERE api_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1941:SELECT count(*) from vicidial_rt_monitor_log;
bin/ADMIN_archive_log_tables.pl:1952:SELECT count(*) from vicidial_rt_monitor_log_archive;
bin/ADMIN_archive_log_tables.pl:1964:INSERT IGNORE INTO vicidial_rt_monitor_log_archive SELECT * from vicidial_rt_monitor_log;
bin/ADMIN_archive_log_tables.pl:1975:DELETE FROM vicidial_rt_monitor_log;
bin/ADMIN_archive_log_tables.pl:1977:DELETE FROM vicidial_rt_monitor_log WHERE monitor_start_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:1995:SELECT count(*) from user_call_log;
bin/ADMIN_archive_log_tables.pl:2007:SELECT count(*) from user_call_log_archive;
bin/ADMIN_archive_log_tables.pl:2019:INSERT IGNORE INTO user_call_log_archive SELECT * from user_call_log;
bin/ADMIN_archive_log_tables.pl:2030:DELETE FROM user_call_log;
bin/ADMIN_archive_log_tables.pl:2032:DELETE FROM user_call_log WHERE call_date < ?/* $del_time */ order by user_call_log_id limit $user_call_log_count_mil;
bin/ADMIN_archive_log_tables.pl:2050:SELECT count(*) from vicidial_inbound_survey_log;
bin/ADMIN_archive_log_tables.pl:2061:SELECT count(*) from vicidial_inbound_survey_log_archive;
bin/ADMIN_archive_log_tables.pl:2073:INSERT IGNORE INTO vicidial_inbound_survey_log_archive SELECT * from vicidial_inbound_survey_log;
bin/ADMIN_archive_log_tables.pl:2084:DELETE FROM vicidial_inbound_survey_log;
bin/ADMIN_archive_log_tables.pl:2086:DELETE FROM vicidial_inbound_survey_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2104:SELECT count(*) from vicidial_log_noanswer;
bin/ADMIN_archive_log_tables.pl:2115:SELECT count(*) from vicidial_log_noanswer_archive;
bin/ADMIN_archive_log_tables.pl:2127:INSERT IGNORE INTO vicidial_log_noanswer_archive SELECT * from vicidial_log_noanswer;
bin/ADMIN_archive_log_tables.pl:2138:DELETE FROM vicidial_log_noanswer;
bin/ADMIN_archive_log_tables.pl:2140:DELETE FROM vicidial_log_noanswer WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2158:SELECT count(*) from vicidial_did_agent_log;
bin/ADMIN_archive_log_tables.pl:2169:SELECT count(*) from vicidial_did_agent_log_archive;
bin/ADMIN_archive_log_tables.pl:2181:INSERT IGNORE INTO vicidial_did_agent_log_archive SELECT * from vicidial_did_agent_log;
bin/ADMIN_archive_log_tables.pl:2192:DELETE FROM vicidial_did_agent_log;
bin/ADMIN_archive_log_tables.pl:2194:DELETE FROM vicidial_did_agent_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2211:SELECT count(*) from vicidial_amd_log;
bin/ADMIN_archive_log_tables.pl:2222:SELECT count(*) from vicidial_amd_log_archive;
bin/ADMIN_archive_log_tables.pl:2234:INSERT IGNORE INTO vicidial_amd_log_archive SELECT * from vicidial_amd_log;
bin/ADMIN_archive_log_tables.pl:2245:DELETE FROM vicidial_amd_log;
bin/ADMIN_archive_log_tables.pl:2247:DELETE FROM vicidial_amd_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2264:SELECT count(*) from vicidial_vmm_counts;
bin/ADMIN_archive_log_tables.pl:2275:SELECT count(*) from vicidial_vmm_counts_archive;
bin/ADMIN_archive_log_tables.pl:2287:INSERT IGNORE INTO vicidial_vmm_counts_archive SELECT * from vicidial_vmm_counts;
bin/ADMIN_archive_log_tables.pl:2298:DELETE FROM vicidial_vmm_counts;
bin/ADMIN_archive_log_tables.pl:2300:DELETE FROM vicidial_vmm_counts WHERE call_date < ?/* $del_date */;
bin/ADMIN_archive_log_tables.pl:2317:SELECT count(*) from server_performance;
bin/ADMIN_archive_log_tables.pl:2330:DELETE FROM server_performance;
bin/ADMIN_archive_log_tables.pl:2332:DELETE FROM server_performance WHERE start_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2344:SELECT count(*) from vicidial_url_log;
bin/ADMIN_archive_log_tables.pl:2356:DELETE FROM vicidial_url_log WHERE url_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2368:SELECT count(*) from vicidial_dtmf_log;
bin/ADMIN_archive_log_tables.pl:2380:DELETE FROM vicidial_dtmf_log WHERE dtmf_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2392:SELECT count(*) from vicidial_agent_log;
bin/ADMIN_archive_log_tables.pl:2403:SELECT count(*) from vicidial_agent_log_archive;
bin/ADMIN_archive_log_tables.pl:2415:INSERT IGNORE INTO vicidial_agent_log_archive SELECT * from vicidial_agent_log;
bin/ADMIN_archive_log_tables.pl:2425:DELETE FROM vicidial_agent_log;
bin/ADMIN_archive_log_tables.pl:2427:DELETE FROM vicidial_agent_log WHERE event_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2444:SELECT count(*) from vicidial_carrier_log;
bin/ADMIN_archive_log_tables.pl:2455:SELECT count(*) from vicidial_carrier_log_archive;
bin/ADMIN_archive_log_tables.pl:2467:INSERT IGNORE INTO vicidial_carrier_log_archive SELECT * from vicidial_carrier_log;
bin/ADMIN_archive_log_tables.pl:2478:DELETE FROM vicidial_carrier_log;
bin/ADMIN_archive_log_tables.pl:2480:DELETE FROM vicidial_carrier_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2498:SELECT count(*) from vicidial_call_notes;
bin/ADMIN_archive_log_tables.pl:2509:SELECT count(*) from vicidial_call_notes_archive;
bin/ADMIN_archive_log_tables.pl:2521:INSERT IGNORE INTO vicidial_call_notes_archive SELECT * from vicidial_call_notes;
bin/ADMIN_archive_log_tables.pl:2531:DELETE FROM vicidial_call_notes WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2549:SELECT count(*) from vicidial_lead_search_log;
bin/ADMIN_archive_log_tables.pl:2560:SELECT count(*) from vicidial_lead_search_log_archive;
bin/ADMIN_archive_log_tables.pl:2572:INSERT IGNORE INTO vicidial_lead_search_log_archive SELECT * from vicidial_lead_search_log;
bin/ADMIN_archive_log_tables.pl:2582:DELETE FROM vicidial_lead_search_log WHERE event_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2599:SELECT count(*) from vicidial_agent_function_log;
bin/ADMIN_archive_log_tables.pl:2610:SELECT count(*) from vicidial_agent_function_log_archive;
bin/ADMIN_archive_log_tables.pl:2622:INSERT IGNORE INTO vicidial_agent_function_log_archive SELECT * from vicidial_agent_function_log;
bin/ADMIN_archive_log_tables.pl:2633:DELETE FROM vicidial_agent_function_log;
bin/ADMIN_archive_log_tables.pl:2635:DELETE FROM vicidial_agent_function_log WHERE event_time < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2653:SELECT count(*) from vicidial_outbound_ivr_log;
bin/ADMIN_archive_log_tables.pl:2664:SELECT count(*) from vicidial_outbound_ivr_log_archive;
bin/ADMIN_archive_log_tables.pl:2676:INSERT IGNORE INTO vicidial_outbound_ivr_log_archive SELECT * from vicidial_outbound_ivr_log;
bin/ADMIN_archive_log_tables.pl:2687:DELETE FROM vicidial_outbound_ivr_log;
bin/ADMIN_archive_log_tables.pl:2689:DELETE FROM vicidial_outbound_ivr_log WHERE event_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2707:SELECT count(*) from vicidial_sip_action_log;
bin/ADMIN_archive_log_tables.pl:2718:SELECT count(*) from vicidial_sip_action_log_archive;
bin/ADMIN_archive_log_tables.pl:2730:INSERT IGNORE INTO vicidial_sip_action_log_archive SELECT * from vicidial_sip_action_log;
bin/ADMIN_archive_log_tables.pl:2740:DELETE FROM vicidial_sip_action_log WHERE call_date < ?/* $del_time */;
bin/ADMIN_archive_log_tables.pl:2761:SELECT count(*) from recording_log;
bin/ADMIN_archive_log_tables.pl:2772:SELECT count(*) from recording_log_archive;
bin/ADMIN_archive_log_tables.pl:2784:INSERT IGNORE INTO recording_log_archive SELECT * from recording_log;
bin/ADMIN_archive_log_tables.pl:2794:DELETE FROM recording_log WHERE start_time < ?/* $RECdel_time */;
bin/ADMIN_archive_log_tables.pl:2814:SELECT count(*) from vicidial_did_log;
bin/ADMIN_archive_log_tables.pl:2825:SELECT count(*) from vicidial_did_log_archive;
bin/ADMIN_archive_log_tables.pl:2837:INSERT IGNORE INTO vicidial_did_log_archive SELECT * from vicidial_did_log;
bin/ADMIN_archive_log_tables.pl:2847:DELETE FROM vicidial_did_log WHERE call_date < ?/* $DIDdel_time */;
bin/ADMIN_archive_log_tables.pl:2867:SELECT count(*) from vicidial_cpd_log;
bin/ADMIN_archive_log_tables.pl:2880:DELETE FROM vicidial_cpd_log WHERE event_date < ?/* $CPDdel_time */;
bin/ADMIN_archive_log_tables.pl:2892:UPDATE system_settings SET oldest_logs_date=?/* $del_time */;
bin/VICIDIAL_IN_new_leads_file.pl:529:SELECT use_non_latin FROM system_settings;
bin/VICIDIAL_IN_new_leads_file.pl:545:SELECT count(*) FROM vicidial_nanpa_prefix_codes;
bin/VICIDIAL_IN_new_leads_file.pl:711:SELECT count(*) from vicidial_lists where list_id=?/* $new_list_id */;
bin/VICIDIAL_IN_new_leads_file.pl:732:INSERT INTO vicidial_lists (list_id,list_name,list_description,campaign_id,active,list_changedate,time_zone_setting,reset_time) values(?/* $new_list_id */,?/* $list_name_prefix $FILES[$i] */,'Created: $insert_date',?/* $list_campaign */,?/* $active_list */,?/* $insert_date */,?/* $time_zone_setting */,?/* $reset_time */);
bin/VICIDIAL_IN_new_leads_file.pl:744:SELECT local_gmt FROM servers where server_ip = ?/* $server_ip */;
bin/VICIDIAL_IN_new_leads_file.pl:1664:SELECT cid from vicidial_custom_cid where state=?/* $state */;
bin/VICIDIAL_IN_new_leads_file.pl:1776:SELECT cid from vicidial_custom_cid where state=?/* $state */;
bin/VICIDIAL_IN_new_leads_file.pl:1897:SELECT cid from vicidial_custom_cid where state=?/* $state */;
bin/VICIDIAL_IN_new_leads_file.pl:1982:SELECT cid from vicidial_custom_cid where state=?/* $state */;
bin/VICIDIAL_IN_new_leads_file.pl:2160:SELECT count(*) from vicidial_phone_codes where areacode=?/* $USarea */ and country_code='1';
bin/VICIDIAL_IN_new_leads_file.pl:2182:SELECT count(*) from vicidial_nanpa_prefix_codes where areacode=?/* $USarea */ and prefix=?/* $USprefix */ limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2203:SELECT count(*) from vicidial_list where phone_number=?/* $phone_number */;
bin/VICIDIAL_IN_new_leads_file.pl:2225:SELECT list_id from vicidial_list where phone_number=?/* $phone_number */ and list_id=?/* $list_id */ limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2249:SELECT count(*) from vicidial_lists where list_id=?/* $list_id */;
bin/VICIDIAL_IN_new_leads_file.pl:2258:SELECT campaign_id from vicidial_lists where list_id=?/* $list_id */;
bin/VICIDIAL_IN_new_leads_file.pl:2266:SELECT list_id from vicidial_lists where campaign_id=?/* $dup_camp */;
bin/VICIDIAL_IN_new_leads_file.pl:2280:SELECT list_id from vicidial_list where phone_number=?/* $phone_number */ and list_id IN($dup_lists) limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2304:SELECT count(*) from vicidial_list where title=?/* $title */ and alt_phone=?/* $alt_phone */;
bin/VICIDIAL_IN_new_leads_file.pl:2326:SELECT list_id from vicidial_list where title=?/* $title */ and alt_phone=?/* $alt_phone */ and list_id=?/* $list_id */ limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2349:SELECT lead_id,title from vicidial_list where phone_number=?/* $phone_number */ and list_id=?/* $list_id */ limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2365:DELETE FROM vicidial_list where lead_id=?/* $tnm_lead_id */ limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2396:SELECT postal_code,state,GMT_offset,DST,DST_range,country,country_code from vicidial_postal_codes where country_code=?/* $phone_code */ and postal_code LIKE \"$postal_code%\
bin/VICIDIAL_IN_new_leads_file.pl:2422:SELECT GMT_offset from vicidial_phone_codes where tz_code=?/* $owner */ and country_code=?/* $phone_code */ limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2436:SELECT distinct DST_range from vicidial_phone_codes where tz_code=?/* $owner */ and country_code=?/* $phone_code */ order by DST_range desc limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2458:SELECT GMT_offset,DST from vicidial_nanpa_prefix_codes where areacode=?/* $USarea */ and prefix=?/* $USprefix */ limit 1;
bin/VICIDIAL_IN_new_leads_file.pl:2483:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $phone_code */ and areacode=?/* $USarea */;
bin/VICIDIAL_IN_new_leads_file.pl:2503:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $phone_code */ and areacode=?/* $USarea */;
bin/VICIDIAL_IN_new_leads_file.pl:2523:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $phone_code */ and state=?/* $state */;
bin/VICIDIAL_IN_new_leads_file.pl:2543:SELECT country_code,country,areacode,state,GMT_offset,DST,DST_range,geographic_description from vicidial_phone_codes where country_code=?/* $phone_code */;
bin/VICIDIAL_IN_new_leads_file.pl:2661:INSERT INTO vicidial_list (lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,gmt_offset_now,called_since_last_reset,phone_code,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner) values('',?/* $insert_date */,?/* $modify_date */,?/* $status */,?/* $user */,?/* $vendor_lead_code */,?/* $source_id */,?/* $list_id */,?/* $gmt_offset */,?/* $called_since_last_reset */,?/* $phone_code */,?/* $phone_number */,?/* $title */,?/* $first_name */,?/* $middle_initial */,?/* $last_name */,?/* $address1 */,?/* $address2 */,?/* $address3 */,?/* $city */,?/* $state */,?/* $province */,?/* $postal_code */,?/* $country */,?/* $gender */,?/* $date_of_birth */,?/* $alt_phone */,?/* $email */,?/* $security_phrase */,?/* $comments */,?/* $called_count */,'2008-01-01 00:00:00',?/* $rank */,?/* $owner */);
bin/VICIDIAL_IN_new_leads_file.pl:2671:INSERT INTO vicidial_list_alt_phones (lead_id,phone_code,phone_number,alt_phone_note,alt_phone_count) values(?/* $lead_id */,?/* $ALTm_phone_code[$r] */,?/* $ALTm_phone_number[$r] */,?/* $ALTm_phone_note[$r] */,?/* $s */);
bin/VICIDIAL_IN_new_leads_file.pl:2683:INSERT INTO vicidial_list (lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,gmt_offset_now,called_since_last_reset,phone_code,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner) values$multistmt('',?/* $insert_date */,?/* $modify_date */,?/* $status */,?/* $user */,?/* $vendor_lead_code */,?/* $source_id */,?/* $list_id */,?/* $gmt_offset */,?/* $called_since_last_reset */,?/* $phone_code */,?/* $phone_number */,?/* $title */,?/* $first_name */,?/* $middle_initial */,?/* $last_name */,?/* $address1 */,?/* $address2 */,?/* $address3 */,?/* $city */,?/* $state */,?/* $province */,?/* $postal_code */,?/* $country */,?/* $gender */,?/* $date_of_birth */,?/* $alt_phone */,?/* $email */,?/* $security_phrase */,?/* $comments */,?/* $called_count */,'2008-01-01 00:00:00',?/* $rank */,?/* $owner */);
bin/VICIDIAL_IN_new_leads_file.pl:2734:INSERT INTO vicidial_list (lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,gmt_offset_now,called_since_last_reset,phone_code,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner) values$multistmt;
bin/VICIDIAL_IN_new_leads_file.pl:2754:INSERTED:           $b\n
bin/VICIDIAL_IN_new_leads_file.pl:2755:INSERT STATEMENTS:  $c\n
bin/AST_DB_territory_populate.pl:104:UPDATE vicidial_list SET owner=CONCAT('MUTO2822',state) where owner='' and list_id IN('1295','1298') and state!='' and state is NOT NULL;
bin/AST_call_log_export.pl:387:SELECT local_gmt FROM servers where server_ip=?/* $server_ip */;
bin/AST_call_log_export.pl:419:select CONVERT_TZ(call_date,$convert_tz),vicidial_log.phone_number,vendor_lead_code,vicidial_log.status,vicidial_log.user,first_name,last_name,vicidial_list.lead_id,vicidial_log.list_id,campaign_id,length_in_sec,vicidial_list.source_id,uniqueid from vicidial_list,vicidial_log where $VLcampaignSQL and $VLdateSQL and vicidial_log.lead_id=vicidial_list.lead_id and vicidial_log.status IN('DROP','XDROP','NA','AA','AM','AL','AB','ADC','PU','PM','SVYEXT','SVYVM','SVYHU','SVYREC','HXFER','HOLDTO','QVMAIL','RQXFER','CPDATB','CPDB','CPDNA','CPDREJ','CPDINV','CPDSUA','CPDSI','CPDSNC','CPDSR','CPDSUK','CPDSV','CPDUK','CPDERR','TIMEOT','AFTHRS','NANQUE','MAXCAL') order by call_date;
bin/AST_call_log_export.pl:456:select CONVERT_TZ(event_time,$convert_tz),vicidial_list.phone_number,vendor_lead_code,vicidial_agent_log.status,vicidial_agent_log.user,first_name,last_name,vicidial_list.lead_id,vicidial_list.list_id,campaign_id,talk_sec,vicidial_list.source_id,dead_sec,agent_log_id from vicidial_list,vicidial_agent_log where $VLAcampaignSQL and $VLAdateSQL and vicidial_agent_log.lead_id=vicidial_list.lead_id and vicidial_agent_log.status NOT IN('DROP','XDROP','NA','AA','AM','AL','AB','ADC','PU','PM','SVYEXT','SVYVM','SVYHU','SVYREC','HXFER','HOLDTO','QVMAIL','RQXFER','CPDATB','CPDB','CPDNA','CPDREJ','CPDINV','CPDSUA','CPDSI','CPDSNC','CPDSR','CPDSUK','CPDSV','CPDUK','CPDERR','TIMEOT','AFTHRS','NANQUE','INCALL','','QUEUE','MAXCAL') order by event_time;
bin/AST_call_log_export.pl:493:UPDATE vicidial_log set processed='Y' where uniqueid IN($VLupdateSQL) and processed='N';
bin/AST_call_log_export.pl:499:UPDATE vicidial_agent_log set processed='Y' where agent_log_id IN($VLAupdateSQL) and processed='N';
bin/VICI_CSV_dump_call_log.pl:180:select distinct status from vicidial_campaign_statuses where customer_contact='Y' UNION select distinct status from vicidial_statuses where customer_contact='Y' order by status
bin/VICI_CSV_dump_call_log.pl:194:select event_time, vu.full_name, vu.user, talk_sec, v.phone_number from vicidial_list v, vicidial_agent_log val, vicidial_users vu where event_time >= ?/* $start_date 00:00:00 */ and event_time <= ?/* $start_date 23:59:59 */ and val.status in (?/* '".$status_str."' */) and val.user=vu.user and val.lead_id=v.lead_id order by event_time asc
bin/AST_activity_log_export.pl:415:SELECT local_gmt FROM servers where server_ip=?/* $server_ip */;
bin/AST_activity_log_export.pl:452:SELECT user,CONVERT_TZ(event_time,$convert_tz),lead_id,campaign_id,pause_sec,wait_sec,talk_sec,dispo_sec,dead_sec,status,agent_log_id from $vicidial_agent_log where $VALcampaignSQL and $VALdateSQL order by agent_log_id;
bin/AST_activity_log_export.pl:526:SELECT user,location,lead_id,recording_id,CONVERT_TZ(start_time,$convert_tz) from $recording_log where $RECdateSQL order by recording_id;
bin/AST_activity_log_export.pl:594:SELECT lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,gmt_offset_now,called_since_last_reset,phone_code,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner,entry_list_id from $vicidial_list where $VLdateSQL order by lead_id;
bin/VICIDIAL_fix_status_mismatch.pl:89:select distinct lead_id,status from vicidial_closer_log where status IN('A1','A2','A3','A4') and call_date > '2008-03-01 01:00:00';
bin/VICIDIAL_fix_status_mismatch.pl:115:select status,start_epoch from vicidial_log where lead_id=?/* $lead_id[$b] */ order by call_date desc LIMIT 1;
bin/VICIDIAL_fix_status_mismatch.pl:129:select status,start_epoch from vicidial_closer_log where lead_id=?/* $lead_id[$b] */ order by closecallid desc LIMIT 1;
bin/VICIDIAL_fix_status_mismatch.pl:148:UPDATE vicidial_list set status=?/* $Cstatus */ where lead_id=?/* $lead_id[$b] */;
bin/AST_CRON_audio_1_move_VDonly.pl:213:SELECT mute_recordings FROM system_settings;
bin/AST_CRON_audio_1_move_VDonly.pl:291:SELECT recording_id,length_in_sec,lead_id,vicidial_id,start_time,end_time,user from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/AST_CRON_audio_1_move_VDonly.pl:315:SELECT count(*),stage from vicidial_agent_function_log where lead_id=?/* $lead_id */ and event_time >= ?/* $start_time */ and user=?/* $user */ and function='mute_rec' group by stage;
bin/AST_CRON_audio_1_move_VDonly.pl:338:SELECT count(*) from vicidial_agent_function_log where lead_id=?/* $lead_id */ and event_time >= ?/* $start_time */ and event_time > DATE_SUB(NOW(),INTERVAL 15 MINUTE) and user=?/* $user */ and function='mute_rec' and stage='on';
bin/AST_CRON_audio_1_move_VDonly.pl:423:SELECT status from vicidial_log where uniqueid=?/* $vicidial_id */ and lead_id=?/* $lead_id */ $camp_postSQL;
bin/AST_CRON_audio_1_move_VDonly.pl:427:SELECT status from vicidial_closer_log where closecallid=?/* $vicidial_id */ and lead_id=?/* $lead_id */ $camp_postSQL;
bin/AST_CRON_audio_1_move_VDonly.pl:472:SELECT vendor_lead_code,security_phrase,address3,status from vicidial_list where lead_id=?/* $lead_id */ LIMIT 1;
bin/AST_CRON_audio_1_move_VDonly.pl:537:UPDATE recording_log set location=?/* $HTTP://$server_ip/RECORDINGS/$ALLfile */ $filenameSQL $lengthSQL where recording_id=?/* $recording_id */;
bin/AST_VDweekly_agent_statuses_report.pl:190:SELECT status, status_name FROM vicidial_statuses;
bin/AST_VDweekly_agent_statuses_report.pl:193:SELECT status, status_name FROM vicidial_campaign_statuses;
bin/AST_VDweekly_agent_statuses_report.pl:196:SELECT user, lead_id, event_time, campaign_id, pause_sec, wait_sec, talk_sec, dispo_sec, status FROM vicidial_agent_log where event_time <= ? and event_time >= ?
bin/AST_VDweekly_agent_statuses_report.pl:199:SELECT vendor_lead_code FROM vicidial_list WHERE lead_id = ?;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:353:SELECT use_non_latin,vtiger_server_ip,vtiger_dbname,vtiger_login,vtiger_pass FROM system_settings;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:431:SELECT count(*) FROM vicidial_agent_log where event_time >= ?/* $TODAY 00:00:00 */ and event_time <= \"$ENDDAY 23:59:59\
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:446:SELECT pause_sec,wait_sec,talk_sec,dispo_sec,sub_status,vu.user,user_code,campaign_id,comments FROM vicidial_agent_log val,vicidial_users vu where event_time >= ?/* $TODAY 00:00:00 */ and event_time <= ?/* $ENDDAY 23:59:59 */ and val.user=vu.user order by val.user;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:504:SELECT billable from vicidial_pause_codes where campaign_id=?/* $campaign[$w] */ and pause_code=?/* $pause_code[$w] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:553:SELECT count(*) from vtiger_field where fieldlabel='Timezone';
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:566:SELECT fieldname from vtiger_field where fieldlabel='Timezone';
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:587:SELECT count(*) from vtiger_field where fieldlabel='Last Sale Amount';
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:598:SELECT count(*) from vtiger_field where fieldlabel='Largest Sale Amount';
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:611:SELECT fieldname from vtiger_field where fieldlabel='Last Sale Amount';
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:626:SELECT fieldname from vtiger_field where fieldlabel='Largest Sale Amount';
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:644:SELECT crmid,smownerid from vtiger_crmentity where setype='Accounts' and deleted='0' order by crmid limit 3000000;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:670:SELECT count(*) FROM vicidial_list where vendor_lead_code=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:683:SELECT state,gmt_offset_now FROM vicidial_list where vendor_lead_code=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:717:UPDATE vtiger_accountscf SET $vt_timezone_field_name=?/* $timezone_abb */ where accountid=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:730:SELECT tickersymbol from vtiger_account where accountid=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:745:SELECT count(*) FROM vicidial_user_territories where territory=?/* $territory */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:759:SELECT user FROM vicidial_user_territories where territory=?/* $territory */ order by level desc,user;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:773:SELECT id from vtiger_users where user_name=?/* $user */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:787:UPDATE vtiger_crmentity SET smownerid=?/* $user_id */,smcreatorid=?/* $user_id */,modifiedby=?/* $user_id */ where crmid=?/* $crmid[$i] */ $VCuser_territory_update_restrictionSQL;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:791:UPDATE vtiger_tracker SET user_id=?/* $user_id */ where item_id=?/* $crmid[$i] */ $VTuser_territory_update_restrictionSQL;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:813:SELECT count(*) from vtiger_salesorder where accountid=?/* $crmid[$i] */ $duedateSQL order by duedate;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:828:SELECT total from vtiger_salesorder where accountid=?/* $crmid[$i] */ $duedateSQL order by duedate;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:842:UPDATE vtiger_accountscf SET $vt_largest_saleamount_field_name=?/* $largest_sale */,$vt_last_saleamount_field_name=?/* $last_sale */ where accountid=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:858:SELECT count(*) FROM vicidial_list where vendor_lead_code=?/* $crmid[$i] */ and last_local_call_time >= ?/* $TODAY 00:00:00 */ and last_local_call_time <= \"$ENDDAY 23:59:59\
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:871:SELECT website,tickersymbol,employees from vtiger_account where accountid=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:889:SELECT lead_id FROM vicidial_list where vendor_lead_code=?/* $crmid[$i] */ and last_local_call_time >= ?/* $TODAY 00:00:00 */ and last_local_call_time <= ?/* $ENDDAY 23:59:59 */ order by lead_id desc limit 1;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:901:SELECT count(*) FROM vicidial_log where lead_id=?/* $lead_id */ and call_date >= ?/* $TODAY 00:00:00 */ and call_date <= \"$ENDDAY 23:59:59\
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:913:SELECT count(*) FROM vicidial_closer_log where lead_id=?/* $lead_id */ and call_date >= ?/* $TODAY 00:00:00 */ and call_date <= \"$ENDDAY 23:59:59\
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:939:SELECT uniqueid,vl.user,user_code,phone_number,vl.status,length_in_sec,call_date,comments FROM vicidial_log vl,vicidial_users vu where lead_id=?/* $lead_id */ and call_date >= ?/* $TODAY 00:00:00 */ and call_date <= ?/* $ENDDAY 23:59:59 */ and vl.user=vu.user order by call_date;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:967:SELECT closecallid,vcl.user,user_code,phone_number,vcl.status,length_in_sec,call_date,comments FROM vicidial_closer_log vcl,vicidial_users vu where lead_id=?/* $lead_id */ and call_date >= ?/* $TODAY 00:00:00 */ and call_date <= ?/* $ENDDAY 23:59:59 */ and vcl.user=vu.user order by call_date;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1001:SELECT count(*) from vtiger_crmentity vc,vtiger_salesorder vs where setype='SalesOrder' and accountid=?/* $crmid[$i] */ and createdtime >= ?/* $TODAY 00:00:00 */ and createdtime <= ?/* $ENDDAY 23:59:59 */ and vc.crmid=vs.salesorderid;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1015:SELECT website,phone,accountname,ownership,siccode from vtiger_account where accountid=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1037:SELECT status FROM vicidial_statuses where status_name=?/* $VCstatus */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1050:SELECT status FROM vicidial_campaign_statuses where status_name=?/* $VCstatus */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1064:SELECT salesorderid,total,duedate,smownerid,user_name from vtiger_salesorder vso, vtiger_crmentity vce, vtiger_users vu where accountid=?/* $crmid[$i] */ and createdtime >= ?/* $TODAY 00:00:00 */ and createdtime <= ?/* $ENDDAY 23:59:59 */ and vso.salesorderid=vce.crmid and vu.id=vce.smownerid order by duedate;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1099:SELECT accountname,ownership,siccode,annualrevenue,tickersymbol,phone,otherphone,fax,email1,website from vtiger_account where accountid=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1130:SELECT bill_city,bill_code,bill_country,bill_state,bill_street,bill_pobox from vtiger_accountbillads where accountaddressid=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1152:SELECT count(*) FROM vicidial_list where phone_number=?/* $phone */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1165:SELECT count(*) FROM vicidial_list where vendor_lead_code=?/* $crmid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1182:SELECT user_name from vtiger_users where id=?/* $smownerid[$i] */;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1204:UPDATE vicidial_list SET first_name=?/* $accountname */,last_name=?/* $ownership */,address1=?/* $bill_street */,address2=?/* $bill_pobox */,city=?/* $bill_city */,state=?/* $bill_state */,postal_code=?/* $bill_code */,country=?/* $bill_country */,vendor_lead_code=?/* $crmid[$i] */,address3=?/* $fax */,alt_phone=?/* $otherphone */,email=?/* $email1 */,province=?/* $website */,security_phrase=?/* $tickersymbol */,comments=?/* $siccode|$annualrevenue */ $vicidial_owner_updateSQL where phone_number=?/* $phone */ limit 1;
bin/Vtiger_OUT_sync2VICIDIAL_file.pl:1217:UPDATE vicidial_list SET first_name=?/* $accountname */,last_name=?/* $ownership */,address1=?/* $bill_street */,address2=?/* $bill_pobox */,city=?/* $bill_city */,state=?/* $bill_state */,postal_code=?/* $bill_code */,country_code=?/* $bill_country */,phone_number=?/* $phone */,address3=?/* $fax */,alt_phone=?/* $otherphone */,email=?/* $email1 */,province=?/* $website */,security_phrase=?/* $tickersymbol */,comments=?/* $siccode $annualrevenue */ $vicidial_owner_updateSQL where vendor_lead_code=?/* $crmid[$i] */ limit 1;
bin/ADMIN_bcrypt_convert.pl:195:SELECT pass_hash_enabled,pass_key,pass_cost FROM system_settings;
bin/ADMIN_bcrypt_convert.pl:236:SELECT user,pass,full_name from vicidial_users;
bin/ADMIN_bcrypt_convert.pl:297:UPDATE vicidial_users set pass_hash=?/* $only_pass_hash[$i] */ $passSQL where user=?/* $user[$i] */;
bin/ADMIN_bcrypt_convert.pl:313:UPDATE system_settings set pass_hash_enabled='1';
bin/AST_list_export.pl:244:SELECT lead_id,entry_date,modify_date,status,user,vendor_lead_code,source_id,list_id,gmt_offset_now,called_since_last_reset,phone_code,phone_number,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner,entry_list_id from vicidial_list where $listSQL;
bin/AST_list_export.pl:348:SELECT $custom_columns from custom_$entry_list_id where lead_id=$lead_id;
bin/AST_VDauto_dial.pl:261:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,vicidial_recording_limit,asterisk_version,routing_prefix FROM servers where server_ip = ?/* $server_ip */;
bin/AST_VDauto_dial.pl:305:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,outbound_autodial_active,queuemetrics_loginout,queuemetrics_addmember_enabled,queuemetrics_pause_type,enable_drop_lists,call_quota_lead_ranking,timeclock_end_of_day FROM system_settings;
bin/AST_VDauto_dial.pl:431:SELECT outbound_calls_per_second,vicidial_recording_limit FROM servers where server_ip=?/* $server_ip */;
bin/AST_VDauto_dial.pl:456:SELECT outbound_autodial_active,noanswer_log,alt_log_server_ip,alt_log_dbname,alt_log_login,alt_log_pass,tables_use_alt_log_db FROM system_settings;
bin/AST_VDauto_dial.pl:476:SELECT user,server_ip,campaign_id,conf_exten,status,callerid FROM vicidial_live_agents where status IN($active_agents) and outbound_autodial='Y' and server_ip=?/* $server_ip */ and last_update_time > ?/* $BDtsSQLdate */ order by last_call_time
bin/AST_VDauto_dial.pl:512:SELECT count(*) FROM vicidial_auto_calls where server_ip=?/* $server_ip */ and status IN('SENT','RINGING','LIVE','XFER','CLOSER','IVR');
bin/AST_VDauto_dial.pl:526:UPDATE vicidial_campaign_server_stats set local_trunk_shortage='0' where server_ip=?/* $server_ip */ and campaign_id NOT IN($user_campaignsSQL);
bin/AST_VDauto_dial.pl:552:SELECT count(*) FROM vicidial_auto_calls where callerid=?/* $DBlive_call_id[$user_counter] */;
bin/AST_VDauto_dial.pl:579:SELECT count(*) FROM vicidial_live_agents where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and server_ip=?/* $server_ip */ and status='READY';
bin/AST_VDauto_dial.pl:591:SELECT local_trunk_shortage FROM vicidial_campaign_server_stats where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and server_ip=?/* $server_ip */;
bin/AST_VDauto_dial.pl:606:INSERT INTO vicidial_campaign_server_stats SET local_trunk_shortage='0', server_ip=?/* $server_ip */,campaign_id=?/* $DBIPcampaign[$user_CIPct] */;
bin/AST_VDauto_dial.pl:620:SELECT dedicated_trunks FROM vicidial_server_trunks where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and server_ip=?/* $server_ip */ and trunk_restriction='MAXIMUM_LIMIT';
bin/AST_VDauto_dial.pl:633:SELECT sum(dedicated_trunks) FROM vicidial_server_trunks where campaign_id NOT IN(?/* $DBIPcampaign[$user_CIPct] */) and server_ip=?/* $server_ip */;
bin/AST_VDauto_dial.pl:651:SELECT auto_dial_level,local_call_time,dial_timeout,dial_prefix,campaign_cid,active,campaign_vdad_exten,closer_campaigns,omit_phone_code,available_only_ratio_tally,auto_alt_dial,campaign_allow_inbound,queue_priority,dial_method,use_custom_cid,inbound_queue_no_dial,available_only_tally_threshold,available_only_tally_threshold_agents,dial_level_threshold,dial_level_threshold_agents,adaptive_dl_diff_target,dl_diff_target_method,inbound_no_agents_no_dial_container,inbound_no_agents_no_dial_threshold,cid_group_id,scheduled_callbacks_auto_reschedule,call_quota_lead_ranking,dial_timeout_lead_container FROM vicidial_campaigns where campaign_id=?/* $DBIPcampaign[$user_CIPct] */
bin/AST_VDauto_dial.pl:696:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $DBIPdial_timeout_lead_container[$user_CIPct] */;
bin/AST_VDauto_dial.pl:782:SELECT count(*) FROM vicidial_auto_calls where server_ip=?/* $DBIPaddress[$user_CIPct] */ and campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and status IN('XFER','CLOSER');
bin/AST_VDauto_dial.pl:816:SELECT count(*) FROM vicidial_auto_calls where (call_type='IN' and campaign_id IN($DBIPclosercamp[$user_CIPct])) and server_ip=?/* $DBIPaddress[$user_CIPct] */ and status IN('SENT','RINGING','LIVE','XFER','CLOSER');
bin/AST_VDauto_dial.pl:827:SELECT count(*) FROM vicidial_auto_calls where (call_type='IN' and campaign_id IN($DBIPclosercamp[$user_CIPct])) and status IN('SENT','RINGING','LIVE','XFER','CLOSER');
bin/AST_VDauto_dial.pl:838:SELECT count(*) FROM vicidial_auto_calls where call_type='IN' and campaign_id IN($DBIPclosercamp[$user_CIPct]) and status IN('LIVE');
bin/AST_VDauto_dial.pl:849:SELECT count(*) FROM vicidial_live_chats where group_id IN($DBIPclosercamp[$user_CIPct]) and status IN('WAITING');
bin/AST_VDauto_dial.pl:860:SELECT count(*) FROM vicidial_inbound_callback_queue where icbq_status IN('LIVE','SENDING','NEW') and group_id IN($DBIPclosercamp[$user_CIPct]);
bin/AST_VDauto_dial.pl:889:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $DBIPinbound_no_agents_no_dial[$user_CIPct] */;
bin/AST_VDauto_dial.pl:910:SELECT distinct(user) FROM vicidial_live_inbound_agents where group_id IN(?/* $DBIPinand_container_entry[$user_CIPct] */);
bin/AST_VDauto_dial.pl:928:SELECT count(*) FROM vicidial_live_agents where user IN($DBIPinand_users[$user_CIPct]) and status IN('READY','CLOSER');
bin/AST_VDauto_dial.pl:952:SELECT count(*) FROM vicidial_auto_calls where (campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and call_type IN('OUT','OUTBALANCE')) and server_ip=?/* $DBIPaddress[$user_CIPct] */ and status IN('SENT','RINGING','LIVE','XFER','CLOSER');
bin/AST_VDauto_dial.pl:1037:SELECT count(*),status from vicidial_live_agents where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and last_update_time > ?/* $halfminSQLdate */ group by status;
bin/AST_VDauto_dial.pl:1055:SELECT count(*) FROM vicidial_auto_calls where (call_type='IN' and campaign_id IN($DBIPclosercamp[$user_CIPct])) and status IN('LIVE');
bin/AST_VDauto_dial.pl:1069:SELECT count(*) FROM vicidial_auto_calls where (campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and call_type IN('OUT','OUTBALANCE')) and status IN('LIVE');
bin/AST_VDauto_dial.pl:1128:UPDATE vicidial_campaign_stats SET differential_onemin=?/* $stat_differential */, agents_average_onemin=?/* $total_agents_avg */ where campaign_id=?/* $DBIPcampaign[$user_CIPct] */;
bin/AST_VDauto_dial.pl:1155:UPDATE vicidial_campaign_server_stats SET local_trunk_shortage=?/* $DBIPtrunk_shortage[$user_CIPct] */,update_time=?/* $now_date */ where server_ip=?/* $server_ip */ and campaign_id=?/* $DBIPcampaign[$user_CIPct] */;
bin/AST_VDauto_dial.pl:1160:UPDATE vicidial_campaign_server_stats SET update_time=?/* $now_date */ where server_ip=?/* $server_ip */ and campaign_id=?/* $DBIPcampaign[$user_CIPct] */;
bin/AST_VDauto_dial.pl:1168:INSERT IGNORE INTO vicidial_campaign_stats_debug SET server_ip=?/* $server_ip */,campaign_id=?/* $DBIPcampaign[$user_CIPct] */,entry_time=?/* $now_date */,debug_output=?/* $debug_string */ ON DUPLICATE KEY UPDATE entry_time=?/* $now_date */,debug_output=?/* $debug_string */;
bin/AST_VDauto_dial.pl:1211:UPDATE vicidial_hopper set status='QUEUE', user='VDAD_$server_ip' where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and status='READY' order by priority desc,hopper_id LIMIT $DBIPmakecalls[$user_CIPct]
bin/AST_VDauto_dial.pl:1221:SELECT lead_id,alt_dial,source FROM vicidial_hopper where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and status='QUEUE' and user='VDAD_$server_ip' order by priority desc,hopper_id LIMIT 1
bin/AST_VDauto_dial.pl:1251:UPDATE vicidial_hopper set status='INCALL' where lead_id=?/* $lead_id */
bin/AST_VDauto_dial.pl:1257:SELECT list_id,gmt_offset_now,called_since_last_reset,phone_code,phone_number,address3,alt_phone,called_count,security_phrase,state,vendor_lead_code,source_id,title,first_name,middle_initial,last_name,address1,address2,city,province,postal_code,country_code,date_of_birth,email,comments,rank,owner FROM vicidial_list where lead_id=?/* $lead_id */;
bin/AST_VDauto_dial.pl:1303:SELECT campaign_cid_override FROM vicidial_lists where list_id=?/* $list_id */;
bin/AST_VDauto_dial.pl:1356:SELECT phone_code,phone_number FROM vicidial_list_alt_phones where lead_id=?/* $lead_id */ order by alt_phone_count desc limit 1;
bin/AST_VDauto_dial.pl:1362:SELECT phone_code,phone_number FROM vicidial_list_alt_phones where lead_id=?/* $lead_id */ and alt_phone_count=?/* $Talt_dial */;
bin/AST_VDauto_dial.pl:1377:UPDATE vicidial_list set called_since_last_reset=?/* $CSLR */,called_count=?/* $called_count */,user='VDAD',last_local_call_time=?/* $LLCT_DATE */ where lead_id=?/* $lead_id */
bin/AST_VDauto_dial.pl:1381:UPDATE vicidial_list set called_since_last_reset=?/* $CSLR */, called_count=?/* $called_count */,user='VDAD',last_local_call_time=?/* $LLCT_DATE */ where lead_id=?/* $lead_id */
bin/AST_VDauto_dial.pl:1392:SELECT callback_id,callback_time,lead_status,list_id FROM vicidial_callbacks where lead_id=?/* $lead_id */ and status='LIVE' and recipient='ANYONE' order by callback_id limit 1;
bin/AST_VDauto_dial.pl:1408:INSERT INTO vicidial_recent_ascb_calls SET call_date=?/* $SQLdate */,callback_date=?/* $PSCBcallback_time */,callback_id=?/* $PSCBcallback_id */,caller_code=?/* $VqueryCID */,lead_id=?/* $lead_id */,server_ip=?/* $DBIPaddress[$user_CIPct] */,orig_status=?/* $PSCBlead_status */,reschedule=?/* $DBIPscheduled_callbacks_auto_reschedule[$user_CIPct] */,list_id=?/* $PSCBlist_id */,rescheduled='U';
bin/AST_VDauto_dial.pl:1510:DELETE FROM vicidial_hopper where lead_id=?/* $lead_id */
bin/AST_VDauto_dial.pl:1545:SELECT cid_group_type FROM vicidial_cid_groups where cid_group_id=?/* $DBIPcid_group_id[$user_CIPct] */;
bin/AST_VDauto_dial.pl:1563:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBIPcid_group_id[$user_CIPct] */ and areacode IN(?/* $temp_ac_two */,?/* $temp_ac_three */,?/* $temp_ac_four */,?/* $temp_ac_five */) and active='Y' order by CAST(areacode as SIGNED INTEGER) asc, call_count_today desc limit 100000;
bin/AST_VDauto_dial.pl:1568:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBIPcid_group_id[$user_CIPct] */ and areacode IN(?/* $temp_state */) and active='Y' order by call_count_today desc limit 100000;
bin/AST_VDauto_dial.pl:1572:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBIPcid_group_id[$user_CIPct] */ and active='Y' order by call_count_today desc limit 100000;
bin/AST_VDauto_dial.pl:1588:UPDATE vicidial_campaign_cid_areacodes set call_count_today=(call_count_today + 1) where campaign_id=?/* $DBIPcid_group_id[$user_CIPct] */ and areacode=?/* $temp_ac */ and outbound_cid=?/* $temp_vcca */;
bin/AST_VDauto_dial.pl:1593:UPDATE vicidial_cid_groups set cid_auto_rotate_calls=(cid_auto_rotate_calls + 1) where cid_group_id=?/* $DBIPcid_group_id[$user_CIPct] */;
bin/AST_VDauto_dial.pl:1614:SELECT outbound_cid,areacode FROM vicidial_campaign_cid_areacodes where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and areacode IN(?/* $temp_ac_two */,?/* $temp_ac_three */,?/* $temp_ac_four */,?/* $temp_ac_five */) and active='Y' order by CAST(areacode as SIGNED INTEGER) asc, call_count_today desc limit 100000;
bin/AST_VDauto_dial.pl:1629:UPDATE vicidial_campaign_cid_areacodes set call_count_today=(call_count_today + 1) where campaign_id=?/* $DBIPcampaign[$user_CIPct] */ and areacode=?/* $temp_ac */ and outbound_cid=?/* $temp_vcca */;
bin/AST_VDauto_dial.pl:1667:INSERT INTO vicidial_manager values('','',?/* $SQLdate */,'NEW','N',?/* $DBIPaddress[$user_CIPct] */,'','Originate',?/* $VqueryCID */,'Exten: $VDAD_dial_exten','Context: $ext_context','Channel: $local_DEF$Ndialstring$local_AMP$ext_context','Priority: 1','Callerid: $CIDstring','Timeout: $Local_dial_timeout','','','','VDACnote: $DBIPcampaign[$user_CIPct]|$lead_id|$phone_code|$phone_number|OUT|$alt_dial|$DBIPqueue_priority[$user_CIPct]')
bin/AST_VDauto_dial.pl:1671:INSERT INTO vicidial_auto_calls (server_ip,campaign_id,status,lead_id,callerid,phone_code,phone_number,call_time,call_type,alt_dial,queue_priority,last_update_time) values(?/* $DBIPaddress[$user_CIPct] */,?/* $DBIPcampaign[$user_CIPct] */,'SENT',?/* $lead_id */,?/* $VqueryCID */,?/* $phone_code */,?/* $phone_number */,?/* $SQLdate */,'OUT',?/* $alt_dial */,?/* $DBIPqueue_priority[$user_CIPct] */,?/* $SQLdate */)
bin/AST_VDauto_dial.pl:1675:INSERT INTO vicidial_dial_log SET caller_code=?/* $VqueryCID */,lead_id=?/* $lead_id */,server_ip=?/* $DBIPaddress[$user_CIPct] */,call_date=?/* $SQLdate */,extension=?/* $VDAD_dial_exten */,channel=?/* $local_DEF$Ndialstring$local_AMP$ext_context */,timeout=?/* $Local_dial_timeout */,outbound_cid=?/* $CIDstring */,context=?/* $ext_context */;
bin/AST_VDauto_dial.pl:1696:UPDATE vicidial_campaigns SET campaign_calldate=?/* $now_date */ where campaign_id=?/* $DBIPcampaign[$user_CIPct] */;
bin/AST_VDauto_dial.pl:1723:SELECT callerid,server_ip,channel,uniqueid,status,call_time FROM vicidial_auto_calls where server_ip=?/* $server_ip */ order by call_time;
bin/AST_VDauto_dial.pl:1755:SELECT end_epoch,uniqueid,start_epoch FROM call_log where caller_code=?/* $KLcallerid[$kill_vac] */ and server_ip=?/* $KLserver_ip[$kill_vac] */ order by end_epoch, start_time desc limit 1;
bin/AST_VDauto_dial.pl:1774:SELECT end_epoch,uniqueid,start_epoch FROM call_log where uniqueid=?/* $KLuniqueid[$kill_vac] */ and server_ip=?/* $KLserver_ip[$kill_vac] */ order by end_epoch, start_time desc limit 1;
bin/AST_VDauto_dial.pl:1795:SELECT count(*) from parked_channels where channel_group=?/* $KLcallerid[$kill_vac] */;
bin/AST_VDauto_dial.pl:1809:SELECT auto_call_id,lead_id,phone_number,status,campaign_id,phone_code,alt_dial,stage,call_type,UTC_TIMESTAMP(last_update_time) FROM vicidial_auto_calls where callerid=?/* $KLcallerid[$kill_vac] */;
bin/AST_VDauto_dial.pl:1832:SELECT user FROM vicidial_live_agents where callerid=?/* $KLcallerid[$kill_vac] */
bin/AST_VDauto_dial.pl:1852:SELECT drop_call_seconds FROM vicidial_inbound_groups where group_id=?/* $CLcampaign_id */;
bin/AST_VDauto_dial.pl:1857:SELECT dial_timeout,drop_call_seconds FROM vicidial_campaigns where campaign_id=?/* $CLcampaign_id */;
bin/AST_VDauto_dial.pl:1888:DELETE from vicidial_auto_calls where auto_call_id=?/* $auto_call_id */
bin/AST_VDauto_dial.pl:1891:UPDATE vicidial_live_agents set ring_callerid='' where ring_callerid=?/* $KLcallerid[$kill_vac] */;
bin/AST_VDauto_dial.pl:1916:SELECT count(*) from vicidial_log where lead_id=?/* $CLlead_id */ and user=?/* $CLuser */ and phone_number=?/* $CLphone_number */ and uniqueid LIKE \"$beginUNIQUEID%\
bin/AST_VDauto_dial.pl:1932:SELECT result FROM vicidial_cpd_log where callerid=?/* $KLcallerid[$kill_vac] */ order by cpd_id desc limit 1;
bin/AST_VDauto_dial.pl:1969:SELECT list_id,called_count from vicidial_list where lead_id=?/* $CLlead_id */ limit 1;
bin/AST_VDauto_dial.pl:1982:INSERT INTO vicidial_log (uniqueid,lead_id,campaign_id,call_date,start_epoch,status,phone_code,phone_number,user,processed,length_in_sec,end_epoch,alt_dial,list_id,called_count) values(?/* $CLuniqueid */,?/* $CLlead_id */,?/* $CLcampaign_id */,?/* $SQLdate */,?/* $now_date_epoch */,?/* $CLnew_status */,?/* $CLphone_code */,?/* $CLphone_number */,?/* $insertVLuser */,'N',?/* $CLstage */,?/* $end_epoch */,?/* $CLalt_dial */,?/* $xCLlist_id */,?/* $called_count */)
bin/AST_VDauto_dial.pl:1986:INSERT INTO vicidial_log_extended set uniqueid=?/* $CLuniqueid */,server_ip=?/* $server_ip */,call_date=?/* $SQLdate */,lead_id = ?/* $CLlead_id */,caller_code=?/* $KLcallerid[$kill_vac] */,custom_call_id='';
bin/AST_VDauto_dial.pl:1991:INSERT IGNORE INTO vicidial_drop_log SET uniqueid=?/* $CLuniqueid */,server_ip=?/* $server_ip */,drop_date=NOW(),lead_id=?/* $CLlead_id */,campaign_id=?/* $CLcampaign_id */,status='DROP',phone_code=?/* $CLphone_code */,phone_number=?/* $CLphone_number */;
bin/AST_VDauto_dial.pl:2002:UPDATE vicidial_log SET status=?/* $CLnew_status */,length_in_sec=?/* $CLstage */,end_epoch=?/* $end_epoch */,alt_dial=?/* $CLalt_dial */ where lead_id=?/* $CLlead_id */ and user=?/* $CLuser */ and phone_number=?/* $CLphone_number */ and uniqueid LIKE \"$beginUNIQUEID%\
bin/AST_VDauto_dial.pl:2013:UPDATE vicidial_list set status=?/* $CLnew_status */ where lead_id=?/* $CLlead_id */
bin/AST_VDauto_dial.pl:2082:SELECT queue_position,call_date FROM vicidial_closer_log where lead_id=?/* $CLlead_id */ and campaign_id=?/* $CLcampaign_id */ and call_date > ?/* $RSQLdate */ order by closecallid desc limit 1;
bin/AST_VDauto_dial.pl:2096:SELECT count(*) FROM vicidial_auto_calls where status = 'LIVE' and campaign_id=?/* $CLcampaign_id */ and call_time < ?/* $VCLcall_date */;
bin/AST_VDauto_dial.pl:2107:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $KLcallerid[$kill_vac] */,queue=?/* $CLcampaign_id */,agent='NONE',verb='ABANDON',data1=?/* $current_position */,data2=?/* $queue_position */,data3=?/* $CLstage */,serverid=?/* $queuemetrics_log_id */;
bin/AST_VDauto_dial.pl:2117:SELECT auto_alt_dial,auto_alt_dial_statuses,use_internal_dnc,use_campaign_dnc,use_other_campaign_dnc,call_quota_lead_ranking FROM vicidial_campaigns where campaign_id=?/* $CLcampaign_id */;
bin/AST_VDauto_dial.pl:2138:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $VD_call_quota_lead_ranking */;
bin/AST_VDauto_dial.pl:2288:SELECT list_id,called_count,rank FROM vicidial_list where lead_id=?/* $CLlead_id */;
bin/AST_VDauto_dial.pl:2317:SELECT call_date from vicidial_dial_log where lead_id=?/* $CLlead_id */ and call_date > ?/* $CQSQLdate */ and caller_code LIKE \"%$CLlead_id\" order by call_date desc limit 1;
bin/AST_VDauto_dial.pl:2386:SELECT first_call_date,UTC_TIMESTAMP(first_call_date),last_call_date from vicidial_lead_call_quota_counts where lead_id=?/* $CLlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDauto_dial.pl:2415:UPDATE vicidial_lead_call_quota_counts SET last_call_date=?/* $VDLcall_datetime */,status=?/* $CLnew_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() $session_updateSQL $day_updateSQL where lead_id=?/* $CLlead_id */ and list_id=?/* $VLlist_id */ and modify_date < NOW();
bin/AST_VDauto_dial.pl:2420:UPDATE vicidial_lead_call_quota_counts SET status=?/* $CLnew_status */,called_count=?/* $VLcalled_count */,rank=?/* $tempVLrank */,modify_date=NOW() where lead_id=?/* $CLlead_id */ and list_id=?/* $VLlist_id */;
bin/AST_VDauto_dial.pl:2428:INSERT INTO vicidial_lead_call_quota_counts SET lead_id=?/* $CLlead_id */,list_id=?/* $VLlist_id */,first_call_date=?/* $VDLcall_datetime */,last_call_date=?/* $VDLcall_datetime */,status=?/* $CLnew_status */,called_count=?/* $VLcalled_count */,day_one_calls='1',rank=?/* $tempVLrank */,modify_date=NOW() $session_newSQL;
bin/AST_VDauto_dial.pl:2436:UPDATE vicidial_list SET rank='0' where lead_id=?/* $CLlead_id */;
bin/AST_VDauto_dial.pl:2457:SELECT alt_phone,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $CLlead_id */;
bin/AST_VDauto_dial.pl:2480:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_alt_phone */,?/* $alt_areacode */);
bin/AST_VDauto_dial.pl:2483:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_alt_phone */;
bin/AST_VDauto_dial.pl:2504:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_alt_phone */,?/* $alt_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDauto_dial.pl:2507:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_alt_phone */ and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDauto_dial.pl:2521:INSERT INTO vicidial_hopper SET lead_id=?/* $CLlead_id */,campaign_id=?/* $CLcampaign_id */,status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='ALT',user='',priority='25',source='A';
bin/AST_VDauto_dial.pl:2537:SELECT address3,gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $CLlead_id */;
bin/AST_VDauto_dial.pl:2560:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_address3 */,?/* $addr3_areacode */);
bin/AST_VDauto_dial.pl:2563:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_address3 */;
bin/AST_VDauto_dial.pl:2584:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_address3 */,?/* $addr3_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDauto_dial.pl:2587:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_address3 */ and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDauto_dial.pl:2601:INSERT INTO vicidial_hopper SET lead_id=?/* $CLlead_id */,campaign_id=?/* $CLcampaign_id */,status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='ADDR3',user='',priority='20',source='A';
bin/AST_VDauto_dial.pl:2622:SELECT gmt_offset_now,state,list_id FROM vicidial_list where lead_id=?/* $CLlead_id */;
bin/AST_VDauto_dial.pl:2636:SELECT count(*) FROM vicidial_list_alt_phones where lead_id=?/* $CLlead_id */;
bin/AST_VDauto_dial.pl:2651:SELECT alt_phone_id,phone_number,active FROM vicidial_list_alt_phones where lead_id=?/* $CLlead_id */ and alt_phone_count=?/* $Xlast */;
bin/AST_VDauto_dial.pl:2677:SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* $VD_altdial_phone */,?/* $ad_areacode */);
bin/AST_VDauto_dial.pl:2680:SELECT count(*) FROM vicidial_dnc where phone_number=?/* $VD_altdial_phone */;
bin/AST_VDauto_dial.pl:2702:SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* $VD_altdial_phone */,?/* $ad_areacode */) and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDauto_dial.pl:2705:SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* $VD_altdial_phone */ and campaign_id=?/* $temp_campaign_id */;
bin/AST_VDauto_dial.pl:2722:INSERT INTO vicidial_hopper SET lead_id=?/* $CLlead_id */,campaign_id=?/* $CLcampaign_id */,status='READY',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='X$Xlast',user='',priority='15',source='A';
bin/AST_VDauto_dial.pl:2733:INSERT INTO vicidial_hopper SET lead_id=?/* $CLlead_id */,campaign_id=?/* $CLcampaign_id */,status='DNC',list_id=?/* $VD_list_id */,gmt_offset_now=?/* $VD_gmt_offset_now */,state=?/* $VD_state */,alt_dial='X$Xlast',user='',priority='15',source='A';
bin/AST_VDauto_dial.pl:2757:DELETE from vicidial_auto_calls where auto_call_id=?/* $auto_call_id */
bin/AST_VDauto_dial.pl:2760:UPDATE vicidial_live_agents set ring_callerid='' where ring_callerid=?/* $KLcallerid[$kill_vac] */;
bin/AST_VDauto_dial.pl:2788:SELECT count(*) FROM vicidial_live_agents where server_ip=?/* $server_ip */ and last_update_time < ?/* $PDtsSQLdate */ and status NOT IN('PAUSED');
bin/AST_VDauto_dial.pl:2802:SELECT agent_log_id,user,server_ip,campaign_id,last_update_time from vicidial_live_agents where server_ip=?/* $server_ip */ and last_update_time < ?/* $PDtsSQLdate */ and status NOT IN('PAUSED');
bin/AST_VDauto_dial.pl:2823:UPDATE vicidial_agent_log set sub_status='LAGGED',pause_type='SYSTEM' where agent_log_id=?/* $LAGagent_log_id[$lagged_ids] */;
bin/AST_VDauto_dial.pl:2826:SELECT user_group from vicidial_users where user=?/* $LAGuser[$lagged_ids] */ limit 1;
bin/AST_VDauto_dial.pl:2837:INSERT INTO vicidial_agent_log set event_time=?/* $now_date */,server_ip=?/* $LAGserver_ip[$lagged_ids] */,campaign_id=?/* $LAGcampaign_id[$lagged_ids] */,user_group=?/* $LAGuser_group[$lagged_ids] */,user=?/* $LAGuser[$lagged_ids] */,pause_epoch=?/* $secX */,pause_sec='0',wait_epoch=?/* $secX */,pause_type='SYSTEM';
bin/AST_VDauto_dial.pl:2850:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id='NONE',queue='NONE',agent='Agent/$LAGuser[$lagged_ids]',verb='PAUSEREASON',serverid=?/* $queuemetrics_log_id */,data1='LAGGED'$pause_typeSQL;
bin/AST_VDauto_dial.pl:2859:UPDATE vicidial_live_agents set status='PAUSED',random_id='10' where server_ip=?/* $server_ip */ and last_update_time < ?/* $PDtsSQLdate */ and status NOT IN('PAUSED');
bin/AST_VDauto_dial.pl:2869:SELECT user,campaign_id,last_update_time,extension FROM vicidial_live_agents where server_ip=?/* $server_ip */ and status='PAUSED' and random_id='10' order by last_update_time desc limit $affected_rows
bin/AST_VDauto_dial.pl:2890:SELECT user_group FROM vicidial_users where user=?/* $VALOuser[$logrun] */;
bin/AST_VDauto_dial.pl:2902:INSERT INTO vicidial_user_log (user,event,campaign_id,event_date,event_epoch,user_group) values(?/* $VALOuser[$logrun] */,'LOGOUT',?/* $VALOcampaign[$logrun] */,?/* $SQLdate */,?/* $now_date_epoch */,?/* $VALOuser_group */);
bin/AST_VDauto_dial.pl:2923:SELECT time_id,data1,data4 FROM queue_log where agent='Agent/$VALOuser[$logrun]' and verb IN('AGENTLOGIN','AGENTCALLBACKLOGIN') and time_id > $check_time order by time_id desc limit 1;
bin/AST_VDauto_dial.pl:2941:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $LOGOFFtime */,call_id='NONE',queue='NONE',agent='Agent/$VALOuser[$logrun]',verb=?/* $QM_LOGOFF */,serverid=?/* $queuemetrics_log_id */,data1=?/* $phone_logged_in */,data2=?/* $time_logged_in */,data4=?/* $data4 */;
bin/AST_VDauto_dial.pl:2949:SELECT time_id,data3,data4 FROM queue_log where agent='Agent/$VALOuser[$logrun]' and verb='PAUSEREASON' and data1='LOGIN' order by time_id desc limit 1;
bin/AST_VDauto_dial.pl:2972:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $LOGOFFtime */,call_id='NONE',queue='NONE',agent='Agent/$VALOuser[$logrun]',verb='PAUSEREASON',serverid=?/* $queuemetrics_log_id */,data1='LOGOFF'$pause_typeSQL;
bin/AST_VDauto_dial.pl:2975:SELECT distinct queue FROM queue_log where time_id >= $RAWtime_logged_in and agent='Agent/$VALOuser[$logrun]' and verb IN('ADDMEMBER','ADDMEMBER2') and queue != ?/* $VALOcampaign[$logrun] */ order by time_id desc;
bin/AST_VDauto_dial.pl:2995:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $LOGOFFtime */,call_id='NONE',queue=?/* $AM_queue[$rec_count] */,agent='Agent/$VALOuser[$logrun]',verb='REMOVEMEMBER',data1=?/* $phone_logged_in */,serverid=?/* $queuemetrics_log_id */,data4=?/* $data4 */;
bin/AST_VDauto_dial.pl:3014:SELECT status,lead_id,last_update_time FROM vicidial_auto_calls where server_ip=?/* $server_ip */ and call_time < ?/* $XDSQLdate */ and status NOT IN('XFER','CLOSER','LIVE','IVR');
bin/AST_VDauto_dial.pl:3030:DELETE FROM vicidial_auto_calls where server_ip=?/* $server_ip */ and call_time < ?/* $XDSQLdate */ and status NOT IN('XFER','CLOSER','LIVE','IVR');
bin/AST_VDauto_dial.pl:3043:SELECT auto_call_id,server_ip,campaign_id,status,lead_id,uniqueid,callerid,channel,phone_code,phone_number,call_time,call_type,stage,last_update_time,alt_dial,queue_priority,agent_only,agent_grab FROM vicidial_auto_calls where server_ip=?/* $server_ip */ and last_update_time < ?/* $BDtsSQLdate */ and status IN('LIVE');
bin/AST_VDauto_dial.pl:3059:SELECT auto_call_id,lead_id,phone_number,status,campaign_id,phone_code,alt_dial,stage,callerid,uniqueid from vicidial_auto_calls where server_ip=?/* $server_ip */ and last_update_time < ?/* $BDtsSQLdate */ and status IN('LIVE','IVR');
bin/AST_VDauto_dial.pl:3085:DELETE from vicidial_auto_calls where auto_call_id=?/* $auto_call_id */;
bin/AST_VDauto_dial.pl:3088:UPDATE vicidial_live_agents set ring_callerid='' where ring_callerid=?/* $CLcallerid */;
bin/AST_VDauto_dial.pl:3098:SELECT list_id,called_count from vicidial_list where lead_id=?/* $CLlead_id */ limit 1;
bin/AST_VDauto_dial.pl:3118:INSERT INTO vicidial_log (uniqueid,lead_id,campaign_id,call_date,start_epoch,status,phone_code,phone_number,user,processed,length_in_sec,end_epoch,alt_dial,list_id,called_count) values(?/* $CLuniqueid */,?/* $CLlead_id */,?/* $CLcampaign_id */,?/* $SQLdate */,?/* $now_date_epoch */,'DROP',?/* $CLphone_code */,?/* $CLphone_number */,'VDAD','N',?/* $CLstage */,?/* $end_epoch */,?/* $CLalt_dial */,?/* $xCLlist_id */,?/* $called_count */)
bin/AST_VDauto_dial.pl:3122:INSERT INTO vicidial_log_extended set uniqueid=?/* $CLuniqueid */,server_ip=?/* $server_ip */,call_date=?/* $SQLdate */,lead_id = ?/* $CLlead_id */,caller_code=?/* $CLcallerid */,custom_call_id='';
bin/AST_VDauto_dial.pl:3127:INSERT IGNORE INTO vicidial_drop_log SET uniqueid=?/* $CLuniqueid */,server_ip=?/* $server_ip */,drop_date=NOW(),lead_id=?/* $CLlead_id */,campaign_id=?/* $CLcampaign_id */,status='DROP',phone_code=?/* $CLphone_code */,phone_number=?/* $CLphone_number */;
bin/AST_VDauto_dial.pl:3157:SELECT queue_position,call_date FROM vicidial_closer_log where lead_id=?/* $CLlead_id */ and campaign_id=?/* $CLcampaign_id */ and call_date > ?/* $RSQLdate */ order by closecallid desc limit 1;
bin/AST_VDauto_dial.pl:3171:SELECT count(*) FROM vicidial_auto_calls where status = 'LIVE' and campaign_id=?/* $CLcampaign_id */ and call_time < ?/* $VCLcall_date */;
bin/AST_VDauto_dial.pl:3182:INSERT INTO queue_log SET `partition`='P01',time_id=?/* $secX */,call_id=?/* $CLcallerid */,queue=?/* $CLcampaign_id */,agent='NONE',verb='ABANDON',data1=?/* $current_position */,data2=?/* $queue_position */,data3=?/* $CLstage */,serverid=?/* $queuemetrics_log_id */;
bin/AST_VDauto_dial.pl:3198:UPDATE vicidial_lists SET list_lastcalldate=?/* $SQLdate */ where list_id IN($lists_update);
bin/AST_VDauto_dial.pl:3207:UPDATE vicidial_campaigns SET campaign_logindate=?/* $SQLdate */ where campaign_id IN($campaigns_update);
bin/AST_VDauto_dial.pl:3224:SELECT count(*) FROM vicidial_campaigns where auto_alt_dial='MULTI_LEAD' and dial_method NOT IN('MANUAL','INBOUND_MAN') and campaign_calldate > \"$MCDSQLdate\
bin/AST_VDauto_dial.pl:3242:SELECT campaign_id,auto_alt_dial_statuses FROM vicidial_campaigns where auto_alt_dial='MULTI_LEAD' and dial_method NOT IN('MANUAL','INBOUND_MAN') and campaign_calldate > \"$MCDSQLdate\
bin/AST_VDauto_dial.pl:3261:SELECT list_id FROM vicidial_lists where campaign_id=?/* $MLcamp_id[$MLcamp_count] */;
bin/AST_VDauto_dial.pl:3290:SELECT uniqueid,lead_id,call_date,caller_code FROM vicidial_log_extended where server_ip=?/* $server_ip */ and call_date > ?/* $MCDSQLdate */ and multi_alt_processed='N' order by call_date,lead_id limit 100000;
bin/AST_VDauto_dial.pl:3322:SELECT count(*) FROM vicidial_auto_calls where callerid=?/* $MLcallerid[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3335:SELECT campaign_id,status FROM vicidial_log where uniqueid=?/* $MLuniqueid[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */ and call_date > \"$MCDSQLdate\
bin/AST_VDauto_dial.pl:3372:SELECT vendor_lead_code FROM vicidial_list where lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3385:SELECT lead_id,status FROM vicidial_list where vendor_lead_code=?/* $MLvlc[$vle_count] */ and list_id IN($MLlists_value) and lead_id!=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3408:UPDATE vicidial_list SET status='MLINAT' where lead_id IN($MLnonmatch_leadids);
bin/AST_VDauto_dial.pl:3411:DELETE FROM vicidial_hopper where lead_id IN($MLnonmatch_leadids);
bin/AST_VDauto_dial.pl:3419:UPDATE vicidial_log_extended SET multi_alt_processed='Y' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3428:UPDATE vicidial_log_extended SET multi_alt_processed='Y' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3438:UPDATE vicidial_log_extended SET multi_alt_processed='Y' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3454:UPDATE vicidial_log_extended SET multi_alt_processed='U' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3474:UPDATE vicidial_log_extended SET multi_alt_processed='U' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3490:SELECT count(*) FROM vicidial_campaigns where na_call_url IS NOT NULL and na_call_url!='' and campaign_calldate > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3501:SELECT count(*) FROM vicidial_inbound_groups where na_call_url IS NOT NULL and na_call_url!='' and group_calldate > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3512:SELECT count(*) FROM vicidial_lists where na_call_url IS NOT NULL and na_call_url!='' and list_lastcalldate > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3532:SELECT campaign_id,na_call_url FROM vicidial_campaigns where na_call_url IS NOT NULL and na_call_url!='' and campaign_calldate > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3550:SELECT group_id,na_call_url FROM vicidial_inbound_groups where na_call_url IS NOT NULL and na_call_url!='' and group_calldate > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3568:SELECT list_id,na_call_url FROM vicidial_lists where na_call_url IS NOT NULL and na_call_url!='' and list_lastcalldate > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3598:SELECT uniqueid,lead_id,call_date,caller_code FROM vicidial_log_extended where server_ip=?/* $server_ip */ and call_date > ?/* $RMSQLdate */ and dispo_url_processed='N' order by call_date,lead_id limit 100000;
bin/AST_VDauto_dial.pl:3626:SELECT count(*) FROM vicidial_auto_calls where callerid=?/* $NCUcallerid[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3641:SELECT campaign_id,status,user,phone_number,'MAIN',list_id FROM vicidial_closer_log where uniqueid=?/* $NCUuniqueid[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */ and call_date=?/* $NCUcalldate[$vle_count] */ order by closecallid desc;
bin/AST_VDauto_dial.pl:3646:SELECT campaign_id,status,user,phone_number,alt_dial,list_id FROM vicidial_log where uniqueid=?/* $NCUuniqueid[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */ and call_date > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3687:UPDATE vicidial_log_extended SET dispo_url_processed='XY' where uniqueid=?/* $NCUuniqueid[$vle_count] */ and call_date=?/* $NCUcalldate[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3711:UPDATE vicidial_log_extended SET dispo_url_processed='XY' where uniqueid=?/* $NCUuniqueid[$vle_count] */ and call_date=?/* $NCUcalldate[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3721:UPDATE vicidial_log_extended SET dispo_url_processed='XY' where uniqueid=?/* $NCUuniqueid[$vle_count] */ and call_date=?/* $NCUcalldate[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3737:UPDATE vicidial_log_extended SET dispo_url_processed='XU' where uniqueid=?/* $NCUuniqueid[$vle_count] */ and call_date=?/* $NCUcalldate[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3757:UPDATE vicidial_log_extended SET dispo_url_processed='XU' where uniqueid=?/* $NCUuniqueid[$vle_count] */ and call_date=?/* $NCUcalldate[$vle_count] */ and lead_id=?/* $NCUleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3789:SELECT uniqueid,lead_id,call_date,caller_code FROM vicidial_log_extended where server_ip=?/* $server_ip */ and call_date > ?/* $RMSQLdate */ and noanswer_processed='N' order by call_date,lead_id limit 100000;
bin/AST_VDauto_dial.pl:3821:SELECT count(*) FROM vicidial_auto_calls where callerid=?/* $MLcallerid[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3833:SELECT status FROM vicidial_log where uniqueid=?/* $MLuniqueid[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */ and call_date > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3849:SELECT uniqueid,lead_id,list_id,campaign_id,call_date,start_epoch,end_epoch,length_in_sec,status,phone_code,phone_number,user,comments,processed,user_group,term_reason,alt_dial FROM vicidial_log where uniqueid=?/* $MLuniqueid[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */ and call_date > \"$RMSQLdate\
bin/AST_VDauto_dial.pl:3862:INSERT INTO vicidial_log_noanswer SET uniqueid=?/* $aryA[0] */,lead_id=?/* $aryA[1] */,list_id=?/* $aryA[2] */,campaign_id=?/* $aryA[3] */,call_date=?/* $aryA[4] */,start_epoch=?/* $aryA[5] */,end_epoch=?/* $aryA[6] */,length_in_sec=?/* $aryA[7] */,status=?/* $aryA[8] */,phone_code=?/* $aryA[9] */,phone_number=?/* $aryA[10] */,user=?/* $aryA[11] */,comments=?/* $aryA[12] */,processed=?/* $aryA[13] */,user_group=?/* $aryA[14] */,term_reason=?/* $aryA[15] */,alt_dial=?/* $aryA[16] */,caller_code=?/* $MLcallerid[$vle_count] */;
bin/AST_VDauto_dial.pl:3877:INSERT INTO vicidial_log_noanswer SELECT uniqueid,lead_id,list_id,campaign_id,call_date,start_epoch,end_epoch,length_in_sec,status,phone_code,phone_number,user,comments,processed,user_group,term_reason,alt_dial,?/* $MLcallerid[$vle_count] */ from vicidial_log where uniqueid=?/* $MLuniqueid[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */ LIMIT 1;
bin/AST_VDauto_dial.pl:3882:UPDATE vicidial_log_extended SET noanswer_processed='Y' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3891:UPDATE vicidial_log_extended SET noanswer_processed='U' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3920:UPDATE vicidial_log_extended SET noanswer_processed='U' where uniqueid=?/* $MLuniqueid[$vle_count] */ and call_date=?/* $MLcalldate[$vle_count] */ and lead_id=?/* $MLleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:3936:SELECT count(*) FROM vicidial_campaigns where scheduled_callbacks_auto_reschedule!='DISABLED' and campaign_calldate > \"$MCDSQLdate\
bin/AST_VDauto_dial.pl:3957:SELECT campaign_id,local_call_time,scheduled_callbacks_auto_reschedule FROM vicidial_campaigns where scheduled_callbacks_auto_reschedule!='DISABLED' and campaign_calldate > \"$MCDSQLdate\
bin/AST_VDauto_dial.pl:3977:SELECT list_id FROM vicidial_lists where campaign_id=?/* $SCARcamp_id[$SCARcamp_count] */;
bin/AST_VDauto_dial.pl:3996:SELECT distinct status_group_id FROM vicidial_lists where list_id IN($SCARlists[$SCARcamp_count]);
bin/AST_VDauto_dial.pl:4014:SELECT distinct status from vicidial_statuses where human_answered='Y' UNION select distinct status from vicidial_campaign_statuses where campaign_id=?/* $SCARcamp_id[$SCARcamp_count] */ and human_answered='Y' UNION select distinct status from vicidial_campaign_statuses where campaign_id IN($SCARstatus_groups[$SCARcamp_count]) and human_answered='Y';
bin/AST_VDauto_dial.pl:4046:SELECT lead_id,call_date,caller_code,orig_status,reschedule,list_id,callback_id,(call_date + INTERVAL 5 MINUTE),callback_date FROM vicidial_recent_ascb_calls where server_ip=?/* $server_ip */ and call_date > ?/* $MCDSQLdate */ and rescheduled='U' order by call_date,lead_id limit 100000;
bin/AST_VDauto_dial.pl:4083:SELECT count(*) FROM vicidial_auto_calls where callerid=?/* $SCARcallerid[$vle_count] */ and lead_id=?/* $SCARleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:4096:SELECT campaign_id,status FROM vicidial_log where lead_id=?/* $SCARleadid[$vle_count] */ and call_date>=?/* $SCARcalldate[$vle_count] */ and call_date < ?/* $SCARcalldateFIVE[$vle_count] */ order by call_date limit 1;
bin/AST_VDauto_dial.pl:4155:SELECT gmt_offset_now,state,list_id,status FROM vicidial_list where lead_id=?/* $SCARleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:4170:SELECT local_call_time FROM vicidial_lists where list_id=?/* $temp_SCAR_list_id */;
bin/AST_VDauto_dial.pl:4206:UPDATE vicidial_callbacks SET status='ACTIVE',callback_time=?/* $SCARcalldateNEW[$vle_count] */ where callback_id=?/* $SCARcallback_id[$vle_count] */ and lead_id=?/* $SCARleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:4210:UPDATE vicidial_recent_ascb_calls SET rescheduled='Y' where caller_code=?/* $SCARcallerid[$vle_count] */;
bin/AST_VDauto_dial.pl:4214:UPDATE vicidial_list SET status='CBHOLD' where lead_id=?/* $SCARleadid[$vle_count] */;
bin/AST_VDauto_dial.pl:4224:UPDATE vicidial_recent_ascb_calls SET rescheduled='P' where caller_code=?/* $SCARcallerid[$vle_count] */;
bin/AST_VDauto_dial.pl:4240:UPDATE vicidial_recent_ascb_calls SET rescheduled='N' where caller_code=?/* $SCARcallerid[$vle_count] */;
bin/AST_VDauto_dial.pl:4260:UPDATE vicidial_recent_ascb_calls SET rescheduled='N' where caller_code=?/* $SCARcallerid[$vle_count] */;
bin/AST_VDauto_dial.pl:4289:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_VDauto_dial.pl:4306:SELECT enable_queuemetrics_logging,queuemetrics_server_ip,queuemetrics_dbname,queuemetrics_login,queuemetrics_pass,queuemetrics_log_id,queuemetrics_loginout FROM system_settings;
bin/AST_VDauto_dial.pl:4326:SELECT status,lead_id,call_time FROM vicidial_auto_calls where server_ip=?/* $server_ip */ and call_time < ?/* $TDSQLdate */ and status NOT IN('XFER','CLOSER');
bin/AST_VDauto_dial.pl:4343:DELETE FROM vicidial_auto_calls where server_ip=?/* $server_ip */ and call_time < ?/* $TDSQLdate */ and status NOT IN('XFER','CLOSER');
bin/AST_VDauto_dial.pl:4351:SELECT max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context FROM servers where server_ip = ?/* $server_ip */;
bin/AST_VDauto_dial.pl:4613:SELECT ct_default_start,ct_default_stop,ct_state_call_times,ct_holidays $TY_timeSQL FROM vicidial_call_times where call_time_id=?/* $SCARcall_time_value */;
bin/AST_VDauto_dial.pl:4638:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($ct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $SCARdate */ order by holiday_id;
bin/AST_VDauto_dial.pl:4683:SELECT sct_default_start,sct_default_stop,ct_holidays $TY_StimeSQL from vicidial_state_call_times where state_call_time_id=?/* $temp_state_rules[$b] */ and state_call_time_state=?/* $temp_SCAR_state */;
bin/AST_VDauto_dial.pl:4707:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($sct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $SCARdate */ order by holiday_id;
bin/ADMIN_timeclock_auto_logout.pl:164:SELECT vd_server_logs,local_gmt FROM servers where server_ip = ?/* $VARserver_ip */;
bin/ADMIN_timeclock_auto_logout.pl:182:SELECT timeclock_end_of_day,timeclock_last_reset_date FROM system_settings;
bin/ADMIN_timeclock_auto_logout.pl:205:SELECT user,user_group,event_epoch,status,ip_address,shift_id from vicidial_timeclock_status where status IN('START','LOGIN')
bin/ADMIN_timeclock_auto_logout.pl:235:INSERT INTO vicidial_timeclock_log set event='AUTOLOGOUT', user=?/* $user[$i] */, user_group=?/* $user_group[$i] */, event_epoch=?/* $now_date_epoch */, ip_address=?/* $VARserver_ip */, login_sec=?/* $last_action_sec */, event_date=?/* $now_date */;
bin/ADMIN_timeclock_auto_logout.pl:242:UPDATE vicidial_timeclock_log set login_sec=?/* $last_action_sec */,tcid_link=?/* $timeclock_id */ where event='LOGIN' and user=?/* $user[$i] */ order by timeclock_id desc limit 1;
bin/ADMIN_timeclock_auto_logout.pl:248:UPDATE vicidial_timeclock_status set status='AUTOLOGOUT', user_group=?/* $user_group[$i] */, event_epoch=?/* $now_date_epoch */, ip_address=?/* $VARserver_ip */ where user=?/* $user[$i] */;
bin/ADMIN_timeclock_auto_logout.pl:254:INSERT INTO vicidial_timeclock_audit_log set timeclock_id=?/* $timeclock_id */, event='AUTOLOGOUT', user=?/* $user[$i] */, user_group=?/* $user_group[$i] */, event_epoch=?/* $now_date_epoch */, ip_address=?/* $VARserver_ip */, login_sec=?/* $last_action_sec */, event_date=?/* $now_date */;
bin/ADMIN_timeclock_auto_logout.pl:260:UPDATE vicidial_timeclock_audit_log set login_sec=?/* $last_action_sec */,tcid_link=?/* $timeclock_id */ where event='LOGIN' and user=?/* $user[$i] */ order by timeclock_id desc limit 1;
bin/ADMIN_timeclock_auto_logout.pl:269:UPDATE system_settings set timeclock_last_reset_date=?/* $file_date */;
bin/AST_CRON_audio_3_newftp.pl:414:SELECT recording_id, start_time, vicidial_id, lead_id FROM recording_log WHERE filename=? ORDER BY recording_id DESC LIMIT 1;
bin/AST_CRON_audio_3_newftp.pl:418:SELECT campaign_id FROM vicidial_log WHERE uniqueid=? AND lead_id=? ORDER BY campaign_id DESC LIMIT 1;
bin/AST_CRON_audio_3_newftp.pl:423:SELECT campaign_id FROM vicidial_closer_log WHERE closecallid=? AND lead_id=? ORDER BY campaign_id DESC LIMIT 1;
bin/AST_CRON_audio_3_newftp.pl:427:UPDATE recording_log SET location=? WHERE recording_id=?;
bin/AST_CRON_audio_3_newftp.pl:508:select recording_id, start_time, vicidial_id, lead_id from recording_log where filename=$SQLFILE order by recording_id desc LIMIT 1;
bin/AST_CRON_audio_3_newftp.pl:527:select campaign_id from vicidial_log where uniqueid=$vicidial_id and lead_id=$lead_id;
bin/AST_CRON_audio_3_newftp.pl:550:select campaign_id from vicidial_closer_log where closecallid=$vicidial_id and lead_id=$lead_id;
bin/AST_CRON_audio_3_newftp.pl:606:UPDATE recording_log set location=?/* $url_path/$start_date_PATH$ALLfile */ where recording_id=?/* $recording_id */;
bin/AST_manager_listen.pl:164:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_listen.pl:352:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:373:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */ and status='SENT';
bin/AST_manager_listen.pl:418:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listen.pl:439:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listen.pl:451:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listen.pl:472:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:488:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:503:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:518:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:536:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:554:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:572:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:590:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:612:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:631:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:651:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:720:INSERT INTO vicidial_cpd_log set channel=?/* $channel */, uniqueid=?/* $uniqueid */, callerid=?/* $callid */, server_ip=?/* $server_ip */, lead_id=?/* $lead_id */, event_date=?/* $now_date */, result=?/* $result */;
bin/AST_manager_listen.pl:757:UPDATE vicidial_dial_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */,uniqueid=?/* $uniqueid */ where caller_code=?/* $callid */ and server_ip=?/* $server_ip */ and lead_id=?/* $lead_id */;
bin/AST_manager_listen.pl:785:UPDATE vicidial_carrier_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */ where server_ip=?/* $server_ip */ and caller_code=?/* $callid */ and lead_id=?/* $lead_id */ and call_date > ?/* $preCSQLdate */ and call_date < ?/* $postCSQLdate */ order by call_date desc limit 1;
bin/AST_manager_listen.pl:822:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_manager_listen.pl:836:SELECT last_update FROM server_updater where server_ip = ?/* $server_ip */;
bin/AST_manager_listen.pl:994:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:1015:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */ and status='SENT';
bin/AST_manager_listen.pl:1060:UPDATE vicidial_manager set status='DEAD', channel=?/* $channel */ where server_ip = ?/* $server_ip */ and uniqueid = ?/* $uniqueid */ and callerid NOT LIKE \"DCagcW%\" and cmd_line_d!='Exten: 8309' and cmd_line_d!='Exten: 8310';
bin/AST_manager_listen.pl:1094:UPDATE vicidial_manager set status='SENT', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:1103:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:1133:UPDATE vicidial_manager set status='UPDATED', channel=?/* $channel */, uniqueid = ?/* $uniqueid */ where server_ip = ?/* $server_ip */ and callerid = ?/* $callid */
bin/AST_manager_listen.pl:1171:INSERT INTO vicidial_dtmf_log SET dtmf_time=NOW(),channel=?/* $channel */,server_ip=?/* $server_ip */,uniqueid=?/* $uniqueid */,digit=?/* $digit */,direction=?/* $direction */,state=?/* $state */
bin/AST_manager_listen.pl:1262:INSERT INTO vicidial_cpd_log set channel=?/* $channel */, uniqueid=?/* $uniqueid */, callerid=?/* $callid */, server_ip=?/* $server_ip */, lead_id=?/* $lead_id */, event_date=?/* $now_date */, result=?/* $cpd_result */;
bin/AST_manager_listen.pl:1299:UPDATE vicidial_dial_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */,uniqueid=?/* $uniqueid */ where caller_code=?/* $callid */ and server_ip=?/* $server_ip */ and lead_id=?/* $lead_id */;
bin/AST_manager_listen.pl:1327:UPDATE vicidial_carrier_log SET sip_hangup_cause=?/* $result_details[0] */,sip_hangup_reason=?/* $result_details[1] */ where server_ip=?/* $server_ip */ and caller_code=?/* $callid */ and lead_id=?/* $lead_id */ and call_date > ?/* $preCSQLdate */ and call_date < ?/* $postCSQLdate */ order by call_date desc limit 1;
bin/AST_manager_listen.pl:1364:SELECT vd_server_logs FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_manager_listen.pl:1378:SELECT last_update FROM server_updater where server_ip = ?/* $server_ip */;
bin/AST_manager_security_AMI2.pl:124:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_security_AMI2.pl:329:SELECT vd_server_logs FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_security_AMI2.pl:620:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */', remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:664:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one='', optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:709:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one='', optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:754:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one='', optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:799:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one='', optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:850:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two=?/* $optional_two */, optional_three=''
bin/AST_manager_security_AMI2.pl:899:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:952:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two=?/* $optional_two */, optional_three=?/* $optional_three */
bin/AST_manager_security_AMI2.pl:1001:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:1053:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two=?/* $optional_two */, optional_three=''
bin/AST_manager_security_AMI2.pl:1104:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:1156:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two=?/* $optional_two */, optional_three=?/* $optional_three */
bin/AST_manager_security_AMI2.pl:1205:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two='', optional_three=''
bin/AST_manager_security_AMI2.pl:1254:INSERT INTO vicidial_security_event_log SET server_ip=?/* $event_hash{'ServerIP'} */,  event=?/* $event_hash{'Event'} */, event_time=?/* $event_hash{'EventTV'} */, severity=?/* $event_hash{'Severity'} */, service=?/* $event_hash{'Service'} */, event_version=?/* $event_hash{'EventVersion'} */, account_id=?/* $event_hash{'AccountID'} */, session_id=?/* $event_hash{'SessionID'} */, local_address=?/* $event_hash{'LocalIP'} */, local_port=?/* $event_hash{'LocalPort'} */, remote_address=?/* $event_hash{'RemoteIP'} */, remote_port=?/* $event_hash{'RemotePort'} */, module=?/* $event_hash{'Module'} */, session_time=?/* $event_hash{'SessionTV'} */, optional_one=?/* $optional_one */, optional_two='', optional_three=''
bin/ADMIN_update_server_ip.pl:404:UPDATE servers SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:409:UPDATE servers SET active_twin_server_ip=?/* $VARserver_ip */ where active_twin_server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:414:UPDATE system_settings SET active_voicemail_server=?/* $VARserver_ip */ where active_voicemail_server=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:419:UPDATE vicidial_automated_reports SET report_server=?/* $VARserver_ip */ where report_server=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:424:UPDATE phones SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:429:UPDATE inbound_numbers SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:434:UPDATE server_updater SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:439:UPDATE conferences SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:444:UPDATE vicidial_conferences SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:449:UPDATE vicidial_stations SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:454:UPDATE vicidial_remote_agents SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:459:UPDATE phone_favorites SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:464:UPDATE vicidial_server_trunks SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:469:UPDATE vicidial_server_carriers SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:474:UPDATE vicidial_inbound_dids SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:479:UPDATE vicidial_inbound_dids SET filter_server_ip=?/* $VARserver_ip */ where filter_server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:484:UPDATE vicidial_process_triggers SET server_ip=?/* $VARserver_ip */ where server_ip=?/* $VARold_server_ip */;
bin/ADMIN_update_server_ip.pl:489:UPDATE servers SET rebuild_conf_files='Y' where generate_vicidial_conf='Y' and active_asterisk_server='Y';
bin/AST_VDcall_quotas.pl:206:SELECT call_quota_lead_ranking,timeclock_end_of_day FROM system_settings;
bin/AST_VDcall_quotas.pl:227:SELECT vd_server_logs,local_gmt FROM servers where server_ip = ?/* $VARserver_ip */;
bin/AST_VDcall_quotas.pl:315:SELECT list_id from vicidial_lists where campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDcall_quotas.pl:337:SELECT lead_id,list_id from vicidial_list where list_id IN($list_idsSQL) and last_local_call_time >= \"$SVSQLdate\
bin/AST_VDcall_quotas.pl:360:SELECT call_quota_lead_ranking from vicidial_campaigns where campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDcall_quotas.pl:384:SELECT call_date,UTC_TIMESTAMP(call_date),uniqueid,caller_code from vicidial_dial_log where lead_id=?/* $LEADlead_id[$lead_ct] */ and call_date >= ?/* $SVSQLdate */ order by call_date limit 1000;
bin/AST_VDcall_quotas.pl:407:SELECT uniqueid from vicidial_log_extended where caller_code=?/* $LEADcaller_code[$call_ct] */ and lead_id=?/* $LEADlead_id[$lead_ct] */;
bin/AST_VDcall_quotas.pl:421:UPDATE vicidial_dial_log SET uniqueid=?/* $LEADuniqueid[$call_ct] */ where caller_code=?/* $LEADcaller_code[$call_ct] */ and lead_id=?/* $LEADlead_id[$lead_ct] */ limit 1;
bin/AST_VDcall_quotas.pl:438:SELECT list_id,status,rank,called_count from vicidial_list where lead_id=?/* $LEADlead_id[$lead_ct] */ and list_id=?/* $LEADlist_id[$lead_ct] */;
bin/AST_VDcall_quotas.pl:557:SELECT first_call_date,last_call_date,status,called_count,session_one_calls,session_two_calls,session_three_calls,session_four_calls,session_five_calls,session_six_calls,day_one_calls,day_two_calls,day_three_calls,day_four_calls,day_five_calls,day_six_calls,day_seven_calls,rank,modify_date,session_one_today_calls,session_two_today_calls,session_three_today_calls,session_four_today_calls,session_five_today_calls,session_six_today_calls from vicidial_lead_call_quota_counts where lead_id=?/* $LEADlead_id[$lead_ct] */ and list_id=?/* $LEADlist_id[$lead_ct] */;
bin/AST_VDcall_quotas.pl:631:UPDATE vicidial_lead_call_quota_counts SET modify_date=NOW() $log_updateSQL where lead_id=?/* $LEADlead_id[$lead_ct] */ and list_id=?/* $LEADlist_id[$lead_ct] */;
bin/AST_VDcall_quotas.pl:640:INSERT INTO vicidial_lead_call_quota_counts SET lead_id=?/* $LEADlead_id[$lead_ct] */,list_id=?/* $LEADlist_id[$lead_ct] */,first_call_date=?/* $VLCQCfirst_call_date */,last_call_date=?/* $VLCQClast_call_date */,status=?/* $LEADINFOstatus */,called_count=?/* $LEADINFOcalled_count */,session_one_calls=?/* $session_one_calls */,session_two_calls=?/* $session_two_calls */,session_three_calls=?/* $session_three_calls */,session_four_calls=?/* $session_four_calls */,session_five_calls=?/* $session_five_calls */,session_six_calls=?/* $session_six_calls */,day_one_calls=?/* $day_one_calls */,day_two_calls=?/* $day_two_calls */,day_three_calls=?/* $day_three_calls */,day_four_calls=?/* $day_four_calls */,day_five_calls=?/* $day_five_calls */,day_six_calls=?/* $day_six_calls */,day_seven_calls=?/* $day_seven_calls */,rank=?/* $LEADINFOrank */,modify_date=NOW(),session_one_today_calls=?/* $session_one_today_calls */,session_two_today_calls=?/* $session_two_today_calls */,session_three_today_calls=?/* $session_three_today_calls */,session_four_today_calls=?/* $session_four_today_calls */,session_five_today_calls=?/* $session_five_today_calls */,session_six_today_calls=?/* $session_six_today_calls */;
bin/AST_VDcall_quotas.pl:719:SELECT campaign_id,auto_active_list_new,call_quota_lead_ranking,call_quota_process_running,call_quota_last_run_date,local_call_time,call_count_limit,local_call_time,lead_filter_id,dial_statuses,drop_lockout_time,lead_order from vicidial_campaigns where campaign_id IN(?/* $CLIcampaign */);
bin/AST_VDcall_quotas.pl:723:SELECT campaign_id,auto_active_list_new,call_quota_lead_ranking,call_quota_process_running,call_quota_last_run_date,local_call_time,call_count_limit,local_call_time,lead_filter_id,dial_statuses,drop_lockout_time,lead_order from vicidial_campaigns where active='Y';
bin/AST_VDcall_quotas.pl:781:SELECT lead_filter_sql FROM vicidial_lead_filters where lead_filter_id=?/* $lead_filter_id[$i] */;
bin/AST_VDcall_quotas.pl:817:SELECT list_id,list_name,active,local_call_time,auto_active_list_rank,cache_count,cache_count_new,cache_count_dialable_new,list_lastcalldate,UTC_TIMESTAMP(list_lastcalldate) from vicidial_lists where expiration_date >= CURDATE() and campaign_id=?/* $campaign_id[$i] */ order by active,auto_active_list_rank desc,list_id;
bin/AST_VDcall_quotas.pl:844:SELECT count(*) from vicidial_list where list_id=?/* $LISTlist_id[$d] */;
bin/AST_VDcall_quotas.pl:856:SELECT count(*) from vicidial_list where list_id=?/* $LISTlist_id[$d] */ and status='NEW';
bin/AST_VDcall_quotas.pl:881:SELECT count(*) FROM vicidial_list $VLforce_index where list_id=?/* $LISTlist_id[$d] */ and status='NEW' and ($RETURN_all_gmtSQL) $lead_filter_sql[$i];
bin/AST_VDcall_quotas.pl:893:UPDATE vicidial_lists SET cache_count=?/* $LISTleads_count[$d] */,cache_count_new=?/* $LISTleads_NEW_count[$d] */,cache_count_dialable_new=?/* $LISTleads_dialable_NEW_count[$d] */,cache_date=NOW() where list_id=?/* $LISTlist_id[$d] */;
bin/AST_VDcall_quotas.pl:934:UPDATE vicidial_lists SET active='Y',list_changedate=NOW() where list_id=?/* $next_NEW_list_to_activate */;
bin/AST_VDcall_quotas.pl:945:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='LISTS', event_type='MODIFY', record_id=?/* $next_NEW_list_to_activate */, event_code='auto_active_list_new', event_sql=?/* $SQL_log */, event_notes=?/* $affected_rowsB   |$recent_dial_count|$auto_active_list_new[$i]|$active_dialable_NEW_count */;
bin/AST_VDcall_quotas.pl:972:UPDATE vicidial_campaigns SET lead_order=?/* $test_lead_order */ where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDcall_quotas.pl:982:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='CAMPAIGNS', event_type='MODIFY', record_id=?/* $campaign_id[$i] */, event_code='call_quota_lead_order_change', event_sql=?/* $SQL_log */, event_notes=?/* $affected_rowsC|$test_lead_order|$lead_order[$i]| */;
bin/AST_VDcall_quotas.pl:989:SELECT list_id from vicidial_lists where campaign_id=?/* $campaign_id[$i] */ order by auto_active_list_rank desc,list_id;
bin/AST_VDcall_quotas.pl:1010:SELECT lead_id,first_call_date,status,called_count,session_one_calls,session_two_calls,session_three_calls,session_four_calls,session_five_calls,session_six_calls,day_one_calls,day_two_calls,day_three_calls,day_four_calls,day_five_calls,day_six_calls,day_seven_calls,rank,modify_date,UTC_TIMESTAMP(first_call_date),UTC_TIMESTAMP(last_call_date),session_one_today_calls,session_two_today_calls,session_three_today_calls,session_four_today_calls,session_five_today_calls,session_six_today_calls from vicidial_lead_call_quota_counts where list_id=?/* $DLISTlist_id[$d] */ and last_call_date < ?/* $VDL_hour */ and status IN($redial_statusesSQL);
bin/AST_VDcall_quotas.pl:1266:SELECT count(*) from vicidial_live_agents where lead_id=?/* $RClead_id[$rc] */;
bin/AST_VDcall_quotas.pl:1280:SELECT count(*) from vicidial_auto_calls where lead_id=?/* $RClead_id[$rc] */;
bin/AST_VDcall_quotas.pl:1294:SELECT count(*) from vicidial_hopper where lead_id=?/* $RClead_id[$rc] */;
bin/AST_VDcall_quotas.pl:1309:SELECT count(*) from vicidial_list where lead_id=?/* $RClead_id[$rc] */ and called_since_last_reset='N';
bin/AST_VDcall_quotas.pl:1331:UPDATE vicidial_list SET rank=?/* $LEADrank */ $called_since_last_resetSQL where lead_id=?/* $RClead_id[$rc] */;
bin/AST_VDcall_quotas.pl:1335:UPDATE vicidial_lead_call_quota_counts SET rank=?/* $LEADrank */,modify_date=NOW() where lead_id=?/* $RClead_id[$rc] */ and list_id=?/* $DLISTlist_id[$d] */;
bin/AST_VDcall_quotas.pl:1366:UPDATE vicidial_campaigns SET call_quota_last_run_date=NOW(),call_quota_process_running='0' where campaign_id=?/* $campaign_id[$i] */;
bin/AST_VDcall_quotas.pl:1386:INSERT IGNORE INTO vicidial_campaign_stats_debug SET server_ip='CALLQUOTA',campaign_id=?/* $campaign_id[$i] */,entry_time=NOW(),debug_output=?/* $ENDoutput$RUNoutput */ ON DUPLICATE KEY UPDATE entry_time=NOW(),debug_output=?/* $ENDoutput$RUNoutput Call Quota run time: $secZ seconds */;
bin/AST_VDcall_quotas.pl:1442:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $TEMPcall_quota_lead_ranking */;
bin/AST_VDcall_quotas.pl:1762:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times,ct_holidays FROM vicidial_call_times where call_time_id=?/* $SUB_local_call_time */;
bin/AST_VDcall_quotas.pl:1801:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($Gct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDcall_quotas.pl:1978:SELECT state_call_time_id,state_call_time_state,state_call_time_name,state_call_time_comments,sct_default_start,sct_default_stop,sct_sunday_start,sct_sunday_stop,sct_monday_start,sct_monday_stop,sct_tuesday_start,sct_tuesday_stop,sct_wednesday_start,sct_wednesday_stop,sct_thursday_start,sct_thursday_stop,sct_friday_start,sct_friday_stop,sct_saturday_start,sct_saturday_stop,ct_holidays from vicidial_state_call_times where state_call_time_id=?/* $state_rules[$b] */;
bin/AST_VDcall_quotas.pl:2020:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id IN($Sct_holidaysSQL) and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDcall_quotas.pl:2026:SELECT holiday_id,holiday_date,holiday_name,ct_default_start,ct_default_stop from vicidial_call_time_holidays where holiday_id=?/* $holiday_id */ and holiday_status='ACTIVE' and holiday_date=?/* $YMD */ order by holiday_id;
bin/AST_VDlist_summary_export.pl:212:select count(*),list_id,status from vicidial_list where list_id>99 group by list_id,status order by list_id,status;
bin/AST_VDlist_summary_export.pl:234:select status_name from vicidial_statuses where status=?/* $status[$i] */;
bin/AST_VDlist_summary_export.pl:247:select status_name from vicidial_campaign_statuses where status=?/* $status[$i] */;
bin/AST_VDlist_summary_export.pl:301:select list_name,vicidial_lists.campaign_id,campaign_name from vicidial_lists,vicidial_campaigns where list_id=?/* $lists_list_id[$i] */ and vicidial_lists.campaign_id=vicidial_campaigns.campaign_id;
bin/AST_VDlist_summary_export.pl:364:select count(*),status from vicidial_list where list_id>99 group by status order by status;
bin/AST_VDlist_summary_export.pl:384:select status_name from vicidial_statuses where status=?/* $Tstatus[$i] */;
bin/AST_VDlist_summary_export.pl:397:select status_name from vicidial_campaign_statuses where status=?/* $Tstatus[$i] */;
bin/AST_conf_update.pl:135:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vicidial_recording_limit,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_conf_update.pl:209:SELECT conf_exten,extension from vicidial_conferences where server_ip=?/* $server_ip */ and leave_3way='1' and leave_3way_datetime < \"$TDSQLdate\
bin/AST_conf_update.pl:233:INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Originate',?/* $queryCID */,'Channel: $kick_local_channel','Context: $ext_context','Exten: 8300','Priority: 1','Callerid: $queryCID','','','','','');
bin/AST_conf_update.pl:236:UPDATE vicidial_conferences set extension='',leave_3way='0' where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$k] */;
bin/AST_conf_update.pl:252:SELECT extension,conf_exten from vicidial_conferences where server_ip=?/* $server_ip */ and leave_3way='1';
bin/AST_conf_update.pl:375:UPDATE vicidial_conferences set extension=?/* $PTextensions[$i] */ where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$i] */;
bin/AST_conf_update.pl:398:INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Originate',?/* $queryCID */,'Channel: $kick_local_channel','Context: $ext_context','Exten: 8300','Priority: 1','Callerid: $queryCID','','','','','');
bin/AST_conf_update.pl:404:UPDATE vicidial_conferences set extension=?/* $NEWexten[$i] */,leave_3way=?/* $leave_3waySQL */ where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$i] */;
bin/AST_conf_update.pl:441:SELECT extension,conf_exten from conferences where server_ip=?/* $server_ip */ and extension is NOT NULL and extension != '';
bin/AST_conf_update.pl:570:UPDATE conferences set extension=?/* $PTextensions[$i] */ where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$i] */;
bin/AST_conf_update.pl:584:UPDATE conferences set extension=?/* $NEWexten[$i] */ where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$i] */;
bin/AST_update.pl:276:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,asterisk_version,sys_perf_log,vd_server_logs FROM servers where server_ip=?/* $server_ip */;
bin/AST_update.pl:328:SELECT count(*) FROM $server_updater where server_ip=?/* $server_ip */;
bin/AST_update.pl:340:INSERT INTO $server_updater set server_ip=?/* $server_ip */, last_update=?/* $now_date */;
bin/AST_update.pl:351:SELECT extension FROM phones where protocol='Zap' and server_ip=?/* $server_ip */
bin/AST_update.pl:373:SELECT extension FROM phones where protocol='IAX2' and server_ip=?/* $server_ip */ and phone_type NOT LIKE \"%trunk%\
bin/AST_update.pl:404:SELECT extension FROM phones where protocol='SIP' and server_ip=?/* $server_ip */
bin/AST_update.pl:718:INSERT INTO server_performance (start_time,server_ip,sysload,freeram,usedram,processes,channels_total,trunks_total,clients_total,clients_zap,clients_iax,clients_local,clients_sip,live_recordings,cpu_user_percent,cpu_system_percent,cpu_idle_percent) values(?/* $now_date */,?/* $server_ip */,?/* $serverLOAD */,?/* $MEMfree */,?/* $MEMused */,?/* $serverPROCESSES */,?/* $#list_channels */,?/* $channel_counter */,?/* $sip_counter */,?/* $test_zap_count */,?/* $test_iax_count */,?/* $test_local_count */,?/* $test_sip_count */,?/* $recording_count */,?/* $cpuUSERcent */,?/* $cpuSYSTcent */,?/* $cpuIDLEcent */)
bin/AST_update.pl:732:UPDATE servers SET sysload=?/* $serverLOAD */,channels_total=?/* $channels_total */,cpu_idle_percent=?/* $cpuIDLEcent */,disk_usage=?/* $disk_usage */ where server_ip=?/* $server_ip */;
bin/AST_update.pl:746:SELECT extension FROM phones where protocol='Zap' and server_ip=?/* $server_ip */
bin/AST_update.pl:768:SELECT extension FROM phones where protocol='IAX2' and server_ip=?/* $server_ip */ and phone_type NOT LIKE \"%trunk%\
bin/AST_update.pl:798:SELECT extension FROM phones where protocol='SIP' and server_ip=?/* $server_ip */
bin/AST_update.pl:830:SELECT sys_perf_log,vd_server_logs FROM servers where server_ip=?/* $server_ip */;
bin/AST_update.pl:989:INSERT INTO $live_channels (channel,server_ip,extension,channel_data) values(?/* $channel */,?/* $server_ip */,?/* $extension */,?/* $channel_data */)
bin/AST_update.pl:1014:INSERT INTO $live_sip_channels (channel,server_ip,extension,channel_data) values(?/* $channel */,?/* $server_ip */,?/* $extension */,?/* $channel_data */)
bin/AST_update.pl:1033:DELETE FROM $live_channels where server_ip=?/* $server_ip */ and channel=?/* $DELchannel */ and extension=?/* $DELextension */ limit 1
bin/AST_update.pl:1049:DELETE FROM $live_sip_channels where server_ip=?/* $server_ip */ and channel=?/* $DELchannel */ and extension=?/* $DELextension */ limit 1
bin/AST_update.pl:1113:DELETE FROM $live_sip_channels where server_ip=?/* $server_ip */
bin/AST_update.pl:1116:DELETE FROM $live_channels where server_ip=?/* $server_ip */
bin/AST_update.pl:1166:SELECT channel,extension FROM $live_channels where server_ip=?/* $server_ip */;
bin/AST_update.pl:1181:SELECT channel,extension FROM $live_sip_channels where server_ip=?/* $server_ip */;
bin/AST_update.pl:1203:UPDATE $server_updater set last_update=?/* $now_date */ where server_ip=?/* $server_ip */
bin/AST_update.pl:1226:SELECT channel,extension,parked_time,UTC_TIMESTAMP(parked_time),channel_group FROM $parked_channels where server_ip = ?/* $server_ip */ order by channel desc, parked_time desc;
bin/AST_update.pl:1253:DELETE FROM $parked_channels where server_ip=?/* $server_ip */ and channel=?/* $PQchannel */ and extension=?/* $PQextension */ and parked_time=?/* $PQparked_time */ limit 1
bin/AST_update.pl:1278:SELECT count(*) FROM $live_channels where server_ip=?/* $server_ip */ and channel=?/* $PQchannel */ and ( (extension=?/* $PQextension */) or (extension LIKE \"%.agi\") );
bin/AST_update.pl:1304:DELETE FROM $parked_channels where server_ip=?/* $server_ip */ and channel=?/* $PQchannel */ and extension=?/* $PQextension */ limit 1;
bin/AST_update.pl:1307:DELETE FROM vicidial_auto_calls where callerid=?/* $PQchannel_group */ limit 1;
bin/AST_CRON_audio_4_ftp2_FTPSSL.pl:367:select recording_id,start_time from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/AST_VDsales_export_SFTP.pl:546:SELECT local_gmt FROM servers where server_ip=?/* $server_ip */;
bin/AST_VDsales_export_SFTP.pl:572:SELECT call_time_id,call_time_name,call_time_comments,ct_default_start,ct_default_stop,ct_sunday_start,ct_sunday_stop,ct_monday_start,ct_monday_stop,ct_tuesday_start,ct_tuesday_stop,ct_wednesday_start,ct_wednesday_stop,ct_thursday_start,ct_thursday_stop,ct_friday_start,ct_friday_stop,ct_saturday_start,ct_saturday_stop,ct_state_call_times FROM vicidial_call_times where call_time_id=?/* $call_time */;
bin/AST_VDsales_export_SFTP.pl:608:select vicidial_log.user,first_name,last_name,address1,address2,city,state,postal_code,vicidial_list.phone_number,vicidial_list.email,security_phrase,vicidial_list.comments,CONVERT_TZ(call_date,$convert_tz),vicidial_list.lead_id,vicidial_users.full_name,vicidial_log.status,vicidial_list.vendor_lead_code,vicidial_list.source_id,vicidial_log.list_id,title,address3,last_local_call_time,uniqueid,length_in_sec,vicidial_list.list_id,vicidial_list.list_id,UTC_TIMESTAMP(vicidial_log.call_date),vicidial_campaigns.campaign_name,vicidial_campaigns.campaign_cid from vicidial_list,vicidial_log,vicidial_users,vicidial_campaigns where $campaignSQL $sale_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_log.lead_id=vicidial_list.lead_id and vicidial_users.user=vicidial_log.user and vicidial_log.campaign_id=vicidial_campaigns.campaign_id order by call_date;
bin/AST_VDsales_export_SFTP.pl:611:select vicidial_log.user,8,8,8,8,8,8,8,vicidial_log.phone_number,8,8,8,CONVERT_TZ(call_date,$convert_tz),vicidial_log.lead_id,vicidial_users.full_name,vicidial_log.status,8,8,vicidial_log.list_id,8,8,CONVERT_TZ(call_date,$convert_tz),uniqueid,length_in_sec,vicidial_log.list_id,vicidial_log.list_id,UTC_TIMESTAMP(vicidial_log.call_date),vicidial_campaigns.campaign_name,vicidial_campaigns.campaign_cid from vicidial_log,vicidial_users,vicidial_campaigns where $campaignSQL $sale_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_log.user and vicidial_log.campaign_id=vicidial_campaigns.campaign_id order by call_date;
bin/AST_VDsales_export_SFTP.pl:668:select vicidial_closer_log.user,first_name,last_name,address1,address2,city,state,postal_code,vicidial_list.phone_number,vicidial_list.email,security_phrase,vicidial_list.comments,CONVERT_TZ(call_date,$convert_tz),vicidial_list.lead_id,vicidial_users.full_name,vicidial_closer_log.status,vicidial_list.vendor_lead_code,vicidial_list.source_id,vicidial_closer_log.list_id,campaign_id,title,address3,last_local_call_time,xfercallid,closecallid,uniqueid,length_in_sec,queue_seconds,vicidial_list.list_id,vicidial_list.list_id,UTC_TIMESTAMP(vicidial_closer_log.call_date),agent_alert_delay from vicidial_list,vicidial_closer_log,vicidial_users,vicidial_inbound_groups where $with_inboundSQL $close_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_closer_log.lead_id=vicidial_list.lead_id and vicidial_users.user=vicidial_closer_log.user and vicidial_inbound_groups.group_id=vicidial_closer_log.campaign_id order by call_date;
bin/AST_VDsales_export_SFTP.pl:671:select vicidial_closer_log.user,8,8,8,8,8,8,8,vicidial_closer_log.phone_number,8,8,8,CONVERT_TZ(call_date,$convert_tz),vicidial_closer_log.lead_id,vicidial_users.full_name,vicidial_closer_log.status,8,8,vicidial_closer_log.list_id,campaign_id,8,8,CONVERT_TZ(call_date,$convert_tz),xfercallid,closecallid,uniqueid,length_in_sec,queue_seconds,vicidial_closer_log.list_id,vicidial_closer_log.list_id,UTC_TIMESTAMP(vicidial_closer_log.call_date),agent_alert_delay from vicidial_closer_log,vicidial_users,vicidial_inbound_groups where $with_inboundSQL $close_statusesSQL and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_closer_log.user and vicidial_inbound_groups.group_id=vicidial_closer_log.campaign_id order by call_date;
bin/AST_VDsales_export_SFTP.pl:719:select vicidial_xfer_log.user,full_name from vicidial_xfer_log,vicidial_users where lead_id=?/* $lead_id */ and closer=?/* $closer */ and xfercallid=?/* $xfercallid */ and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ and vicidial_users.user=vicidial_xfer_log.user order by call_date desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1000:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ and vicidial_id=?/* $vicidial_id */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by start_time desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1017:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by length_in_sec desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1035:select recording_id,filename,location from recording_log where lead_id=?/* $lead_id */ order by length_in_sec desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1053:select recording_id,filename,location from recording_log where filename LIKE \"%$phone_number%\" order by length_in_sec desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1087:select recording_id,filename,location from recording_log where vicidial_id=?/* $vicidial_id */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by start_time limit 10;
bin/AST_VDsales_export_SFTP.pl:1116:select closecallid,length_in_sec,queue_seconds,agent_alert_delay from vicidial_closer_log,vicidial_inbound_groups where lead_id=?/* $lead_id */ and call_date > ?/* $call_date */ and call_date < ?/* $shipdate 23:59:59 */ and campaign_id=group_id order by call_date limit 10;
bin/AST_VDsales_export_SFTP.pl:1138:select recording_id,filename,location from recording_log where vicidial_id=?/* $closecallid */ and start_time > ?/* $shipdate 00:00:01 */ and start_time < ?/* $shipdate 23:59:59 */ order by start_time limit 10;
bin/AST_VDsales_export_SFTP.pl:1177:select did_pattern,did_description,CONVERT_TZ(call_date,$convert_tz) from vicidial_inbound_dids vid,vicidial_did_log vdl where uniqueid=?/* $uniqueid */ and call_date > ?/* $shipdate 00:00:01 */ and call_date <= ?/* $call_date */ and vid.did_id=vdl.did_id order by call_date desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1192:select vc.campaign_cid,vc.campaign_name,CONVERT_TZ(call_date,$convert_tz) from vicidial_campaigns vc,vicidial_log vl where lead_id=?/* $lead_id */ and call_date > ?/* $shipdate 00:00:01 */ and call_date <= ?/* $call_date */ and vc.campaign_id=vl.campaign_id order by call_date desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1385:select CONVERT_TZ(call_date,$convert_tz),order_id,appointment_date,appointment_time,call_notes from vicidial_call_notes where lead_id=?/* $lead_id */ and vicidial_id=?/* $uniqueid */ and call_date > ?/* $shipdate 00:00:01 */ and call_date < ?/* $shipdate 23:59:59 */ order by call_date desc limit 1;
bin/AST_VDsales_export_SFTP.pl:1438:select dispo_sec from vicidial_agent_log where lead_id=?/* $lead_id */ and user=?/* $closer */ and event_time > ?/* $shipdate 00:00:01 */ and event_time < ?/* $shipdate 23:59:59 */ order by event_time desc limit 1;
bin/VICIDIAL_DEDUPE_leads.pl:201:select list_id from vicidial_lists where campaign_id=?/* $campdup */;
bin/VICIDIAL_DEDUPE_leads.pl:235:select count(*) as tally, phone_number from vicidial_list $where $campSQL $listSQL group by phone_number order by tally desc;
bin/VICIDIAL_DEDUPE_leads.pl:262:select lead_id,list_id,entry_date from vicidial_list where phone_number=?/* $dup_list[$b] */ $and $campSQL $listSQL order by entry_date;
bin/VICIDIAL_DEDUPE_leads.pl:302:UPDATE vicidial_list set list_id=?/* $duplicatelist */ where lead_id IN($DUP_updates);
bin/AST_CRON_audio_4_ftp2.pl:336:select recording_id,start_time from recording_log where filename=?/* $SQLFILE */ order by recording_id desc LIMIT 1;
bin/ADMIN_keepalive_ALL.pl:430:SELECT sounds_central_control_active,active_voicemail_server,custom_dialplan_entry,default_codecs,generate_cross_server_exten,voicemail_timezones,default_voicemail_timezone,call_menu_qualify_enabled,allow_voicemail_greeting,reload_timestamp,meetme_enter_login_filename,meetme_enter_leave3way_filename,allow_chats,enable_auto_reports,enable_drop_lists,expired_lists_inactive,sip_event_logging,call_quota_lead_ranking FROM system_settings;
bin/ADMIN_keepalive_ALL.pl:461:SELECT active_asterisk_server,generate_vicidial_conf,rebuild_conf_files,asterisk_version,sounds_update,conf_secret,custom_dialplan_entry,auto_restart_asterisk,asterisk_temp_no_restart,gather_asterisk_output,conf_qualify FROM servers where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:1007:SELECT count(*) from system_settings where timeclock_end_of_day LIKE \"%$reset_test%\
bin/ADMIN_keepalive_ALL.pl:1024:SELECT agents_calls_reset,usacan_phone_dialcode_fix from system_settings;
bin/ADMIN_keepalive_ALL.pl:1039:SELECT conf_exten,extension from vicidial_conferences where server_ip=?/* $server_ip */ and leave_3way='0';
bin/ADMIN_keepalive_ALL.pl:1059:SELECT count(*) from vicidial_live_agents where conf_exten=?/* $PT_conf_extens[$k] */ and server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:1072:UPDATE vicidial_conferences set extension='' where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$k] */;
bin/ADMIN_keepalive_ALL.pl:1087:UPDATE vicidial_xfer_stats SET xfer_count='0';
bin/ADMIN_keepalive_ALL.pl:1102:UPDATE vicidial_campaign_stats SET dialable_leads='0', calls_today='0', answers_today='0', drops_today='0', drops_today_pct='0', drops_answers_today_pct='0', calls_hour='0', answers_hour='0', drops_hour='0', drops_hour_pct='0', calls_halfhour='0', answers_halfhour='0', drops_halfhour='0', drops_halfhour_pct='0', calls_fivemin='0', answers_fivemin='0', drops_fivemin='0', drops_fivemin_pct='0', calls_onemin='0', answers_onemin='0', drops_onemin='0', drops_onemin_pct='0', differential_onemin='0', agents_average_onemin='0', balance_trunk_fill='0', status_category_count_1='0', status_category_count_2='0', status_category_count_3='0', status_category_count_4='0',agent_calls_today='0',agent_pause_today='0',agent_wait_today='0',agent_custtalk_today='0',agent_acw_today='0';
bin/ADMIN_keepalive_ALL.pl:1117:UPDATE vicidial_drop_rate_groups SET calls_today='0', answers_today='0', drops_today='0', drops_today_pct='0', drops_answers_today_pct='0';
bin/ADMIN_keepalive_ALL.pl:1132:delete from vicidial_campaign_server_stats;
bin/ADMIN_keepalive_ALL.pl:1147:delete from vicidial_campaign_stats_debug;
bin/ADMIN_keepalive_ALL.pl:1162:update vicidial_inbound_group_agents SET calls_today=0,calls_today_filtered=0;
bin/ADMIN_keepalive_ALL.pl:1177:update vicidial_campaign_cid_areacodes SET call_count_today=0;
bin/ADMIN_keepalive_ALL.pl:1201:update vicidial_did_ra_extensions SET call_count_today=0;
bin/ADMIN_keepalive_ALL.pl:1216:update vicidial_extension_groups SET call_count_today=0;
bin/ADMIN_keepalive_ALL.pl:1240:update vicidial_lists SET resets_today=0;
bin/ADMIN_keepalive_ALL.pl:1255:UPDATE vicidial_list SET user='' where user LIKE \"QUEUE%\
bin/ADMIN_keepalive_ALL.pl:1261:update vicidial_campaign_agents SET calls_today=0,hopper_calls_today=0,hopper_calls_hour=0;
bin/ADMIN_keepalive_ALL.pl:1276:update vicidial_live_inbound_agents SET calls_today=0,calls_today_filtered=0;
bin/ADMIN_keepalive_ALL.pl:1284:delete from vicidial_live_inbound_agents where last_call_finish < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1290:delete from vicidial_live_agents where last_state_change < ?/* $TDSQLdate */ and extension NOT LIKE \"R/%\
bin/ADMIN_keepalive_ALL.pl:1296:delete from vicidial_auto_calls where last_update_time < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1330:update vicidial_user_list_new_lead SET new_count=0;
bin/ADMIN_keepalive_ALL.pl:1363:delete from vicidial_session_data where login_time < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1378:delete from vicidial_monitor_calls where monitor_time < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1394:UPDATE vicidial_call_time_holidays SET holiday_status='EXPIRED' where holiday_date < ?/* $RMdate */ and holiday_status!='EXPIRED';
bin/ADMIN_keepalive_ALL.pl:1402:INSERT IGNORE INTO vicidial_campaign_hour_counts_archive SELECT * from vicidial_campaign_hour_counts where date_hour < ?/* $today_start */;
bin/ADMIN_keepalive_ALL.pl:1413:DELETE FROM vicidial_campaign_hour_counts WHERE date_hour < ?/* $today_start */;
bin/ADMIN_keepalive_ALL.pl:1428:INSERT IGNORE INTO vicidial_carrier_hour_counts_archive SELECT * from vicidial_carrier_hour_counts where date_hour < ?/* $today_start */;
bin/ADMIN_keepalive_ALL.pl:1439:DELETE FROM vicidial_carrier_hour_counts WHERE date_hour < ?/* $yesterday_start */;
bin/ADMIN_keepalive_ALL.pl:1454:INSERT IGNORE INTO vicidial_ingroup_hour_counts_archive SELECT * from vicidial_ingroup_hour_counts where date_hour < ?/* $today_start */;
bin/ADMIN_keepalive_ALL.pl:1465:DELETE FROM vicidial_ingroup_hour_counts WHERE date_hour < ?/* $today_start */;
bin/ADMIN_keepalive_ALL.pl:1480:INSERT IGNORE INTO vicidial_inbound_callback_queue_archive SELECT * from vicidial_inbound_callback_queue where icbq_status IN('SENT','EXPIRED','DNCL','DNCC','ORPHAN');
bin/ADMIN_keepalive_ALL.pl:1491:DELETE FROM vicidial_inbound_callback_queue WHERE icbq_status IN('SENT','EXPIRED','DNCL','DNCC','ORPHAN');
bin/ADMIN_keepalive_ALL.pl:1506:INSERT IGNORE INTO vicidial_recent_ascb_calls_archive SELECT * from vicidial_recent_ascb_calls where call_date < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1517:DELETE FROM vicidial_recent_ascb_calls WHERE call_date < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1533:INSERT IGNORE INTO vicidial_sessions_recent_archive SELECT * from vicidial_sessions_recent where call_date < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1544:DELETE FROM vicidial_sessions_recent WHERE call_date < \"$TDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1560:INSERT IGNORE INTO vicidial_ccc_log_archive SELECT * from vicidial_ccc_log;
bin/ADMIN_keepalive_ALL.pl:1571:DELETE FROM vicidial_ccc_log WHERE call_date < \"$RMSQLdate\
bin/ADMIN_keepalive_ALL.pl:1586:UPDATE vicidial_inbound_groups SET closing_time_now_trigger='N' WHERE closing_time_now_trigger='Y';
bin/ADMIN_keepalive_ALL.pl:1595:UPDATE vicidial_daily_max_stats SET stats_flag='CLOSING' where stats_flag='OPEN';
bin/ADMIN_keepalive_ALL.pl:1602:SELECT stats_date,stats_flag,stats_type,campaign_id,update_time,closed_time,max_channels,max_calls,max_inbound,max_outbound,max_agents,max_remote_agents,total_calls from vicidial_daily_max_stats where stats_flag='CLOSING';
bin/ADMIN_keepalive_ALL.pl:1641:SELECT count(*) from vicidial_did_log where call_date >= ?/* $RMSQLdate */ and call_date < \"$now_date\
bin/ADMIN_keepalive_ALL.pl:1653:SELECT count(*) from vicidial_log where call_date >= ?/* $RMSQLdate */ and call_date < \"$now_date\
bin/ADMIN_keepalive_ALL.pl:1666:UPDATE vicidial_daily_max_stats SET total_calls=?/* $NEWtotal_calls */,stats_flag='CLOSED' where stats_flag='CLOSING' and campaign_id='' and stats_type='TOTAL';
bin/ADMIN_keepalive_ALL.pl:1675:SELECT count(*) from vicidial_closer_log where call_date >= ?/* $RMSQLdate */ and call_date < ?/* $now_date */ and campaign_id=?/* $Acampaign_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:1687:UPDATE vicidial_daily_max_stats SET total_calls=?/* $NEWtotal_calls */,stats_flag='CLOSED' where stats_flag='CLOSING' and campaign_id=?/* $Acampaign_id[$i] */ and stats_type='INGROUP';
bin/ADMIN_keepalive_ALL.pl:1696:SELECT count(*) from vicidial_log where call_date >= ?/* $RMSQLdate */ and call_date < ?/* $now_date */ and campaign_id=?/* $Acampaign_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:1708:UPDATE vicidial_daily_max_stats SET total_calls=?/* $NEWtotal_calls */,stats_flag='CLOSED' where stats_flag='CLOSING' and campaign_id=?/* $Acampaign_id[$i] */ and stats_type='CAMPAIGN';
bin/ADMIN_keepalive_ALL.pl:1721:UPDATE vicidial_daily_max_stats SET stats_flag='CLOSED' where stats_flag='CLOSING';
bin/ADMIN_keepalive_ALL.pl:1732:UPDATE vicidial_daily_ra_stats SET stats_flag='CLOSING' where stats_flag='OPEN';
bin/ADMIN_keepalive_ALL.pl:1739:SELECT stats_date,stats_flag,user,update_time,closed_time,max_calls,total_calls from vicidial_daily_ra_stats where stats_flag='CLOSING';
bin/ADMIN_keepalive_ALL.pl:1761:UPDATE vicidial_daily_ra_stats SET stats_flag='CLOSED' where stats_flag='CLOSING';
bin/ADMIN_keepalive_ALL.pl:1770:DELETE from vicidial_ajax_log where db_time < \"$SDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1788:DELETE from vicidial_vdad_log where db_time < \"$SDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1806:DELETE from vicidial_recent_ascb_calls_archive where call_date < \"$SDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1824:DELETE from vicidial_sessions_recent_archive where call_date < \"$SDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1842:DELETE from vicidial_security_event_log where event_time < \"$SDSQLdate\
bin/ADMIN_keepalive_ALL.pl:1860:DELETE FROM vicidial_lead_messages WHERE call_date < \"$RMSQLdate\
bin/ADMIN_keepalive_ALL.pl:1877:UPDATE vicidial_list SET phone_code='1' where phone_code!='1';
bin/ADMIN_keepalive_ALL.pl:1883:UPDATE vicidial_list SET phone_number = TRIM(LEADING '1' from phone_number) where char_length(phone_number) > 10 and phone_number LIKE \"1%\
bin/ADMIN_keepalive_ALL.pl:1892:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='SERVERS', event_type='MODIFY', record_id='leads', event_code='USACAN PHONE DIALCODE FIX', event_sql='', event_notes=?/* $PCaffected_rows vicidial_list.phone_code entries set to 1|$PNaffected_rows vicidial_list phone_number leading 1 entries trimmed| */;
bin/ADMIN_keepalive_ALL.pl:1914:ALTER TABLE $table_name ENGINE=MEMORY;
bin/ADMIN_keepalive_ALL.pl:1928:DELETE FROM $TEMPvicidial_sip_event_log;
bin/ADMIN_keepalive_ALL.pl:1943:INSERT IGNORE INTO $TEMPvicidial_sip_event_log SELECT * from vicidial_sip_event_log;
bin/ADMIN_keepalive_ALL.pl:1954:DELETE FROM vicidial_sip_event_log;
bin/ADMIN_keepalive_ALL.pl:1969:ALTER TABLE vicidial_sip_event_log AUTO_INCREMENT = 1;
bin/ADMIN_keepalive_ALL.pl:1979:SELECT count(*) FROM $TEMPvicidial_sip_event_log;
bin/ADMIN_keepalive_ALL.pl:1989:SELECT event_date FROM $TEMPvicidial_sip_event_log order by sip_event_id LIMIT 1;
bin/ADMIN_keepalive_ALL.pl:2000:SELECT event_date FROM $TEMPvicidial_sip_event_log order by sip_event_id desc LIMIT 1;
bin/ADMIN_keepalive_ALL.pl:2011:INSERT INTO vicidial_sip_event_archive_details SET wday=?/* $wday_now */,start_event_date=?/* $vsel_start */,end_event_date=?/* $vsel_end */,record_count=?/* $vsel_count */ ON DUPLICATE KEY UPDATE start_event_date=?/* $vsel_start */,end_event_date=?/* $vsel_end */,record_count=?/* $vsel_count */;
bin/ADMIN_keepalive_ALL.pl:2027:INSERT IGNORE INTO vicidial_lead_call_quota_counts_archive SELECT * from vicidial_lead_call_quota_counts where ( (first_call_date < ?/* $SXSQLdate */) or (first_call_date IS NULL) );
bin/ADMIN_keepalive_ALL.pl:2039:SELECT lead_id from vicidial_lead_call_quota_counts where ( (first_call_date < ?/* $SXSQLdate */) or (first_call_date IS NULL) );
bin/ADMIN_keepalive_ALL.pl:2057:UPDATE vicidial_list SET rank=0 where lead_id=?/* $DLISTlead_id[$e] */;
bin/ADMIN_keepalive_ALL.pl:2069:DELETE FROM vicidial_lead_call_quota_counts where ( (first_call_date < ?/* $SXSQLdate */) or (first_call_date IS NULL) );
bin/ADMIN_keepalive_ALL.pl:2082:UPDATE vicidial_lead_call_quota_counts SET session_one_today_calls='0',session_two_today_calls='0',session_three_today_calls='0',session_four_today_calls='0',session_five_today_calls='0',session_six_today_calls='0';
bin/ADMIN_keepalive_ALL.pl:2197:SELECT voicemail_id,pass,email,delete_vm_after_email,voicemail_timezone,voicemail_options FROM phones where voicemail_id=?/* $mailbox */ and active='Y' order by extension limit 1;
bin/ADMIN_keepalive_ALL.pl:2214:UPDATE phones SET pass=?/* $vmc_pass */,email=?/* $vmc_email */,delete_vm_after_email=?/* $vmc_delete_vm_after_email */,voicemail_timezone=?/* $vmc_voicemail_timezone */,voicemail_options=?/* $vmc_voicemail_options */ where voicemail_id=?/* $mailbox */ and active='Y' order by extension limit 1;
bin/ADMIN_keepalive_ALL.pl:2217:UPDATE servers SET rebuild_conf_files='Y' where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:2225:SELECT voicemail_id,pass,email,delete_vm_after_email,voicemail_timezone,voicemail_options FROM vicidial_voicemail WHERE voicemail_id=?/* $mailbox */ and active='Y' limit 1;
bin/ADMIN_keepalive_ALL.pl:2242:UPDATE vicidial_voicemail SET pass=?/* $vmc_pass */,email=?/* $vmc_email */,delete_vm_after_email=?/* $vmc_delete_vm_after_email */,voicemail_timezone=?/* $vmc_voicemail_timezone */,voicemail_options=?/* $vmc_voicemail_options */ where voicemail_id=?/* $mailbox */ and active='Y' limit 1;
bin/ADMIN_keepalive_ALL.pl:2245:UPDATE servers SET rebuild_conf_files='Y' where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:2266:UPDATE system_settings SET voicemail_timezones=?/* $vm_zones_content */;
bin/ADMIN_keepalive_ALL.pl:2276:SELECT voicemail_id,voicemail_greeting,count(*) FROM phones where voicemail_greeting != '' and voicemail_greeting is not NULL and active='Y' group by voicemail_id order by voicemail_id limit 10000;
bin/ADMIN_keepalive_ALL.pl:2342:UPDATE phones SET voicemail_greeting='' where voicemail_greeting='---DELETE---' and voicemail_id=?/* $VG_voicemail_id */;
bin/ADMIN_keepalive_ALL.pl:2354:SELECT voicemail_id,voicemail_greeting,count(*) FROM vicidial_voicemail where voicemail_greeting != '' and voicemail_greeting is not NULL and active='Y' group by voicemail_id order by voicemail_id limit 10000;
bin/ADMIN_keepalive_ALL.pl:2420:UPDATE vicidial_voicemail SET voicemail_greeting='' where voicemail_greeting='---DELETE---' and voicemail_id=?/* $VG_voicemail_id */;
bin/ADMIN_keepalive_ALL.pl:2435:SELECT server_id FROM servers,system_settings where servers.server_ip=system_settings.active_voicemail_server;
bin/ADMIN_keepalive_ALL.pl:2465:UPDATE servers SET rebuild_conf_files='N' where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:2602:SELECT server_id,vicidial_recording_limit FROM servers where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:2618:SELECT server_ip,server_id,conf_secret FROM servers where server_ip!=?/* $server_ip */ and active_asterisk_server='Y' order by server_ip;
bin/ADMIN_keepalive_ALL.pl:2769:SELECT carrier_id,carrier_name,registration_string,template_id,account_entry,globals_string,dialplan_entry,carrier_description FROM vicidial_server_carriers where server_ip IN(?/* $server_ip */,'0.0.0.0') and active='Y' and protocol='IAX2' order by carrier_id;
bin/ADMIN_keepalive_ALL.pl:2795:SELECT template_contents FROM vicidial_conf_templates where template_id=?/* $template_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:2826:SELECT carrier_id,carrier_name,registration_string,template_id,account_entry,globals_string,dialplan_entry,carrier_description FROM vicidial_server_carriers where server_ip IN(?/* $server_ip */,'0.0.0.0') and active='Y' and protocol='SIP' order by carrier_id;
bin/ADMIN_keepalive_ALL.pl:2852:SELECT template_contents FROM vicidial_conf_templates where template_id=?/* $template_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:2886:SELECT extension,dialplan_number,voicemail_id,pass,template_id,conf_override,email,template_id,conf_override,outbound_cid,fullname,phone_context,phone_ring_timeout,conf_secret,delete_vm_after_email,codecs_list,codecs_with_template,voicemail_timezone,voicemail_options,voicemail_instructions,unavail_dialplan_fwd_exten,unavail_dialplan_fwd_context,conf_qualify FROM phones where server_ip=?/* $server_ip */ and protocol='IAX2' and active='Y' order by extension;
bin/ADMIN_keepalive_ALL.pl:2955:SELECT template_contents FROM vicidial_conf_templates where template_id=?/* $template_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:3053:SELECT extension,dialplan_number,voicemail_id,pass,template_id,conf_override,email,template_id,conf_override,outbound_cid,fullname,phone_context,phone_ring_timeout,conf_secret,delete_vm_after_email,codecs_list,codecs_with_template,voicemail_timezone,voicemail_options,voicemail_instructions,unavail_dialplan_fwd_exten,unavail_dialplan_fwd_context FROM phones where server_ip=?/* $server_ip */ and protocol='SIP' and active='Y' order by extension;
bin/ADMIN_keepalive_ALL.pl:3121:SELECT template_contents FROM vicidial_conf_templates where template_id=?/* $template_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:3215:SELECT extension,dialplan_number,fullname,server_ip FROM phones where server_ip NOT IN(?/* $server_ip */) and server_ip IN($active_server_ips) and dialplan_number NOT IN($active_dialplan_numbers'') and protocol IN('SIP','IAX2') and active='Y' order by dialplan_number,server_ip;
bin/ADMIN_keepalive_ALL.pl:3282:SELECT menu_id,menu_name,menu_prompt,menu_timeout,menu_timeout_prompt,menu_invalid_prompt,menu_repeat,menu_time_check,call_time_id,track_in_vdac,custom_dialplan_entry,tracking_group,dtmf_log,dtmf_field,qualify_sql,alt_dtmf_log,question FROM vicidial_call_menu order by menu_id;
bin/ADMIN_keepalive_ALL.pl:3326:SELECT option_value,option_description,option_route,option_route_value,option_route_value_context FROM vicidial_call_menu_options where menu_id=?/* $menu_id[$i] */ order by option_value;
bin/ADMIN_keepalive_ALL.pl:3571:SELECT dialplan_number,server_ip FROM phones where login=?/* $option_route_value[$j] */;
bin/ADMIN_keepalive_ALL.pl:3773:SELECT distinct(voicemail_id) FROM phones where active='Y' order by voicemail_id;
bin/ADMIN_keepalive_ALL.pl:3791:SELECT extension,pass,email,delete_vm_after_email,voicemail_timezone,voicemail_options FROM phones where active='Y' and voicemail_id=?/* $voicemail[$i] */;
bin/ADMIN_keepalive_ALL.pl:3817:SELECT voicemail_id,fullname,pass,email,delete_vm_after_email,voicemail_timezone,voicemail_options FROM vicidial_voicemail where active='Y';
bin/ADMIN_keepalive_ALL.pl:3856:SELECT conf_exten FROM vicidial_conferences where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:3880:SELECT conf_exten FROM conferences where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:3907:SELECT moh_id,moh_name,random FROM vicidial_music_on_hold where remove='N' and active='Y' and moh_id NOT IN('astdb','sounds','agi-bin','keys');
bin/ADMIN_keepalive_ALL.pl:4262:UPDATE servers SET system_uptime=?/* $system_uptime */ $asterisk_temp_no_restartSQL where server_ip=?/* $server_ip */;
bin/ADMIN_keepalive_ALL.pl:4318:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='SERVERS', event_type='RESET', record_id=?/* $server_ip */, event_code='AUTO RESTART ASTERISK', event_sql='', event_notes=?/* $system_uptime system uptime */;
bin/ADMIN_keepalive_ALL.pl:4329:INSERT INTO vicidial_admin_log set event_date=NOW(), user='VDAD', ip_address='1.1.1.1', event_section='SERVERS', event_type='RESET', record_id=?/* $server_ip */, event_code='AUTO START ASTERISK', event_sql='', event_notes=?/* $system_uptime system uptime */;
bin/ADMIN_keepalive_ALL.pl:4354:SELECT campaign_id,callback_useronly_move_minutes FROM vicidial_campaigns where active='Y' and callback_useronly_move_minutes > 0 order by campaign_id;
bin/ADMIN_keepalive_ALL.pl:4375:SELECT count(*) from vicidial_callbacks where campaign_id=?/* $CBcampaign_id[$i] */ and status='LIVE' and recipient='USERONLY' and callback_time < (NOW() - INTERVAL $CBcallback_useronly_move_minutes[$i] MINUTE);
bin/ADMIN_keepalive_ALL.pl:4389:UPDATE vicidial_callbacks SET recipient='ANYONE',status='ACTIVE' where campaign_id=?/* $CBcampaign_id[$i] */ and status='LIVE' and recipient='USERONLY' and callback_time < (NOW() - INTERVAL $CBcallback_useronly_move_minutes[$i] MINUTE);
bin/ADMIN_keepalive_ALL.pl:4418:SELECT cid_group_id,cid_auto_rotate_minutes,cid_auto_rotate_minimum,cid_auto_rotate_calls,cid_last_auto_rotate,cid_auto_rotate_cid,UTC_TIMESTAMP(cid_last_auto_rotate) FROM vicidial_cid_groups where cid_group_type='NONE' and cid_auto_rotate_minutes > 0 order by cid_group_id;
bin/ADMIN_keepalive_ALL.pl:4443:SELECT campaign_calldate,campaign_id,UTC_TIMESTAMP(campaign_calldate) from vicidial_campaigns where cid_group_id=?/* $cid_group_id[$i] */ order by campaign_calldate desc limit 1;
bin/ADMIN_keepalive_ALL.pl:4478:SELECT count(*) from vicidial_campaign_cid_areacodes where campaign_id=?/* $cid_group_id[$i] */ and cid_description NOT IN('NOROTATE','NO-ROTATE','NO_ROTATE','INACTIVE','DONOTUSE') and cid_description NOT LIKE \"%NOROTATE%\
bin/ADMIN_keepalive_ALL.pl:4500:SELECT outbound_cid from vicidial_campaign_cid_areacodes where campaign_id=?/* $cid_group_id[$i] */ and cid_description NOT IN('NOROTATE','NO-ROTATE','NO_ROTATE','INACTIVE','DONOTUSE') and cid_description NOT LIKE \"%NOROTATE%\" order by call_count_today limit 100000;
bin/ADMIN_keepalive_ALL.pl:4517:UPDATE vicidial_campaign_cid_areacodes SET cid_description=?/* $j */,active='N' where campaign_id=?/* $cid_group_id[$i] */ and outbound_cid=?/* $outbound_cid[$j] */;
bin/ADMIN_keepalive_ALL.pl:4520:UPDATE vicidial_campaign_cid_areacodes SET cid_description=?/* $dateint */,active='Y' where campaign_id=?/* $cid_group_id[$i] */ and outbound_cid=?/* $outbound_cid[$j] */;
bin/ADMIN_keepalive_ALL.pl:4527:UPDATE vicidial_cid_groups SET cid_auto_rotate_calls='0',cid_last_auto_rotate=NOW(),cid_auto_rotate_cid=?/* $outbound_cid[$j] */ where cid_group_id=?/* $cid_group_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:4549:SELECT outbound_cid from vicidial_campaign_cid_areacodes where campaign_id=?/* $cid_group_id[$i] */ and cid_description NOT IN('NOROTATE','NO-ROTATE','NO_ROTATE','INACTIVE','DONOTUSE') and cid_description NOT LIKE \"%NOROTATE%\" order by CAST(cid_description as SIGNED INTEGER) limit 1;
bin/ADMIN_keepalive_ALL.pl:4567:UPDATE vicidial_campaign_cid_areacodes SET cid_description=?/* $dateint */,active='Y' where campaign_id=?/* $cid_group_id[$i] */ and outbound_cid=?/* $outbound_cid_next */;
bin/ADMIN_keepalive_ALL.pl:4571:UPDATE vicidial_cid_groups SET cid_auto_rotate_calls='0',cid_last_auto_rotate=NOW(),cid_auto_rotate_cid=?/* $outbound_cid_next */ where cid_group_id=?/* $cid_group_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:4575:UPDATE vicidial_campaign_cid_areacodes SET active='N' where campaign_id=?/* $cid_group_id[$i] */ and outbound_cid=?/* $cid_auto_rotate_cid[$i] */;
bin/ADMIN_keepalive_ALL.pl:4671:SELECT trigger_id,user,trigger_lines,trigger_name FROM vicidial_process_triggers where server_ip=?/* $server_ip */ and trigger_run='1' and trigger_time < NOW() order by trigger_time limit 1;
bin/ADMIN_keepalive_ALL.pl:4687:UPDATE vicidial_process_triggers SET trigger_run='0' where trigger_id=?/* $trigger_id */;
bin/ADMIN_keepalive_ALL.pl:4722:INSERT INTO vicidial_process_trigger_log SET trigger_id=?/* $trigger_id */,user=?/* $user */,trigger_time=NOW(),server_ip=?/* $server_ip */,trigger_lines=?/* $trigger_lines */,trigger_results=?/* $trigger_results */;
bin/ADMIN_keepalive_ALL.pl:4741:SELECT report_id FROM vicidial_automated_reports where ( (report_server IN(?/* $server_ip */$THISserver_voicemailSQL) ) and ( ( (active='Y') and (report_times LIKE \"%$reset_test%\") and ( (report_weekdays LIKE \"%$wday%\") or (report_monthdays LIKE \"%$mday%\") ) ) or (run_now_trigger='Y') ) ) order by report_id limit 1000;
bin/ADMIN_keepalive_ALL.pl:4766:UPDATE vicidial_automated_reports SET run_now_trigger='N' where run_now_trigger='Y' and report_server IN(?/* $server_ip */$THISserver_voicemailSQL) and report_id=?/* $report_idARY[$r] */;
bin/ADMIN_keepalive_ALL.pl:4789:SELECT dl_id FROM vicidial_drop_lists where ( (dl_server IN(?/* $server_ip */$THISserver_voicemailSQL) ) and ( ( (active='Y') and (dl_times LIKE \"%$reset_test%\") and ( (dl_weekdays LIKE \"%$wday%\") or (dl_monthdays LIKE \"%$mday%\") ) ) or (run_now_trigger='Y') ) ) order by dl_id limit 1000;
bin/ADMIN_keepalive_ALL.pl:4814:UPDATE vicidial_drop_lists SET run_now_trigger='N' where run_now_trigger='Y' and dl_server IN(?/* $server_ip */$THISserver_voicemailSQL) and dl_id=?/* $dl_idARY[$r] */;
bin/ADMIN_keepalive_ALL.pl:4836:SELECT campaign_id,call_quota_lead_ranking FROM vicidial_campaigns where active='Y' and call_quota_lead_ranking!='DISABLED' limit 1000;
bin/ADMIN_keepalive_ALL.pl:4857:SELECT container_entry FROM vicidial_settings_containers where container_id=?/* $CQcall_quota_lead_rankingARY[$r] */;
bin/ADMIN_keepalive_ALL.pl:4921:UPDATE vicidial_campaign_agents set hopper_calls_hour='0';
bin/ADMIN_keepalive_ALL.pl:4939:SELECT list_id,daily_reset_limit,resets_today FROM vicidial_lists where reset_time LIKE \"%$reset_test%\
bin/ADMIN_keepalive_ALL.pl:4961:UPDATE vicidial_lists set resets_today=(resets_today + 1) where list_id=?/* $list_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:4964:UPDATE vicidial_list set called_since_last_reset='N' where list_id=?/* $list_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:4973:INSERT INTO vicidial_admin_log set event_date=?/* $now_date */, user='VDAD', ip_address='1.1.1.1', event_section='LISTS', event_type='RESET', record_id=?/* $list_id[$i] */, event_code='ADMIN RESET LIST', event_sql=?/* $SQL_log */, event_notes=?/* $affected_rowsB leads reset, list resets today: $resets_today[$i] */;
bin/ADMIN_keepalive_ALL.pl:4981:INSERT INTO vicidial_admin_log set event_date=?/* $now_date */, user='VDAD', ip_address='1.1.1.1', event_section='LISTS', event_type='RESET', record_id=?/* $list_id[$i] */, event_code='ADMIN RESET LIST FAILED', event_sql=\"Reset Limit Reached $daily_reset_limit[$i] / $resets_today[$i]\", event_notes='Reset failed';
bin/ADMIN_keepalive_ALL.pl:4994:SELECT list_id FROM vicidial_lists where active='Y' and expiration_date < \"$today_date\
bin/ADMIN_keepalive_ALL.pl:5012:UPDATE vicidial_lists set active='N' where list_id=?/* $expired_list_id[$i] */;
bin/ADMIN_keepalive_ALL.pl:5020:INSERT INTO vicidial_admin_log set event_date=?/* $now_date */, user='VDAD', ip_address='1.1.1.1', event_section='LISTS', event_type='MODIFY', record_id=?/* $expired_list_id[$i] */, event_code='ADMIN EXPIRED LIST INACTIVE', event_sql=?/* $SQL_log */, event_notes=?/* $affected_rows list expired */;
bin/AST_email_web_reportFTPSSL.pl:297:SELECT container_entry from vicidial_settings_containers where container_id=?/* $container_id */;
bin/AST_email_web_reportFTPSSL.pl:525:SELECT report_destination,email_from,email_to,email_subject,ftp_server,ftp_user,ftp_pass,ftp_directory,report_url,filename_override from vicidial_automated_reports where report_id=?/* $report_id */;
bin/AST_email_web_reportFTPSSL.pl:584:SELECT user from vicidial_admin_log where event_section='AUTOREPORTS' and record_id=?/* $report_id */ and event_type IN('ADD','MODIFY','COPY') order by admin_log_id desc limit 1;
bin/AST_email_web_reportFTPSSL.pl:600:SELECT pass,custom_five from vicidial_users where user=?/* $http_user */;
bin/AST_email_web_reportFTPSSL.pl:793:UPDATE vicidial_automated_reports set report_last_run=NOW(), report_last_length=?/* $secRUN */ where report_id=?/* $report_id */;
bin/AST_email_web_reportFTPSSL.pl:799:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $http_user */, ip_address=?/* $server_ip */, event_section='AUTOREPORTS', event_type='EXPORT', record_id=?/* $report_id */, event_code='ADMIN REPORT EXPORT RUN $report_destination', event_sql=?/* $location */, event_notes='Run time: $secRUN seconds. Sent $report_destination';
bin/AST_email_web_reportFTPSSL.pl:809:INSERT INTO vicidial_admin_log set event_date=NOW(), user=?/* $http_user */, ip_address=?/* $server_ip */, event_section='REPORTS', event_type='EXPORT', record_id='email_web_report', event_code='ADMIN REPORT EXPORT RUN', event_sql=?/* $location */, event_notes='Run time: $secRUN seconds';
bin/AST_lead_select_export.pl:388:SELECT lead_id,call_date,length_in_sec,phone_number,status,user,campaign_id,list_id from vicidial_closer_log where call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ $ingroupsSQL $statusesSQL;
bin/AST_lead_select_export.pl:428:SELECT lead_id,call_date,length_in_sec,phone_number,status,user,campaign_id,list_id from vicidial_closer_log_archive where call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ $ingroupsSQL $statusesSQL;
bin/AST_lead_select_export.pl:467:SELECT lead_id,call_date,length_in_sec,phone_number,status,user,campaign_id,list_id from vicidial_log where call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ $campaignsSQL $statusesSQL;
bin/AST_lead_select_export.pl:508:SELECT lead_id,call_date,length_in_sec,phone_number,status,user,campaign_id,list_id from vicidial_log_archive where call_date >= ?/* $shipdate 00:00:00 */ and call_date <= ?/* $shipdate_end 23:59:59 */ $campaignsSQL $statusesSQL;
bin/AST_lead_select_export.pl:592:SELECT entry_date,user,vendor_lead_code,source_id,list_id,gmt_offset_now,title,first_name,middle_initial,last_name,address1,address2,address3,city,state,province,postal_code,country_code,gender,date_of_birth,alt_phone,email,security_phrase,comments,called_count,last_local_call_time,rank,owner,entry_list_id from vicidial_list where lead_id=$L_lead_id;
bin/AST_lead_select_export.pl:671:SELECT $custom_columns from custom_$entry_list_id where lead_id=$L_lead_id;
bin/AST_update_AMI2.pl:154:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_update_AMI2.pl:194:SELECT count(*) FROM server_updater where server_ip=?/* $server_ip */;
bin/AST_update_AMI2.pl:205:INSERT INTO server_updater set server_ip=?/* $server_ip */, last_update=NOW();
bin/AST_update_AMI2.pl:233:CREATE TABLE cid_channels_recent_$PADserver_ip (caller_id_name VARCHAR(30) NOT NULL, connected_line_name VARCHAR(30) NOT NULL, call_date DATETIME, channel VARCHAR(100) DEFAULT '', dest_channel VARCHAR(100) DEFAULT '', linkedid VARCHAR(20) DEFAULT '', dest_uniqueid VARCHAR(20) DEFAULT '', uniqueid VARCHAR(20) DEFAULT '', index(call_date)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
bin/AST_update_AMI2.pl:569:UPDATE server_updater set last_update=NOW() where server_ip=?/* $server_ip */
bin/AST_update_AMI2.pl:974:DELETE FROM live_sip_channels where \n\t(" . $client_delete_sql . " )
bin/AST_update_AMI2.pl:984:DELETE FROM live_channels where \n\t(" . $trunk_delete_sql . " )
bin/AST_update_AMI2.pl:1017:INSERT IGNORE INTO $cid_channels_recent (caller_id_name, connected_line_name, call_date, channel, dest_channel, linkedid, dest_uniqueid, uniqueid) values \n\t
bin/AST_update_AMI2.pl:1037:DELETE pc1 FROM parked_channels pc1, parked_channels pc2 WHERE pc1.parked_time < pc2.parked_time AND pc1.parked_time <> pc2.parked_time AND pc1.channel = pc2.channel AND pc1.server_ip=?/* $server_ip */ and pc2.server_ip=?/* $server_ip */
bin/AST_update_AMI2.pl:1042:SELECT channel,extension,parked_time,UTC_TIMESTAMP(parked_time),channel_group FROM parked_channels where server_ip = ?/* $server_ip */ order by channel desc, parked_time desc;
bin/AST_update_AMI2.pl:1100:DELETE FROM parked_channels WHERE (" . $park_delete_sql . ") and server_ip=?/* $server_ip */
bin/AST_update_AMI2.pl:1217:UPDATE servers SET sysload=?/* $server_load */, channels_total=?/* $channel_counts->{'total'} */, cpu_idle_percent=?/* $cpu_idle_percent */, disk_usage=?/* $disk_usage */ where server_ip=?/* $server_ip */;
bin/AST_update_AMI2.pl:1231:INSERT INTO server_performance (start_time, server_ip, sysload, freeram, usedram, processes, channels_total, trunks_total, clients_total, clients_zap, clients_iax, clients_local, clients_sip, live_recordings, cpu_user_percent, cpu_system_percent, cpu_idle_percent, disk_reads, disk_writes) values( NOW(), ?/* $server_ip */, ?/* $server_load */, ?/* $mem_free */, ?/* $mem_used */, ?/* $num_processes */, ?/* $channel_counts->{'total'} */, ?/* $channel_counts->{'trunks'} */, ?/* $channel_counts->{'clients'} */, ?/* $channel_counts->{'dahdi'} */, ?/* $channel_counts->{'iax'} */, ?/* $channel_counts->{'local'} */, ?/* $channel_counts->{'sip'} */, '0', ?/* $cpu_user_percent */, ?/* $cpu_sys_percent */, ?/* $cpu_idle_percent */, ?/* $reads */, ?/* $writes */)
bin/AST_update_AMI2.pl:1246:SELECT sys_perf_log,vd_server_logs FROM servers where server_ip=?/* $server_ip */;
bin/AST_update_AMI2.pl:1264:SELECT extension, protocol FROM phones where server_ip=?/* $server_ip */ and phone_type NOT LIKE \"%trunk%\"
bin/AST_update_AMI2.pl:1315:SELECT channel,extension FROM live_channels where server_ip=?/* $server_ip */;
bin/AST_update_AMI2.pl:1324:SELECT channel,extension FROM live_sip_channels where server_ip=?/* $server_ip */;
bin/AST_conf_update_3way.pl:147:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vicidial_recording_limit,asterisk_version,vd_server_logs FROM servers where server_ip = ?/* $server_ip */;
bin/AST_conf_update_3way.pl:248:SELECT extension,conf_exten from vicidial_conferences where server_ip=?/* $server_ip */ and leave_3way='1';
bin/AST_conf_update_3way.pl:378:UPDATE vicidial_conferences set extension=?/* $PTextensions[$i] */ where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$i] */;
bin/AST_conf_update_3way.pl:401:INSERT INTO vicidial_manager values('','',?/* $now_date */,'NEW','N',?/* $server_ip */,'','Originate',?/* $queryCID */,'Channel: $kick_local_channel','Context: $ext_context','Exten: 8300','Priority: 1','Callerid: $queryCID','','','','','');
bin/AST_conf_update_3way.pl:409:UPDATE vicidial_conferences set extension=?/* $NEWexten[$i] */,leave_3way=?/* $leave_3waySQL */ where server_ip=?/* $server_ip */ and conf_exten=?/* $PT_conf_extens[$i] */;
bin/AST_conf_update_3way.pl:444:SELECT count(*) from system_settings where timeclock_end_of_day LIKE \"%$current_hourmin%\
bin/AST_SWAMPauto_dial.pl:201:INSERT INTO vicidial_manager values('','',?/* $SQLdate */,'NEW','N',?/* $SERVERtemp */,'','Originate','TESTCIDX$CIDdate$US$it','Channel: Local/$dialstring@$context','Context: $context','Exten: $exten','Priority: 1','Callerid: \"Inbound Test Call\" <$CIDtemp>','','','','','');
bin/VICIDIAL_rebuild_list_statuses.pl:190:select lead_id,phone_number,alt_phone from vicidial_list where status='NOUSE' $newlistidSQL;
bin/VICIDIAL_rebuild_list_statuses.pl:236:SELECT status,start_epoch,lead_id,call_date,user from vicidial_log where $searchSQL $oldlistidSQL order by call_date desc LIMIT 1;
bin/VICIDIAL_rebuild_list_statuses.pl:253:SELECT status,start_epoch,lead_id,call_date,user from vicidial_closer_log where $searchSQL $oldlistidSQL order by closecallid desc LIMIT 1;
bin/VICIDIAL_rebuild_list_statuses.pl:272:SELECT status,start_epoch,lead_id,call_date,user from vicidial_log where $searchSQL $oldlistidSQL order by call_date desc LIMIT 1;
bin/VICIDIAL_rebuild_list_statuses.pl:307:SELECT count(*) from vicidial_log where lead_id=?/* $OLDlead_id */ $oldlistidSQL;
bin/VICIDIAL_rebuild_list_statuses.pl:324:UPDATE vicidial_list set status=?/* $NEWstatus */,user=?/* $NEWuser */ $cc_and_llct_updateSQL where lead_id=?/* $lead_id[$b] */;
bin/AST_agent_week_tally.pl:176:select count(*) as calls, full_name,vicidial_users.user,sum(talk_sec),sum(pause_sec),sum(wait_sec),sum(dispo_sec) from vicidial_users,$vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $begindate 00:00:00 */ and vicidial_users.user=$vicidial_agent_log.user and pause_sec<48800 and wait_sec<48800 and talk_sec<48800 and dispo_sec<48800 group by vicidial_users.user order by full_name limit 10000;
bin/AST_agent_week_tally.pl:253:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $begindate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time limit 1;
bin/AST_agent_week_tally.pl:262:select event_time,UTC_TIMESTAMP(event_time) from $vicidial_agent_log where event_time <= ?/* $shipdate 23:59:59 */ and event_time >= ?/* $begindate 00:00:00 */ and user=?/* $aryA[2] */ order by event_time desc limit 1;
bin/ADMIN_reset_failed_count.pl:122:UPDATE vicidial_users set failed_login_count=0 where user=?/* $CLIuser */;
bin/ADMIN_update_archive_url.pl:114:SELECT recording_id, location from recording_log where location LIKE ?/* $old_url% */;
bin/ADMIN_update_archive_url.pl:136:UPDATE recording_log SET location=?/* $new_loc */ where recording_id=?/* $rec_id */;
bin/ADMIN_update_archive_url.pl:150:Updated $rec_count records in the recording_log table\n
bin/AST_manager_sip_AMI2.pl:116:SELECT telnet_host,telnet_port,ASTmgrUSERNAME,ASTmgrSECRET,ASTmgrUSERNAMEupdate,ASTmgrUSERNAMElisten,ASTmgrUSERNAMEsend,max_vicidial_trunks,answer_transfer_agent,local_gmt,ext_context,vd_server_logs,asterisk_version FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_sip_AMI2.pl:321:SELECT vd_server_logs FROM servers where server_ip = ?/* $server_ip */;
bin/AST_manager_sip_AMI2.pl:575:INSERT INTO vicidial_sip_event_log SET caller_code =?/* $call_id */, channel=?/* $event_hash{'Channel'} */, server_ip=?/* $event_hash{'ServerIP'} */, uniqueid=?/* $event_hash{'Uniqueid'} */, sip_call_id=?/* $event_hash{'SIPCallID'} */, event_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ), sip_event = 'INVITE'
bin/AST_manager_sip_AMI2.pl:582:INSERT INTO vicidial_sip_event_recent SET caller_code =?/* $call_id */, channel=?/* $event_hash{'Channel'} */, server_ip=?/* $event_hash{'ServerIP'} */, uniqueid=?/* $event_hash{'Uniqueid'} */, invite_date = FROM_UNIXTIME( $event_hash{'Timestamp'} )
bin/AST_manager_sip_AMI2.pl:626:INSERT INTO vicidial_sip_event_log SET caller_code =?/* $call_id */, channel=?/* $event_hash{'Channel'} */, server_ip=?/* $event_hash{'ServerIP'} */, uniqueid=?/* $event_hash{'Uniqueid'} */, sip_call_id=?/* $event_hash{'SIPCallID'} */, event_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ), sip_event = ?/* $event_hash{'Response'} */
bin/AST_manager_sip_AMI2.pl:635:UPDATE vicidial_sip_event_recent SET first_100_date = IF( first_100_date IS NULL, FROM_UNIXTIME( $event_hash{'Timestamp'} ), first_100_date), last_100_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */
bin/AST_manager_sip_AMI2.pl:639:UPDATE vicidial_sip_event_recent SET first_180_date = IF( first_180_date IS NULL, FROM_UNIXTIME( $event_hash{'Timestamp'} ), first_180_date), last_180_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */
bin/AST_manager_sip_AMI2.pl:643:UPDATE vicidial_sip_event_recent SET first_183_date = IF( first_183_date IS NULL, FROM_UNIXTIME( $event_hash{'Timestamp'} ), first_183_date), last_183_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */
bin/AST_manager_sip_AMI2.pl:647:UPDATE vicidial_sip_event_recent SET 200_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */
bin/AST_manager_sip_AMI2.pl:651:UPDATE vicidial_sip_event_recent SET error_date = FROM_UNIXTIME( $event_hash{'Timestamp'} ) where caller_code = ?/* $call_id */
