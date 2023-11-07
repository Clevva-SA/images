SET FOREIGN_KEY_CHECKS=0; SET UNIQUE_CHECKS=0; 
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `accountguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `accountnumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `oldaccountnumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `referencenumber` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `accounttype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `accountentity` enum('company','person','other') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `othername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `classid` int unsigned DEFAULT NULL,
  `companyid` int unsigned DEFAULT NULL,
  `personid` int unsigned DEFAULT NULL,
  `currencyid` int unsigned DEFAULT NULL,
  `pricebookid` int unsigned DEFAULT NULL,
  `minimumprice_pricebookid` int unsigned DEFAULT NULL,
  `warehouseid` int unsigned DEFAULT NULL,
  `ext_branchcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `defaulttaxcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `blocked` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `restrictedaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`accountid`),
  UNIQUE KEY `uk_systemaccountid_accountnumber` (`systemaccountid`,`accountnumber`),
  KEY `fk_account_company` (`companyid`),
  KEY `fk_account_person` (`personid`),
  KEY `fk_account_systemaccount` (`systemaccountid`),
  KEY `fk_account_currency` (`currencyid`),
  KEY `fk_account_pricebook` (`pricebookid`),
  KEY `idx_account_guid` (`accountguid`),
  KEY `idx_account_systemaccountid_datedeleted` (`systemaccountid`,`datedeleted`),
  KEY `fk_minimumprice_pricebookid` (`minimumprice_pricebookid`),
  KEY `idx_account_systemaccount_accountentity` (`systemaccountid`,`accountentity`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`currencyid`) REFERENCES `currency` (`currencyid`),
  CONSTRAINT `fk_account_company` FOREIGN KEY (`companyid`) REFERENCES `company` (`companyid`),
  CONSTRAINT `fk_account_person` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`),
  CONSTRAINT `fk_account_pricebook` FOREIGN KEY (`pricebookid`) REFERENCES `pricebook` (`pricebookid`),
  CONSTRAINT `fk_account_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_minimumprice_pricebookid` FOREIGN KEY (`minimumprice_pricebookid`) REFERENCES `pricebook` (`pricebookid`)
) ENGINE=InnoDB AUTO_INCREMENT=161966  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountaddressmap` (
  `accountaddressmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int unsigned NOT NULL,
  `addressid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `accountaddressmapguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`accountaddressmapid`),
  KEY `idx_account` (`accountid`),
  KEY `idx_address` (`addressid`),
  KEY `idx_accountaddressmap_guid` (`accountaddressmapguid`),
  CONSTRAINT `fk_accountaddressmap_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_accountaddressmap_address` FOREIGN KEY (`addressid`) REFERENCES `address` (`addressid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountcontactmap` (
  `accountcontactmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int unsigned NOT NULL,
  `contactid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `accountcontactmapguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`accountcontactmapid`),
  KEY `idx_accountcontactmap_accountcontactmapguid` (`accountcontactmapguid`),
  KEY `idx_accountcontactmap_account` (`accountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountmodify` (
  `accounts` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountpersonmap` (
  `accountpersonmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `accountpersonmapguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `accountid` int unsigned NOT NULL,
  `personid` int unsigned NOT NULL,
  `position` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ext_personcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`accountpersonmapid`),
  KEY `fk_accountpersonmap_account` (`accountid`),
  KEY `fk_accountpersonmap_person` (`personid`),
  KEY `idx_accountpersonmap_guid` (`accountpersonmapguid`),
  CONSTRAINT `fk_accountpersonmap_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_accountpersonmap_person` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountpropertyvaluemap` (
  `accountpropertyvaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `objecttable` enum('processinstance','activity','account') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'account',
  `accountid` int unsigned DEFAULT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  `group_guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processinstanceid` int unsigned DEFAULT NULL,
  `activityid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`accountpropertyvaluemapid`),
  KEY `idx_apvm_propertyvalueid` (`propertyvalueid`),
  KEY `idx_apvm_accountid` (`accountid`,`objecttable`),
  KEY `idx_apvm_processinstanceid` (`processinstanceid`,`objecttable`),
  KEY `idx_apvm_activityid` (`activityid`,`objecttable`),
  KEY `idx_apvm_processinstanceobjectid` (`processinstanceobjectid`),
  CONSTRAINT `fk_apvm_accountid` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_apvm_activityid` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_apvm_processinstanceid` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_apvm_processinstanceobjectid` FOREIGN KEY (`processinstanceobjectid`) REFERENCES `processinstanceobject` (`processinstanceobjectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_apvm_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2340165  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountusermap` (
  `accountusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `roleid` int unsigned DEFAULT NULL,
  `type` enum('linked','primary') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'linked',
  `segmentation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ext_repcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `recurringactivity_freq_weeks` int DEFAULT NULL,
  `recurringactivity_mon` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `recurringactivity_tue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `recurringactivity_wed` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `recurringactivity_thu` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `recurringactivity_fri` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `recurringactivity_sat` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `recurringactivity_sun` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`accountusermapid`),
  UNIQUE KEY `idx_accountusermap` (`accountid`,`userid`,`roleid`),
  KEY `fk_accountusermap_account` (`accountid`),
  KEY `fk_accountusermap_user` (`userid`),
  KEY `fk_accountusermap_role` (`roleid`),
  KEY `idx_accountusermap_accountid_userid_datedeleted` (`accountid`,`userid`,`datedeleted`),
  CONSTRAINT `fk_accountusermap_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_accountusermap_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `fk_accountusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acl` (
  `aclid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned DEFAULT '0',
  `edit_userids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `view_userids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `code` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`aclid`),
  UNIQUE KEY `uk_acl_name_systemaccountid` (`name`,`systemaccountid`),
  KEY `idx_acl_systemaccountid` (`systemaccountid`),
  KEY `idx_classid` (`classid`),
  CONSTRAINT `fk_acl_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=21  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activityid` int unsigned NOT NULL AUTO_INCREMENT,
  `hashid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `activitynumber` int unsigned NOT NULL,
  `activityguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesquoteid` int unsigned DEFAULT NULL,
  `incidentid` int unsigned DEFAULT NULL,
  `responsibilityid` int unsigned DEFAULT NULL,
  `departmentid` int unsigned DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `duedate` datetime DEFAULT NULL,
  `state` enum('notstarted','inprogress','complete') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `activitytype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `activitytypedate` datetime DEFAULT NULL,
  `activitystatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `activitypriority` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `processactivitytemplateid` int unsigned DEFAULT NULL,
  `auto_activity_processinstanceid` int DEFAULT NULL,
  `eventlogid` int unsigned DEFAULT NULL,
  `templink1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `templink2` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`activityid`),
  KEY `fk_activity_systemaccount` (`systemaccountid`),
  KEY `idx_activity_hashid` (`hashid`),
  KEY `idx_activity_activitytype` (`activitytype`),
  KEY `idx_activity_activitynumber` (`activitynumber`),
  KEY `idx_activity_activitystatus` (`activitystatus`),
  KEY `fk_activity_departmentid` (`departmentid`),
  KEY `idx_activity_systemaccountid_activitynuber` (`systemaccountid`,`activitynumber`),
  KEY `fk_activity_salesquoteid_idx` (`salesquoteid`),
  CONSTRAINT `fk_activity_departmentid` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`),
  CONSTRAINT `fk_activity_salesquoteid` FOREIGN KEY (`salesquoteid`) REFERENCES `salesquote` (`salesquoteid`),
  CONSTRAINT `fk_activity_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=1315925  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitylog` (
  `activitylogid` int unsigned NOT NULL AUTO_INCREMENT,
  `activityid` int unsigned NOT NULL,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  `logicid` int unsigned DEFAULT NULL,
  `logic_eval` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`activitylogid`),
  KEY `idx_activitylog_activityid` (`activityid`),
  KEY `idx_activitylog_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `idx_activitylog_logicid` (`logicid`),
  KEY `idx_activitylog_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_activitylog_activityid` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`),
  CONSTRAINT `fk_activitylog_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityobjectmap` (
  `activityobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `activityid` int unsigned NOT NULL,
  `objecttable` enum('account','challenge','class','document','item','person','process','solution','salesopportunity','salesquote','salesorder','salesinvoice') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `objectid` int unsigned DEFAULT NULL,
  `rank` int DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`activityobjectmapid`),
  UNIQUE KEY `idx_activityobjectmap` (`activityid`,`objecttable`,`objectid`),
  KEY `fk_classusermap_class` (`activityid`),
  KEY `idx_activityobject` (`objecttable`,`objectid`),
  CONSTRAINT `fk_activityobjectmap_activity` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitysession` (
  `activitysessionid` int unsigned NOT NULL AUTO_INCREMENT,
  `activityid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `deviceid` int unsigned DEFAULT NULL,
  `startdatetime` datetime NOT NULL,
  `enddatetime` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`activitysessionid`),
  KEY `fk_activitysession_activity` (`activityid`),
  KEY `fk_activitysession_user` (`userid`),
  KEY `fk_activitysession_device` (`deviceid`),
  CONSTRAINT `fk_activitysession_activity` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`),
  CONSTRAINT `fk_activitysession_device` FOREIGN KEY (`deviceid`) REFERENCES `device` (`deviceid`),
  CONSTRAINT `fk_activitysession_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityusermap` (
  `activityusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `activityid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `action` enum('responsible','view') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`activityusermapid`),
  UNIQUE KEY `idx_activityusermap` (`activityid`,`userid`,`action`),
  KEY `fk_activityusermap_activity` (`activityid`),
  KEY `fk_activityusermap_user` (`userid`),
  CONSTRAINT `fk_activityusermap_activity` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`),
  CONSTRAINT `fk_activityusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressid` int unsigned NOT NULL AUTO_INCREMENT,
  `addresstype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `addressname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `line1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `line2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `line3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `line4` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `line5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `postcode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `addressguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`addressid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addtosalesquote` (
  `addtosalesquoteid` int unsigned NOT NULL AUTO_INCREMENT,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `itemid` int unsigned DEFAULT NULL,
  `itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`addtosalesquoteid`),
  KEY `idx_addtosalesquote_itemid` (`itemid`),
  KEY `idx_addtosalesquote_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_addtosalesquote_itemid` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_addtosalesquote_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addtosalesquoteitem` (
  `addtosalesquoteitemid` int unsigned NOT NULL AUTO_INCREMENT,
  `addtosalesquoteid` int unsigned NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `itemid` int unsigned DEFAULT NULL,
  `itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`addtosalesquoteitemid`),
  UNIQUE KEY `uk_addtosalesquoteitem` (`addtosalesquoteid`,`itemid`,`itemtypesection`),
  KEY `idx_addtosalesquoteitem_addtosalesquoteid` (`addtosalesquoteid`),
  KEY `idx_addtosalesquoteitem_itemid` (`itemid`),
  KEY `idx_addtosalesquoteitem_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_addtosalesquoteitem_addtosalesquoteid` FOREIGN KEY (`addtosalesquoteid`) REFERENCES `addtosalesquote` (`addtosalesquoteid`),
  CONSTRAINT `fk_addtosalesquoteitem_itemid` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_addtosalesquoteitem_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agreement` (
  `agreementid` int unsigned NOT NULL AUTO_INCREMENT,
  `agreementguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `type` enum('enduser','enterprise') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'enduser',
  `systemdefault` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `version` float unsigned NOT NULL DEFAULT '1',
  `priority` int unsigned DEFAULT NULL,
  `text` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `acceptance_period_days` int unsigned NOT NULL DEFAULT '0',
  `status` enum('unverified','verified') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'verified',
  `date_published` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`agreementid`)
) ENGINE=InnoDB AUTO_INCREMENT=3  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agreementusermap` (
  `agreementusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `agreementid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `status` enum('linked','viewed','skipped','agreed') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'viewed',
  `date_viewed` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`agreementusermapid`),
  UNIQUE KEY `idx_agreementusermap` (`agreementid`,`userid`),
  KEY `idx_agreementusermap_systemaccountid` (`systemaccountid`),
  KEY `idx_agreementusermap_agreementid` (`agreementid`),
  KEY `idx_agreementusermap_userid` (`userid`),
  CONSTRAINT `fk_agreementusermap_agreement` FOREIGN KEY (`agreementid`) REFERENCES `agreement` (`agreementid`),
  CONSTRAINT `fk_agreementusermap_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_agreementusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1905  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apilog` (
  `apilogid` int unsigned NOT NULL AUTO_INCREMENT,
  `apikey` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `method` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `host` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `basepath` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `path` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `hourgroup` int unsigned NOT NULL,
  `request` longblob,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`apilogid`),
  KEY `idx_apilog_systemaccountid` (`systemaccountid`),
  KEY `idx_apilog_createdbyuserid` (`createdbyuserid`),
  KEY `idx_apilog_hourgroup` (`systemaccountid`,`createdbyuserid`,`hourgroup`)
) ENGINE=InnoDB AUTO_INCREMENT=2072580  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apiratelimit` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identity` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `systemaccountid` int unsigned DEFAULT '0',
  `userid` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_identity` (`identity`),
  KEY `idx_ts` (`ts`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  KEY `idx_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8779  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `applicationid` int unsigned NOT NULL AUTO_INCREMENT,
  `applicationguid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=7  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicationregionmap` (
  `applicationregionmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `applicationid` int unsigned NOT NULL,
  `regionid` int unsigned NOT NULL,
  `domainname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `currencyid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`applicationregionmapid`),
  KEY `fk_applicationregionmap_region` (`regionid`),
  KEY `fk_applicationregionmap_application` (`applicationid`),
  CONSTRAINT `fk_applicationregionmap_application` FOREIGN KEY (`applicationid`) REFERENCES `application` (`applicationid`),
  CONSTRAINT `fk_applicationregionmap_region` FOREIGN KEY (`regionid`) REFERENCES `region` (`regionid`)
) ENGINE=InnoDB AUTO_INCREMENT=11  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculation` (
  `calculationid` int unsigned NOT NULL AUTO_INCREMENT,
  `calculationtype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `quotetype_metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `qnty_from` float DEFAULT NULL,
  `qnty_to` float DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_x_qnty` double DEFAULT NULL,
  `warranty_metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `percent_of_subtotal` float DEFAULT NULL,
  `pricing_level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `add_software_to_existing_contract` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `nod32included` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int NOT NULL,
  `updatedbyuserid` int DEFAULT NULL,
  `deletedbyuserid` int DEFAULT NULL,
  PRIMARY KEY (`calculationid`),
  KEY `systemaccountid` (`systemaccountid`),
  CONSTRAINT `calculation_ibfk_1` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge` (
  `challengeid` int unsigned NOT NULL AUTO_INCREMENT,
  `extchallengeno` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `categorycode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `criteriastatus` enum('incomplete','complete') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'incomplete',
  `allcriteriasetsgenerated` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `criteriasetsrequired` int unsigned DEFAULT NULL,
  `restoredeletedcriteriasets` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `generatecriteriasetsdate` datetime DEFAULT NULL,
  `clientaccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `useraccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `classid` int unsigned DEFAULT NULL,
  `create_criteriaset_items` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `cycle_associated_items` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `exclusion_rule` enum('none','associated','all') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'none',
  `busygeneratingcombinations` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengeid`),
  KEY `fk_challenge_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_challenge_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengeclassmap` (
  `challengeclassmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `challengeid` int unsigned NOT NULL,
  `classid` int unsigned NOT NULL,
  `applytochildren` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengeclassmapid`),
  KEY `fk_challengeclassmap_challenge` (`challengeid`),
  KEY `fk_challengeclassmap_class` (`classid`),
  CONSTRAINT `fk_challengeclassmap_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`),
  CONSTRAINT `fk_challengeclassmap_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengecriteriamap` (
  `challengecriteriamapid` int unsigned NOT NULL AUTO_INCREMENT,
  `challengeid` int unsigned NOT NULL,
  `criteriaid` int unsigned NOT NULL,
  `mandatoryquestion` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `topcriteriatype` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bottomcriteriatype` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `orderbynumber` int unsigned NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengecriteriamapid`),
  KEY `fk_challengecriteriamap_challenge` (`challengeid`),
  KEY `fk_challengecriteriamap_criteria` (`criteriaid`),
  CONSTRAINT `fk_challengecriteriamap_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`),
  CONSTRAINT `fk_challengecriteriamap_criteria` FOREIGN KEY (`criteriaid`) REFERENCES `criteria` (`criteriaid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengecriteriasolutionmap` (
  `challengecriteriasolutionmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `challengecriteriamapid` int unsigned NOT NULL,
  `solutionid` int unsigned NOT NULL,
  `mandatoryquestion` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengecriteriasolutionmapid`),
  KEY `fk_ccsm_challengecriteriamap` (`challengecriteriamapid`),
  KEY `fk_ccsm_solution` (`solutionid`),
  CONSTRAINT `fk_ccsm_challengecriteriamap` FOREIGN KEY (`challengecriteriamapid`) REFERENCES `challengecriteriamap` (`challengecriteriamapid`),
  CONSTRAINT `fk_ccsm_solution` FOREIGN KEY (`solutionid`) REFERENCES `solution` (`solutionid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengeitemmap` (
  `challengeitemmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `challengeid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengeitemmapid`),
  KEY `fk_challengeitemmap_challenge` (`challengeid`),
  KEY `fk_challengeitemmap_item` (`itemid`),
  CONSTRAINT `fk_challengeitemmap_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`),
  CONSTRAINT `fk_challengeitemmap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengeobjectmap` (
  `challengeobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `challengeid` int unsigned NOT NULL,
  `objecttable` enum('document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengeobjectmapid`),
  UNIQUE KEY `challengeobject` (`challengeid`,`objecttable`,`objectid`),
  KEY `fk_challengeobjectmap_challenge` (`challengeid`),
  CONSTRAINT `fk_challengeobjectmap_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengetagmap` (
  `challengetagmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `challengeid` int unsigned NOT NULL,
  `tagid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengetagmapid`),
  KEY `fk_documenttagmap_document` (`challengeid`),
  KEY `fk_documenttagmap_tag` (`tagid`),
  CONSTRAINT `fk_challengetagmap_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`),
  CONSTRAINT `fk_challengetagmap_tag` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challengeusermap` (
  `challengeusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `challengeid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `rank` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`challengeusermapid`),
  KEY `fk_challengeusermap_user` (`userid`),
  KEY `fk_challengeusermap_challenge` (`challengeid`),
  CONSTRAINT `fk_challengeusermap_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`),
  CONSTRAINT `fk_challengeusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `classid` int unsigned NOT NULL AUTO_INCREMENT,
  `classguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `parentid` int unsigned DEFAULT NULL,
  `classtype` enum('item','needfilter','object','folder','va','diagnostic') COLLATE utf8mb3_bin NOT NULL DEFAULT 'item',
  `itemtype` enum('product','solution','need','account','propertygroup','acl') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'product',
  `hierarchy` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objecttable` enum('class','department','documentfolder','processfolder') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'class',
  `objectid` int DEFAULT NULL,
  `objectparentid` int DEFAULT NULL,
  `classname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `classdescription` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `classgroupid` int unsigned DEFAULT NULL,
  `originalimagefilename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `imagefilename` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `orderbynumber` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `blocked` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `clientaccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `useraccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classid`),
  UNIQUE KEY `uk_class_object` (`objecttable`,`objectid`,`objectparentid`,`systemaccountid`),
  KEY `fk_class_systemaccount` (`systemaccountid`),
  KEY `fk_class_classgroup` (`classgroupid`),
  KEY `idx_class_guid` (`classguid`),
  KEY `idx_class_classtype` (`classtype`),
  CONSTRAINT `fk_class_classgroup` FOREIGN KEY (`classgroupid`) REFERENCES `classgroup` (`classgroupid`),
  CONSTRAINT `fk_class_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=68442  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classclassmap` (
  `classclassmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned NOT NULL,
  `linkedclassid` int unsigned NOT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `va_itemid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classid`,`linkedclassid`),
  UNIQUE KEY `idx_classclassmapid` (`classclassmapid`),
  KEY `fk_classclassmap_class` (`classid`),
  KEY `fk_classclassmap_linkedclass` (`linkedclassid`),
  KEY `idx_classclassmap_va_itemid` (`va_itemid`),
  CONSTRAINT `fk_classclassmap_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classclassmap_linkedclass` FOREIGN KEY (`linkedclassid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classclassmap_va_itemid` FOREIGN KEY (`va_itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Linked Class (Cross Sell)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classfactorindex` (
  `classfactorindexid` int unsigned NOT NULL AUTO_INCREMENT,
  `indexversionid` int unsigned NOT NULL,
  `classid` int unsigned NOT NULL,
  `propertygroupid` int unsigned NOT NULL,
  `propertyid` int unsigned NOT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  PRIMARY KEY (`classfactorindexid`),
  KEY `idx_indexversionid` (`indexversionid`),
  KEY `idx_classid` (`classid`),
  KEY `idx_propertygroupid` (`propertygroupid`),
  KEY `idx_propertyid` (`propertyid`),
  KEY `idx_propertyvalueid` (`propertyvalueid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_classfactorindex_indexversionid` FOREIGN KEY (`indexversionid`) REFERENCES `indexversion` (`indexversionid`),
  CONSTRAINT `fk_classfactorindex_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classfilter` (
  `classfilterid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned NOT NULL,
  `maptable` enum('propertygroupvalue','propertyvalue','class') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'propertygroupvalue',
  `propertygroupvalueid` int unsigned DEFAULT NULL,
  `propertyvalueid` int unsigned DEFAULT NULL,
  `filterclassid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classfilterid`),
  KEY `fk_classfilter_class` (`classid`),
  KEY `fk_classfilter_propertygroupvalueid` (`propertygroupvalueid`),
  KEY `fk_classfilter_propertyvalueid` (`propertyvalueid`),
  KEY `fk_classfilter_filterclass` (`filterclassid`),
  CONSTRAINT `fk_classfilter_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classfilter_filterclass` FOREIGN KEY (`filterclassid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classfilter_propertygroupvalueid` FOREIGN KEY (`propertygroupvalueid`) REFERENCES `propertygroupvalue` (`propertygroupvalueid`),
  CONSTRAINT `fk_classfilter_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Linked (Filter) Class to Property Group Value';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classgroup` (
  `classgroupid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `classgroupname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classgroupid`),
  KEY `fk_property_propertygroup` (`systemaccountid`),
  CONSTRAINT `fk_classgoupr_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classgroupimagemap` (
  `classgroupimagemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classgroupid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `imageimportruleid` int unsigned DEFAULT NULL,
  `viewsequence` int unsigned NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classgroupimagemapid`),
  UNIQUE KEY `idx_classgroupimagemap` (`classgroupid`,`imageid`),
  KEY `fk_propertygroupimagesmap_image` (`imageid`),
  KEY `fk_propertygroupimagemap_imageimportrule` (`imageimportruleid`),
  KEY `fk_classgroupimagemap_propertygroup` (`classgroupid`),
  CONSTRAINT `fk_classgroupimagemap_imageimportrule` FOREIGN KEY (`imageimportruleid`) REFERENCES `imageimportrule` (`imageimportruleid`),
  CONSTRAINT `fk_classgroupimagemap_propertygroup` FOREIGN KEY (`classgroupid`) REFERENCES `classgroup` (`classgroupid`),
  CONSTRAINT `fk_classgroupimagesmap_image` FOREIGN KEY (`imageid`) REFERENCES `image` (`imageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classimagemap` (
  `classimagemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `imageimportruleid` int unsigned DEFAULT NULL,
  `viewsequence` int unsigned NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classid`,`imageid`),
  UNIQUE KEY `idx_classimagemapid` (`classimagemapid`),
  KEY `fk_classimagemap_image` (`imageid`),
  KEY `fk_classimagemap_class` (`classid`),
  KEY `fk_classimagemap_imageimportrule` (`imageimportruleid`),
  CONSTRAINT `classimagemap_ibfk_1` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classimagemap_image` FOREIGN KEY (`imageid`) REFERENCES `image` (`imageid`),
  CONSTRAINT `fk_classimagemap_imageimportrule` FOREIGN KEY (`imageimportruleid`) REFERENCES `imageimportrule` (`imageimportruleid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classitemmap` (
  `classitemmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `va_itemid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classitemmapid`),
  UNIQUE KEY `idx_classitem` (`classid`,`itemid`),
  KEY `fk_classitemmap_item` (`itemid`),
  KEY `fk_classitemmap_class` (`classid`),
  KEY `idx_classitemmap_va_itemid` (`va_itemid`),
  CONSTRAINT `fk_classitemmap_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classitemmap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_classitemmap_va_itemid` FOREIGN KEY (`va_itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Linked Class to Item (Cross Sell)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classobjectmap` (
  `classobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned NOT NULL,
  `objecttable` enum('challenge','document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `objectaction` enum('list','autoopen','autoopenonchoose') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'list',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classobjectmapid`),
  UNIQUE KEY `classobject` (`classid`,`objecttable`,`objectid`),
  KEY `fk_classusermap_class` (`classid`),
  CONSTRAINT `fk_classobjectmap_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classpropertygroupmap` (
  `classpropertygroupmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned NOT NULL,
  `propertygroupid` int unsigned NOT NULL,
  `propertygroupvalueid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classpropertygroupmapid`),
  UNIQUE KEY `uk_classpropertygroupmap` (`classid`,`propertygroupid`),
  KEY `fk_classpropertygroupmap_class` (`classid`),
  KEY `fk_classpropertygroupmap_propertygroup` (`propertygroupid`),
  CONSTRAINT `fk_classpropertygroupmap_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classpropertygroupmap_propertygroup` FOREIGN KEY (`propertygroupid`) REFERENCES `propertygroup` (`propertygroupid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classpropertyvaluemap` (
  `classpropertyvaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classpropertygroupmapid` int unsigned NOT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classpropertyvaluemapid`),
  UNIQUE KEY `uk_classpropertyvaluemap` (`classpropertygroupmapid`,`propertyvalueid`),
  KEY `fk_classpropertyvaluemap_classpropertygroupmap` (`classpropertygroupmapid`),
  KEY `fk_classpropertyvaluemap_propertyvalue` (`propertyvalueid`),
  CONSTRAINT `fk_classpropertyvaluemap_classpropertygroupmap` FOREIGN KEY (`classpropertygroupmapid`) REFERENCES `classpropertygroupmap` (`classpropertygroupmapid`),
  CONSTRAINT `fk_classpropertyvaluemap_propertyvalue` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classusermap` (
  `classusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `classid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `relationshiptype` enum('expert','author') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`classusermapid`),
  KEY `fk_classusermap_class` (`classid`),
  KEY `fk_classusermap_user` (`userid`),
  CONSTRAINT `fk_classusermap_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_classusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collected_factors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `level` enum('session','interaction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` int NOT NULL,
  `interaction_id` int NOT NULL,
  `factorvalue_id` int NOT NULL,
  `factorname_id` int NOT NULL,
  `factorgroup_id` int NOT NULL,
  `systemaccountid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `collected_factors_level_index` (`level`),
  KEY `collected_factors_session_id_index` (`session_id`),
  KEY `collected_factors_interaction_id_index` (`interaction_id`),
  KEY `collected_factors_factorvalue_id_index` (`factorvalue_id`),
  KEY `collected_factors_factorname_id_index` (`factorname_id`),
  KEY `collected_factors_factorgroup_id_index` (`factorgroup_id`),
  KEY `collected_factors_systemaccountid_index` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collected_records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `interaction_id` int NOT NULL,
  `record_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collected_variables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `interaction_id` int NOT NULL,
  `variable_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentid` int unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int unsigned DEFAULT '0',
  `hierarchy` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `system_note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `objecttable` enum('account','activity','itemid','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `accountid` int unsigned DEFAULT NULL,
  `activityid` int unsigned DEFAULT NULL,
  `itemid` int unsigned DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`commentid`),
  KEY `idx_comment_objecttable` (`objecttable`),
  KEY `idx_comment_createdbyuserid` (`createdbyuserid`),
  KEY `idx_comment_parentid` (`parentid`),
  KEY `fk_comment_accountid` (`accountid`),
  KEY `fk_comment_activityid` (`activityid`),
  KEY `fk_comment_itemid` (`itemid`),
  KEY `fk_comment_processid` (`processid`),
  KEY `fk_comment_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_comment_accountid` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_comment_activityid` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`),
  CONSTRAINT `fk_comment_itemid` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_comment_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_comment_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=4964  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyid` int unsigned NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `departmentname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `registrationnumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `taxnumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=146812  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `component` (
  `componentid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `componenttype` enum('tab','area') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `interface` enum('web','backend','vapp') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `parentid` int unsigned DEFAULT NULL,
  `hierarchy` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`componentid`),
  UNIQUE KEY `uk_component_code` (`code`),
  KEY `fk_component_parentid` (`parentid`),
  CONSTRAINT `fk_component_parentid` FOREIGN KEY (`parentid`) REFERENCES `component` (`componentid`)
) ENGINE=InnoDB AUTO_INCREMENT=45  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componentmap` (
  `componentmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `componentid` int unsigned NOT NULL,
  `objecttable` enum('systemaccountsubdomain') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountsubdomainid` int unsigned DEFAULT NULL,
  `can_view` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`componentmapid`),
  KEY `idx_componentmap_componentid` (`componentid`),
  KEY `idx_componentmap_systemaccountsubdomainid` (`systemaccountsubdomainid`),
  CONSTRAINT `fk_componentmap_componentid` FOREIGN KEY (`componentid`) REFERENCES `component` (`componentid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `console_patchfile` (
  `console_patchfileid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `script_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `file_content` blob,
  `md5_sum` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `target_systemaccountguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`console_patchfileid`),
  KEY `fk_console_patchfile_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_console_patchfile_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contactid` int unsigned NOT NULL AUTO_INCREMENT,
  `contactguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `contacttype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `contactlabel` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `contactvalue` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`contactid`),
  KEY `idx_contacttype` (`contacttype`),
  KEY `idx_contact_guid` (`contactguid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteria` (
  `criteriaid` int unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `criteriatype` enum('toplevel','question','answer') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `hierarchy` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `orderbynumber` int unsigned DEFAULT NULL,
  `static_cycle` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `cycle_answers_orderbynumber_forward` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `cycle_static_answer_criteriaid` int DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriaid`),
  KEY `fk_class_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_criteria_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=14679  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriaimagemap` (
  `criteriaimagemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriaid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriaimagemapid`),
  KEY `fk_classusermap_class` (`criteriaid`),
  KEY `fk_criteriaobjectmap_criteria` (`criteriaid`),
  KEY `fk_criteriaimagemap_criteria` (`criteriaid`),
  KEY `fk_criteriaimagemap_image` (`imageid`),
  CONSTRAINT `fk_criteriaimagemap_criteria` FOREIGN KEY (`criteriaid`) REFERENCES `criteria` (`criteriaid`),
  CONSTRAINT `fk_criteriaimagemap_image` FOREIGN KEY (`imageid`) REFERENCES `image` (`imageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriaobjectmap` (
  `criteriaobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriaid` int unsigned NOT NULL,
  `objecttable` enum('class','item','document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `objectid` int unsigned DEFAULT NULL,
  `rank` int DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriaobjectmapid`),
  UNIQUE KEY `criteriaobject` (`criteriaid`,`objecttable`,`objectid`),
  KEY `fk_classusermap_class` (`criteriaid`),
  KEY `fk_criteriaobjectmap_criteria` (`criteriaid`),
  CONSTRAINT `fk_criteriaobjectmap_criteria` FOREIGN KEY (`criteriaid`) REFERENCES `criteria` (`criteriaid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriapropertyvaluemap` (
  `criteriapropertyvaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriaid` int unsigned NOT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriapropertyvaluemapid`),
  UNIQUE KEY `uk_criteriapropertyvaluemap` (`criteriaid`,`propertyvalueid`),
  KEY `idx_criteriapropertyvaluemap_criteriaid` (`criteriaid`),
  KEY `idx_criteriapropertyvaluemap_propertyvalueid` (`propertyvalueid`),
  CONSTRAINT `criteriapropertyvaluemap_ibfk_1` FOREIGN KEY (`criteriaid`) REFERENCES `criteria` (`criteriaid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `criteriapropertyvaluemap_ibfk_2` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriaset` (
  `criteriasetid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriasetnumber` int unsigned NOT NULL,
  `challengeid` int unsigned NOT NULL,
  `solutionstatus` enum('verified','unverified') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'unverified',
  `criteriasetcriteriamapids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriasetid`),
  KEY `fk_criteriaset_challenge` (`challengeid`),
  CONSTRAINT `fk_criteriaset_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Sets of criteria used to determine a solution.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriasetcriteriamap` (
  `criteriasetcriteriamapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriasetid` int unsigned NOT NULL,
  `challengecriteriamapid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriasetcriteriamapid`),
  KEY `fk_criteriasetcriteriamap_criteriaset` (`criteriasetid`),
  KEY `fk_criteriasetcriteriamap_challengecriteriamap` (`challengecriteriamapid`),
  CONSTRAINT `fk_criteriasetcriteriamap_challengecriteriamap` FOREIGN KEY (`challengecriteriamapid`) REFERENCES `challengecriteriamap` (`challengecriteriamapid`),
  CONSTRAINT `fk_criteriasetcriteriamap_criteriaset` FOREIGN KEY (`criteriasetid`) REFERENCES `criteriaset` (`criteriasetid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Criteria linked to sets of criteria.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriasetsolutionmap` (
  `criteriasetsolutionmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriasetid` int unsigned NOT NULL,
  `solutionid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriasetsolutionmapid`),
  KEY `fk_criteriasetsolutionmap_criteriaset` (`criteriasetid`),
  KEY `fk_criteriasetsolutionmap_solution` (`solutionid`),
  CONSTRAINT `fk_criteriasetsolutionmap_criteriaset` FOREIGN KEY (`criteriasetid`) REFERENCES `criteriaset` (`criteriasetid`),
  CONSTRAINT `fk_criteriasetsolutionmap_solution` FOREIGN KEY (`solutionid`) REFERENCES `solution` (`solutionid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriasetusermap` (
  `criteriasetusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriasetid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `maptype` enum('expertverifiedsolution','expertunverifiedsolution','usersolved','userunsolved') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriasetusermapid`),
  KEY `fk_criteriasetusermap_criteriaset` (`criteriasetid`),
  KEY `fk_criteriasetusermap_user` (`userid`),
  CONSTRAINT `fk_criteriasetusermap_criteriaset` FOREIGN KEY (`criteriasetid`) REFERENCES `criteriaset` (`criteriasetid`),
  CONSTRAINT `fk_criteriasetusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriasolutionmap` (
  `criteriasolutionmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriaid` int unsigned NOT NULL,
  `solutionid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriasolutionmapid`),
  KEY `fk_criteriasolutionmap_criteria` (`criteriaid`),
  KEY `fk_criteriasolutionmap_solution` (`solutionid`),
  CONSTRAINT `fk_criteriasolutionmap_criteria` FOREIGN KEY (`criteriaid`) REFERENCES `criteria` (`criteriaid`),
  CONSTRAINT `fk_criteriasolutionmap_solution` FOREIGN KEY (`solutionid`) REFERENCES `solution` (`solutionid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criteriatablevaluemap` (
  `criteriatablevaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `criteriaid` int unsigned NOT NULL,
  `tablevalueid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`criteriatablevaluemapid`),
  UNIQUE KEY `idx_criteriatablevaluemap` (`criteriaid`,`tablevalueid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csstemplate` (
  `csstemplateid` int unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `interface` enum('vapp') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'vapp',
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`csstemplateid`),
  KEY `idx_csstemplate_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_csstemplate_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csstemplatecssvarmap` (
  `csstemplatecssvarmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `csstemplateid` int unsigned NOT NULL,
  `cssvarid` int unsigned NOT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`csstemplatecssvarmapid`),
  UNIQUE KEY `uk_csstemplatecssvarmap` (`csstemplateid`,`cssvarid`),
  KEY `idx_csstemplatecssvarmap_csstemplateid` (`csstemplateid`),
  KEY `idx_csstemplatecssvarmap_cssvarid` (`cssvarid`),
  KEY `idx_csstemplatecssvarmap_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_csstemplatecssvarmap_csstemplateid` FOREIGN KEY (`csstemplateid`) REFERENCES `csstemplate` (`csstemplateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_csstemplatecssvarmap_cssvarid` FOREIGN KEY (`cssvarid`) REFERENCES `cssvar` (`cssvarid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_csstemplatecssvarmap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csstemplatemap` (
  `csstemplatemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `csstemplateid` int unsigned NOT NULL,
  `objecttable` enum('systemaccount','department','user') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'systemaccount',
  `systemaccountid` int unsigned DEFAULT NULL,
  `departmentid` int unsigned DEFAULT NULL,
  `userid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`csstemplatemapid`),
  KEY `idx_csstemplatemap_csstemplateid` (`csstemplateid`),
  KEY `idx_csstemplatemap_objecttable` (`objecttable`),
  KEY `idx_csstemplatemap_systemaccountid` (`systemaccountid`),
  KEY `idx_csstemplatemap_departmentid` (`departmentid`),
  KEY `idx_csstemplatemap_userid` (`userid`),
  CONSTRAINT `fk_csstemplatemap_csstemplateid` FOREIGN KEY (`csstemplateid`) REFERENCES `csstemplate` (`csstemplateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_csstemplatemap_departmentid` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_csstemplatemap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_csstemplatemap_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cssvar` (
  `cssvarid` int unsigned NOT NULL AUTO_INCREMENT,
  `interface` enum('vapp') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'vapp',
  `type` enum('general','color','font') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'general',
  `variable` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`cssvarid`),
  UNIQUE KEY `uk_cssvar_interface_variable` (`interface`,`variable`),
  KEY `idx_cssvar_interface` (`interface`),
  KEY `idx_cssvar_variable` (`variable`)
) ENGINE=InnoDB AUTO_INCREMENT=12  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency` (
  `currencyid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `currencycode` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccountid`,`currencycode`),
  UNIQUE KEY `idx_currencyid` (`currencyid`),
  KEY `fk_currency_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_currency_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=2  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencyrate` (
  `currencyrateid` int unsigned NOT NULL AUTO_INCREMENT,
  `basecurrencycode` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `convertcurrencycode` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `conversionrate` float unsigned DEFAULT NULL,
  `inversedrate` float unsigned DEFAULT NULL,
  `conversiondatetime` datetime NOT NULL,
  `conversiontimezone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`currencyrateid`),
  UNIQUE KEY `idx_currencyid` (`currencyrateid`)
) ENGINE=InnoDB AUTO_INCREMENT=176  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_mart_clevva_systemaccount_stats` (
  `data_mart_clevva_systemaccount_stats_id` int NOT NULL AUTO_INCREMENT,
  `systemaccountid` int NOT NULL,
  `systemaccountcreated` date NOT NULL,
  `accountnumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `AccountName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `SystemAdminUser` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `AccountType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountstatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `LastEventLog` datetime DEFAULT NULL,
  `EventsLogged` int DEFAULT NULL,
  `AdminUsers` int DEFAULT NULL,
  `AdminUserLogins` int DEFAULT NULL,
  `FrontendUsers` int DEFAULT NULL,
  `FrontendUserLogins` int DEFAULT NULL,
  `BackendUsers` int DEFAULT NULL,
  `BackendUserLogins` int DEFAULT NULL,
  `TotalUsers` int DEFAULT NULL,
  `TotalUserLogins` int DEFAULT NULL,
  `ProcessesCreated` int DEFAULT NULL,
  `ProcessesStarted` int DEFAULT NULL,
  `ProcessesCompleted` int DEFAULT NULL,
  `ProcessStepsCreated` int DEFAULT NULL,
  `ProcessStepsClicked` int DEFAULT NULL,
  `ProcessDecisionsCreated` int DEFAULT NULL,
  `ProcessDecisionsViewed` int DEFAULT NULL,
  `ProcessAnswersClicked` int DEFAULT NULL,
  `DecisionSupportChallengesCreated` int DEFAULT NULL,
  `DecisionSupportChallengesUsed` int DEFAULT NULL,
  `DecisionSupportChallengeQuestionsCreated` int DEFAULT NULL,
  `DecisionSupportChallengeAnswersCreated` int DEFAULT NULL,
  `LibrarySupportCreated` int DEFAULT NULL,
  `LibraryDocumentsOpened` int DEFAULT NULL,
  `LibraryLinksClicked` int DEFAULT NULL,
  `LibraryTotalSupportUsed` int DEFAULT NULL,
  `ProductsCreated` int DEFAULT NULL,
  `ProductsViewed` int DEFAULT NULL,
  `SolutionsCreated` int DEFAULT NULL,
  `SolutionsViewed` int DEFAULT NULL,
  `AccountsCreated` int DEFAULT NULL,
  `IncidentsCreated` int DEFAULT NULL,
  `SalesOpportunitiesCreated` int DEFAULT NULL,
  `SalesQuotesCreated` int DEFAULT NULL,
  `ActivitiesCreated` int DEFAULT NULL,
  `MessagesSent` int DEFAULT NULL,
  `MessagesRead` int DEFAULT NULL,
  `MessagesConfirmed` int DEFAULT NULL,
  `APIMethodCallsMade` int DEFAULT NULL,
  `record_datecreated` datetime NOT NULL,
  `record_startend` datetime NOT NULL,
  `record_enddate` datetime DEFAULT NULL,
  PRIMARY KEY (`data_mart_clevva_systemaccount_stats_id`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `databasecleanupsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `systemaccountid` int NOT NULL,
  `apilog_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `apilog_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `accountpropertyvaluemap_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `accountpropertyvaluemap_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `activity_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `activity_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `eventlog_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `eventlog_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `processinstance_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `processinstance_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `processinstanceaction_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `processinstanceaction_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `processinstanceobject_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `processinstanceobject_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `processinstanceobjecthistory_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `processinstanceobjecthistory_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `propertyvalue_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `propertyvalue_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `propertyvalue_retention_groupids` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesquote_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `salesquote_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  `salesquoteitem_retention_interval` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '1',
  `salesquoteitem_retention_period` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'week',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataretentionlog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `startdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `success` tinyint(1) NOT NULL,
  `error` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daterange` (
  `date` date NOT NULL,
  `year` smallint unsigned NOT NULL,
  `month` smallint unsigned NOT NULL,
  `day` smallint unsigned NOT NULL,
  `datetime_from` datetime NOT NULL,
  `datetime_to` datetime NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal` (
  `dealid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `dealcode` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `dealstart` datetime NOT NULL,
  `dealend` datetime NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`dealid`),
  UNIQUE KEY `uk_dealcode` (`systemaccountid`,`dealcode`),
  KEY `fk_deal_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_deal_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealaccountmap` (
  `dealaccountmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `dealid` int unsigned NOT NULL,
  `accountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`dealaccountmapid`),
  KEY `fk_dealaccount_deal` (`dealid`),
  KEY `fk_dealaccount_account` (`accountid`),
  CONSTRAINT `fk_dealaccount_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_dealaccount_deal` FOREIGN KEY (`dealid`) REFERENCES `deal` (`dealid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dealitemmap` (
  `dealitemmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `dealid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `dealprice` float DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`dealitemmapid`),
  KEY `fk_dealitem_deal` (`dealid`),
  KEY `fk_dealitem_item` (`itemid`),
  CONSTRAINT `fk_dealitem_deal` FOREIGN KEY (`dealid`) REFERENCES `deal` (`dealid`),
  CONSTRAINT `fk_dealitem_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `parentid` int unsigned NOT NULL,
  `hierarchy` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `departmentname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `use_branding` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `dark_colour` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `lite_colour` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`departmentid`),
  KEY `fk_department_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_department_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=3039  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departmentbranding` (
  `departmentbrandingid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned DEFAULT NULL,
  `departmentid` int unsigned DEFAULT NULL,
  `brandingimage` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `brandingcss` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`departmentbrandingid`),
  KEY `idx_departmentbranding_departmentid` (`departmentid`),
  KEY `idx_departmentbranding_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_departmentbranding_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departmentrolemap` (
  `departmentrolemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `departmentid` int unsigned NOT NULL,
  `roleid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`departmentrolemapid`),
  UNIQUE KEY `uk_departmentrolemap_departmentid_roleid` (`departmentid`,`roleid`),
  KEY `idx_departmentrolemap_roleid` (`roleid`),
  KEY `idx_departmentrolemap_departmentid` (`departmentid`),
  CONSTRAINT `fk_departmentrolemap_departmentid` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_departmentrolemap_roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `deviceid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL,
  `devicename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `macaddress` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `devicestatus` enum('requested','authorised','blocked') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `requesteddate` datetime DEFAULT NULL,
  `requesteduserid` int unsigned DEFAULT NULL,
  `authoriseddate` datetime DEFAULT NULL,
  `authoriseduserid` int unsigned DEFAULT NULL,
  `blockeddate` datetime DEFAULT NULL,
  `blockeduserid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`deviceid`),
  KEY `fk_device_userid` (`userid`),
  CONSTRAINT `fk_device_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic` (
  `diagnosticid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `choose_question_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `classid` int unsigned DEFAULT NULL,
  `classid_down` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `override_property_inputtype` enum('inherit','buttons','checkboxlist','radiolist','selectlist','dropdown','labels','varchar','text','numeric') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_classids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `exclude_classids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `include_propertyids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `exclude_propertyids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `include_propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `exclude_propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `include_itemids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `exclude_itemids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `include_range` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `exclude_range` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `prefilter_propertyids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `itemtype` enum('product','solution','need') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `matchtype` enum('all','any') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'all',
  `next_action` enum('choose','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'choose',
  `next_action_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `show_answer_itemcount` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `hide_matching_section` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `show_matching_page_limit` int DEFAULT '5',
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`diagnosticid`),
  KEY `idx_diagnostic_classid` (`classid`),
  KEY `idx_diagnostic_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_diagnostic_classid` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_diagnostic_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=8893  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `documentid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `documentname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `documenttype` enum('hostedfile','linkedfile','slideshow') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'hostedfile',
  `replacedbydocumentid` int unsigned DEFAULT NULL,
  `mobilesync` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `private` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `documentcategory` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `filetype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `filesize_kb` float NOT NULL,
  `duration_seconds` int DEFAULT NULL,
  `linkedurl` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `originalfilename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `filenameguid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `clientaccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `useraccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `documentguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`documentid`),
  KEY `fk_document_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_document_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentobjectmap` (
  `documentobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `documentid` int unsigned NOT NULL,
  `objecttable` enum('process','processinstanceobject','property','propertyvalue','document') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `processid` int unsigned DEFAULT NULL,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  `propertyid` int unsigned DEFAULT NULL,
  `propertyvalueid` int unsigned DEFAULT NULL,
  `obj_documentid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`documentobjectmapid`),
  KEY `idx_documentobjectmap_systemaccountid` (`systemaccountid`),
  KEY `idx_documentobjectmap_documentid` (`documentid`),
  KEY `idx_documentobjectmap_objecttable_processinstanceobjectid` (`objecttable`,`processinstanceobjectid`),
  KEY `fk_documentobjectmap_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `fk_documentobjectmap_processid` (`processid`),
  KEY `fk_documentobjectmap_propertyid` (`propertyid`),
  KEY `fk_documentobjectmap_propertyvalueid` (`propertyvalueid`),
  CONSTRAINT `fk_documentobjectmap_obj_documentid` FOREIGN KEY (`documentid`) REFERENCES `document` (`documentid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_documentobjectmap_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_documentobjectmap_processinstanceobjectid` FOREIGN KEY (`processinstanceobjectid`) REFERENCES `processinstanceobject` (`processinstanceobjectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_documentobjectmap_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_documentobjectmap_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_documentobjectmap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentprocessprocessmap` (
  `documentprocessprocessmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processprocessmapid` int unsigned NOT NULL,
  `documentid` int unsigned NOT NULL,
  `rank` int NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`documentprocessprocessmapid`),
  UNIQUE KEY `uk_dppm_processprocessmapid_documentid` (`processprocessmapid`,`documentid`),
  KEY `documentprocessprocessmap_document` (`documentid`),
  KEY `documentprocessprocessmap_ppmap` (`processprocessmapid`),
  CONSTRAINT `documentprocessprocessmap_document` FOREIGN KEY (`documentid`) REFERENCES `document` (`documentid`),
  CONSTRAINT `documentprocessprocessmap_ppmap` FOREIGN KEY (`processprocessmapid`) REFERENCES `processprocessmap` (`processprocessmapid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentslide` (
  `documentslideid` int unsigned NOT NULL AUTO_INCREMENT,
  `documentid` int unsigned NOT NULL,
  `orderbynumber` int unsigned NOT NULL,
  `slidename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `slidetemplateid` int unsigned NOT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`documentslideid`),
  KEY `fk_documentslide_document` (`documentid`),
  KEY `fk_documentslide_slidetemplate` (`slidetemplateid`),
  CONSTRAINT `fk_documentslide_document` FOREIGN KEY (`documentid`) REFERENCES `document` (`documentid`),
  CONSTRAINT `fk_documentslide_slidetemplate` FOREIGN KEY (`slidetemplateid`) REFERENCES `slidetemplatesystemaccountmap` (`slidetemplatesystemaccountmapid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documenttagmap` (
  `documenttagmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `documentid` int unsigned NOT NULL,
  `tagid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`documenttagmapid`),
  KEY `fk_documenttagmap_document` (`documentid`),
  KEY `fk_documenttagmap_tag` (`tagid`),
  CONSTRAINT `fk_documenttagmap_document` FOREIGN KEY (`documentid`) REFERENCES `document` (`documentid`),
  CONSTRAINT `fk_documenttagmap_tag` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emaillog` (
  `emaillogid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned DEFAULT NULL,
  `to` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `from` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `cc` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `bcc` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`emaillogid`),
  KEY `fk_emaillog_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_emaillog_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=196078  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailsetting` (
  `emailsettingid` int unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `port` int DEFAULT NULL,
  `authentication` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `mailer` enum('smtp') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'smtp',
  `smtpsecure` enum('tls','ssl','none') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'tls',
  `username` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fromaddress` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fromname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `send_as_loggedin_user` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `systemdefault` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`emailsettingid`)
) ENGINE=InnoDB AUTO_INCREMENT=3  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailtemplate` (
  `emailtemplateid` int unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`emailtemplateid`),
  KEY `idx_emailtemplate_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_emailtemplate_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailtemplatemap` (
  `emailtemplatemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `emailtemplateid` int unsigned NOT NULL,
  `objecttable` enum('trigger') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `triggerid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`emailtemplatemapid`),
  KEY `idx_emailtemplatemap_systemaccountid` (`systemaccountid`),
  KEY `idx_emailtemplatemap_triggerid` (`triggerid`),
  CONSTRAINT `fk_emailtemplatemap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_emailtemplatemap_triggerid` FOREIGN KEY (`triggerid`) REFERENCES `trigger` (`triggerid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `environmentalvariable` (
  `environmentalvariableid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`environmentalvariableid`),
  UNIQUE KEY `uk_unique` (`name`,`systemaccountid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_environmentalvariable_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=6  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `database` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `systemaccountid` int NOT NULL,
  `datefrom_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datefrom_strtotime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateto_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateto_strtotime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventlog` (
  `eventlogid` int unsigned NOT NULL AUTO_INCREMENT,
  `interface` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `eventtype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `originalvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `newvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `linkedtable` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `linkedid` int unsigned DEFAULT NULL,
  `versionid` int unsigned DEFAULT NULL,
  `alias_userid` int unsigned DEFAULT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `accountid` int unsigned DEFAULT NULL,
  `activityid` int unsigned DEFAULT NULL,
  `processinstanceid` int unsigned DEFAULT NULL,
  `hiddenvalue_varchar_1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `payload_size` double DEFAULT NULL,
  `ipaddress` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  PRIMARY KEY (`eventlogid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  KEY `idx_accountid` (`accountid`),
  KEY `idx_activityid` (`activityid`),
  KEY `idx_eventlog_interface` (`interface`(1)),
  KEY `idx_eventlog_eventtype` (`eventtype`),
  KEY `idx_eventlog_createdbyuserid` (`createdbyuserid`)
) ENGINE=InnoDB AUTO_INCREMENT=48073518  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factorgroups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `factorgroup_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `systemaccountid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factorgroups_factorgroup_id_index` (`factorgroup_id`),
  KEY `factorgroups_name_index` (`name`),
  KEY `factorgroups_systemaccountid_index` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factornames` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `factorgroup_id` int NOT NULL,
  `factorname_id` int NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `systemaccountid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factornames_factorgroup_id_index` (`factorgroup_id`),
  KEY `factornames_factorname_id_index` (`factorname_id`),
  KEY `factornames_systemaccountid_index` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factorvalues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `factorgroup_id` int NOT NULL,
  `factorname_id` int NOT NULL,
  `factorvalue_id` int NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `systemaccountid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `factorvalues_factorgroup_id_index` (`factorgroup_id`),
  KEY `factorvalues_factorname_id_index` (`factorname_id`),
  KEY `factorvalues_factorvalue_id_index` (`factorvalue_id`),
  KEY `factorvalues_systemaccountid_index` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formfield` (
  `formfieldid` int unsigned NOT NULL AUTO_INCREMENT,
  `objecttable` enum('process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `objectid` int unsigned DEFAULT NULL,
  `fieldlabel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fieldtype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'text',
  `fieldvaluedefault` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `default_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `default_textarea` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `default_numeric` double DEFAULT NULL,
  `default_checkbox` tinyint(1) DEFAULT NULL,
  `mandatory` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `propertyid` int unsigned DEFAULT NULL,
  `propertyvalueids` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'IMPORTANT! This field is no longer in use. It cannot be removed, because of referencing in previous versions.',
  `collect_against` enum('inherit','none','processinstance','activity','account') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'inherit',
  `answer_rule` enum('inherit','autoanswer','suggest','alwaysask') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'inherit',
  `ordernumber` double DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `variable_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `variable_objecttable` enum('processinstanceobject','processinstance','activity','account') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`formfieldid`),
  KEY `idx_formfield_systemaccountid` (`systemaccountid`),
  KEY `fk_formfield_processid_idx` (`processid`),
  KEY `fk_formfield_propertyid` (`propertyid`),
  CONSTRAINT `fk_formfield_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_formfield_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`),
  CONSTRAINT `fk_formfield_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=26756  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ftp` (
  `ftpid` int unsigned NOT NULL AUTO_INCREMENT,
  `ftpguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ftp_host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ftp_port` int DEFAULT NULL,
  `ftp_user` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ftp_pass` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemdefault` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ftpid`)
) ENGINE=InnoDB AUTO_INCREMENT=2  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fulfillmentfield` (
  `fulfillmentfieldid` int unsigned NOT NULL AUTO_INCREMENT,
  `fulfillmentgroupid` int unsigned NOT NULL,
  `propertyid` int unsigned NOT NULL,
  `orderbyno` int NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`fulfillmentfieldid`),
  UNIQUE KEY `fulfillmentgroupid_2` (`fulfillmentgroupid`,`propertyid`),
  KEY `fulfillmentgroupid` (`fulfillmentgroupid`),
  KEY `propertyid` (`propertyid`),
  CONSTRAINT `fulfillmentfield_ibfk_1` FOREIGN KEY (`fulfillmentgroupid`) REFERENCES `fulfillmentgroup` (`fulfillmentgroupid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fulfillmentgroup` (
  `fulfillmentgroupid` int unsigned NOT NULL AUTO_INCREMENT,
  `fulfillmentsystemid` int unsigned NOT NULL,
  `fulfillmentgroupname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `orderbyno` int NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`fulfillmentgroupid`),
  UNIQUE KEY `fulfillmentsystemid_2` (`fulfillmentsystemid`,`fulfillmentgroupname`),
  KEY `fulfillmentsystemid` (`fulfillmentsystemid`),
  CONSTRAINT `fulfillmentgroup_ibfk_1` FOREIGN KEY (`fulfillmentsystemid`) REFERENCES `fulfillmentsystem` (`fulfillmentsystemid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fulfillmentsystem` (
  `fulfillmentsystemid` int unsigned NOT NULL AUTO_INCREMENT,
  `fulfillmentsystemname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`fulfillmentsystemid`),
  UNIQUE KEY `fulfillmentsystemname` (`fulfillmentsystemname`,`systemaccountid`),
  KEY `systemaccountid` (`systemaccountid`),
  CONSTRAINT `fulfillmentsystem_ibfk_1` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `function` (
  `functionid` int unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`functionid`),
  KEY `fk_function_module` (`moduleid`),
  CONSTRAINT `fk_function_module` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geolocationmap` (
  `geolocationmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `objecttable` enum('processinstance','processinstanceobject') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `processinstanceid` int unsigned DEFAULT NULL,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  `timestampdatecreated` datetime DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `accuracy` float DEFAULT NULL,
  `altitude` float DEFAULT NULL,
  `altitudeaccuracy` float DEFAULT NULL,
  `speed` float DEFAULT NULL,
  `heading` float unsigned DEFAULT NULL,
  `addressid` int unsigned DEFAULT NULL,
  `errorcode` enum('UNKNOWN','PERMISSION_DENIED','POSITION_UNAVAILABLE','TIMED_OUT','BROWSER_NOT_COMPATIBLE') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`geolocationmapid`),
  KEY `idx_geolocationmap_systemaccountid` (`systemaccountid`),
  KEY `idx_geolocationmap_objecttable_processinstanceid` (`objecttable`,`processinstanceid`),
  KEY `idx_geolocationmap_objecttable_processinstanceobjectid` (`objecttable`,`processinstanceobjectid`),
  KEY `idx_geolocationmap_addressid` (`addressid`),
  KEY `fk_geolocationmap_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `fk_geolocationmap_processinstanceid` (`processinstanceid`),
  CONSTRAINT `fk_geolocationmap_addressid` FOREIGN KEY (`addressid`) REFERENCES `address` (`addressid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_geolocationmap_processinstanceid` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_geolocationmap_processinstanceobjectid` FOREIGN KEY (`processinstanceobjectid`) REFERENCES `processinstanceobject` (`processinstanceobjectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_geolocationmap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `imageid` int unsigned NOT NULL AUTO_INCREMENT,
  `imagesizeid` int unsigned NOT NULL,
  `originalfilename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `hostedfilename` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `filesize_kb` float unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`imageid`),
  KEY `fk_image_imagesize` (`imagesizeid`),
  CONSTRAINT `fk_image_imagesize` FOREIGN KEY (`imagesizeid`) REFERENCES `imagesize` (`imagesizeid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imageimportrule` (
  `imageimportruleid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `importtable` enum('class','item') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `matchcolumn` enum('item.code','item.description','class.classname','class.classdescription') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `matchtype` enum('full','partial') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `partialmatchside` enum('left','mid','right') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `partialmatchchars` int DEFAULT NULL,
  `matchusingimagefolder` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `imagefolderconcat` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `existingimageoption` enum('replace','ignore','append') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`imageimportruleid`),
  KEY `fk_imageimportrule_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_imageimportrule_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imageprocessprocessmap` (
  `imageprocessprocessmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processprocessmapid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processprocessmapid`,`imageid`),
  UNIQUE KEY `idx_imageprocessprocessmapid` (`imageprocessprocessmapid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagesize` (
  `imagesizeid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `width_pixels` int unsigned NOT NULL,
  `height_pixels` int unsigned NOT NULL,
  `viewtype` enum('product','support') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'product',
  `devicetype` enum('desktop','tablet','phone') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'tablet',
  `imagefiletype` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `noimage_originalfilename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `noimage_hostedfilename` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`imagesizeid`),
  UNIQUE KEY `idx_imagesize` (`systemaccountid`,`width_pixels`,`height_pixels`,`viewtype`,`devicetype`,`imagefiletype`),
  KEY `fk_imagesize_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_imagesize_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=7868  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incident` (
  `incidentid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `incidentguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ext_incidentguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `incidentno` int unsigned NOT NULL,
  `dateopen` datetime NOT NULL,
  `predictedclosingdate` datetime DEFAULT NULL,
  `dateclosed` datetime DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'OPEN',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int NOT NULL,
  `updatedbyuserid` int DEFAULT NULL,
  `deletedbyuserid` int DEFAULT NULL,
  PRIMARY KEY (`incidentid`),
  UNIQUE KEY `idx_incident` (`systemaccountid`,`incidentno`),
  KEY `fk_incident_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_incident_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidentobjectmap` (
  `incidentobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `incidentid` int unsigned NOT NULL,
  `objecttable` enum('account','person','class','document','item','process','user') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`incidentobjectmapid`),
  UNIQUE KEY `uk_object` (`incidentid`,`objecttable`,`objectid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indexversion` (
  `indexversionid` int unsigned NOT NULL AUTO_INCREMENT,
  `table` enum('classfactorindex','itemclassindex','itemfactorindex') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `progress` enum('pending','busy','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'pending',
  `phase` enum('unversioned','versioned') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'unversioned',
  `systemaccountid` int unsigned NOT NULL,
  `datestarted` datetime DEFAULT NULL,
  `datedone` datetime DEFAULT NULL,
  `duration` double unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`indexversionid`),
  KEY `idx_table` (`table`),
  KEY `idx_progress` (`progress`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_indexversion_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=4  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `interaction_id` int NOT NULL,
  `interaction_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `va_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime_start` timestamp NULL DEFAULT NULL,
  `datetime_end` timestamp NULL DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `systemaccountid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `interactions_session_id_index` (`session_id`),
  KEY `interactions_interaction_id_index` (`interaction_id`),
  KEY `interactions_interaction_no_index` (`interaction_no`),
  KEY `interactions_va_code_index` (`va_code`),
  KEY `interactions_datetime_start_index` (`datetime_start`),
  KEY `interactions_datetime_end_index` (`datetime_end`),
  KEY `interactions_user_email_index` (`user_email`),
  KEY `interactions_systemaccountid_index` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interface` (
  `interfaceid` int unsigned NOT NULL AUTO_INCREMENT,
  `interfacename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`interfaceid`)
) ENGINE=InnoDB AUTO_INCREMENT=5  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interfacetemplatemap` (
  `interfacetemplatemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `interfaceid` int unsigned NOT NULL,
  `templateid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`interfacetemplatemapid`),
  UNIQUE KEY `uk_interfacetemplate` (`interfaceid`,`templateid`),
  KEY `fk_interfacetemplatemap_interface` (`interfaceid`),
  KEY `fk_interfacetemplatemap_template` (`templateid`),
  CONSTRAINT `fk_interfacetemplatemap_interface` FOREIGN KEY (`interfaceid`) REFERENCES `interface` (`interfaceid`),
  CONSTRAINT `fk_interfacetemplatemap_template` FOREIGN KEY (`templateid`) REFERENCES `template` (`templateid`)
) ENGINE=InnoDB AUTO_INCREMENT=2  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemid` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objecttable` enum('account','document','item','process','role','salesopportunity','salesquote','user') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'item',
  `objectid` int DEFAULT NULL,
  `barcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `itemtype` enum('stock','service') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'stock',
  `pricetype` enum('list','range') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'list',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `classid` int unsigned NOT NULL,
  `additionalinfo` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `infolabel1` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `code_extaccounts` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description_extaccounts` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `unitofmeasure` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `category_extaccounts` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `unitcost` float unsigned DEFAULT NULL,
  `minimumprice` float unsigned DEFAULT NULL,
  `blocked` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `clientaccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `useraccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `imagefileexists` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `desiredoutcome` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `ordernumber` int DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `itemguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `propertyvalueids_inherited` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `fulfillmentsystemid` int unsigned DEFAULT NULL,
  `criteriasetid` int unsigned DEFAULT '0',
  `extra_cost` double DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  UNIQUE KEY `uk_code_systemaccountid` (`code`,`systemaccountid`),
  KEY `fk_item_class` (`classid`),
  KEY `fk_item_systemaccount` (`systemaccountid`),
  KEY `fulfillmentsystemid` (`fulfillmentsystemid`),
  CONSTRAINT `fk_item_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=2937230  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemclassindex` (
  `itemclassindexid` int unsigned NOT NULL AUTO_INCREMENT,
  `indexversionid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `classid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  PRIMARY KEY (`itemclassindexid`),
  KEY `idx_indexversionid` (`indexversionid`),
  KEY `idx_itemid` (`itemid`),
  KEY `idx_classid` (`classid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_itemclassindex_indexversionid` FOREIGN KEY (`indexversionid`) REFERENCES `indexversion` (`indexversionid`),
  CONSTRAINT `fk_itemclassindex_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=74422  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemclassmap` (
  `itemclassmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `classid` int unsigned NOT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `va_itemid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itemclassmapid`),
  UNIQUE KEY `idx_itemclass` (`itemid`,`classid`),
  KEY `fk_classitemmap_item` (`itemid`),
  KEY `fk_itemclassmap_class` (`classid`),
  KEY `idx_itemclassmap_va_itemid` (`va_itemid`),
  CONSTRAINT `fk_itemclassmap_class` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_itemclassmap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_itemclassmap_va_itemid` FOREIGN KEY (`va_itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Linked Item to Class (Cross Sell)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemfactorindex` (
  `itemfactorindexid` int unsigned NOT NULL AUTO_INCREMENT,
  `indexversionid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `propertygroupid` int unsigned NOT NULL,
  `propertyid` int unsigned NOT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  PRIMARY KEY (`itemfactorindexid`),
  KEY `idx_indexversionid` (`indexversionid`),
  KEY `idx_itemid` (`itemid`),
  KEY `idx_propertygroupid` (`propertygroupid`),
  KEY `idx_propertyid` (`propertyid`),
  KEY `idx_propertyvalueid` (`propertyvalueid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_itemfactorindex_indexversionid` FOREIGN KEY (`indexversionid`) REFERENCES `indexversion` (`indexversionid`),
  CONSTRAINT `fk_itemfactorindex_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=127277  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemimagemap` (
  `itemimagemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `imageimportruleid` int unsigned DEFAULT NULL,
  `viewsequence` int unsigned NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itemimagemapid`),
  UNIQUE KEY `idx_itemimage` (`itemid`,`imageid`),
  KEY `fk_itemimagemap_item` (`itemid`),
  KEY `fk_itemimagemap_image` (`imageid`),
  KEY `fk_itemimagemap_imageimportrule` (`imageimportruleid`),
  CONSTRAINT `fk_itemimagemap_imageimportrule` FOREIGN KEY (`imageimportruleid`) REFERENCES `imageimportrule` (`imageimportruleid`),
  CONSTRAINT `fk_itemimagemap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemitemmap` (
  `itemitemmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `linkeditemid` int unsigned NOT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `va_itemid` int unsigned DEFAULT NULL,
  `itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itemid`,`linkeditemid`),
  UNIQUE KEY `idx_itemitemmapid` (`itemitemmapid`),
  KEY `fk_itemitemmap_item2` (`linkeditemid`),
  KEY `fk_itemitemmap_item` (`itemid`),
  KEY `idx_itemitemmap_va_itemid` (`va_itemid`),
  CONSTRAINT `fk_itemitemmap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_itemitemmap_linkeditem` FOREIGN KEY (`linkeditemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_itemitemmap_va_itemid` FOREIGN KEY (`va_itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Linked Items (Cross Sell)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemobjectmap` (
  `itemobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `objecttable` enum('challenge','document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `objectaction` enum('list','autoopen','autoopenonchoose') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'list',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itemobjectmapid`),
  UNIQUE KEY `itemobject` (`itemid`,`objecttable`,`objectid`),
  KEY `fk_classusermap_class` (`itemid`),
  CONSTRAINT `fk_itemobjectmap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=9  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemoverride` (
  `itemoverrideid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `maptable` enum('diagnostic') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `diagnosticid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itemoverrideid`),
  UNIQUE KEY `uk_itemoverride_diagnosticid` (`itemid`,`maptable`,`diagnosticid`),
  KEY `idx_itemoverride_itemid` (`itemid`),
  KEY `idx_itemoverride_maptable` (`maptable`),
  KEY `idx_itemoverride_diagnosticid` (`diagnosticid`),
  KEY `idx_itemoverride_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_itemoverride_diagnosticid` FOREIGN KEY (`diagnosticid`) REFERENCES `diagnostic` (`diagnosticid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_itemoverride_itemid` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_itemoverride_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itempricebookmap` (
  `itempricebookmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `pricebookid` int unsigned NOT NULL,
  `pricetype` enum('list','range') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'list',
  `unitofmeasure` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `range_qnty_from` float DEFAULT NULL,
  `range_qnty_to` float DEFAULT NULL,
  `unitprice` float unsigned NOT NULL DEFAULT '0',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `unitprice_BCK` float DEFAULT NULL,
  PRIMARY KEY (`itempricebookmapid`),
  KEY `fk_itempricebookmap_item` (`itemid`),
  KEY `fk_itempricebookmap_pricebook` (`pricebookid`),
  CONSTRAINT `fk_itempricebookmap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_itempricebookmap_pricebook` FOREIGN KEY (`pricebookid`) REFERENCES `pricebook` (`pricebookid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itempropertygroupmap` (
  `itempropertygroupmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `propertygroupid` int unsigned NOT NULL,
  `propertygroupvalueid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itempropertygroupmapid`),
  KEY `fk_classpropertygroupmap_class` (`itemid`),
  KEY `fk_classpropertygroupmap_propertygroup` (`propertygroupid`),
  CONSTRAINT `fk_itempropertygroupmap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_itempropertygroupmap_propertygroup` FOREIGN KEY (`propertygroupid`) REFERENCES `propertygroup` (`propertygroupid`)
) ENGINE=InnoDB AUTO_INCREMENT=3443356  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itempropertymap` (
  `itempropertymapid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `propertyid` int unsigned NOT NULL,
  `answerrule` enum('apply_all','apply_none') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itempropertymapid`),
  KEY `idx_itempropertymap_systemaccountid` (`systemaccountid`),
  KEY `idx_itempropertymap_itemid` (`itemid`),
  KEY `idx_itempropertymap_propertyid` (`propertyid`),
  CONSTRAINT `fk_itempropertymap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itempropertyvaluemap` (
  `itempropertyvaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itempropertygroupmapid` int unsigned NOT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `inheritedclassid` int unsigned DEFAULT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itempropertyvaluemapid`),
  KEY `fk_classpropertyvaluemap_classpropertygroupmap` (`itempropertygroupmapid`),
  KEY `fk_classpropertyvaluemap_propertyvalue` (`propertyvalueid`),
  CONSTRAINT `fk_itempropertyvaluemap_itempropertygroupmap` FOREIGN KEY (`itempropertygroupmapid`) REFERENCES `itempropertygroupmap` (`itempropertygroupmapid`),
  CONSTRAINT `fk_itempropertyvaluemap_propertyvalue` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22495952  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemunitofmeasuremap` (
  `itemunitofmeasuremapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `unitofmeasure` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itemunitofmeasuremapid`),
  UNIQUE KEY `idx_itemuommap` (`itemid`,`unitofmeasure`),
  KEY `fk_itemuommap_item` (`itemid`),
  CONSTRAINT `fk_itemmetadatamap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Linked Item to Class (Cross Sell)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemusermap` (
  `itemusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `itemid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `relationshiptype` enum('expert','author') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`itemusermapid`),
  KEY `fk_classusermap_class` (`itemid`),
  KEY `fk_classusermap_user` (`userid`),
  CONSTRAINT `fk_itemusermap_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_itemusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jsondata` (
  `jsondataid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` json DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`jsondataid`),
  KEY `idx_jsondata_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_jsondata_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jsondatamap` (
  `jsondatamapid` int unsigned NOT NULL AUTO_INCREMENT,
  `jsondataid` int unsigned NOT NULL,
  `maptable` enum('class','item','process','processfolder','propertygroup','property','propertyvalue','process','property','starboard','widget') DEFAULT NULL,
  `classid` int unsigned DEFAULT NULL,
  `itemid` int unsigned DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `processfolderid` int unsigned DEFAULT NULL,
  `propertygroupid` int unsigned DEFAULT NULL,
  `propertyid` int unsigned DEFAULT NULL,
  `propertyvalueid` int unsigned DEFAULT NULL,
  `starboardid` int unsigned DEFAULT NULL,
  `widgetid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`jsondatamapid`),
  UNIQUE KEY `uk_jsondatamap_classid` (`jsondataid`,`maptable`,`classid`),
  UNIQUE KEY `uk_jsondatamap_itemid` (`jsondataid`,`maptable`,`itemid`),
  UNIQUE KEY `uk_jsondatamap_processid` (`jsondataid`,`maptable`,`processid`),
  UNIQUE KEY `uk_jsondatamap_processfolderid` (`jsondataid`,`maptable`,`processfolderid`),
  UNIQUE KEY `uk_jsondatamap_propertygroupid` (`jsondataid`,`maptable`,`propertygroupid`),
  UNIQUE KEY `uk_jsondatamap_propertyid` (`jsondataid`,`maptable`,`propertyid`),
  UNIQUE KEY `uk_jsondatamap_propertyvalueid` (`jsondataid`,`maptable`,`propertyvalueid`),
  UNIQUE KEY `uk_jsondatamap_starboardid` (`jsondataid`,`maptable`,`starboardid`),
  UNIQUE KEY `uk_jsondatamap_widgetid` (`jsondataid`,`maptable`,`widgetid`),
  KEY `idx_jsondatamap_jsondataid` (`jsondataid`),
  KEY `idx_jsondatamap_maptable` (`maptable`),
  KEY `idx_jsondatamap_classid` (`classid`),
  KEY `idx_jsondatamap_itemid` (`itemid`),
  KEY `idx_jsondatamap_processid` (`processid`),
  KEY `idx_jsondatamap_processfolderid` (`processfolderid`),
  KEY `idx_jsondatamap_propertygroupid` (`propertygroupid`),
  KEY `idx_jsondatamap_propertyid` (`propertyid`),
  KEY `idx_jsondatamap_propertyvalueid` (`propertyvalueid`),
  KEY `idx_jsondatamap_systemaccountid` (`systemaccountid`),
  KEY `idx_jsondatamap_starboardid` (`starboardid`),
  KEY `idx_jsondatamap_widgetid` (`widgetid`),
  CONSTRAINT `fk_jsondatamap_classid` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_jsondatamap_itemid` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_jsondatamap_jsondataid` FOREIGN KEY (`jsondataid`) REFERENCES `jsondata` (`jsondataid`),
  CONSTRAINT `fk_jsondatamap_processfolderid` FOREIGN KEY (`processfolderid`) REFERENCES `processfolder` (`processfolderid`),
  CONSTRAINT `fk_jsondatamap_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_jsondatamap_propertygroupid` FOREIGN KEY (`propertygroupid`) REFERENCES `propertygroup` (`propertygroupid`),
  CONSTRAINT `fk_jsondatamap_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`),
  CONSTRAINT `fk_jsondatamap_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`),
  CONSTRAINT `fk_jsondatamap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logic` (
  `logicid` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('acl','logic') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'acl',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `logic` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `acl` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`logicid`),
  KEY `idx_logic_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_logic_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=1207  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logicaction` (
  `logicactionid` int unsigned NOT NULL AUTO_INCREMENT,
  `logicid` int unsigned NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `addtosalesquoteid` int unsigned DEFAULT NULL,
  `orderby` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`logicactionid`),
  KEY `idx_logicaction_logicid` (`logicid`),
  KEY `idx_logicaction_systemaccountid` (`systemaccountid`),
  KEY `idx_logicaction_addtosalesquoteid` (`addtosalesquoteid`),
  CONSTRAINT `fk_logicaction_logicid` FOREIGN KEY (`logicid`) REFERENCES `logic` (`logicid`),
  CONSTRAINT `fk_logicaction_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logicindexmap` (
  `logicindexmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `logicid` int unsigned NOT NULL,
  `maptable` enum('propertygroup','property','propertyvalue') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `propertygroupid` int unsigned DEFAULT NULL,
  `propertyid` int unsigned DEFAULT NULL,
  `propertyvalueid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`logicindexmapid`),
  UNIQUE KEY `uk_logicindexmap_factor` (`logicid`,`maptable`,`propertygroupid`,`propertyid`,`propertyvalueid`),
  KEY `idx_logicindexmap_logicid` (`logicid`),
  KEY `idx_logicindexmap_maptable` (`maptable`),
  KEY `idx_logicindexmap_propertyid` (`propertyid`),
  KEY `idx_logicindexmap_systemaccountid` (`systemaccountid`),
  KEY `idx_logicindexmap_propertygroupid` (`propertygroupid`),
  KEY `idx_logicindexmap_propertyvalueid` (`propertyvalueid`),
  CONSTRAINT `fk_logicindexmap_logicid` FOREIGN KEY (`logicid`) REFERENCES `logic` (`logicid`),
  CONSTRAINT `fk_logicindexmap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logiclog` (
  `logiclogid` int unsigned NOT NULL AUTO_INCREMENT,
  `logicid` int unsigned NOT NULL,
  `logicmapid` int unsigned NOT NULL,
  `processinstanceobjectid` int unsigned NOT NULL,
  `processinstanceid` int unsigned NOT NULL,
  `activityid` int unsigned NOT NULL,
  `data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`logiclogid`),
  KEY `idx_logicid` (`logicid`),
  KEY `idx_logicmapid` (`logicmapid`),
  KEY `idx_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `idx_processinstanceid` (`processinstanceid`),
  KEY `idx_activityid` (`activityid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_logiclog_activityid` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`),
  CONSTRAINT `fk_logiclog_logicid` FOREIGN KEY (`logicid`) REFERENCES `logic` (`logicid`),
  CONSTRAINT `fk_logiclog_logicmapid` FOREIGN KEY (`logicmapid`) REFERENCES `logicmap` (`logicmapid`),
  CONSTRAINT `fk_logiclog_processinstanceid` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`),
  CONSTRAINT `fk_logiclog_processinstanceobjectid` FOREIGN KEY (`processinstanceobjectid`) REFERENCES `processinstanceobject` (`processinstanceobjectid`),
  CONSTRAINT `fk_logiclog_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=834358  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logicmap` (
  `logicmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `logicid` int unsigned NOT NULL,
  `position` decimal(4,2) DEFAULT '0.00',
  `maptable` enum('process','processprocessmap','processfolder','property','propertyoverride','formfield') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `processprocessmapid` int unsigned DEFAULT NULL,
  `processfolderid` int unsigned DEFAULT NULL,
  `propertyid` int unsigned DEFAULT NULL,
  `propertyoverrideid` int unsigned DEFAULT NULL,
  `formfieldid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `publish` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`logicmapid`),
  KEY `idx_logicmap_logicid` (`logicid`),
  KEY `idx_logicmap_maptable` (`maptable`),
  KEY `idx_logicmap_processid` (`processid`),
  KEY `idx_logicmap_processprocessmapid` (`processprocessmapid`),
  KEY `idx_logicmap_processfolderid` (`processfolderid`),
  KEY `idx_logicmap_systemaccountid` (`systemaccountid`),
  KEY `idx_logicmap_propertyid` (`propertyid`),
  KEY `idx_logicmap_propertyoverrideid` (`propertyoverrideid`),
  KEY `idx_logicmap_formfieldid` (`formfieldid`),
  CONSTRAINT `fk_logicmap_formfieldid` FOREIGN KEY (`formfieldid`) REFERENCES `formfield` (`formfieldid`),
  CONSTRAINT `fk_logicmap_logicid` FOREIGN KEY (`logicid`) REFERENCES `logic` (`logicid`),
  CONSTRAINT `fk_logicmap_processfolderid` FOREIGN KEY (`processfolderid`) REFERENCES `processfolder` (`processfolderid`),
  CONSTRAINT `fk_logicmap_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_logicmap_processprocessmapid` FOREIGN KEY (`processprocessmapid`) REFERENCES `processprocessmap` (`processprocessmapid`),
  CONSTRAINT `fk_logicmap_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`),
  CONSTRAINT `fk_logicmap_propertyoverrideid` FOREIGN KEY (`propertyoverrideid`) REFERENCES `propertyoverride` (`propertyoverrideid`),
  CONSTRAINT `fk_logicmap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=1204  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `dateposted` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `fk_message_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_message_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messageobjectmap` (
  `messageobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `messageid` int unsigned NOT NULL,
  `objecttable` enum('account','challenge','class','document','item','person','process','solution') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`messageobjectmapid`),
  KEY `fk_classusermap_class` (`messageid`),
  CONSTRAINT `fk_messageobjectmap_message` FOREIGN KEY (`messageid`) REFERENCES `message` (`messageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messageusermap` (
  `messageusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `messageusermapguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `messageid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `datefirstopened` datetime DEFAULT NULL,
  `dateconfirmed` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`messageid`,`userid`),
  UNIQUE KEY `uk_msgusermap` (`messageusermapid`),
  KEY `fk_messageusermap_message` (`messageid`),
  KEY `fk_messageusermap_user` (`userid`),
  KEY `idx_messageusermap_messageusermapguid` (`messageusermapguid`),
  CONSTRAINT `fk_messageusermap_message` FOREIGN KEY (`messageid`) REFERENCES `message` (`messageid`),
  CONSTRAINT `fk_messageusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata` (
  `metadataid` int unsigned NOT NULL AUTO_INCREMENT,
  `metadataguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `metatype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `orderbynumber` int DEFAULT NULL,
  `flag1` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `flag2` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `parentmetatype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `parentmetacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `int1` int DEFAULT NULL,
  `activity_state` enum('notstarted','inprogress','complete') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`metadataid`),
  UNIQUE KEY `uk_metacode_metatype_systemaccountid` (`systemaccountid`,`metatype`,`metacode`),
  KEY `fk_metadata_systemaccount` (`systemaccountid`),
  KEY `idx_metadata_guid` (`metadataguid`),
  CONSTRAINT `fk_metadata_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=172372  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metatype` (
  `metatypeid` int unsigned NOT NULL AUTO_INCREMENT,
  `metatype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `defaultmetacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `autometacode` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `flag1description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `flag2description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`metatype`,`systemaccountid`),
  UNIQUE KEY `metatypeid` (`metatypeid`),
  KEY `fk_metatype_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_metatype_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=40079  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `moduleid` int unsigned NOT NULL AUTO_INCREMENT,
  `modulecode` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `optional` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `mobile` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`moduleid`)
) ENGINE=InnoDB AUTO_INCREMENT=39  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulecomponentmap` (
  `modulecomponentmapid` int NOT NULL AUTO_INCREMENT,
  `moduleid` int unsigned NOT NULL,
  `componentid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`modulecomponentmapid`),
  UNIQUE KEY `modulecomponentmap_unique` (`moduleid`,`componentid`),
  KEY `fk_modulecomponentmap_componentid` (`componentid`),
  CONSTRAINT `fk_modulecomponentmap_componentid` FOREIGN KEY (`componentid`) REFERENCES `component` (`componentid`),
  CONSTRAINT `fk_modulecomponentmap_moduleid` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`)
) ENGINE=InnoDB AUTO_INCREMENT=97  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulelicense` (
  `modulelicenseid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesordercontractid` int unsigned NOT NULL,
  `moduleid` int unsigned NOT NULL,
  `licensestartdate` datetime NOT NULL,
  `licenseexpirydate` datetime NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`modulelicenseid`),
  KEY `fk_ modulelicense_module` (`moduleid`),
  KEY `fk_ modulelicense_salesordercontract` (`salesordercontractid`),
  CONSTRAINT `fk_ modulelicense_module` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`),
  CONSTRAINT `fk_ modulelicense_salesordercontract` FOREIGN KEY (`salesordercontractid`) REFERENCES `salesordercontract` (`salesordercontractid`)
) ENGINE=InnoDB AUTO_INCREMENT=15496  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulesettingmap` (
  `modulesettingmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` int unsigned NOT NULL,
  `settingid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`settingid`,`moduleid`),
  UNIQUE KEY `idx_modulesettingmapid` (`modulesettingmapid`),
  KEY `fk_modulesettingmap_moduleid` (`moduleid`),
  KEY `fk_modulesettingmap_settingid` (`settingid`),
  CONSTRAINT `fk_modulesettingmap_moduleid` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`),
  CONSTRAINT `fk_modulesettingmap_settingid` FOREIGN KEY (`settingid`) REFERENCES `setting` (`settingid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notetemplate` (
  `notetemplateid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `notename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`notetemplateid`),
  KEY `fk_notetemplate_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_notetemplate_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notetemplatecolumn` (
  `notetemplatecolumnid` int unsigned NOT NULL AUTO_INCREMENT,
  `notetemplateid` int unsigned NOT NULL,
  `columnname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `columntype` enum('int','text','varchar','bool','datetime','double') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `orderbynumber` int unsigned NOT NULL,
  `processinstance_column` enum('note_int1_value','note_int2_value','note_int3_value','note_int4_value','note_int5_value','note_int6_value','note_int7_value','note_int8_value','note_int9_value','note_int10_value','note_text1_value','note_text2_value','note_text3_value','note_text4_value','note_text5_value','note_varchar1_value','note_varchar2_value','note_varchar3_value','note_varchar4_value','note_varchar5_value','note_varchar6_value','note_varchar7_value','note_varchar8_value','note_varchar9_value','note_varchar10_value','note_double1_value','note_double2_value','note_double3_value','note_double4_value','note_double5_value','note_double6_value','note_double7_value','note_double8_value','note_double9_value','note_double10_value','note_bool1_value','note_bool2_value','note_bool3_value','note_bool4_value','note_bool5_value','note_bool6_value','note_bool7_value','note_bool8_value','note_bool9_value','note_bool10_value','note_datetime1_value','note_datetime2_value','note_datetime3_value','note_datetime4_value','note_datetime5_value','note_datetime6_value','note_datetime7_value','note_datetime8_value','note_datetime9_value','note_datetime10_value') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `show_in_conversationbasket` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `readonly` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`notetemplatecolumnid`),
  UNIQUE KEY `uk_notetemplatecolumn` (`notetemplateid`,`processinstance_column`),
  KEY `fk_notetemplatecolumn_notetemplate` (`notetemplateid`),
  CONSTRAINT `fk_notetemplatecolumn_notetemplate` FOREIGN KEY (`notetemplateid`) REFERENCES `notetemplate` (`notetemplateid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optionalmoduleregionprice` (
  `optionalmoduleregionpriceid` int unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` int unsigned NOT NULL,
  `regionid` int unsigned NOT NULL,
  `pricetype` enum('user','systemaccount') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'user',
  `pricepermonth` float NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`moduleid`,`regionid`),
  UNIQUE KEY `optionalmoduleregionpriceid` (`optionalmoduleregionpriceid`),
  KEY `fk_optionalmoduleregionprice_module` (`moduleid`),
  KEY `fk_optionalmoduleregionprice_region` (`regionid`),
  CONSTRAINT `fk_optionalmoduleregionprice_module` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`),
  CONSTRAINT `fk_optionalmoduleregionprice_region` FOREIGN KEY (`regionid`) REFERENCES `region` (`regionid`)
) ENGINE=InnoDB AUTO_INCREMENT=7  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageid` int unsigned NOT NULL AUTO_INCREMENT,
  `applicationid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`packageid`),
  KEY `fk_package_application` (`applicationid`),
  KEY `fk_package_item` (`itemid`),
  CONSTRAINT `fk_package_application` FOREIGN KEY (`applicationid`) REFERENCES `application` (`applicationid`)
) ENGINE=InnoDB AUTO_INCREMENT=10  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packagemodulemap` (
  `packagemodulemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `packageid` int unsigned NOT NULL,
  `moduleid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`packagemodulemapid`),
  KEY `fk_packagemodule_package` (`packageid`),
  KEY `fk_packagemodule_module` (`moduleid`),
  CONSTRAINT `fk_packagemodule_module` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`),
  CONSTRAINT `fk_packagemodule_package` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`)
) ENGINE=InnoDB AUTO_INCREMENT=39  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packageregionprice` (
  `packageregionpriceid` int unsigned NOT NULL AUTO_INCREMENT,
  `packageid` int unsigned NOT NULL,
  `regionid` int unsigned NOT NULL,
  `pricetype` enum('user','systemaccount') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'user',
  `pricepermonth` float NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`packageregionpriceid`),
  KEY `fk_packageregionprice_region` (`regionid`),
  KEY `fk_packageregionprice_package` (`packageid`),
  CONSTRAINT `fk_packageregionprice_package` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`),
  CONSTRAINT `fk_packageregionprice_region` FOREIGN KEY (`regionid`) REFERENCES `region` (`regionid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patch` (
  `patchid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `script_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `file_content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `md5_sum` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `status` enum('success','failed','inprogress') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `exception` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`patchid`),
  KEY `fk_patch_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_patch_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `personid` int unsigned NOT NULL AUTO_INCREMENT,
  `personguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `firstname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `lastname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `dateofbirth` datetime DEFAULT NULL,
  `idnumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`personid`),
  KEY `fk_person_systemaccount` (`systemaccountid`),
  KEY `idx_person_guid` (`personguid`),
  CONSTRAINT `fk_person_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=589146  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personcontactmap` (
  `personcontactmapid` int NOT NULL AUTO_INCREMENT,
  `personcontactmapguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `personid` int unsigned NOT NULL,
  `contactid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`personcontactmapid`),
  KEY `idx_personid` (`personid`),
  KEY `idx_contactid` (`contactid`),
  KEY `idx_personcontactmap_guid` (`personcontactmapguid`),
  CONSTRAINT `personcontactmap_ibfk_1` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`),
  CONSTRAINT `personcontactmap_ibfk_2` FOREIGN KEY (`contactid`) REFERENCES `contact` (`contactid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricebook` (
  `pricebookid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `currencycode` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'ZAR',
  `defaultpricebook` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `pricebooktype` enum('recommended_retail','minimum_price') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'recommended_retail',
  `ext_pricebookcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`pricebookid`),
  UNIQUE KEY `uk_name_systemaccount` (`name`,`systemaccountid`),
  UNIQUE KEY `uk_ext_pricebookcode_systemaccount` (`ext_pricebookcode`,`systemaccountid`),
  KEY `fk_item_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_pricebook_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=7839  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process` (
  `processid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `processguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `parentid` int unsigned DEFAULT NULL,
  `processfolderid` int unsigned DEFAULT NULL,
  `hierarchy` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `original_processid` int unsigned DEFAULT NULL,
  `duplicatedfrom_processid` int unsigned DEFAULT NULL,
  `duplicatedfrom_parentid` int DEFAULT NULL,
  `version_number` int DEFAULT NULL,
  `orderbynumber` int unsigned DEFAULT NULL,
  `vatype` enum('process','finder','helper','analyser') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `vatype_finder_diagnosticid` int unsigned DEFAULT NULL,
  `processtype` enum('category','decision','end','process','start','step','diagnostic','finder') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `processtype_finder_processid` int unsigned DEFAULT NULL,
  `processtype_finder_diagnosticid` int unsigned DEFAULT NULL,
  `classid` int unsigned DEFAULT NULL,
  `inputtype` enum('none','checkboxlist','radiolist','checkbox','varchar','text','datetime','numeric','dropdown') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'none',
  `subprocessonly` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `subprocessrule` enum('linked','all') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'linked',
  `grouping` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `name_publish` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `avatar_publish` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `description_publish` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `challengeid` int unsigned DEFAULT NULL,
  `challenge_autoopen` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `challenge_autonext` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `mandatorychallenge` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `mandatoryclientselected` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `itempropertyfilter` enum('any','all') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `status` enum('verified','unverified') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'unverified',
  `show_matching_rule` enum('dont_show_on_step_and_decision','always_show','show_on_step_and_decision_if_factors_collected') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `clientaccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `useraccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `outcomeitemtype` enum('product','solution','bulkview') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'product',
  `outcomefiltermatch` enum('all','any') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `stopdead` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `closesessionatendofprocess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `notetemplateid` int unsigned DEFAULT NULL,
  `objecttype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `summary_view` enum('list','chart') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'list',
  `add_matching_items_and_clear_collected_attributes` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `add_matching_items_matchtype` enum('any','all') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `add_matching_items_itemtype` enum('product','solution','need') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'product',
  `add_matching_items_if_relevance_weight_above_or_equal` float DEFAULT NULL,
  `add_matching_items_itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `autoopen_conversation_basket` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `pintodashboard` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `pintodashboard_orderbynumber` int DEFAULT NULL,
  `auto_answer_debug` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `showmatching_classid` int unsigned DEFAULT '0',
  `add_cycle_items` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `add_cycle_items_itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `conversationbasket_endsession_process` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `start_process_action` enum('always_launch_account_form','launch_account_form_when_no_session_account','show_msg_and_stop_process_when_no_session_account','always_launch_account_browse_form','always_launch_account_form_optional') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `end_process_action` enum('summary','start_diagnostic') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `launch_account_form` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `need_account_session_active` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `collect_account_attribute_on_process_start` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `attributes_user_consider` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `attributes_user_show_matching` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `propertyid` int DEFAULT NULL,
  `auto_next` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `linked_process_return_auto_next` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `answer_rule` enum('inherit','autoanswer','suggest','alwaysask') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'inherit',
  `answer_rule_level` enum('default','processinstance_items','activity_items') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'default',
  `collect_against` enum('inherit','processinstance','activity','account') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'inherit',
  `answerorder` enum('manual','ascending','descending') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'manual',
  `record_geolocation` enum('y','n','default') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'default',
  `require_file_upload` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `leave_process` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `leave_process_and_view_catalogue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `auto_create_activity_on_process_start` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `diagnostic_show_items_when_total_lessthanequalto` int unsigned DEFAULT NULL,
  `diagnostic_auto_choose_question` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `diagnostic_allow_remove_answered_question` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `diagnostic_override_message_when_no_items` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `hide_save_activity_button` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  PRIMARY KEY (`processid`),
  KEY `fk_process_systemaccount` (`systemaccountid`),
  KEY `fk_process_challenge` (`challengeid`),
  KEY `idx_process_processguid` (`processguid`),
  KEY `fk_process_processfolder` (`processfolderid`),
  KEY `fk_process_notetemplate` (`notetemplateid`),
  KEY `idx_process_processtype` (`processtype`),
  KEY `idx_process_subprocessonly` (`subprocessonly`),
  KEY `idx_process_classid` (`classid`),
  KEY `idx_process_subprocessrule` (`subprocessrule`),
  KEY `idx_process_original_processid` (`original_processid`),
  KEY `idx_process_status` (`status`),
  KEY `idx_process_duplicatedfrom_processid` (`duplicatedfrom_processid`),
  KEY `idx_process_code` (`code`),
  CONSTRAINT `fk_process_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`),
  CONSTRAINT `fk_process_notetemplate` FOREIGN KEY (`notetemplateid`) REFERENCES `notetemplate` (`notetemplateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_process_processfolder` FOREIGN KEY (`processfolderid`) REFERENCES `processfolder` (`processfolderid`),
  CONSTRAINT `fk_process_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=268176  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processactivityobjectmap` (
  `processactivityobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processactivitytemplateid` int unsigned NOT NULL,
  `processid` int unsigned DEFAULT NULL,
  `documentid` int unsigned DEFAULT NULL,
  `itemid` int unsigned DEFAULT NULL,
  `userid` int unsigned DEFAULT NULL,
  `action` enum('responsible','view') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processactivityobjectmapid`),
  UNIQUE KEY `uk_document` (`processactivitytemplateid`,`documentid`),
  UNIQUE KEY `uk_item` (`processactivitytemplateid`,`itemid`),
  UNIQUE KEY `uk_process` (`processactivitytemplateid`,`processid`),
  UNIQUE KEY `uk_user` (`userid`,`processactivitytemplateid`,`action`),
  KEY `fk_paom_document` (`documentid`),
  KEY `fk_paom_item` (`itemid`),
  KEY `fk_paom_process` (`processid`),
  KEY `fk_paom_user` (`userid`),
  CONSTRAINT `fk_paom_document` FOREIGN KEY (`documentid`) REFERENCES `document` (`documentid`),
  CONSTRAINT `fk_paom_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_paom_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_paom_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processactivitytemplate` (
  `processactivitytemplateid` int unsigned NOT NULL AUTO_INCREMENT,
  `processid` int unsigned DEFAULT NULL,
  `processprocessmapid` int unsigned DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `activitytype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `activitystatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `activitypriority` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `duedate_days` int DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `linkinitiator` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `linkinitiatoraction` enum('responsible','view') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'view',
  `opentoedit` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `sendemailalert` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `createnewactivity` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processactivitytemplateid`),
  KEY `fk_pat_process` (`processid`),
  KEY `fk_pat_processprocessmap` (`processprocessmapid`),
  CONSTRAINT `fk_pat_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_pat_processprocessmap` FOREIGN KEY (`processprocessmapid`) REFERENCES `processprocessmap` (`processprocessmapid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processdocumentmap` (
  `processdocumentmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processid` int unsigned NOT NULL,
  `documentid` int unsigned NOT NULL,
  `rank` int NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processid`,`documentid`),
  UNIQUE KEY `idx_processdocumentmapid` (`processdocumentmapid`),
  KEY `fk_processdocumentmap_process` (`processid`),
  KEY `fk_processdocumentmap_document` (`documentid`),
  CONSTRAINT `fk_processdocumentmap_document` FOREIGN KEY (`documentid`) REFERENCES `document` (`documentid`),
  CONSTRAINT `fk_processdocumentmap_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processfolder` (
  `processfolderid` int unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int unsigned DEFAULT NULL,
  `from_processid` int DEFAULT NULL,
  `from_parentid` int DEFAULT NULL,
  `hierarchy` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `foldername` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `folderdescription` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `orderbynumber` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `clientaccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `useraccess` enum('all','restricted') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'all',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processfolderid`),
  KEY `fk_processfolder_systemaccount` (`systemaccountid`),
  KEY `idx_processfolder_processfolderid_datedeleted` (`processfolderid`,`datedeleted`),
  CONSTRAINT `fk_processfolder_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=14077  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processfolderuserpermission` (
  `processfolderuserpermissionid` int unsigned NOT NULL AUTO_INCREMENT,
  `processfolderid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `permission` enum('view','expert','author') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processfolderuserpermissionid`),
  UNIQUE KEY `uk_processfolderuserpermission` (`userid`,`permission`,`processfolderid`),
  KEY `fk_pfup_processfolder` (`processfolderid`),
  KEY `fk_pfup_user` (`userid`),
  CONSTRAINT `fk_pfup_processfolder` FOREIGN KEY (`processfolderid`) REFERENCES `processfolder` (`processfolderid`),
  CONSTRAINT `fk_pfup_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processimagemap` (
  `processimagemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processimagemapid`),
  KEY `fk_processimagemap_process` (`processid`),
  KEY `fk_processimagemap_image` (`imageid`),
  CONSTRAINT `fk_processimagemap_image` FOREIGN KEY (`imageid`) REFERENCES `image` (`imageid`),
  CONSTRAINT `fk_processimagemap_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processinstance` (
  `processinstanceid` int unsigned NOT NULL AUTO_INCREMENT,
  `processinstanceguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processinstancenumber` int unsigned DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `accountid` int unsigned DEFAULT NULL,
  `salesopportunityid` int unsigned DEFAULT NULL,
  `incidentid` int unsigned DEFAULT NULL,
  `activityid` int unsigned DEFAULT NULL,
  `salesquoteitemid` int unsigned DEFAULT NULL,
  `itemid` int unsigned DEFAULT NULL,
  `embed_source` enum('msdynamics','sapone','pastelevolution') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `embed_sourceobjecttype` enum('incident','activity','account','contact','lead','opportunity','quote','order','invoice','product','campaign','custom') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `embed_sourceobjectguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `embed_sourceparenttype` enum('account','contact') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `embed_sourceparentguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `embed_sourceuserguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `embed_resulttype` enum('all','process','document','product','processdocument') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `note_int1_value` int DEFAULT NULL,
  `note_int2_value` int DEFAULT NULL,
  `note_int3_value` int DEFAULT NULL,
  `note_int4_value` int DEFAULT NULL,
  `note_int5_value` int DEFAULT NULL,
  `note_int6_value` int DEFAULT NULL,
  `note_int7_value` int DEFAULT NULL,
  `note_int8_value` int DEFAULT NULL,
  `note_int9_value` int DEFAULT NULL,
  `note_int10_value` int DEFAULT NULL,
  `note_text1_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `note_text2_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `note_text3_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `note_text4_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `note_text5_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `note_varchar1_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar2_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar3_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar4_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar5_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar6_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar7_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar8_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar9_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_varchar10_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_double1_value` double DEFAULT NULL,
  `note_double2_value` double DEFAULT NULL,
  `note_double4_value` double DEFAULT NULL,
  `note_double5_value` double DEFAULT NULL,
  `note_double6_value` double DEFAULT NULL,
  `note_double7_value` double DEFAULT NULL,
  `note_double8_value` double DEFAULT NULL,
  `note_double9_value` double DEFAULT NULL,
  `note_double10_value` double DEFAULT NULL,
  `note_bool1_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool2_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool3_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool4_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool5_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool6_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool7_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool8_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool9_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_bool10_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `note_datetime1_value` datetime DEFAULT NULL,
  `note_datetime2_value` datetime DEFAULT NULL,
  `note_datetime3_value` datetime DEFAULT NULL,
  `note_datetime4_value` datetime DEFAULT NULL,
  `note_datetime5_value` datetime DEFAULT NULL,
  `note_datetime6_value` datetime DEFAULT NULL,
  `note_datetime7_value` datetime DEFAULT NULL,
  `note_datetime8_value` datetime DEFAULT NULL,
  `note_datetime9_value` datetime DEFAULT NULL,
  `note_datetime10_value` datetime DEFAULT NULL,
  `total_match_item_count` int unsigned DEFAULT NULL,
  `propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `diagnostic_start_propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `classid` int unsigned DEFAULT NULL,
  `sharelinkid` int DEFAULT NULL,
  `initiator_processinstanceobjectid` int unsigned DEFAULT NULL,
  `initiator_parent_processinstanceids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `initiator_itemids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  PRIMARY KEY (`processinstanceid`),
  UNIQUE KEY `idx_processinstance_processinstanceguid` (`processinstanceguid`),
  KEY `fk_processinstance_process` (`processid`),
  KEY `fk_processinstance_acccount` (`accountid`),
  KEY `fk_processinstance_salesopportunity` (`salesopportunityid`),
  KEY `fk_processinstance_activity` (`activityid`),
  KEY `idx_processinstance_createdbyuserid` (`createdbyuserid`),
  KEY `idx_processinstance_salesquoteitemid` (`salesquoteitemid`),
  CONSTRAINT `fk_processinstance_acccount` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_processinstance_activity` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`),
  CONSTRAINT `fk_processinstance_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_processinstance_salesopportunity` FOREIGN KEY (`salesopportunityid`) REFERENCES `salesopportunity` (`salesopportunityid`)
) ENGINE=InnoDB AUTO_INCREMENT=1079892  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processinstanceaction` (
  `processinstanceactionid` int unsigned NOT NULL AUTO_INCREMENT,
  `processinstanceobjectid` int unsigned NOT NULL,
  `action` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `objecttable` enum('process','processprocessmap','processdocumentmap','documentprocessprocessmap','user','propertygroup','property','propertyvalue','item','account','activity','accountpropertyvaluemap','salesquoteitem') COLLATE utf8mb3_bin DEFAULT NULL,
  `objectid` int unsigned DEFAULT NULL,
  `objectids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processinstanceactionid`),
  KEY `idx_processinstanceaction_systemaccountid` (`systemaccountid`),
  KEY `idx_processinstanceaction_processinstanceobjectid` (`processinstanceobjectid`),
  CONSTRAINT `fk_processinstanceaction_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9756277  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processinstanceitemmap` (
  `processinstanceitemmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processinstanceid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int NOT NULL,
  `updatedbyuserid` int DEFAULT NULL,
  `deletedbyuserid` int DEFAULT NULL,
  PRIMARY KEY (`processinstanceitemmapid`),
  KEY `fk_processinstanceitemmap_processinstanceid` (`processinstanceid`),
  KEY `fk_processinstanceitemmap_itemid` (`itemid`),
  CONSTRAINT `fk_processinstanceitemmap_itemid` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_processinstanceitemmap_processinstanceid` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processinstancematchitem` (
  `processinstancematchitemid` int unsigned NOT NULL AUTO_INCREMENT,
  `processinstanceid` int unsigned NOT NULL,
  `itemid` int unsigned NOT NULL,
  `systemaccountid` int unsigned DEFAULT NULL,
  `orderbynumber` int unsigned DEFAULT NULL,
  `unitcost` float unsigned DEFAULT NULL,
  `itemprice` float unsigned DEFAULT NULL,
  `minimumsellingprice` float unsigned DEFAULT NULL,
  `stocklevel` double DEFAULT NULL,
  `total_relevance_weight` float DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processinstancematchitemid`),
  KEY `idx_processinstancematchitem_processinstanceid` (`processinstanceid`),
  KEY `idx_processinstancematchitem_itemid` (`itemid`),
  KEY `idx_processinstancematchitem_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_processinstancematchitem_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processinstanceobject` (
  `processinstanceobjectid` int unsigned NOT NULL AUTO_INCREMENT,
  `processinstanceid` int unsigned NOT NULL,
  `processid` int unsigned DEFAULT NULL,
  `challengeid` int unsigned DEFAULT NULL,
  `action_engine` enum('process','diagnostic','guide') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `objecttype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `history` enum('load','ignore') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `laststacked_processinstanceobjectid` int DEFAULT NULL,
  `initiator` enum('user','system') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `objectaction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `autoopen` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `autonext` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `objecttable` enum('process','processprocessmap','processdocumentmap','documentprocessprocessmap','challenge','criteria','user','propertygroup','property','propertyvalue','item','activity') COLLATE utf8mb3_bin DEFAULT NULL,
  `objectid` int DEFAULT NULL,
  `objectids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `history_text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `history_question` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `history_answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `collected_propertyids_skipped` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `collected_propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `criteriaid_questions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `criteriaid_answers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `processprocessmapid_answers` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `processid_sub_stack` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `processinstanceobjectid_sub_stack` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `processinstanceobjectid_pipe_processid` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `propertyid_pipe_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `activityid_sub_stack` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `input_checkbox_value` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `input_varchar_value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `input_text_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `input_datetime_value` datetime DEFAULT NULL,
  `input_numeric_value` double DEFAULT NULL,
  `input_checkboxlist_value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'inlistof_processprocessmapids',
  `input_radiolist_value` int DEFAULT NULL COMMENT 'processprocessmapid',
  `input_dropdown_value` int DEFAULT NULL COMMENT 'processprocessmapid',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `auto_next` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `leave_process` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `possible_itemids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `suggest_itemids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `propertyvalueids_answered` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `propertyids_skipped` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `propertyid_skip` int unsigned DEFAULT NULL,
  `propertyid` int unsigned DEFAULT NULL,
  `answer_rule` enum('alwaysask','suggest','autoanswer') COLLATE utf8mb3_bin DEFAULT 'autoanswer',
  `answer_level` enum('processinstance','activity','account','userdepartment') COLLATE utf8mb3_bin DEFAULT 'processinstance',
  `json_snapshot` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'Used to store point in time reference data in json format.',
  PRIMARY KEY (`processinstanceobjectid`),
  KEY `fk_processinstanceobject_processinstance` (`processinstanceid`),
  KEY `idx_processinstanceobject_createdbyuserid` (`createdbyuserid`),
  CONSTRAINT `fk_processinstanceobject_processinstance` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`)
) ENGINE=InnoDB AUTO_INCREMENT=6079369  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processinstanceobjectformfieldmap` (
  `processinstanceobjectformfieldmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  `formfieldid` int unsigned DEFAULT NULL,
  `fieldlabel` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fieldtype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'text',
  `fieldvalue` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `value_label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `value_text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `value_textarea` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `value_numeric` double DEFAULT NULL,
  `value_checkbox` tinyint(1) DEFAULT NULL,
  `propertyvalueid` int unsigned DEFAULT NULL,
  `propertyvalueids` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `ordernumber` double DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processinstanceobjectformfieldmapid`),
  KEY `idx_processinstanceobjectformfieldmap_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `idx_processinstanceobjectformfieldmap_formfieldid` (`formfieldid`),
  KEY `idx_processinstanceobjectformfieldmap_systemaccountid` (`systemaccountid`),
  KEY `fk_processinstanceobjectformfieldmap_propertyvalueid` (`propertyvalueid`),
  CONSTRAINT `fk_processinstanceobjectformfieldmap_formfieldid` FOREIGN KEY (`formfieldid`) REFERENCES `formfield` (`formfieldid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_processinstanceobjectformfieldmap_processinstanceobjectid` FOREIGN KEY (`processinstanceobjectid`) REFERENCES `processinstanceobject` (`processinstanceobjectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_processinstanceobjectformfieldmap_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE CASCADE,
  CONSTRAINT `fk_processinstanceobjectformfieldmap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=564236  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processinstanceobjecthistory` (
  `processinstanceobjecthistoryid` int unsigned NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `load_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `action_data` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `activityid` int unsigned NOT NULL,
  `processinstanceid` int unsigned NOT NULL,
  `processinstanceobjectid` int unsigned NOT NULL,
  `processid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processinstanceobjecthistoryid`),
  UNIQUE KEY `uk_processinstanceobjecthistory` (`activityid`,`processinstanceid`,`processinstanceobjectid`),
  KEY `idx_processinstanceobjecthistory_activity` (`activityid`),
  KEY `idx_processinstanceobjecthistory_processinstance` (`processinstanceid`),
  KEY `idx_processinstanceobjecthistory_processinstanceobject` (`processinstanceobjectid`),
  KEY `idx_processinstanceobjecthistory_process` (`processid`),
  KEY `idx_processinstanceobjecthistory_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_processinstanceobjecthistory_activity` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`),
  CONSTRAINT `fk_processinstanceobjecthistory_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_processinstanceobjecthistory_processinstance` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`),
  CONSTRAINT `fk_processinstanceobjecthistory_processinstanceobject` FOREIGN KEY (`processinstanceobjectid`) REFERENCES `processinstanceobject` (`processinstanceobjectid`),
  CONSTRAINT `fk_processinstanceobjecthistory_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=650096  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processprocessmap` (
  `processprocessmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processprocessmapid_duplicatedfrom` int DEFAULT NULL,
  `processprocessmapguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processid` int unsigned NOT NULL,
  `linkedprocessid` int unsigned NOT NULL,
  `orderbynumber` int unsigned DEFAULT NULL,
  `maptype` enum('samelevelmap','deeperlevelmap','decisionmap') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `decisionvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `propertyvalueid` int unsigned DEFAULT NULL,
  `decisionsummary` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `includeinsummary` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `autoopen` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `autonext` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `answer_rule_else` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processprocessmapid`),
  KEY `fk_processprocessmap_linkedprocess` (`linkedprocessid`),
  KEY `fk_processprocessmap_process` (`processid`),
  KEY `processprocessmapguid` (`processprocessmapguid`),
  KEY `idx_ppm_ppmid_duplicatedfrom` (`processprocessmapid_duplicatedfrom`),
  CONSTRAINT `fk_processprocessmap_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`)
) ENGINE=InnoDB AUTO_INCREMENT=531885  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processprocessmapcondition` (
  `processprocessmapconditionid` int unsigned NOT NULL AUTO_INCREMENT,
  `processprocessmapid` int unsigned NOT NULL,
  `propertyid` int unsigned DEFAULT NULL,
  `range_gte` double DEFAULT NULL,
  `range_lt` double DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processprocessmapconditionid`),
  KEY `idx_ppmc_ppmid` (`processprocessmapid`),
  KEY `idx_ppmc_propertyid` (`propertyid`),
  KEY `idx_ppmc_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_ppmc_ppmid` FOREIGN KEY (`processprocessmapid`) REFERENCES `processprocessmap` (`processprocessmapid`),
  CONSTRAINT `fk_ppmc_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`),
  CONSTRAINT `fk_ppmc_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processprocessmapcriteriasetmap` (
  `processprocessmapcriteriasetmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processprocessmapid` int unsigned NOT NULL,
  `criteriasetid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processprocessmapcriteriasetmapid`),
  UNIQUE KEY `idx_ppmapcsmap` (`processprocessmapid`,`criteriasetid`),
  KEY `fk_ppmapcsmap_criteriaset` (`criteriasetid`),
  CONSTRAINT `fk_ppmapcsmap_criteriaset` FOREIGN KEY (`criteriasetid`) REFERENCES `criteriaset` (`criteriasetid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processpropertyvaluemap` (
  `processpropertyvaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processid` int unsigned NOT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processpropertyvaluemapid`),
  KEY `fk_processpropertyvaluemap_processid` (`processid`),
  KEY `fk_processpropertyvaluemap_propertyvalueid` (`propertyvalueid`),
  KEY `fk_processpropertyvaluemap_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_processpropertyvaluemap_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_processpropertyvaluemap_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_processpropertyvaluemap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processsettingmap` (
  `processsettingmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processid` int unsigned NOT NULL,
  `settingcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `intvalue` int DEFAULT NULL,
  `floatvalue` float DEFAULT NULL,
  `varcharvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `textvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `booleanvalue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datetimevalue` datetime DEFAULT NULL,
  `markdownvalue` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processsettingmapid`),
  UNIQUE KEY `uk_psmap` (`processid`,`settingcode`),
  KEY `idx_psmap_processid` (`processid`),
  KEY `idx_psmap_settingcode` (`settingcode`),
  KEY `idx_psmap_systemaccountid` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=41100  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processtagmap` (
  `processtagmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processid` int unsigned NOT NULL,
  `tagid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processtagmapid`),
  KEY `fk_documenttagmap_document` (`processid`),
  KEY `fk_documenttagmap_tag` (`tagid`),
  CONSTRAINT `fk_processtagmap_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_processtagmap_tag` FOREIGN KEY (`tagid`) REFERENCES `tag` (`tagid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processuserpermission` (
  `processuserpermissionid` int unsigned NOT NULL AUTO_INCREMENT,
  `processid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `permission` enum('view','expert','author') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`processuserpermissionid`),
  UNIQUE KEY `idx_processuserpermission_unique` (`processid`,`userid`,`permission`),
  KEY `fk_processuserpermission_process` (`processid`),
  KEY `fk_processuserpermission_user` (`userid`),
  CONSTRAINT `fk_processuserpermission_process` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`),
  CONSTRAINT `fk_processuserpermission_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `propertyid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertygroupid` int unsigned NOT NULL,
  `propertyname` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `title_markdown` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `body_markdown` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `propertyvaluetype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'TEXT',
  `classid` int unsigned DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `terminology` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'TECHNICAL',
  `visiblefilter` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `showwhenaddtoquote` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `include_differential_filter` enum('y','n','always','matchaccount','none') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'none',
  `answer_rule` enum('autoanswer','suggest','alwaysask') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'suggest',
  `collect_against` enum('processinstance','activity','account') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'activity',
  `collect_account_attribute_on_process_start` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `inputtype` enum('buttons','checkboxlist','radiolist','selectlist','dropdown','labels','varchar','text','numeric') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'buttons',
  `json_orderby` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyid`),
  KEY `fk_property_propertygroup` (`propertygroupid`),
  KEY `idx_property_propertygroupid_datedeleted` (`propertygroupid`,`datedeleted`),
  CONSTRAINT `fk_property_propertygroup` FOREIGN KEY (`propertygroupid`) REFERENCES `propertygroup` (`propertygroupid`)
) ENGINE=InnoDB AUTO_INCREMENT=40057  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertygroup` (
  `propertygroupid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertygroupname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `classid` int unsigned DEFAULT NULL,
  `visiblefilter` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertygroupid`),
  KEY `fk_propertygroup_systemaccount` (`systemaccountid`),
  KEY `idx_propertygroup_classid` (`classid`),
  CONSTRAINT `fk_propertygroup_classid` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_propertygroup_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=9453  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertygroupimagemap` (
  `propertygroupimagemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertygroupid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `imageimportruleid` int unsigned DEFAULT NULL,
  `viewsequence` int unsigned NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertygroupimagemapid`),
  UNIQUE KEY `idx_propertygroupimagemap` (`propertygroupid`,`imageid`),
  KEY `fk_propertygroupimagesmap_image` (`imageid`),
  KEY `fk_propertygroupimagemap_imageimportrule` (`imageimportruleid`),
  KEY `fk_propertygroupimagemap_propertygroup` (`propertygroupid`),
  CONSTRAINT `fk_propertygroupimagemap_imageimportrule` FOREIGN KEY (`imageimportruleid`) REFERENCES `imageimportrule` (`imageimportruleid`),
  CONSTRAINT `fk_propertygroupimagemap_propertygroup` FOREIGN KEY (`propertygroupid`) REFERENCES `propertygroup` (`propertygroupid`),
  CONSTRAINT `fk_propertygroupimagesmap_image` FOREIGN KEY (`imageid`) REFERENCES `image` (`imageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertygroupobjectmap` (
  `propertygroupobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertygroupid` int unsigned NOT NULL,
  `objecttable` enum('challenge','document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertygroupobjectmapid`),
  UNIQUE KEY `uniquethree` (`propertygroupid`,`objecttable`,`objectid`),
  KEY `fk_classusermap_class` (`propertygroupid`),
  CONSTRAINT `fk_propertygroupobjectmap_item` FOREIGN KEY (`propertygroupid`) REFERENCES `propertygroup` (`propertygroupid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertygroupvalue` (
  `propertygroupvalueid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertygroupid` int unsigned NOT NULL,
  `groupvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertygroupvalueid`),
  KEY `fk_propertygroupvalue_propertygroup` (`propertygroupid`),
  CONSTRAINT `fk_propertygroupvalue_propertygroup` FOREIGN KEY (`propertygroupid`) REFERENCES `propertygroup` (`propertygroupid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyimagemap` (
  `propertyimagemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyid` int unsigned NOT NULL,
  `imageid` int unsigned NOT NULL,
  `imageimportruleid` int unsigned DEFAULT NULL,
  `viewsequence` int unsigned NOT NULL DEFAULT '1',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyimagemapid`),
  UNIQUE KEY `idx_propertyimagemap` (`propertyid`,`imageid`),
  KEY `fk_propertyimagesmap_image` (`imageid`),
  KEY `fk_propertyimagemap_imageimportrule` (`imageimportruleid`),
  KEY `fk_propertyimagemap_propertygroup` (`propertyid`),
  CONSTRAINT `fk_propertyimagemap_imageimportrule` FOREIGN KEY (`imageimportruleid`) REFERENCES `imageimportrule` (`imageimportruleid`),
  CONSTRAINT `fk_propertyimagemap_propertygroup` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`),
  CONSTRAINT `fk_propertyimagesmap_image` FOREIGN KEY (`imageid`) REFERENCES `image` (`imageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyobjectmap` (
  `propertyobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyid` int unsigned NOT NULL,
  `objecttable` enum('document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyobjectmapid`),
  UNIQUE KEY `uniquethree` (`propertyid`,`objecttable`,`objectid`),
  KEY `fk_propertyobjectmap_property` (`propertyid`),
  CONSTRAINT `fk_propertyobjectmap_property` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyoverride` (
  `propertyoverrideid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyid` int unsigned NOT NULL,
  `diagnosticid` int unsigned DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `propertyname` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `title_markdown` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `body_markdown` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `priority` int DEFAULT NULL,
  `orderbynumber` int unsigned DEFAULT NULL,
  `inputtype` enum('inherit','buttons','checkboxlist','radiolist','selectlist','dropdown','labels','varchar','text','numeric') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'inherit',
  `collect_against` enum('none','inherit','processinstance','activity','account') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'inherit',
  `answer_rule` enum('inherit','autoanswer','suggest','alwaysask') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'inherit',
  `answer_rule_level` enum('default','processinstance_items','activity_items') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'default',
  `hidden` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `mandatory` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyoverrideid`),
  UNIQUE KEY `uk_propertyoverride` (`propertyid`,`diagnosticid`,`processid`,`systemaccountid`),
  KEY `idx_propertyoverride_propertyid` (`propertyid`),
  KEY `idx_propertyoverride_diagnosticid` (`diagnosticid`),
  KEY `idx_propertyoverride_processid` (`processid`),
  KEY `idx_propertyoverride_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_propertyoverride_diagnosticid` FOREIGN KEY (`diagnosticid`) REFERENCES `diagnostic` (`diagnosticid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_propertyoverride_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_propertyoverride_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_propertyoverride_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=91915  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyprocessmap` (
  `propertyprocessmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyid` int unsigned NOT NULL,
  `process_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyprocessmapid`),
  UNIQUE KEY `uk_propertyprocessmap_propertyid_process_code` (`propertyid`,`process_code`),
  KEY `idx_propertyprocessmap_propertyid` (`propertyid`),
  KEY `idx_propertyprocessmap_process_code` (`process_code`),
  KEY `idx_propertyprocessmap_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_propertyprocessmap_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`),
  CONSTRAINT `fk_propertyprocessmap_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyvalue` (
  `propertyvalueid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyvalueguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `propertyid` int unsigned NOT NULL,
  `displayvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `title_markdown` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `body_markdown` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `itemid` int unsigned DEFAULT NULL,
  `rangevalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `range_gte` double DEFAULT NULL,
  `range_lt` double DEFAULT NULL,
  `numericvalue` double DEFAULT NULL,
  `datetimevalue` datetime DEFAULT NULL,
  `textvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `varcharvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `booleanvalue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `propertyvaluemaprule` enum('and','or') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'or',
  `weight` float NOT NULL DEFAULT '1',
  `sort_position` decimal(4,2) DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyvalueid`),
  KEY `fx_propertyvalue_property` (`propertyid`),
  KEY `idx_propertyvalue_guid` (`propertyvalueguid`),
  KEY `idx_propertyvalue_itemid` (`itemid`),
  CONSTRAINT `fx_propertyvalue_property` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=899680  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyvaluemap` (
  `propertyvaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyvalueid` int unsigned NOT NULL,
  `tech_propertyvalueid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyvaluemapid`),
  KEY `fk_ propertyvaluemapid _propertyvalue` (`propertyvalueid`),
  KEY `fk_ propertyvaluemapid _techpropertyvalue` (`tech_propertyvalueid`),
  CONSTRAINT `fk_ propertyvaluemapid _propertyvalue` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`),
  CONSTRAINT `fk_ propertyvaluemapid _techpropertyvalue` FOREIGN KEY (`tech_propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyvalueobjectmap` (
  `propertyvalueobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyvalueid` int unsigned NOT NULL,
  `objecttable` enum('document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyvalueobjectmapid`),
  UNIQUE KEY `uniquethree` (`propertyvalueid`,`objecttable`,`objectid`),
  KEY `fk_propertyvalueobjectmap_propertyvalue` (`propertyvalueid`),
  CONSTRAINT `fk_propertyvalueobjectmap_propertyvalue` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyvalueoverride` (
  `propertyvalueoverrideid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyvalueid` int unsigned NOT NULL,
  `diagnosticid` int unsigned DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `displayvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `title_markdown` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `body_markdown` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `hidden` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `sort_position` decimal(4,2) DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyvalueoverrideid`),
  UNIQUE KEY `uk_propertyvalueoverride` (`propertyvalueid`,`diagnosticid`,`processid`,`systemaccountid`),
  KEY `idx_propertyvalueoverride_propertyvalueid` (`propertyvalueid`),
  KEY `idx_propertyvalueoverride_diagnosticid` (`diagnosticid`),
  KEY `idx_propertyvalueoverride_processid` (`processid`),
  KEY `idx_propertyvalueoverride_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_propertyvalueoverride_diagnosticid` FOREIGN KEY (`diagnosticid`) REFERENCES `diagnostic` (`diagnosticid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_propertyvalueoverride_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_propertyvalueoverride_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE CASCADE,
  CONSTRAINT `fk_propertyvalueoverride_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=475  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyvalueprocessprocessmap` (
  `propertyvalueprocessprocessmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `processprocessmapid` int unsigned NOT NULL,
  `propertyvalueid` int unsigned NOT NULL,
  `showmatching` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyvalueprocessprocessmapid`),
  UNIQUE KEY `idx_propertyvalueprocessprocessmap` (`processprocessmapid`,`propertyvalueid`),
  KEY `fk_pvprocessprocessmap_propertyvalueid` (`propertyvalueid`),
  KEY `fk_pvprocessprocessmap_processprocessmap` (`processprocessmapid`),
  CONSTRAINT `fk_pvprocessprocessmap_processprocessmap` FOREIGN KEY (`processprocessmapid`) REFERENCES `processprocessmap` (`processprocessmapid`),
  CONSTRAINT `fk_pvprocessprocessmap_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=355766  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyvaluepropertyvaluemap` (
  `propertyvaluepropertyvaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `propertyvalueid` int unsigned NOT NULL,
  `linkedpropertyvalueid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`propertyvaluepropertyvaluemapid`),
  UNIQUE KEY `uk_pvpvm` (`propertyvalueid`,`linkedpropertyvalueid`),
  KEY `idx_pvpvm_propertyvalueid` (`propertyvalueid`),
  KEY `idx_pvpvm_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_pvpvm_linkedpropertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`),
  CONSTRAINT `fk_pvpvm_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`),
  CONSTRAINT `fk_pvpvm_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxylink` (
  `proxylinkid` int unsigned NOT NULL AUTO_INCREMENT,
  `hashid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `status` enum('active','inactive','testing') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'active',
  `triggerid` int unsigned DEFAULT NULL,
  `custom` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyproxylinkid` int unsigned DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`proxylinkid`),
  KEY `idx_proxylink_hashid` (`hashid`),
  KEY `idx_proxylink_systemaccountid` (`systemaccountid`),
  KEY `idx_proxylink_triggerid` (`triggerid`),
  KEY `fk_proxylinkobject_alias_idx` (`alias`),
  KEY `fk_proxylink_createdbyproxylinkid_idx` (`createdbyproxylinkid`),
  CONSTRAINT `fk_proxylink_createdbyproxylinkid` FOREIGN KEY (`createdbyproxylinkid`) REFERENCES `proxylink` (`proxylinkid`),
  CONSTRAINT `fk_proxylink_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylink_triggerid` FOREIGN KEY (`triggerid`) REFERENCES `trigger` (`triggerid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28057  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxylinkaudit` (
  `proxylinkauditid` int unsigned NOT NULL AUTO_INCREMENT,
  `proxylinkid` int unsigned NOT NULL,
  `proxylinkstatus` enum('active','inactive','testing') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'active',
  `activityid` int unsigned DEFAULT NULL,
  `processinstanceid` int unsigned DEFAULT NULL,
  `ipaddress` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `URL_ROOT` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `HTTP_REFERER` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned DEFAULT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`proxylinkauditid`),
  KEY `idx_proxylinkaudit_proxylinkid` (`proxylinkid`),
  KEY `idx_proxylinkaudit_activityid` (`activityid`),
  KEY `idx_proxylinkaudit_processinstanceid` (`processinstanceid`),
  KEY `idx_proxylinkaudit_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_proxylinkaudit_activityid` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkaudit_processinstanceid` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkaudit_proxylinkid` FOREIGN KEY (`proxylinkid`) REFERENCES `proxylink` (`proxylinkid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkaudit_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6493  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxylinkobject` (
  `proxylinkobjectid` int unsigned NOT NULL AUTO_INCREMENT,
  `proxylinkid` int unsigned NOT NULL,
  `objecttype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objecttable` enum('account','activity','class','department','csstemplate','item','process','processinstance','processinstanceobject','property','propertyvalue','role','user') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `accountid` int unsigned DEFAULT NULL,
  `activityid` int unsigned DEFAULT NULL,
  `csstemplateid` int unsigned DEFAULT NULL,
  `classid` int unsigned DEFAULT NULL,
  `departmentid` int unsigned DEFAULT NULL,
  `itemid` int unsigned DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `processinstanceid` int unsigned DEFAULT NULL,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  `propertyid` int unsigned DEFAULT NULL,
  `propertyvalueid` int unsigned DEFAULT NULL,
  `roleid` int unsigned DEFAULT NULL,
  `userid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`proxylinkobjectid`),
  KEY `idx_proxylinkobject_proxylinkid` (`proxylinkid`),
  KEY `idx_proxylinkobject_systemaccountid` (`systemaccountid`),
  KEY `fk_proxylinkobject_accountid` (`accountid`),
  KEY `fk_proxylinkobject_activityid` (`activityid`),
  KEY `fk_proxylinkobject_departmentid` (`departmentid`),
  KEY `fk_proxylinkobject_csstemplateid` (`csstemplateid`),
  KEY `fk_proxylinkobject_itemid` (`itemid`),
  KEY `fk_proxylinkobject_processid` (`processid`),
  KEY `fk_proxylinkobject_processinstanceid` (`processinstanceid`),
  KEY `fk_proxylinkobject_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `fk_proxylinkobject_propertyid` (`propertyid`),
  KEY `fk_proxylinkobject_propertyvalueid` (`propertyvalueid`),
  KEY `fk_proxylinkobject_userid` (`userid`),
  KEY `fk_proxylinkobject_classid_idx` (`classid`),
  KEY `fk_proxylinkobject_roleid` (`roleid`),
  CONSTRAINT `fk_proxylinkobject_accountid` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_activityid` FOREIGN KEY (`activityid`) REFERENCES `activity` (`activityid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_classid` FOREIGN KEY (`classid`) REFERENCES `class` (`classid`),
  CONSTRAINT `fk_proxylinkobject_csstemplateid` FOREIGN KEY (`csstemplateid`) REFERENCES `csstemplate` (`csstemplateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_departmentid` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_itemid` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_processinstanceid` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_processinstanceobjectid` FOREIGN KEY (`processinstanceobjectid`) REFERENCES `processinstanceobject` (`processinstanceobjectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_propertyid` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_propertyvalueid` FOREIGN KEY (`propertyvalueid`) REFERENCES `propertyvalue` (`propertyvalueid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_proxylinkid` FOREIGN KEY (`proxylinkid`) REFERENCES `proxylink` (`proxylinkid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `fk_proxylinkobject_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_proxylinkobject_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60098  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxylinksettingmap` (
  `proxylinksettingmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `proxylinkid` int unsigned NOT NULL,
  `settingcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `intvalue` int DEFAULT NULL,
  `floatvalue` float DEFAULT NULL,
  `varcharvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `textvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `booleanvalue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datetimevalue` datetime DEFAULT NULL,
  `markdownvalue` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`proxylinksettingmapid`),
  UNIQUE KEY `uk_psmap` (`proxylinkid`,`settingcode`),
  KEY `idx_psmap_proxylinkid` (`proxylinkid`),
  KEY `idx_psmap_settingcode` (`settingcode`),
  KEY `idx_psmap_systemaccountid` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotetype` (
  `quotetypeid` int unsigned NOT NULL AUTO_INCREMENT,
  `quotetype_metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `deposit_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `default_depositpercent` float DEFAULT NULL,
  `default_deposittype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `default_discountpercent` float DEFAULT NULL,
  `default_term` float DEFAULT NULL,
  `default_interestrate` float DEFAULT NULL,
  `default_footer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `default_pricing_level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `default_nod32included` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `default_add_software_to_existing_contract` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `kds_software_unitprice` float DEFAULT NULL,
  `default_warranty_metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pos_terminal_qnty` float DEFAULT NULL,
  `office_terminal_qnty` float DEFAULT NULL,
  `handheld_terminal_qnty` float DEFAULT NULL,
  `kds_terminal_qnty` float DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`quotetypeid`),
  UNIQUE KEY `uk_quotetype_systemaccountid_metacode` (`quotetype_metacode`,`systemaccountid`),
  KEY `idx_quotetype_systemaccountid` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotetypeitem` (
  `quotetypeitemid` int unsigned NOT NULL AUTO_INCREMENT,
  `quotetypeid` int unsigned NOT NULL,
  `salesquoteitemtype` enum('header','item','other') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'item',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `itemid` int unsigned DEFAULT NULL,
  `itemqnty` float DEFAULT '1',
  `itemnumber` int unsigned DEFAULT NULL,
  `itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `group_quotetypeitemid` int unsigned DEFAULT NULL,
  `formulatype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `formulatype_quotetypeitemid_1` int unsigned DEFAULT NULL,
  `formulatype_quotetypeitemid_2` int unsigned DEFAULT NULL,
  `include_salesquote_licence_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_kds_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_pos_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_office_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_handheld_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`quotetypeitemid`),
  KEY `fk_quotetype` (`quotetypeid`),
  CONSTRAINT `fk_quotetype` FOREIGN KEY (`quotetypeid`) REFERENCES `quotetype` (`quotetypeid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_factors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int NOT NULL,
  `factor_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `records` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurrence` (
  `recurrenceid` int unsigned NOT NULL AUTO_INCREMENT,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `durationtime` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `recurrence_pattern` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `recurrence_days` int unsigned DEFAULT NULL,
  `recurrence_weekday` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `recurrence_everynumberofweeks` int unsigned DEFAULT NULL,
  `recurrence_dayofweek` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `recurrence_dayofmonth` int unsigned DEFAULT NULL,
  `recurrence_everynumberofmonths` int unsigned DEFAULT NULL,
  `recurrence_monthlydaynumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `recurrence_monthlydayofweek` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `recurrence_monthlyeverynumberofmonths` int unsigned DEFAULT NULL,
  `recurrence_yearlyeverymonth` int unsigned DEFAULT NULL,
  `recurrence_yearlyeverymonthday` int unsigned DEFAULT NULL,
  `recurrence_yearlyweekdaynumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `recurrence_yearlyweekday` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `recurrence_yearlymonth` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `startdate` date NOT NULL,
  `enddatetype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `endafteroccurrences` int DEFAULT NULL,
  `endbydate` date DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int NOT NULL,
  `updatedbyuserid` int DEFAULT NULL,
  `deletedbyuserid` int DEFAULT NULL,
  PRIMARY KEY (`recurrenceid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `regionid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`regionid`)
) ENGINE=InnoDB AUTO_INCREMENT=4  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsibility` (
  `responsibilityid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `responsibilityname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`responsibilityid`),
  KEY `fk_responsibility_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_responsibility_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleid` int unsigned NOT NULL AUTO_INCREMENT,
  `rolekey` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `departmentid` int unsigned DEFAULT NULL,
  `rolename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `public` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `systemdefault` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  PRIMARY KEY (`roleid`),
  KEY `fk_role_department` (`departmentid`),
  KEY `idx_role_systemaccountid` (`systemaccountid`),
  KEY `idx_role_rolekey` (`rolekey`)
) ENGINE=InnoDB AUTO_INCREMENT=206821  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleobjectmap` (
  `roleobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `roleid` int unsigned NOT NULL,
  `objecttype` enum('class','document','item','module','process','processfolder','component') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `objectid` int NOT NULL,
  `can_view` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `can_add` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `can_edit` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `can_remove` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `can_export` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `is_expert` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `is_author` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`roleobjectmapid`),
  UNIQUE KEY `roleobjectmap_unique` (`roleid`,`objecttype`,`objectid`),
  KEY `idx_roleobjectmap_roleid` (`roleid`),
  KEY `idx_roleobjectmap_objecttype` (`objecttype`),
  KEY `idx_roleobjectmap_objectid` (`objectid`),
  CONSTRAINT `fk_roleobjectmap_roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=91483  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleresponsibilitymap` (
  `roleresponsibilitymapid` int unsigned NOT NULL AUTO_INCREMENT,
  `roleid` int unsigned NOT NULL,
  `responsibilityid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`roleresponsibilitymapid`),
  KEY `fk_rrmap_role` (`roleid`),
  KEY `fk_rrmap_responsibility` (`responsibilityid`),
  CONSTRAINT `fk_rrmap_responsibility` FOREIGN KEY (`responsibilityid`) REFERENCES `responsibility` (`responsibilityid`),
  CONSTRAINT `fk_rrmap_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesinvoice` (
  `salesinvoiceid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesinvoiceno` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `salesorderid` int unsigned DEFAULT NULL,
  `salesquoteid` int unsigned DEFAULT NULL,
  `salesinvoicetype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `docnum` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Corresponding 3rd Party Document Number for Pastel, SAP, AccPac, QuickBooks etc.',
  `docnumdate` datetime DEFAULT NULL,
  `externalsonumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `externalsonumberdate` datetime DEFAULT NULL,
  `externalsonumbercreatedby` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `accountid` int DEFAULT '0',
  `attention_personid` int DEFAULT NULL,
  `salesrep_systemaccountuserid` int DEFAULT '0',
  `customertype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesinvoicetitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesinvoicestatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesinvoicestatusdate` datetime DEFAULT NULL,
  `customerreference` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `documentdate` datetime DEFAULT NULL COMMENT 'Sales Invoice Date',
  `billingaddress` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `billingprovince` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingcity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingpostcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingcountry` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingaddress` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `shippingprovince` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingcity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingpostcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingcountry` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `paymentterms` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `salesinvoicepaymentstatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `customerordernumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Drop customerordernumber when SAP Sync for Graffiti is removed.',
  `discountpercent` float DEFAULT '0',
  `currencyid` int DEFAULT NULL,
  `comments` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesinvoiceno`,`systemaccountid`),
  UNIQUE KEY `idx_salesinvoiceid` (`salesinvoiceid`),
  KEY `idx_salesquoteid` (`salesquoteid`),
  KEY `idx_systemaccount` (`systemaccountid`),
  CONSTRAINT `salesinvoice_ibfk_1` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `salesinvoice_ibfk_2` FOREIGN KEY (`salesquoteid`) REFERENCES `salesquote` (`salesquoteid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesinvoiceitem` (
  `salesinvoiceitemid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesinvoiceid` int unsigned NOT NULL,
  `salesinvoiceitemtype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesquoteitemid` int unsigned DEFAULT NULL,
  `salesorderitemid` int unsigned DEFAULT NULL,
  `itemnumber` int unsigned DEFAULT NULL,
  `itemcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `unitprice` double DEFAULT NULL,
  `discountpercent` double DEFAULT '0',
  `itemqnty` float DEFAULT NULL,
  `taxcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `taxrate` float DEFAULT NULL,
  `vehicleordertype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned DEFAULT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesinvoiceitemid`),
  KEY `idx_salesinvoice` (`salesinvoiceid`),
  KEY `idx_salesquoteitemid` (`salesquoteitemid`),
  KEY `idx_salesorderitemid` (`salesorderitemid`),
  CONSTRAINT `salesinvoiceitem_ibfk_1` FOREIGN KEY (`salesinvoiceid`) REFERENCES `salesinvoice` (`salesinvoiceid`),
  CONSTRAINT `salesinvoiceitem_ibfk_2` FOREIGN KEY (`salesquoteitemid`) REFERENCES `salesquoteitem` (`salesquoteitemid`),
  CONSTRAINT `salesinvoiceitem_ibfk_3` FOREIGN KEY (`salesorderitemid`) REFERENCES `salesorderitem` (`salesorderitemid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesinvoiceusermap` (
  `salesinvoiceusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesinvoiceid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `roleid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesinvoiceid`,`userid`,`roleid`),
  UNIQUE KEY `idx_salesinvoiceusermap` (`salesinvoiceusermapid`),
  KEY `fk_salesinvoiceusermap_salesquote` (`salesinvoiceid`),
  KEY `fk_salesinvoiceusermap_user` (`userid`),
  KEY `fk_salesinvoiceusermap_role` (`roleid`),
  CONSTRAINT `fk_salesinvoiceusermap_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `fk_salesinvoiceusermap_salesquote` FOREIGN KEY (`salesinvoiceid`) REFERENCES `salesinvoice` (`salesinvoiceid`),
  CONSTRAINT `fk_salesinvoiceusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Links users to salesinvoice as salerep or pm etc';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesopportunity` (
  `salesopportunityid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesopportunitynumber` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `opportunityname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `opendate` datetime DEFAULT NULL,
  `predictedclosingdate` datetime DEFAULT NULL,
  `potentialamount` double DEFAULT NULL,
  `grossprofitpercent` float DEFAULT NULL,
  `grossprofitamount` double DEFAULT NULL,
  `chanceofclosing` float DEFAULT NULL,
  `opportunityremarks` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `closingtotalamount` double DEFAULT NULL,
  `closinggrossprofit` double DEFAULT NULL,
  `discountpercent` float DEFAULT '0',
  `salesopportunitycategory` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `salesopportunityguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`salesopportunityid`),
  KEY `fk_salesopportunity_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_salesopportunity_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesopportunityitem` (
  `salesopportunityitemid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesopportunityitemguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesopportunityid` int unsigned NOT NULL,
  `ext_quoteitemno` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `itemtype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `itemnumber` int unsigned DEFAULT NULL,
  `itemid` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `comments` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `discountpercent` double NOT NULL DEFAULT '0',
  `itemqnty` float DEFAULT NULL,
  `taxcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `taxrate` float DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesopportunityitemid`),
  KEY `fk_salesopportunityitem_salesopportunity` (`salesopportunityid`),
  KEY `idx_salesopportunityitem_salesopportunityitemguid` (`salesopportunityitemguid`),
  CONSTRAINT `fk_salesopportunityitem_salesopportunity` FOREIGN KEY (`salesopportunityid`) REFERENCES `salesopportunity` (`salesopportunityid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesopportunityobjectmap` (
  `salesopportunityobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesopportunityid` int unsigned NOT NULL,
  `objecttable` enum('account','person','class','document','item','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesopportunityobjectmapid`),
  UNIQUE KEY `salesopportunityid` (`salesopportunityid`,`objecttable`,`objectid`),
  KEY `fk_soomap_salesopportunity` (`salesopportunityid`),
  CONSTRAINT `fk_soomap_salesopportunity` FOREIGN KEY (`salesopportunityid`) REFERENCES `salesopportunity` (`salesopportunityid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesopportunityusermap` (
  `salesopportunityusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesopportunityid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `salesopportunityusertype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesopportunityusermapid`),
  UNIQUE KEY `uniqueness` (`salesopportunityid`,`userid`),
  KEY `fk_sumap_salesopportunity` (`salesopportunityid`),
  KEY `fk_sumap_user` (`userid`),
  CONSTRAINT `fk_sumap_salesopportunity` FOREIGN KEY (`salesopportunityid`) REFERENCES `salesopportunity` (`salesopportunityid`),
  CONSTRAINT `fk_sumap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesorder` (
  `salesorderid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesquoteid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `salesorderno` int unsigned NOT NULL,
  `ext_orderno` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shopid` int unsigned DEFAULT NULL,
  `accountid` int unsigned NOT NULL,
  `segmentation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesordertitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'Pulled across from salesquote.quotetitle',
  `salesorderstatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `salesorderdate` datetime NOT NULL COMMENT 'Date Sales Order was Placed',
  `customerreference` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `comments` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `billingaddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingprovince` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingcity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingpostcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingcountry` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingaddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingprovince` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingcity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingpostcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingcountry` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `paymentterms` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `invoicealertrule` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `paymenttype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `paymentstatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `discountpercent` float DEFAULT NULL,
  `currencyid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccountid`,`salesorderno`),
  UNIQUE KEY `idx_salesorder` (`salesorderid`),
  UNIQUE KEY `uk_systemaccountid_ext_orderno` (`systemaccountid`,`ext_orderno`),
  KEY `fk_salesorder_systemaccount` (`systemaccountid`),
  KEY `fk_salesorder_account` (`accountid`),
  KEY `fk_salesorder_currency` (`currencyid`),
  CONSTRAINT `fk_salesorder_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_salesorder_currency` FOREIGN KEY (`currencyid`) REFERENCES `currency` (`currencyid`),
  CONSTRAINT `fk_salesorder_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=536849  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesordercontract` (
  `salesordercontractid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `accountid` int unsigned NOT NULL,
  `salesorderid` int unsigned NOT NULL,
  `licensetype` enum('trial','rent') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `contracttype` enum('monthly','setperiod') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `contractstartdate` datetime NOT NULL,
  `contractenddate` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesordercontractid`),
  KEY `fk_salesordercontract_systemaccount` (`systemaccountid`),
  KEY `fk_salesordercontract_account` (`accountid`),
  KEY `fk_salesordercontract_salesorder` (`salesorderid`),
  CONSTRAINT `fk_salesordercontract_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_salesordercontract_salesorder` FOREIGN KEY (`salesorderid`) REFERENCES `salesorder` (`salesorderid`),
  CONSTRAINT `fk_salesordercontract_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=1233  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesordercontractsignature` (
  `salesordercontractsignatureid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesordercontractid` int unsigned NOT NULL,
  `personid` int unsigned NOT NULL,
  `datesigned` datetime NOT NULL,
  `locationsigned` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `signaturetype` enum('primary','witness') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesordercontractsignatureid`),
  KEY `fk_socsignature_salesordercontract` (`salesordercontractid`),
  KEY `fk_socsignature_ personid` (`personid`),
  CONSTRAINT `fk_socsignature_ personid` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`),
  CONSTRAINT `fk_socsignature_salesordercontract` FOREIGN KEY (`salesordercontractid`) REFERENCES `salesordercontract` (`salesordercontractid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesorderitem` (
  `salesorderitemid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesorderitemno` int unsigned DEFAULT NULL,
  `salesorderitemstatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesorderid` int unsigned NOT NULL,
  `salesorderitemtype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `salesquoteitemid` int unsigned DEFAULT NULL,
  `ext_orderitemno` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `itemnumber` int unsigned DEFAULT NULL COMMENT 'Helps the order in which items are listed',
  `itemid` int unsigned DEFAULT NULL,
  `itemqnty` float DEFAULT NULL,
  `backorderqnty` float DEFAULT '0',
  `shipqnty` float DEFAULT '0',
  `unitofmeasure` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `details` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `discountpercent` double DEFAULT '0',
  `taxcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `taxrate` float DEFAULT NULL,
  `pricerange` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `requestedshipdate` datetime DEFAULT NULL,
  `promisedshipdate` datetime DEFAULT NULL,
  `ext_text1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ext_text2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned DEFAULT NULL COMMENT 'Added in v2.12.01 for license time tracking',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesorderitemid`),
  UNIQUE KEY `uk_salesorderid_ext_orderitemno` (`salesorderid`,`ext_orderitemno`),
  KEY `idx_salesorderid` (`salesorderid`),
  KEY `idx_salesquoteitemid` (`salesquoteitemid`),
  KEY `fk_salesorderitem_item` (`itemid`),
  KEY `idx_salesquoteitem_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_salesorderitem_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `salesorderitem_ibfk_1` FOREIGN KEY (`salesorderid`) REFERENCES `salesorder` (`salesorderid`),
  CONSTRAINT `salesorderitem_ibfk_2` FOREIGN KEY (`salesquoteitemid`) REFERENCES `salesquoteitem` (`salesquoteitemid`)
) ENGINE=InnoDB AUTO_INCREMENT=1355191  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesorderpersonmap` (
  `salesorderpersonmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesorderid` int unsigned NOT NULL,
  `personid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesorderpersonmapid`),
  UNIQUE KEY `idx_salesorderpersonmap` (`salesorderid`,`personid`),
  KEY `fk_salesorderpersonmap_salesorder` (`salesorderid`),
  KEY `fk_salesorderpersonmap_person` (`personid`),
  CONSTRAINT `fk_salesorderpersonmap_person` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`),
  CONSTRAINT `fk_salesorderpersonmap_salesorder` FOREIGN KEY (`salesorderid`) REFERENCES `salesorder` (`salesorderid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Links users to salesorder as salerep or pm etc';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesorderusermap` (
  `salesorderusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesorderid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `roleid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesorderid`,`userid`,`roleid`),
  UNIQUE KEY `idx_salesorderusermap` (`salesorderusermapid`),
  KEY `fk_salesorderusermap_salesorder` (`salesorderid`),
  KEY `fk_salesorderusermap_user` (`userid`),
  KEY `fk_salesorderusermap_role` (`roleid`),
  CONSTRAINT `fk_salesorderusermap_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `fk_salesorderusermap_salesorder` FOREIGN KEY (`salesorderid`) REFERENCES `salesorder` (`salesorderid`),
  CONSTRAINT `fk_salesorderusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Links users to salesorder as salerep or pm etc';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesquote` (
  `salesquoteid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesquoteno` int unsigned DEFAULT NULL,
  `ext_quoteno` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `salesopportunityid` int unsigned DEFAULT NULL,
  `accountid` int unsigned DEFAULT NULL,
  `quotetype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'QUOTE',
  `estimate` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `customertype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `introduction` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `introductiontinytext` tinytext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `quotetitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `quotestatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `orderstatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `invoicestatus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `customerreference` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `accountpersonmapid` int unsigned DEFAULT NULL,
  `accountaddressmapid` int unsigned DEFAULT NULL,
  `validfromdate` datetime DEFAULT NULL,
  `expirydate` datetime DEFAULT NULL,
  `documentdate` datetime DEFAULT NULL COMMENT 'Sales Quote Date',
  `billingaddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingline1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingline2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingline3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingline4` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingline5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingprovince` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingcity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingpostcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `billingcountry` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingaddress` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingline1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingline2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingline3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingline4` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingline5` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingprovince` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingcity` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingpostcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shippingcountry` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `paymentterms` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `invoicealertrule` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `customerordernumber` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'Drop customerordernumber when SAP Sync for Graffiti is removed.',
  `discountpercent` float DEFAULT '0',
  `currencyid` int unsigned DEFAULT NULL,
  `comments` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `internalcomments` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `lead_time` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `offer_valid` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `terms_and_conditions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `lastsynchdate` datetime DEFAULT NULL,
  `duplicatedfrom_salesquoteid` int unsigned DEFAULT NULL,
  `depositpercent` float DEFAULT NULL,
  `term` float DEFAULT NULL,
  `interestrate` float DEFAULT NULL,
  `dateaccepted` datetime DEFAULT NULL,
  `datedeclined` datetime DEFAULT NULL,
  `sentguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `approveguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `salesquoteguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `terminal_qnty` float DEFAULT NULL,
  `kds_terminal_qnty` float DEFAULT NULL,
  `deposittype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pricing_level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `nod32included` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `licence_qnty` float DEFAULT NULL,
  `add_software_to_existing_contract` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `kds_software_unitprice` float DEFAULT NULL,
  `warranty_metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pos_terminal_qnty` float DEFAULT NULL,
  `office_terminal_qnty` float DEFAULT NULL,
  `handheld_terminal_qnty` float DEFAULT NULL,
  `installation_amount` float DEFAULT NULL,
  `use_installation_amount` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`salesquoteid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  KEY `idx_salesopportunityid` (`salesopportunityid`),
  KEY `idx_account` (`accountid`),
  KEY `idx_salesquoteguid` (`salesquoteguid`),
  KEY `fk_salesquote_accountpersonmapid` (`accountpersonmapid`),
  KEY `fk_salesquote_accountid` (`accountaddressmapid`),
  KEY `idx_salesquote_sentguid` (`sentguid`),
  KEY `idx_salesquote_approveguid` (`approveguid`),
  KEY `idx_salesquote_quotestatus` (`quotestatus`),
  KEY `idx_salesquote_salesquoteno` (`systemaccountid`,`salesquoteno`),
  CONSTRAINT `fk_salesquote_accountid` FOREIGN KEY (`accountaddressmapid`) REFERENCES `accountaddressmap` (`accountaddressmapid`),
  CONSTRAINT `fk_salesquote_accountpersonmapid` FOREIGN KEY (`accountpersonmapid`) REFERENCES `accountpersonmap` (`accountpersonmapid`),
  CONSTRAINT `salesquote_ibfk_1` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `salesquote_ibfk_2` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `salesquote_ibfk_3` FOREIGN KEY (`salesopportunityid`) REFERENCES `salesopportunity` (`salesopportunityid`)
) ENGINE=InnoDB AUTO_INCREMENT=564530  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesquotecalculation` (
  `salesquotecalculationid` int unsigned NOT NULL AUTO_INCREMENT,
  `calculationtype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `salesquoteid` int unsigned NOT NULL,
  `quotetype_metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `qnty_from` float DEFAULT NULL,
  `qnty_to` float DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_x_qnty` double DEFAULT NULL,
  `warranty_metacode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `percent_of_subtotal` float DEFAULT NULL,
  `pricing_level` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `add_software_to_existing_contract` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `nod32included` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int NOT NULL,
  `updatedbyuserid` int DEFAULT NULL,
  `deletedbyuserid` int DEFAULT NULL,
  PRIMARY KEY (`salesquotecalculationid`),
  KEY `salesquoteid` (`salesquoteid`),
  CONSTRAINT `salesquotecalculation_ibfk_1` FOREIGN KEY (`salesquoteid`) REFERENCES `salesquote` (`salesquoteid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesquoteitem` (
  `salesquoteitemid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesquoteid` int unsigned NOT NULL,
  `salesquoteitemtype` enum('header','item','other') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'item',
  `quotetypeitemid` int unsigned DEFAULT NULL,
  `pricemethod` enum('list','manual') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'list',
  `itemnumber` int unsigned DEFAULT NULL,
  `itemid` int unsigned DEFAULT NULL,
  `itemtypesection` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `group_quotetypeitemid` int unsigned DEFAULT NULL,
  `formulatype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `formulatype_salesquoteitemid_1` int unsigned DEFAULT NULL,
  `formulatype_salesquoteitemid_2` int unsigned DEFAULT NULL,
  `include_salesquote_licence_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_kds_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_pos_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_office_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `include_salesquote_handheld_terminal_qnty` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `comments` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `unitprice` double DEFAULT NULL,
  `discountpercent` double NOT NULL DEFAULT '0',
  `itemqnty` float DEFAULT NULL,
  `taxcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `taxrate` float DEFAULT NULL,
  `processinstanceid` int unsigned DEFAULT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `itemstatus` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ext_refno` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `related_itemid` int DEFAULT NULL,
  `extra_cost` double DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `salesquoteitemguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `chooser_salesquoteitemid` int unsigned DEFAULT NULL,
  `related_itemids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesquoteitemid`),
  KEY `idx_salesquoteid` (`salesquoteid`),
  KEY `idx_salesquoteitemguid` (`salesquoteitemguid`),
  KEY `idx_salesquoteitem_chooser_salesquoteitemid` (`chooser_salesquoteitemid`),
  KEY `idx_salesquoteitem_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `fk_salesquoteitem_item_idx` (`itemid`),
  KEY `fk_salesquoteitem_processinstance_idx` (`processinstanceid`),
  CONSTRAINT `fk_salesquoteitem_chooser_salesquoteitemid` FOREIGN KEY (`chooser_salesquoteitemid`) REFERENCES `salesquoteitem` (`salesquoteitemid`),
  CONSTRAINT `fk_salesquoteitem_item` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_salesquoteitem_processinstance` FOREIGN KEY (`processinstanceid`) REFERENCES `processinstance` (`processinstanceid`),
  CONSTRAINT `fk_salesquoteitem_salesquote` FOREIGN KEY (`salesquoteid`) REFERENCES `salesquote` (`salesquoteid`)
) ENGINE=InnoDB AUTO_INCREMENT=1129952  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesquoteitemobjectmap` (
  `salesquoteitemobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesquoteitemid` int unsigned NOT NULL,
  `objecttable` enum('salesquoteitem') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesquoteitemobjectmapid`),
  UNIQUE KEY `salesquoteitemid_2` (`salesquoteitemid`,`objecttable`,`objectid`),
  KEY `salesquoteitemid` (`salesquoteitemid`),
  CONSTRAINT `salesquoteitemobjectmap_ibfk_1` FOREIGN KEY (`salesquoteitemid`) REFERENCES `salesquoteitem` (`salesquoteitemid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=56  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesquotesoftware` (
  `salesquotesoftwareid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesquoteid` int unsigned NOT NULL,
  `softwareid` int unsigned DEFAULT NULL,
  `itemcode` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `itemqnty` float DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesquotesoftwareid`),
  KEY `idx_salesquotesoftware_salesquoteid` (`salesquoteid`),
  CONSTRAINT `fk_salesquotesoftware_salesquoteid` FOREIGN KEY (`salesquoteid`) REFERENCES `salesquote` (`salesquoteid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesquoteusermap` (
  `salesquoteusermapid` int unsigned NOT NULL AUTO_INCREMENT,
  `salesquoteid` int unsigned NOT NULL,
  `userid` int unsigned NOT NULL,
  `roleid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`salesquoteid`,`userid`,`roleid`),
  UNIQUE KEY `idx_salesquoteusermap` (`salesquoteusermapid`),
  KEY `fk_salesquoteusermap_salesquote` (`salesquoteid`),
  KEY `fk_salesquoteusermap_user` (`userid`),
  KEY `fk_salesquoteusermap_role` (`roleid`),
  CONSTRAINT `fk_salesquoteusermap_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`),
  CONSTRAINT `fk_salesquoteusermap_salesquote` FOREIGN KEY (`salesquoteid`) REFERENCES `salesquote` (`salesquoteid`),
  CONSTRAINT `fk_salesquoteusermap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin COMMENT='Links users to salesquote as salerep or pm etc';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchphrase` (
  `searchphraseid` int unsigned NOT NULL AUTO_INCREMENT,
  `searchphrase` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `accountid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`searchphraseid`),
  KEY `fk_searchphrase_account` (`accountid`),
  CONSTRAINT `fk_searchphrase_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`)
) ENGINE=InnoDB AUTO_INCREMENT=76506  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `sessionid` int unsigned NOT NULL AUTO_INCREMENT,
  `php_sessionid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `idx_session_php_sessionid` (`php_sessionid`),
  KEY `idx_session_createdbyuserid` (`createdbyuserid`),
  KEY `fk_session_systemaccountid` (`systemaccountid`),
  KEY `idx_session_common_lookup` (`systemaccountid`,`createdbyuserid`,`php_sessionid`),
  CONSTRAINT `fk_session_createdbyuserid` FOREIGN KEY (`createdbyuserid`) REFERENCES `user` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `fk_session_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=2179  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `session_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `va_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime_start` timestamp NULL DEFAULT NULL,
  `datetime_end` timestamp NULL DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `systemaccountid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_session_id_index` (`session_id`),
  KEY `sessions_session_code_index` (`session_code`),
  KEY `sessions_va_code_index` (`va_code`),
  KEY `sessions_datetime_start_index` (`datetime_start`),
  KEY `sessions_datetime_end_index` (`datetime_end`),
  KEY `sessions_user_email_index` (`user_email`),
  KEY `sessions_systemaccountid_index` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `settingid` int unsigned NOT NULL AUTO_INCREMENT,
  `settingcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `settingtype` enum('systemaccount','user','process','proxylink','generic') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'systemaccount',
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'NeuroLogic Pastel Account No.',
  `datatype` enum('int','float','varchar','text','boolean','datetime','markdown') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `restriction` enum('none','hidden','readonly') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'none',
  `childsettingcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `defaultintvalue` int DEFAULT NULL,
  `defaultfloatvalue` float DEFAULT NULL,
  `defaultvarcharvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `defaulttextvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `defaultbooleanvalue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `defaultdatetimevalue` datetime DEFAULT NULL,
  `defaultmarkdownvalue` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`settingid`),
  UNIQUE KEY `uk_setting_settingcode` (`settingcode`,`settingtype`),
  KEY `idx_setting_settingtype` (`settingtype`),
  KEY `idx_setting_settingcode` (`settingcode`),
  KEY `idx_setting_datatype` (`datatype`)
) ENGINE=InnoDB AUTO_INCREMENT=257  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sharelink` (
  `sharelinkid` int unsigned NOT NULL AUTO_INCREMENT,
  `hashid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `objecttype` enum('advisor') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `userid` int unsigned DEFAULT NULL,
  `accountid` int unsigned DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `classid` int unsigned DEFAULT NULL,
  `activityid` int unsigned DEFAULT NULL,
  `processinstanceid` int unsigned DEFAULT NULL,
  `processinstanceobjectid` int unsigned DEFAULT NULL,
  `datelastclicked` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sharelinkid`),
  KEY `idx_sharelink_hashid` (`hashid`),
  KEY `idx_sharelink_systemaccountid` (`systemaccountid`),
  KEY `idx_sharelink_userid` (`userid`),
  KEY `idx_sharelink_accountid` (`accountid`),
  KEY `idx_sharelink_processid` (`processid`),
  KEY `idx_sharelink_classid` (`classid`),
  KEY `idx_sharelink_activityid` (`activityid`),
  KEY `idx_sharelink_processinstanceid` (`processinstanceid`),
  KEY `idx_sharelink_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `idx_sharelink_createdbyuserid` (`createdbyuserid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `shopid` int NOT NULL AUTO_INCREMENT,
  `shopguid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `shop_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_domain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_domain_registered` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `shop_domain_ready` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `shop_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_fax` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_physical_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `google_map_src` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `shop_productsperpage` int DEFAULT '12',
  `shop_productcategory_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'bag.png',
  `shop_head_logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_head_logo_alt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_cufon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_vatblurb` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '* All Prices Exclude VAT',
  `shop_footlogo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shop_stockreservedtimeout` int DEFAULT '15',
  `home_folders_heading` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `reg_dealership_required` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `shippingcostingmethod` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'PRICERANGE',
  `productcodedisplayfield` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'productcode',
  `generate_sap_file` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `nearest_dealership_link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `dealer_discount_percent` float DEFAULT '0',
  `home_banner` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `taxrate` float DEFAULT '14',
  `termsandconditions` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `adminemail` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `active` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `meta_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `use_mygate` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `mygate_Mode` int DEFAULT '0',
  `mygate_txtMerchantID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `mygate_txtApplicationID` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `mygate_txtMerchantReference` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `mygate_txtCurrencyCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'ZAR',
  `mygate_txtRedirectSuccessfulURL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `mygate_txtRedirectFailedURL` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `platform_maintainable` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`shopid`),
  KEY `fk_shop_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_shop_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcss` (
  `shopcssid` int NOT NULL AUTO_INCREMENT,
  `shopid` int NOT NULL,
  `shop_font_family` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `nav_background_color` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `nav_link_hover_bgcolor` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `nav_link_text_color` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `nav_link_text_hover_color` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`shopcssid`),
  KEY `fk_shopcss_shop` (`shopid`),
  CONSTRAINT `fk_shopcss_shop` FOREIGN KEY (`shopid`) REFERENCES `shop` (`shopid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppage` (
  `shoppageid` int NOT NULL AUTO_INCREMENT,
  `parentid` int DEFAULT NULL,
  `hierarchy` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pagetype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `pagename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `linktype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `linkname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `linkhref` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `linktarget` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `content_layout` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shopid` int DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbysystemaccountuserid` int DEFAULT NULL,
  `updatedbysystemaccountuserid` int DEFAULT NULL,
  `deletedbysystemaccountuserid` int DEFAULT NULL,
  PRIMARY KEY (`shoppageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppagecontent` (
  `shoppagecontentid` int NOT NULL AUTO_INCREMENT,
  `shoppageid` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `image_float` enum('left','right') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'left',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`shoppagecontentid`),
  KEY `fk_shoppagecontent_shoppage` (`shoppageid`),
  CONSTRAINT `fk_shoppagecontent_shoppage` FOREIGN KEY (`shoppageid`) REFERENCES `shoppage` (`shoppageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppagelist` (
  `shoppagelistid` int NOT NULL AUTO_INCREMENT,
  `shopid` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`shoppagelistid`),
  KEY `fk_shoppagelist_shop` (`shopid`),
  CONSTRAINT `fk_shoppagelist_shop` FOREIGN KEY (`shopid`) REFERENCES `shop` (`shopid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppagelistmap` (
  `shoppagelistmapid` int NOT NULL AUTO_INCREMENT,
  `shoppagelistid` int NOT NULL,
  `shoppageid` int NOT NULL,
  `sortorder` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`shoppagelistmapid`),
  KEY `fk_shoppagelistmap_shoppagelist` (`shoppagelistid`),
  KEY `fk_shoppagelistmap_shoppage` (`shoppageid`),
  CONSTRAINT `fk_shoppagelistmap_shoppage` FOREIGN KEY (`shoppageid`) REFERENCES `shoppage` (`shoppageid`),
  CONSTRAINT `fk_shoppagelistmap_shoppagelist` FOREIGN KEY (`shoppagelistid`) REFERENCES `shoppagelist` (`shoppagelistid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppagenavmap` (
  `shoppagenavmapid` int NOT NULL AUTO_INCREMENT,
  `shopid` int NOT NULL,
  `shoppageid` int NOT NULL,
  `sortorder` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`shoppagenavmapid`),
  KEY `fk_shoppagenavmap_shop` (`shopid`),
  KEY `fk_shoppagenavmap_shoppageid` (`shoppageid`),
  CONSTRAINT `fk_shoppagenavmap_shop` FOREIGN KEY (`shopid`) REFERENCES `shop` (`shopid`),
  CONSTRAINT `fk_shoppagenavmap_shoppageid` FOREIGN KEY (`shoppageid`) REFERENCES `shoppage` (`shoppageid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slidetemplate` (
  `slidetemplateid` int unsigned NOT NULL AUTO_INCREMENT,
  `templatename` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`slidetemplateid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slidetemplatesystemaccountmap` (
  `slidetemplatesystemaccountmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `slidetemplateid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`slidetemplatesystemaccountmapid`),
  KEY `fk_stsam_systemaccount` (`systemaccountid`),
  KEY `fk_stsam_slidetemplateid` (`slidetemplateid`),
  CONSTRAINT `fk_stsam_slidetemplateid` FOREIGN KEY (`slidetemplateid`) REFERENCES `slidetemplate` (`slidetemplateid`),
  CONSTRAINT `fk_stsam_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `software` (
  `softwareid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `quotetype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `itemcode` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`softwareid`),
  UNIQUE KEY `uk_software_sysid_qt_itemcode` (`systemaccountid`,`quotetype`,`itemcode`),
  KEY `idx_software_systemaccountid` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solution` (
  `solutionid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `solutiontype` enum('criteriaimpact','expertsolution') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`solutionid`),
  KEY `fk_solution_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_solution_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutionobjectmap` (
  `solutionobjectmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `solutionid` int unsigned NOT NULL,
  `objecttable` enum('document','process') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `rank` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`solutionobjectmapid`),
  UNIQUE KEY `solutionobject` (`solutionid`,`objecttable`,`objectid`),
  KEY `fk_solutionobjectmap_solution` (`solutionid`),
  CONSTRAINT `fk_solutionobjectmap_solution` FOREIGN KEY (`solutionid`) REFERENCES `solution` (`solutionid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutionrule` (
  `solutionruleid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `rulenumber` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `applytoallchallenges` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`solutionruleid`),
  KEY `fk_solutionrule_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_solutionrule_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutionrulechallengemap` (
  `solutionrulechallengemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `solutionruleid` int unsigned NOT NULL,
  `challengeid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`solutionrulechallengemapid`),
  KEY `fk_solutionrulechallengemap_solutionrule` (`solutionruleid`),
  KEY `fk_solutionrulechallengemap_challenge` (`challengeid`),
  CONSTRAINT `fk_solutionrulechallengemap_challenge` FOREIGN KEY (`challengeid`) REFERENCES `challenge` (`challengeid`),
  CONSTRAINT `fk_solutionrulechallengemap_solutionrule` FOREIGN KEY (`solutionruleid`) REFERENCES `solutionrule` (`solutionruleid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutionrulecriteria` (
  `solutionrulecriteriaid` int unsigned NOT NULL AUTO_INCREMENT,
  `solutionruleid` int unsigned NOT NULL,
  `criteriatype` enum('operator','criteria') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `operator` enum('(',')','or','and') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `criteriaid` int unsigned DEFAULT NULL,
  `orderbynumber` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`solutionrulecriteriaid`),
  KEY `fk_solutionrulecriteria_solutionrule` (`solutionruleid`),
  KEY `fk_solutionrulecriteria_criteria` (`criteriaid`),
  CONSTRAINT `fk_solutionrulecriteria_criteria` FOREIGN KEY (`criteriaid`) REFERENCES `criteria` (`criteriaid`),
  CONSTRAINT `fk_solutionrulecriteria_solutionrule` FOREIGN KEY (`solutionruleid`) REFERENCES `solutionrule` (`solutionruleid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutionrulesolutionmap` (
  `solutionrulesolutionmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `solutionruleid` int unsigned NOT NULL,
  `solutionid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`solutionrulesolutionmapid`),
  KEY `fk_solutionrulesolutionmap_solutionruleid` (`solutionruleid`),
  KEY `fk_solutionrulesolutionmap_solutionid` (`solutionid`),
  CONSTRAINT `fk_solutionrulesolutionmap_solutionid` FOREIGN KEY (`solutionid`) REFERENCES `solution` (`solutionid`),
  CONSTRAINT `fk_solutionrulesolutionmap_solutionruleid` FOREIGN KEY (`solutionruleid`) REFERENCES `solution` (`solutionid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `starboard` (
  `starboardid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`starboardid`),
  KEY `idx_starboard_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_starboard_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stockid` int NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `assigned_userid` int unsigned DEFAULT NULL,
  `units` double NOT NULL,
  `transactiontype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `transactiondate` datetime NOT NULL,
  `stocklocation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `salesorderitemid` int DEFAULT NULL,
  `salesquoteitemid` int DEFAULT NULL,
  `warehouseid` int NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`stockid`),
  KEY `fk_stock_item` (`code`),
  KEY `fk_stock_systemaccount` (`systemaccountid`),
  KEY `fk_stock_warehouse` (`warehouseid`),
  CONSTRAINT `fk_stock_item` FOREIGN KEY (`code`) REFERENCES `item` (`code`),
  CONSTRAINT `fk_stock_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_stock_warehouse` FOREIGN KEY (`warehouseid`) REFERENCES `warehouse` (`warehouseid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestion` (
  `suggestionid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `categorycode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `suggestiontype` enum('internal','customer') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'internal',
  `status` enum('suggested','indevelopment','implemented') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'suggested',
  `suggesteddate` datetime NOT NULL,
  `suggestedbyuserid` int unsigned NOT NULL,
  `versionid` int unsigned DEFAULT NULL,
  `functionid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`suggestionid`),
  KEY `fk_suggestion_systemaccount` (`systemaccountid`),
  KEY `fk_suggestion_user` (`suggestedbyuserid`),
  KEY `fk_suggestion_function` (`functionid`),
  KEY `fk_suggestion_version` (`versionid`),
  CONSTRAINT `fk_suggestion_function` FOREIGN KEY (`functionid`) REFERENCES `function` (`functionid`),
  CONSTRAINT `fk_suggestion_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_suggestion_user` FOREIGN KEY (`suggestedbyuserid`) REFERENCES `user` (`userid`),
  CONSTRAINT `fk_suggestion_version` FOREIGN KEY (`versionid`) REFERENCES `version` (`versionid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suggestionvote` (
  `suggestionvoteid` int unsigned NOT NULL AUTO_INCREMENT,
  `suggestionid` int unsigned NOT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`suggestionid`,`createdbyuserid`),
  UNIQUE KEY `idx_suggestionvoteid` (`suggestionvoteid`),
  KEY `fk_suggestionvote_suggestion` (`suggestionid`),
  KEY `fk_suggestionvote_user` (`createdbyuserid`),
  CONSTRAINT `fk_suggestionvote_suggestion` FOREIGN KEY (`suggestionid`) REFERENCES `suggestion` (`suggestionid`),
  CONSTRAINT `fk_suggestionvote_user` FOREIGN KEY (`createdbyuserid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdbscript` (
  `sysdbscriptid` bigint NOT NULL AUTO_INCREMENT,
  `script_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `md5_sum` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `applied_status` int DEFAULT NULL,
  PRIMARY KEY (`sysdbscriptid`)
) ENGINE=InnoDB AUTO_INCREMENT=919  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemaccount` (
  `systemaccountid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccounttemplateid` int unsigned DEFAULT NULL,
  `systemaccountguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `accountid` int unsigned NOT NULL,
  `subdomain` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `subdomainpublic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `allowpublicaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `status` enum('prototype','testing','live') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'prototype',
  `corporateidentityid` int unsigned DEFAULT NULL,
  `content_upload_type` enum('local','ftp') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'local',
  `ftpid` int unsigned DEFAULT NULL,
  `emailsettingid` int unsigned DEFAULT NULL,
  `contentdomain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'https://clevva.net/clevva/',
  `contentlocation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `tabletdashboardimage` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `process_avatar_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `web_dashboard_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `dishonest` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `contentvendor` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `noimage` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `db_host` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `db_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `db_is_production` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'y',
  `db_label_backend` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `db_label_web` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `last_sync_version` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccountid`),
  KEY `fk_systemaccount_account` (`accountid`),
  KEY `systemaccountguid` (`systemaccountguid`),
  KEY `idx_systemaccount_systemaccounttemplateid` (`systemaccounttemplateid`),
  CONSTRAINT `fk_systemaccount_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_systemaccount_systemaccounttemplateid` FOREIGN KEY (`systemaccounttemplateid`) REFERENCES `systemaccounttemplate` (`systemaccounttemplateid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1153  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemaccountipaddress` (
  `systemaccountipaddressid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `ipaddress` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccountipaddressid`),
  UNIQUE KEY `systemaccountid` (`systemaccountid`,`ipaddress`),
  KEY `systemaccountid_2` (`systemaccountid`),
  CONSTRAINT `systemaccountipaddress_ibfk_1` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemaccountsettingmap` (
  `systemaccountsettingmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `settingcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `intvalue` int DEFAULT NULL,
  `floatvalue` float DEFAULT NULL,
  `varcharvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'NeuroLogic Pastel Account No.',
  `textvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `booleanvalue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datetimevalue` datetime DEFAULT NULL,
  `markdownvalue` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccountid`,`settingcode`),
  UNIQUE KEY `idx_systemaccountsettingmap` (`systemaccountsettingmapid`),
  KEY `fk_sasmap_systemaccount` (`systemaccountid`),
  KEY `fk_sasmap_settingcode` (`settingcode`),
  CONSTRAINT `fk_sasmap_settingcode` FOREIGN KEY (`settingcode`) REFERENCES `setting` (`settingcode`)
) ENGINE=InnoDB AUTO_INCREMENT=11855  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemaccountsubdomain` (
  `systemaccountsubdomainid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `subdomain` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `type` enum('reserved','additional') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'additional',
  `csstemplateid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccountsubdomainid`),
  UNIQUE KEY `uk_systemaccountsubdomain` (`systemaccountid`,`subdomain`),
  KEY `idx_systemaccountsubdomain_systemaccountid` (`systemaccountid`),
  KEY `fk_systemaccountsubdomain_csstemplateid` (`csstemplateid`),
  CONSTRAINT `fk_systemaccountsubdomain_csstemplateid` FOREIGN KEY (`csstemplateid`) REFERENCES `csstemplate` (`csstemplateid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_systemaccountsubdomain_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemaccounttemplate` (
  `systemaccounttemplateid` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `base_user_count` int unsigned NOT NULL DEFAULT '10',
  `base_period_days` int unsigned NOT NULL DEFAULT '60',
  `base_company_logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '8dea6eff484d70de4b13eafe8ca652268567b61c.png',
  `signup_account_agreementid` int unsigned DEFAULT NULL,
  `signup_enduser_agreementid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccounttemplateid`),
  KEY `idx_systemaccounttemplate_signup_account_agreementid` (`signup_account_agreementid`),
  KEY `idx_systemaccounttemplate_signup_enduser_agreementid` (`signup_enduser_agreementid`),
  CONSTRAINT `fk_systemaccounttemplate_signup_account_agreementid` FOREIGN KEY (`signup_account_agreementid`) REFERENCES `agreement` (`agreementid`),
  CONSTRAINT `fk_systemaccounttemplate_signup_enduser_agreementid` FOREIGN KEY (`signup_enduser_agreementid`) REFERENCES `agreement` (`agreementid`)
) ENGINE=InnoDB AUTO_INCREMENT=6  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemaccountversionmap` (
  `systemaccountversionmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `versionid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`systemaccountversionmapid`),
  KEY `fk_savmap_systemaccount` (`systemaccountid`),
  KEY `fk_savmap_versionid` (`versionid`),
  CONSTRAINT `fk_savmap_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_savmap_versionid` FOREIGN KEY (`versionid`) REFERENCES `version` (`versionid`)
) ENGINE=InnoDB AUTO_INCREMENT=4294  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablecolumn` (
  `tablecolumnid` int unsigned NOT NULL AUTO_INCREMENT,
  `tablename` enum('account','person','salesopportunity') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `columnname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `columntype` enum('combo','text','numeric','datetime') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'combo',
  `filter_show_limit` int DEFAULT '20',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`tablecolumnid`),
  UNIQUE KEY `uk_columnname` (`systemaccountid`,`columnname`),
  KEY `fk_tablecolumn_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_tablecolumn_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablevalue` (
  `tablevalueid` int unsigned NOT NULL AUTO_INCREMENT,
  `tablecolumnid` int unsigned NOT NULL,
  `varcharvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`tablevalueid`),
  KEY `fk_tablevalue_tablecolumn` (`tablecolumnid`),
  CONSTRAINT `fk_tablevalue_tablecolumn` FOREIGN KEY (`tablecolumnid`) REFERENCES `tablecolumn` (`tablecolumnid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablevaluemap` (
  `tablevaluemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `accountid` int unsigned DEFAULT NULL,
  `personid` int unsigned DEFAULT NULL,
  `salesopportunityid` int unsigned DEFAULT NULL,
  `tablevalueid` int unsigned DEFAULT NULL,
  `numericvalue` float DEFAULT NULL,
  `textvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datetimevalue` datetime DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`tablevaluemapid`),
  UNIQUE KEY `idx_tablevalue` (`tablevalueid`,`accountid`),
  KEY `fk_tablevaluemap_account` (`accountid`),
  KEY `fk_tablevaluemap_person` (`personid`),
  KEY `fk_tablevaluemap_salesopportunity` (`salesopportunityid`),
  KEY `fk_tablevaluemap_tablevalue` (`tablevalueid`),
  CONSTRAINT `fk_tablevaluemap_account` FOREIGN KEY (`accountid`) REFERENCES `account` (`accountid`),
  CONSTRAINT `fk_tablevaluemap_person` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`),
  CONSTRAINT `fk_tablevaluemap_salesopportunity` FOREIGN KEY (`salesopportunityid`) REFERENCES `salesopportunity` (`salesopportunityid`),
  CONSTRAINT `fk_tablevaluemap_tablevalue` FOREIGN KEY (`tablevalueid`) REFERENCES `tablevalue` (`tablevalueid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablevalueprocessprocessmap` (
  `tablevalueprocessprocessmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `tablevalueid` int unsigned NOT NULL,
  `processprocessmapid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`tablevalueprocessprocessmapid`),
  KEY `fk_tvppm_tablevalue` (`tablevalueid`),
  KEY `fk_tvppm_processprocessmap` (`processprocessmapid`),
  CONSTRAINT `fk_tvppm_processprocessmap` FOREIGN KEY (`processprocessmapid`) REFERENCES `processprocessmap` (`processprocessmapid`),
  CONSTRAINT `fk_tvppm_tablevalue` FOREIGN KEY (`tablevalueid`) REFERENCES `tablevalue` (`tablevalueid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tagid` int unsigned NOT NULL AUTO_INCREMENT,
  `tagword` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`tagword`,`systemaccountid`),
  UNIQUE KEY `idx_tagid` (`tagid`),
  KEY `fk_tag_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_tag_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax` (
  `taxid` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_percent` double DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `active` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`taxid`)
) ENGINE=InnoDB AUTO_INCREMENT=4  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempdateday` (
  `tempdatedayid` int unsigned NOT NULL AUTO_INCREMENT,
  `year` int unsigned DEFAULT NULL,
  `month` int unsigned DEFAULT NULL,
  `day` int unsigned DEFAULT NULL,
  `date` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `date_gte` datetime NOT NULL,
  `date_lt` datetime NOT NULL,
  PRIMARY KEY (`tempdatedayid`)
) ENGINE=InnoDB AUTO_INCREMENT=2353  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempencodinglog` (
  `tempencodinglogid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `objecttable` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int NOT NULL,
  `objectfield` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `value_before` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `value_after` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`tempencodinglogid`),
  KEY `idx_tempencodinglog_systemaccountid` (`systemaccountid`),
  KEY `idx_tempencodinglog_objecttable_objectid` (`objecttable`,`objectid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `templateid` int unsigned NOT NULL AUTO_INCREMENT,
  `systemaccountid` int unsigned NOT NULL,
  `templatetype` enum('process','item') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `templatename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `templatehtml` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`templateid`),
  KEY `fk_template_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_template_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timelog` (
  `timelogid` int unsigned NOT NULL AUTO_INCREMENT,
  `timeunitid` int unsigned NOT NULL,
  `sessionhash` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'sessionid hash sha256',
  `timecost` double NOT NULL,
  `unitofmeasure` enum('second') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `payload_json` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `userid` int unsigned NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`timelogid`),
  KEY `idx_timelog_user` (`userid`),
  KEY `idx_timelog_systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeunit` (
  `timeunitid` int unsigned NOT NULL AUTO_INCREMENT,
  `timecost` double NOT NULL,
  `unitofmeasure` enum('second') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`timeunitid`)
) ENGINE=InnoDB AUTO_INCREMENT=2  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger` (
  `triggerid` int unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objecttable` enum('process','processprocessmap') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `processprocessmapid` int unsigned DEFAULT NULL,
  `linkinitiator` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`triggerid`),
  KEY `idx_trigger_systemaccountid` (`systemaccountid`),
  KEY `idx_trigger_objecttable` (`objecttable`),
  KEY `idx_trigger_processid` (`processid`),
  KEY `idx_trigger_processprocessmapid` (`processprocessmapid`),
  CONSTRAINT `fk_trigger_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_trigger_processprocessmapid` FOREIGN KEY (`processprocessmapid`) REFERENCES `processprocessmap` (`processprocessmapid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_trigger_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `triggerobject` (
  `triggerobjectid` int unsigned NOT NULL AUTO_INCREMENT,
  `triggerid` int unsigned NOT NULL,
  `objecttype` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objecttable` enum('process','user') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processid` int unsigned DEFAULT NULL,
  `userid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`triggerobjectid`),
  UNIQUE KEY `uk_triggerobject_process` (`objecttype`,`objecttable`,`processid`,`triggerid`),
  UNIQUE KEY `uk_triggerobject_user` (`objecttype`,`objecttable`,`userid`,`triggerid`),
  KEY `idx_triggerobject_systemaccountid` (`systemaccountid`),
  KEY `idx_triggerobject_objecttable` (`objecttable`),
  KEY `idx_triggerobject_processid` (`processid`),
  KEY `idx_triggerobject_userid` (`userid`),
  CONSTRAINT `fk_triggerobject_processid` FOREIGN KEY (`processid`) REFERENCES `process` (`processid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_triggerobject_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_triggerobject_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int unsigned NOT NULL AUTO_INCREMENT,
  `parentuserid` int unsigned DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `departmentid` int unsigned DEFAULT NULL,
  `userguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `usertype` enum('system','account','public') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'account',
  `userstatus` enum('live','unregistered','sandboxplay') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'live',
  `emailaddress` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `pwkey` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `skypename` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `alias_of_userid` int unsigned NOT NULL DEFAULT '0',
  `auto_login_guid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `personid` int unsigned NOT NULL,
  `restrictedaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `desktopaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `canmaintainmessages` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `tabletaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `webaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `assistantaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `embedaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `administrator` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'n',
  `ext_usercode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `clevvasupportaccess` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `ipaddress_lockdown` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `playuser` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `apitoken` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_via_api` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'n',
  `lastquotedetailinemail` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  `password_reset_token` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `password_reset_at` datetime DEFAULT NULL,
  `officephone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `mobilephone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processids` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `idx_userguid` (`userguid`),
  UNIQUE KEY `idx_user_unique` (`systemaccountid`,`emailaddress`,`alias_of_userid`),
  KEY `fk_user_person` (`personid`),
  KEY `fk_user_systemaccount` (`systemaccountid`),
  KEY `idx_user_apitoken` (`apitoken`),
  FULLTEXT KEY `idx_fulltext_user_userguid` (`userguid`),
  CONSTRAINT `fk_user_person` FOREIGN KEY (`personid`) REFERENCES `person` (`personid`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=516236  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userbookmarkobject` (
  `userbookmarkobjectid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL,
  `objecttable` enum('account','challenge','class','document','item','person','process','solution') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `objectid` int unsigned NOT NULL,
  `orderbynumber` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`userbookmarkobjectid`),
  KEY `fk_classusermap_class` (`userid`),
  CONSTRAINT `fk_userbookmarkobject_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdepartmentmap` (
  `userdepartmentmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL,
  `departmentid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`userdepartmentmapid`),
  UNIQUE KEY `uk_userdepartmentmap_userid_departmentid` (`userid`,`departmentid`),
  KEY `idx_userdepartmentmap_userid` (`userid`),
  KEY `idx_userdepartmentmap_departmentid` (`departmentid`),
  KEY `idx_userrolemap_datecreated` (`datecreated`),
  CONSTRAINT `fk_userdepartmentmap_departmentid` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_userdepartmentmap_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13353  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrolemap` (
  `userrolemapid` int unsigned NOT NULL AUTO_INCREMENT,
  `userrolemapguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `userid` int unsigned NOT NULL,
  `roleid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`userrolemapid`),
  UNIQUE KEY `uk_userrolemap_userid_roleid` (`userid`,`roleid`),
  KEY `idx_userrolemap_roleid` (`roleid`),
  KEY `idx_userrolemap_userid` (`userid`),
  KEY `idx_userrolemap_guid` (`userrolemapguid`),
  CONSTRAINT `fk_userrolemap_roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_userrolemap_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16267  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersession` (
  `usersessionid` int unsigned NOT NULL AUTO_INCREMENT,
  `usersessionguid` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `userid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int NOT NULL,
  `updatedbyuserid` int DEFAULT NULL,
  `deletedbyuserid` int DEFAULT NULL,
  PRIMARY KEY (`usersessionid`),
  KEY `fk_usersession_userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5951  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersettingmap` (
  `usersettingmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned NOT NULL,
  `settingcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `intvalue` int DEFAULT NULL,
  `floatvalue` float DEFAULT NULL,
  `varcharvalue` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'NeuroLogic Pastel Account No.',
  `textvalue` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `booleanvalue` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `metacode1` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datetimevalue` datetime DEFAULT NULL,
  `markdownvalue` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`userid`,`settingcode`),
  UNIQUE KEY `usersettingmapid_UNIQUE` (`usersettingmapid`),
  KEY `fk_usmap_user` (`userid`),
  KEY `fk_usmap_settingcode` (`settingcode`),
  CONSTRAINT `fk_usmap_settingcode` FOREIGN KEY (`settingcode`) REFERENCES `setting` (`settingcode`),
  CONSTRAINT `fk_usmap_user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19251  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vahook` (
  `vahookid` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `type` enum('processcode','url') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'processcode',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `visible` enum('y','n') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'y',
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`vahookid`),
  KEY `idx_vahook_code` (`code`),
  KEY `fk_vahook_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_vahook_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variable` (
  `variableid` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('base64_serialized_object','base64_serialized_closure','json') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `objecttable` enum('processinstanceobject','processinstance','activity','account') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processinstanceobjectid` int unsigned DEFAULT '0',
  `processinstanceid` int unsigned DEFAULT '0',
  `activityid` int unsigned DEFAULT '0',
  `accountid` int unsigned DEFAULT '0',
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`variableid`),
  UNIQUE KEY `uk_unique` (`name`,`objecttable`,`processinstanceobjectid`,`processinstanceid`,`activityid`,`accountid`),
  KEY `idx_processinstanceobjectid` (`processinstanceobjectid`),
  KEY `idx_processinstanceid` (`processinstanceid`),
  KEY `idx_activityid` (`activityid`),
  KEY `idx_accountid` (`accountid`),
  KEY `idx_systemaccount` (`systemaccountid`),
  KEY `functional_index` ((coalesce(`dateupdated`,`datecreated`))),
  CONSTRAINT `fk_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=2274639  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `versionid` int unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `interface` enum('tablet','backend','web','clevva') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'clevva',
  `level` enum('release','minor','major') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT 'release',
  `rootpath` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `stage` enum('alpha','beta','rc','ga') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT 'alpha',
  `alphadate` datetime DEFAULT NULL,
  `alphauserid` int unsigned DEFAULT NULL,
  `betadate` datetime DEFAULT NULL,
  `betauserid` int unsigned DEFAULT NULL,
  `rcdate` datetime DEFAULT NULL,
  `rcuserid` int unsigned DEFAULT NULL,
  `gadate` datetime DEFAULT NULL,
  `gauserid` int unsigned DEFAULT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`versionid`),
  UNIQUE KEY `uk_versioninterface` (`version`,`interface`),
  UNIQUE KEY `uk_location` (`location`,`rootpath`,`level`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=678  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `warehouseid` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `ext_warehousecode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `ext_branchcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `datecreated` datetime DEFAULT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int DEFAULT NULL,
  `updatedbyuserid` int DEFAULT NULL,
  `deletedbyuserid` int DEFAULT NULL,
  PRIMARY KEY (`warehouseid`),
  UNIQUE KEY `uk_description` (`description`,`systemaccountid`),
  UNIQUE KEY `uk_extwhcode` (`systemaccountid`,`ext_warehousecode`),
  KEY `fk_warehouse_systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_warehouse_systemaccount` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook` (
  `webhookid` int unsigned NOT NULL AUTO_INCREMENT,
  `request` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `response` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `failure` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`webhookid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_webhook_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=231648  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooklog` (
  `webhooklogid` int unsigned NOT NULL AUTO_INCREMENT,
  `webhookid` int unsigned NOT NULL,
  `curl_request` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `curl_response` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `curl_info` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `acl_response` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `acl_failure` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`webhooklogid`),
  KEY `idx_webhookid` (`webhookid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_webhooklog_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_webhooklog_webhookid` FOREIGN KEY (`webhookid`) REFERENCES `webhook` (`webhookid`)
) ENGINE=InnoDB AUTO_INCREMENT=231636  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhookmap` (
  `webhookmapid` int unsigned NOT NULL AUTO_INCREMENT,
  `webhookid` int unsigned NOT NULL,
  `objecttable` enum('processinstanceobject') CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `processinstanceobjectid` int unsigned DEFAULT '0',
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`webhookmapid`),
  KEY `idx_webhookid` (`webhookid`),
  KEY `idx_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_webhookmap_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`),
  CONSTRAINT `fk_webhookmap_webhookid` FOREIGN KEY (`webhookid`) REFERENCES `webhook` (`webhookid`)
) ENGINE=InnoDB AUTO_INCREMENT=231654  COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget` (
  `widgetid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `systemaccountid` int unsigned NOT NULL,
  `datecreated` datetime NOT NULL,
  `dateupdated` datetime DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  `createdbyuserid` int unsigned NOT NULL,
  `updatedbyuserid` int unsigned DEFAULT NULL,
  `deletedbyuserid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`widgetid`),
  KEY `idx_widget_systemaccountid` (`systemaccountid`),
  CONSTRAINT `fk_widget_systemaccountid` FOREIGN KEY (`systemaccountid`) REFERENCES `systemaccount` (`systemaccountid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 ;
/*!40101 SET character_set_client = @saved_cs_client */;
SET FOREIGN_KEY_CHECKS=1; SET UNIQUE_CHECKS=1; 
