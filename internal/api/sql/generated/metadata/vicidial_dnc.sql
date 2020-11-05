CREATE TABLE vicidial_dnc (
phone_number VARCHAR(18) PRIMARY KEY
) ENGINE=MyISAM;



/* bin/FastAGI_log.pl:1781 */


/* name: GetVicidialDnc :many */
SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* VD_alt_phone */,?/* alt_areacode */);



/* bin/FastAGI_log.pl:1784 */


/* name: GetVicidialDnc :many */
SELECT count(*) FROM vicidial_dnc where phone_number=?/* VD_alt_phone */;



/* bin/FastAGI_log.pl:1863 */


/* name: GetVicidialDnc :many */
SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* VD_address3 */,?/* addr3_areacode */);



/* bin/FastAGI_log.pl:1866 */


/* name: GetVicidialDnc :many */
SELECT count(*) FROM vicidial_dnc where phone_number=?/* VD_address3 */;



/* bin/FastAGI_log.pl:1982 */


/* name: GetVicidialDnc :many */
SELECT count(*) FROM vicidial_dnc where phone_number IN(?/* VD_altdial_phone */,?/* ad_areacode */);



/* bin/FastAGI_log.pl:1985 */


/* name: GetVicidialDnc :many */
SELECT count(*) FROM vicidial_dnc where phone_number=?/* VD_altdial_phone */;
