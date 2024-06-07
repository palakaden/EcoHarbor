# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_ecoharbor
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-06-07 08:31:17
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_ecoharbor'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_ecoharbor" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_ecoharbor";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(100) NOT NULL auto_increment,
  "admin_name" varchar(100) default NULL,
  "admin_email" varchar(100) default NULL,
  "admin_password" varchar(100) default NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=16;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	(15,'MAJOR SREEKUMAR ','sreekumar@gmail.com','Abcd@123');
/*!40000 ALTER TABLE "tbl_admin" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_agency'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_agency" (
  "agency_name" varchar(100) default NULL,
  "agency_logo" varchar(100) default NULL,
  "agency_contact" varchar(100) default NULL,
  "agency_email" varchar(100) default NULL,
  "agency_proof" varchar(100) default NULL,
  "agency_address" varchar(100) default NULL,
  "agency_password" varchar(100) default NULL,
  "agency_id" int(11) NOT NULL auto_increment,
  PRIMARY KEY  ("agency_id")
) AUTO_INCREMENT=13;



#
# Dumping data for table 'tbl_agency'
#

LOCK TABLES "tbl_agency" WRITE;
/*!40000 ALTER TABLE "tbl_agency" DISABLE KEYS;*/
REPLACE INTO "tbl_agency" ("agency_name", "agency_logo", "agency_contact", "agency_email", "agency_proof", "agency_address", "agency_password", "agency_id") VALUES
	('Arakkal Abu','AgencyLogo_2040.jpg','7894561212','abu@gmail.com','AgencyProof_2059.jpg','perumbavoor','Abcd@123',12);
/*!40000 ALTER TABLE "tbl_agency" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) NOT NULL auto_increment,
  "complaint_content" varchar(200) default NULL,
  "complaint_date" varchar(100) default NULL,
  "complaint_reply" varchar(250) default NULL,
  "user_id" int(10) unsigned default NULL,
  "complaint_status" varchar(50) default '0',
  "agency_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("complaint_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_complaint'
#

LOCK TABLES "tbl_complaint" WRITE;
/*!40000 ALTER TABLE "tbl_complaint" DISABLE KEYS;*/
REPLACE INTO "tbl_complaint" ("complaint_id", "complaint_content", "complaint_date", "complaint_reply", "user_id", "complaint_status", "agency_id") VALUES
	(1,'not proper','2024-06-07',NULL,'76','0',NULL);
/*!40000 ALTER TABLE "tbl_complaint" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(11) NOT NULL auto_increment,
  "feedback_content" varchar(250) default NULL,
  "feedback_date" varchar(100) default NULL,
  "user_id" int(10) unsigned default NULL,
  "agency_id" int(10) unsigned default NULL,
  PRIMARY KEY  ("feedback_id")
) AUTO_INCREMENT=2;



#
# Dumping data for table 'tbl_feedback'
#

LOCK TABLES "tbl_feedback" WRITE;
/*!40000 ALTER TABLE "tbl_feedback" DISABLE KEYS;*/
REPLACE INTO "tbl_feedback" ("feedback_id", "feedback_content", "feedback_date", "user_id", "agency_id") VALUES
	(1,'very bad','2024-06-07','76',NULL);
/*!40000 ALTER TABLE "tbl_feedback" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_location'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_location" (
  "location_id" int(50) NOT NULL auto_increment,
  "location_name" varchar(50) default NULL,
  PRIMARY KEY  ("location_id")
) AUTO_INCREMENT=85;



#
# Dumping data for table 'tbl_location'
#

LOCK TABLES "tbl_location" WRITE;
/*!40000 ALTER TABLE "tbl_location" DISABLE KEYS;*/
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(80,' Kizhakkekkara');
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(81,' Randar');
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(82,' Kottappuram');
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(84,' Thiruvumplavu Kshetram');
/*!40000 ALTER TABLE "tbl_location" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_property'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_property" (
  "property_id" int(11) NOT NULL auto_increment,
  "property_no" varchar(100) default NULL,
  "ward_id" int(11) default NULL,
  "property_ownername" varchar(100) default NULL,
  PRIMARY KEY  ("property_id")
) AUTO_INCREMENT=46;



#
# Dumping data for table 'tbl_property'
#

LOCK TABLES "tbl_property" WRITE;
/*!40000 ALTER TABLE "tbl_property" DISABLE KEYS;*/
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(30,'5',52,'Dhashamoolam Dhamu');
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(34,'3',54,'Mahadevan');
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(39,'5',51,'Franklin');
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(44,'5',54,'Ajay');
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(45,'3',51,'Arun');
/*!40000 ALTER TABLE "tbl_property" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_request'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_request" (
  "request_id" int(100) NOT NULL auto_increment,
  "request_date" varchar(50) default NULL,
  "user_id" int(11) default NULL,
  "request_status" varchar(10) default '0',
  "request_minimumamount" varchar(100) default '0',
  "actual_amount" varchar(100) default '0',
  PRIMARY KEY  ("request_id")
) AUTO_INCREMENT=19;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "request_status", "request_minimumamount", "actual_amount") VALUES
	(18,'2024-06-07',76,'3','75','15');
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_requesttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_requesttype" (
  "requesttype_id" int(11) NOT NULL auto_increment,
  "requesttype_status" varchar(50) default '0',
  "wastetype_id" int(10) default NULL,
  "request_id" int(10) default NULL,
  "requesttype_qty" varchar(100) default '0',
  PRIMARY KEY  ("requesttype_id")
) AUTO_INCREMENT=30;



#
# Dumping data for table 'tbl_requesttype'
#

LOCK TABLES "tbl_requesttype" WRITE;
/*!40000 ALTER TABLE "tbl_requesttype" DISABLE KEYS;*/
REPLACE INTO "tbl_requesttype" ("requesttype_id", "requesttype_status", "wastetype_id", "request_id", "requesttype_qty") VALUES
	(28,'0',9,18,'2');
