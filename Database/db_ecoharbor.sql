# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_ecoharbor
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2024-02-10 11:45:35
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
) AUTO_INCREMENT=15;



#
# Dumping data for table 'tbl_admin'
#

LOCK TABLES "tbl_admin" WRITE;
/*!40000 ALTER TABLE "tbl_admin" DISABLE KEYS;*/
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	(13,'Frankiln','franklin@gmail.com','Abcd@123');
REPLACE INTO "tbl_admin" ("admin_id", "admin_name", "admin_email", "admin_password") VALUES
	(14,'Ananthu','ananthu@gmail.com','Abcd@123');
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
) AUTO_INCREMENT=11;



#
# Dumping data for table 'tbl_agency'
#

LOCK TABLES "tbl_agency" WRITE;
/*!40000 ALTER TABLE "tbl_agency" DISABLE KEYS;*/
REPLACE INTO "tbl_agency" ("agency_name", "agency_logo", "agency_contact", "agency_email", "agency_proof", "agency_address", "agency_password", "agency_id") VALUES
	('Dani','AgencyLogo_1590.jpg','7894561212','dani@gmail.com','AgencyProof_1619.jpg','aaaaa','Abcd@1234',7);
REPLACE INTO "tbl_agency" ("agency_name", "agency_logo", "agency_contact", "agency_email", "agency_proof", "agency_address", "agency_password", "agency_id") VALUES
	('Ajay','AgencyLogo_1148.jpg','7894561212','ajay@gmail.com','AgencyProof_1631.jpg','aaavoly','Abcd@123',10);
/*!40000 ALTER TABLE "tbl_agency" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_location'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_location" (
  "location_id" int(50) NOT NULL auto_increment,
  "location_name" varchar(50) default NULL,
  PRIMARY KEY  ("location_id")
) AUTO_INCREMENT=33;



#
# Dumping data for table 'tbl_location'
#

LOCK TABLES "tbl_location" WRITE;
/*!40000 ALTER TABLE "tbl_location" DISABLE KEYS;*/
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(29,' Muvattupuzha');
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(30,' vazhakulam');
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(31,' Avoly');
REPLACE INTO "tbl_location" ("location_id", "location_name") VALUES
	(32,' thodu');
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
) AUTO_INCREMENT=17;



#
# Dumping data for table 'tbl_property'
#

LOCK TABLES "tbl_property" WRITE;
/*!40000 ALTER TABLE "tbl_property" DISABLE KEYS;*/
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(13,'100',36,'Abirami');
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(15,'22',37,'Liya');
REPLACE INTO "tbl_property" ("property_id", "property_no", "ward_id", "property_ownername") VALUES
	(16,'5',37,'Athulya');
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
) AUTO_INCREMENT=58;



#
# Dumping data for table 'tbl_request'
#

LOCK TABLES "tbl_request" WRITE;
/*!40000 ALTER TABLE "tbl_request" DISABLE KEYS;*/
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "request_status", "request_minimumamount", "actual_amount") VALUES
	(55,'2024-02-01',33,'1','0','0');
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "request_status", "request_minimumamount", "actual_amount") VALUES
	(56,'2024-02-01',34,'1','0','0');
REPLACE INTO "tbl_request" ("request_id", "request_date", "user_id", "request_status", "request_minimumamount", "actual_amount") VALUES
	(57,'2024-02-02',35,'1','0','0');
/*!40000 ALTER TABLE "tbl_request" ENABLE KEYS;*/
UNLOCK TABLES;


#
# Table structure for table 'tbl_requesttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_requesttype" (
  "requesttype_id" tinyint(4) NOT NULL auto_increment,
  "requesttype_status" varchar(50) default '0',
  "wastetype_id" int(10) default NULL,
  "request_id" int(10) default NULL,
  "requesttype_qty" varchar(100) default '0',
  PRIMARY KEY  ("requesttype_id")
) AUTO_INCREMENT=59;



#
# Dumping data for table 'tbl_requesttype'
#

LOCK TABLES "tbl_requesttype" WRITE;
/*!40000 ALTER TABLE "tbl_requesttype" DISABLE KEYS;*/
REPLACE INTO "tbl_requesttype" ("requesttype_id", "requesttype_status", "wastetype_id", "request_id", "requesttype_qty") VALUES
	(55,'0',9,55,'0');
REPLACE INTO "tbl_requesttype" ("requesttype_id", "requesttype_status", "wastetype_id", "request_id", "requesttype_qty") VALUES
	(56,'0',16,55,'0');
REPLACE INTO "tbl_requesttype" ("requesttype_id", "requesttype_status", "wastetype_id", "request_id", "requesttype_qty") VALUES
	(57,'0',16,56,'0');
REPLACE INTO "tbl_requesttype" ("requesttype_id", "requesttype_status", "wastetype_id", "request_id", "requesttype_qty") VALUES
	(58,'0',9,57,'0');
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
);



#
# Dumping data for table 'tbl_transaction'
#

# No data found.



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
) AUTO_INCREMENT=39;



#
# Dumping data for table 'tbl_user'
#

LOCK TABLES "tbl_user" WRITE;
/*!40000 ALTER TABLE "tbl_user" DISABLE KEYS;*/
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Abirami','7894561259','abirami@gmail.com','Female','perumbavoor',36,'UserPhoto_2079.png','100','Abcd@123',33,'Adproof_1143.png','2','0');
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Liya','7894561212','Ashwin@gmail.com','Female','yfgfhg',37,'UserPhoto_1454.png','22','Abcd@123',35,'Adproof_1799.png','3','0');
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Athulya','7894561212','athulya@gmail.com','Female','thottyill',37,'UserPhoto_1965.png','5','Abcd@123',36,'Adproof_1627.png','1','0');
REPLACE INTO "tbl_user" ("user_name", "user_contact", "user_email", "user_gender", "user_address", "ward_id", "user_photo", "user_propertyno", "user_password", "user_id", "user_adproof", "user_status", "user_wallet") VALUES
	('Baskaran','7894561212','baskaran@gmail.com','Male','yfgfhg',38,'UserPhoto_1133.png','588','Abcd@123',38,'Adproof_2022.png','0','0');
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
) AUTO_INCREMENT=39;



#
# Dumping data for table 'tbl_ward'
#

LOCK TABLES "tbl_ward" WRITE;
/*!40000 ALTER TABLE "tbl_ward" DISABLE KEYS;*/
REPLACE INTO "tbl_ward" ("ward_id", "ward_no", "location_id") VALUES
	(36,'1',29);
REPLACE INTO "tbl_ward" ("ward_id", "ward_no", "location_id") VALUES
	(37,'2',30);
REPLACE INTO "tbl_ward" ("ward_id", "ward_no", "location_id") VALUES
	(38,'3',31);
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
) AUTO_INCREMENT=19;



#
# Dumping data for table 'tbl_wastetype'
#

LOCK TABLES "tbl_wastetype" WRITE;
/*!40000 ALTER TABLE "tbl_wastetype" DISABLE KEYS;*/
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('9','paper','25');
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('16','Plastic','12');
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('17','rubber','50');
REPLACE INTO "tbl_wastetype" ("wastetype_id", "wastetype_name", "wastetype_rate") VALUES
	('18','plastic','55');
/*!40000 ALTER TABLE "tbl_wastetype" ENABLE KEYS;*/
UNLOCK TABLES;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
