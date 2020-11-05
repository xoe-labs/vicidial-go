CREATE TABLE vicidial_campaign_dnc (
phone_number VARCHAR(18) NOT NULL,
campaign_id VARCHAR(8) NOT NULL,
index (phone_number),
unique index phonecamp (phone_number, campaign_id)
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1805 */


/* name: GetVicidialCampaignDnc :many */
SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* VD_alt_phone */,?/* alt_areacode */) and campaign_id=?/* temp_campaign_id */;



/* bin/FastAGI_log.pl:1808 */


/* name: GetVicidialCampaignDnc :many */
SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* VD_alt_phone */ and campaign_id=?/* temp_campaign_id */;



/* bin/FastAGI_log.pl:1887 */


/* name: GetVicidialCampaignDnc :many */
SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* VD_address3 */,?/* alt_areacode */) and campaign_id=?/* temp_campaign_id */;



/* bin/FastAGI_log.pl:1890 */


/* name: GetVicidialCampaignDnc :many */
SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* VD_address3 */ and campaign_id=?/* temp_campaign_id */;



/* bin/FastAGI_log.pl:2007 */


/* name: GetVicidialCampaignDnc :many */
SELECT count(*) FROM vicidial_campaign_dnc where phone_number IN(?/* VD_altdial_phone */,?/* ap_areacode */) and campaign_id=?/* temp_campaign_id */;



/* bin/FastAGI_log.pl:2010 */


/* name: GetVicidialCampaignDnc :many */
SELECT count(*) FROM vicidial_campaign_dnc where phone_number=?/* VD_altdial_phone */ and campaign_id=?/* temp_campaign_id */;