REPLACE INTO "tbl_requesttype" ("requesttype_id", "requesttype_status", "wastetype_id", "request_id", "requesttype_qty") VALUES
	(29,'0',17,18,'2');
/*!40000 ALTER TABLE "tbl_requesttype" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_transaction'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_transaction" (
  "transaction_id" int(50) NOT NULL auto_increment,
  "transaction_date" varchar(50) default NULL,
  "transaction_type" varchar(100) default NULL,
  "transaction_amount" varchar(100) default '0',
  "user_id" int(11) unsigned default NULL,
  PRIMARY KEY  ("transaction_id")
) AUTO_INCREMENT=47;



#
# Dumping data for table 'tbl_transaction'
#

LOCK TABLES "tbl_transaction" WRITE;
/*!40000 ALTER TABLE "tbl_transaction" DISABLE KEYS;*/
REPLACE INTO "tbl_transaction" ("transaction_id", "transaction_date", "transaction_type", "transaction_amount", "user_id") VALUES
	(44,'2024-06-07','Wallet Amount','500','76');
REPLACE INTO "tbl_transaction" ("transaction_id", "transaction_date", "transaction_type", "transaction_amount", "user_id") VALUES
	(45,'2024-06-07','Min amount','75','76');
REPLACE INTO "tbl_transaction" ("transaction_id", "transaction_date", "transaction_type", "transaction_amount", "user_id") VALUES
	(46,'2024-06-07','Actual amount','15','76');
/*!40000 ALTER TABLE "tbl_transaction" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_name" varchar(100) NOT NULL default '',
  "user_contact" varchar(100) NOT NULL default '',
  "user_email" varchar(100) NOT NULL default '',
  "user_gender" varchar(100) NOT NULL default '',
  "user_address" varchar(100) NOT NULL default '',
  "ward_id" int(10) NOT NULL default '0',
  "user_photo" varchar(100) NOT NULL default '',
  "user_propertyno" varchar(100) NOT NULL default '',
  "user_password" varchar(100) NOT NULL default '',
  "user_id" int(10) NOT NULL auto_increment,
  "user_adproof" varchar(100) default NULL,
  "user_status" varchar(50) default '0',
  "user_wallet" varchar(100) default '0',
  PRIMARY KEY  ("user_id")
) AUTO_INCREMENT=77;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Stephen Nedumpally','9876543210','stephen@gmail.com','Male','nedupalill house',53,'UserPhoto_1758.jpg','4','Abcd@123',73,'Adproof_1233.jpg','0','0');
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Franklin','8974561230','franklin@gmail.com','Male','thottmari(h)',51,'UserPhoto_1700.jpg','5','Abcd@123',74,'Adproof_1780.jpg','1','0');
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Arun','7012178498','arun@gmail.com','Male','www',51,'UserPhoto_1084.jpg','3','Abcd@123',75,'Adproof_1115.jpg','3','0');
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Mahadevan','9654781230','mahadevan@gmail.com','Male','edaakattill(h)',54,'UserPhoto_1661.jpg','3','Abcd@123',76,'Adproof_1576.jpg','2','410');
/*!40000 ALTER TABLE "tbl_user" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_ward'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_ward" (
  "ward_id" int(11) NOT NULL auto_increment,
  "ward_no" varchar(50) NOT NULL,
  "location_id" int(11) NOT NULL,
  PRIMARY KEY  ("ward_id")
) AUTO_INCREMENT=55;



#
# Dumping data for table 'tbl_ward'
#

LOCK TABLES "tbl_ward" WRITE;
/*!40000 ALTER TABLE "tbl_ward" DISABLE KEYS;*/
REPLACE INTO "tbl_ward" ("ward_id", "ward_no", "location_id") VALUES
	(51,'1',80);
REPLACE INTO "tbl_ward" ("ward_id", "ward_no", "location_id") VALUES
	(52,'2',81);
REPLACE INTO "tbl_ward" ("ward_id", "ward_no", "location_id") VALUES
	(53,'3',82);
REPLACE INTO "tbl_ward" ("ward_id", "ward_no", "location_id") VALUES
	(54,'4',84);
/*!40000 ALTER TABLE "tbl_ward" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_wastetype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wastetype" (
  "wastetype_id" int(10) unsigned NOT NULL auto_increment,
  "wastetype_name" varchar(50) default NULL,
  "wastetype_rate" varchar(50) default NULL,
  PRIMARY KEY  ("wastetype_id")
) AUTO_INCREMENT=20;



#
# Dumping data for table 'tbl_wastetype'
#

LOCK TABLES "tbl_wastetype" WRITE;
/*!40000 ALTER TABLE "tbl_wastetype" DISABLE KEYS;*/
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('9','paper','25');
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('16','plastic','12');
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('17','Rubber','50');
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('18','Thermocol','10');
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('19','Textile Waste','22');
/*!40000 ALTER TABLE "tbl_wastetype" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
