-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 31, 2012 at 05:19 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `superbb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_formats`
--

CREATE TABLE IF NOT EXISTS `address_formats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addressFormat` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_modules`
--

CREATE TABLE IF NOT EXISTS `admin_modules` (
  `id` double NOT NULL AUTO_INCREMENT,
  `adminModuleParentID` double DEFAULT NULL,
  `adminModuleURLKey` varchar(765) DEFAULT NULL,
  `adminModuleURLString` varchar(765) DEFAULT NULL,
  `adminModuleStyleClass` varchar(765) DEFAULT NULL,
  `adminModuleStyleIcon` varchar(765) DEFAULT NULL,
  `adminModuleOrder` double DEFAULT NULL,
  `adminModuleType` varchar(255) DEFAULT NULL,
  `adminModuleStatus` varchar(255) DEFAULT NULL,
  `adminModuleCaption` varchar(255) DEFAULT NULL,
  `adminModuleBreadcrumbCaption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminUserFirstName` varchar(100) NOT NULL,
  `adminUserLastName` varchar(100) NOT NULL,
  `adminUserEmail` varchar(100) NOT NULL,
  `adminUserLoginName` varchar(50) NOT NULL,
  `adminUserLoginPass` varchar(50) NOT NULL,
  `adminUserStatus` enum('Active','Inactive','Blocked','Deleted') NOT NULL,
  `adminUserAccessCount` int(11) NOT NULL,
  `adminUserInvalidAccessCount` int(11) NOT NULL,
  `adminUserLockedDate` datetime NOT NULL,
  `adminUserCreatedDate` datetime NOT NULL,
  `adminUserLastAccessDate` datetime NOT NULL,
  `userTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_admin_users_1` (`userTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_type`
--

CREATE TABLE IF NOT EXISTS `admin_user_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userTypeName` varchar(255) DEFAULT NULL,
  `userTypeStatus` varchar(255) DEFAULT NULL,
  `adminMode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_type_modules`
--

CREATE TABLE IF NOT EXISTS `admin_user_type_modules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userTypeID` int(11) DEFAULT NULL,
  `adminModuleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_admin_user_type_modules_1` (`userTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE IF NOT EXISTS `affiliates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliateID` varchar(25) DEFAULT NULL,
  `affiliateReqID` int(11) NOT NULL,
  `affiliateUserName` varchar(100) DEFAULT NULL,
  `affiliatePassword` varchar(50) DEFAULT NULL,
  `affiliateFirstName` varchar(100) DEFAULT NULL,
  `affiliateLastName` varchar(100) DEFAULT NULL,
  `affiliateContactPerson` varchar(100) DEFAULT NULL,
  `affiliateCompanyName` varchar(100) DEFAULT NULL,
  `affiliateAddress1` varchar(150) DEFAULT NULL,
  `affiliateAddress2` varchar(150) DEFAULT NULL,
  `affiliateEmail` varchar(150) DEFAULT NULL,
  `affiliatePhone` varchar(50) DEFAULT NULL,
  `affiliateFax` varchar(50) DEFAULT NULL,
  `affiliateCity` varchar(100) DEFAULT NULL,
  `affiliateStateID` int(11) NOT NULL,
  `affiliateStateProvince` varchar(50) DEFAULT NULL,
  `affiliateCountryID` int(11) NOT NULL,
  `affiliateZipcode` varchar(10) NOT NULL,
  `affiliateTypeofWebsite` varchar(100) DEFAULT NULL,
  `affiliateWebsiteURL` varchar(100) DEFAULT NULL,
  `affiliateAccountType` varchar(100) DEFAULT NULL,
  `affiliateAccountName` varchar(100) DEFAULT NULL,
  `affiliateAccountDetails` varchar(255) DEFAULT NULL,
  `affiliateStatus` varchar(255) NOT NULL,
  `affiliateRegisterDate` datetime NOT NULL,
  `affiliateLastAccesed` datetime NOT NULL,
  `preferredLanguage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliates_requests`
--

CREATE TABLE IF NOT EXISTS `affiliates_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliateReqFirstName` varchar(100) DEFAULT NULL,
  `affiliateReqLastName` varchar(100) DEFAULT NULL,
  `affiliateReqContactPerson` varchar(150) DEFAULT NULL,
  `affiliateCompanyName` varchar(150) DEFAULT NULL,
  `affiliateReqAddress1` varchar(150) DEFAULT NULL,
  `affiliateReqAddress2` varchar(150) DEFAULT NULL,
  `affiliateReqEmail` varchar(150) DEFAULT NULL,
  `affiliateReqPhone` varchar(20) DEFAULT NULL,
  `affiliateReqFax` varchar(20) DEFAULT NULL,
  `affiliateReqCity` varchar(100) DEFAULT NULL,
  `affiliateReqStateID` int(11) NOT NULL,
  `affiliateReqProvince` varchar(50) DEFAULT NULL,
  `affiliateReqCountryID` int(11) NOT NULL,
  `affiliateReqZipcode` varchar(10) NOT NULL,
  `affiliateReqTypeofWebsite` varchar(100) DEFAULT NULL,
  `affiliateReqWebsiteURL` varchar(150) DEFAULT NULL,
  `affiliateReqComments` varchar(255) DEFAULT NULL,
  `affiliateReqStatus` varchar(255) NOT NULL,
  `affiliateReqDate` datetime NOT NULL,
  `affiliateReqUpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_commissions`
--

CREATE TABLE IF NOT EXISTS `affiliate_commissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affVisitorID` int(15) NOT NULL,
  `affiliateUserID` int(11) NOT NULL,
  `actionID` int(11) NOT NULL,
  `commissionAmount` decimal(10,0) NOT NULL,
  `commissionPercent` decimal(10,0) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdDate` datetime NOT NULL,
  `lastUpdateDate` datetime NOT NULL,
  `level` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_commission_settings`
--

CREATE TABLE IF NOT EXISTS `affiliate_commission_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliateUserID` int(11) NOT NULL,
  `enableSalesCommission` enum('Yes','No') NOT NULL,
  `firstPurchaseCommissionType` enum('Percentage','Value') NOT NULL,
  `firstPurchaseCommissionValue` decimal(10,0) NOT NULL,
  `recurringPurchaseCommissionType` enum('Percentage','Value') NOT NULL,
  `recurringPurchaseCommissionValue` decimal(10,0) NOT NULL,
  `enableTierCommission` enum('Yes','No') NOT NULL,
  `tierCommissionLevel` int(10) NOT NULL,
  `tierCommissionType` enum('Percentage','Value') NOT NULL,
  `tierCommissionValue` decimal(10,0) NOT NULL,
  `subscriptionCommission` enum('Yes','No') NOT NULL,
  `subscriptionCommissionAmount` decimal(10,0) NOT NULL,
  `registrationCommission` enum('Yes','No') NOT NULL,
  `registrationCommissionAmount` decimal(10,0) NOT NULL,
  `bulkSubscriberImport` enum('Yes','No') NOT NULL,
  `bulkSubscriberImportCommission` decimal(10,0) NOT NULL,
  `bulkUserImport` enum('Yes','No') NOT NULL,
  `bulkUserImportCommission` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_imported_users`
--

CREATE TABLE IF NOT EXISTS `affiliate_imported_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bulkID` int(11) NOT NULL,
  `userEmail` varchar(150) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `userFirstName` varchar(100) NOT NULL,
  `userLastName` varchar(100) NOT NULL,
  `userPhone` varchar(25) NOT NULL,
  `userCity` varchar(100) NOT NULL,
  `userAdress1` varchar(255) NOT NULL,
  `userAdress2` varchar(255) NOT NULL,
  `userZip` varchar(12) NOT NULL,
  `userConfirm` varchar(255) NOT NULL,
  `confirmDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE IF NOT EXISTS `affiliate_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliateUserID` int(11) NOT NULL,
  `affiliateTransDate` datetime NOT NULL,
  `affiliateTransAmt` decimal(10,0) NOT NULL,
  `affiliateTransType` varchar(50) NOT NULL,
  `affiliateTransDescrption` varchar(255) DEFAULT NULL,
  `readStatus` varchar(255) NOT NULL,
  `transactionDescrForAffiliate` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payment_details`
--

CREATE TABLE IF NOT EXISTS `affiliate_payment_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliatePaymentTransID` int(11) NOT NULL,
  `affiliateCommissionID` int(11) NOT NULL,
  `affiliatePaidAmount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_performance`
--

CREATE TABLE IF NOT EXISTS `affiliate_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affVisitorID` int(11) NOT NULL,
  `affiliateUserID` int(11) NOT NULL,
  `actionID` int(11) NOT NULL,
  `type` enum('Order','Subscription','Registration','Imported User','Imported Subscriber') NOT NULL,
  `createdDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_referral_purchases`
--

CREATE TABLE IF NOT EXISTS `affiliate_referral_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliateUserID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `commissionAmount` decimal(10,0) NOT NULL,
  `commissionPercent` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_to_subscribers`
--

CREATE TABLE IF NOT EXISTS `affiliate_to_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bulkID` int(11) NOT NULL,
  `subscEmailID` varchar(150) NOT NULL,
  `contactPhone` varchar(50) NOT NULL,
  `confirmStatus` enum('Yes','No') NOT NULL,
  `updatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_visits`
--

CREATE TABLE IF NOT EXISTS `affiliate_visits` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `affiliateUserID` int(15) NOT NULL,
  `visitorID` int(15) NOT NULL,
  `widgetID` int(15) NOT NULL,
  `visitType` enum('Widget','API','Referral','Imported User','Imported Subscriber') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_widget_details`
--

CREATE TABLE IF NOT EXISTS `affiliate_widget_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widgetName` varchar(100) NOT NULL,
  `widgetDealCategories` text NOT NULL,
  `widgetCities` text NOT NULL,
  `widgetType` enum('Iframe','Flash','JS') NOT NULL,
  `affiliateDealSizeID` varchar(50) NOT NULL,
  `affiliateUserID` int(11) DEFAULT NULL,
  `languageID` int(11) NOT NULL,
  `affiliateWidgetContentType` enum('Text_Only','Image_Only','Image_with_Text') NOT NULL,
  `widgetColors` text NOT NULL,
  `affiliateWidgetCreatedDate` datetime NOT NULL,
  `affiliateWidgetOtherDealTypes` varchar(50) NOT NULL,
  `widgetScrolling` enum('Horizontal','Vertical') NOT NULL,
  `widget_format` enum('Sidebar','Large','Banner') NOT NULL,
  `widgetStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_widget_size`
--

CREATE TABLE IF NOT EXISTS `affiliate_widget_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliateDealWidthPx` int(11) NOT NULL,
  `affiliateDealHeightPx` int(11) NOT NULL,
  `widget_format` enum('Sidebar','Large','Banner') NOT NULL,
  `widgetScrolling` enum('Horizontal','Vertical') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aff_bulk_import`
--

CREATE TABLE IF NOT EXISTS `aff_bulk_import` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliateUserID` int(11) NOT NULL,
  `commission` decimal(10,0) NOT NULL,
  `addedDate` datetime NOT NULL,
  `campaignListID` varchar(100) NOT NULL,
  `campaignListName` varchar(50) NOT NULL,
  `mailSendStatus` enum('Yes','No') NOT NULL,
  `cities` text NOT NULL,
  `type` enum('User','Subscriber') NOT NULL,
  `mailScheduleDate` datetime NOT NULL,
  `importLog` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `api_access`
--

CREATE TABLE IF NOT EXISTS `api_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userApiKey` varchar(110) NOT NULL,
  `lastAccess` datetime NOT NULL,
  `accessCount` int(11) NOT NULL,
  `section` enum('deals','deal','city') NOT NULL,
  `accessTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE IF NOT EXISTS `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessLogin` varchar(100) NOT NULL,
  `businessPassword` varchar(50) NOT NULL,
  `businessName` varchar(100) NOT NULL,
  `businessKey` varchar(100) NOT NULL,
  `businessAddress1` varchar(100) NOT NULL,
  `businessAddress2` varchar(100) NOT NULL,
  `businessCity` varchar(100) NOT NULL,
  `businessStateID` int(11) DEFAULT NULL,
  `businessStateProvince` varchar(100) NOT NULL,
  `businessCountryID` int(11) DEFAULT NULL,
  `businessLatitude` varchar(25) NOT NULL,
  `businessLongitude` varchar(25) NOT NULL,
  `businessProfile` text NOT NULL,
  `businessLogo` varchar(255) NOT NULL,
  `businessCFirstName` varchar(50) NOT NULL,
  `businessCLastName` varchar(50) NOT NULL,
  `businessCDesignation` varchar(100) NOT NULL,
  `businessPhone` varchar(25) NOT NULL,
  `businessFax` varchar(25) NOT NULL,
  `businessZip` varchar(10) NOT NULL,
  `businessEmail` varchar(100) NOT NULL,
  `businessWebsite` varchar(450) NOT NULL,
  `businessAccountName` varchar(255) NOT NULL,
  `businessAccountType` varchar(100) NOT NULL,
  `businessAccountDetails` text NOT NULL,
  `businessPaypalEmail` varchar(250) DEFAULT NULL,
  `businessStatus` varchar(255) NOT NULL,
  `businessAddedDate` datetime NOT NULL,
  `businessUpdateDate` datetime NOT NULL,
  `businessDefaultLanguageID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_1` (`businessStateID`),
  KEY `FK_business_2` (`businessCountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_deal_campaigns`
--

CREATE TABLE IF NOT EXISTS `business_deal_campaigns` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `businessID` mediumint(9) NOT NULL,
  `dealID` int(11) DEFAULT NULL,
  `campaignDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_deal_campaigns_1` (`dealID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE IF NOT EXISTS `business_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessID` int(11) DEFAULT NULL,
  `locName` varchar(100) NOT NULL,
  `locAddress1` varchar(100) NOT NULL,
  `locAddress2` varchar(100) NOT NULL,
  `locCity` varchar(100) NOT NULL,
  `locStateID` int(11) NOT NULL,
  `locProvince` varchar(100) NOT NULL,
  `locCountryID` int(11) NOT NULL,
  `locZip` varchar(10) NOT NULL,
  `locLatitude` varchar(25) NOT NULL,
  `locLongitude` varchar(25) NOT NULL,
  `locPhone` varchar(25) NOT NULL,
  `locEmail` varchar(50) NOT NULL,
  `locStatus` varchar(255) NOT NULL,
  `locCreatedDate` datetime NOT NULL,
  `locModifiedDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_locations_1` (`businessID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_payments`
--

CREATE TABLE IF NOT EXISTS `business_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessID` int(11) DEFAULT NULL,
  `adminUserID` int(11) DEFAULT NULL,
  `businessTransDescription` text NOT NULL,
  `businessTransDate` datetime NOT NULL,
  `totalAmount` decimal(10,0) NOT NULL,
  `commission` decimal(10,0) NOT NULL,
  `serviceFee` decimal(10,0) NOT NULL,
  `ccCharges` decimal(10,0) NOT NULL,
  `otherDeduction` decimal(10,0) NOT NULL,
  `transactionAmount` decimal(10,0) NOT NULL,
  `transactionStatus` enum('Active','Inactive','Deleted') NOT NULL,
  `transactionType` enum('Debit','Credit') NOT NULL,
  `orderID` int(11) DEFAULT NULL,
  `paymentTotal` decimal(10,0) NOT NULL,
  `paidCommission` decimal(10,0) NOT NULL,
  `paidServiceFee` decimal(10,0) NOT NULL,
  `paidCcCharges` decimal(10,0) NOT NULL,
  `paidOtherDeduction` decimal(10,0) NOT NULL,
  `paidAmount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_payments_2` (`adminUserID`),
  KEY `FK_business_payments_1` (`businessID`),
  KEY `FK_business_payments_3` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_ratings`
--

CREATE TABLE IF NOT EXISTS `business_ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `businessID` int(11) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `userRating` tinyint(4) NOT NULL,
  `userRatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_ratings_1` (`businessID`),
  KEY `FK_business_ratings_2` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_requests`
--

CREATE TABLE IF NOT EXISTS `business_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessTypeID` int(11) DEFAULT NULL,
  `businessTypeOther` varchar(255) NOT NULL,
  `businessReqName` varchar(100) NOT NULL,
  `businessReqFirstName` varchar(100) DEFAULT NULL,
  `businessReqLastName` varchar(100) DEFAULT NULL,
  `businessReqAddress1` varchar(100) NOT NULL,
  `businessReqAddress2` varchar(100) DEFAULT NULL,
  `businessReqCity` varchar(100) NOT NULL,
  `businessReqCountryID` int(11) DEFAULT NULL,
  `businessReqStateID` int(11) DEFAULT NULL,
  `businessReqProvince` varchar(50) NOT NULL,
  `businessReqPhone` varchar(20) DEFAULT NULL,
  `businessReqZip` varchar(20) NOT NULL,
  `businessReqEmail` varchar(50) NOT NULL,
  `businessReqWebsite` varchar(450) NOT NULL,
  `businessReqComments` text,
  `PeriodofBusiness` varchar(20) DEFAULT NULL,
  `hearAbout` varchar(100) NOT NULL,
  `businessRequestDate` datetime NOT NULL,
  `businessReqStatus` varchar(255) NOT NULL,
  `ReqUpdateDate` datetime NOT NULL,
  `businessReqDefaultLanguageID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_requests_1` (`businessTypeID`),
  KEY `FK_business_requests_2` (`businessReqCountryID`),
  KEY `FK_business_requests_3` (`businessReqStateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_reviews`
--

CREATE TABLE IF NOT EXISTS `business_reviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `languageID` int(11) NOT NULL,
  `businessID` int(11) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `userComment` text NOT NULL,
  `userReviewedDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_reviews_1` (`businessID`),
  KEY `FK_business_reviews_2` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_shipping_history`
--

CREATE TABLE IF NOT EXISTS `business_shipping_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activityDate` datetime NOT NULL,
  `comment` text NOT NULL,
  `notifyCustomer` varchar(255) NOT NULL,
  `orderID` bigint(20) NOT NULL,
  `shippingStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_to_types`
--

CREATE TABLE IF NOT EXISTS `business_to_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessID` int(11) DEFAULT NULL,
  `businessTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_business_to_types_1` (`businessID`),
  KEY `FK_business_to_types_2` (`businessTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_transactions`
--

CREATE TABLE IF NOT EXISTS `business_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transactionType` varchar(255) DEFAULT NULL,
  `transactionGroup` varchar(255) DEFAULT NULL,
  `businessID` bigint(20) DEFAULT NULL,
  `transactionDescription` text,
  `transactionSubTotalAmount` decimal(10,0) DEFAULT NULL,
  `transactionCommissionAmount` decimal(10,0) DEFAULT NULL,
  `transactionPaymentGatewayCharge` decimal(10,0) DEFAULT NULL,
  `transactionOtherServiceCharge` decimal(10,0) DEFAULT NULL,
  `transactionGrandTotalAmount` decimal(10,0) DEFAULT NULL,
  `transactionDate` datetime DEFAULT NULL,
  `transactionDescrForBusiness` text NOT NULL,
  `dealID` int(11) DEFAULT NULL,
  `orderID` bigint(20) DEFAULT NULL,
  `transactionTotalAmount` decimal(10,0) DEFAULT NULL,
  `transactionViewed` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_types`
--

CREATE TABLE IF NOT EXISTS `business_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessTypeName` varchar(250) NOT NULL,
  `businessTypeDescription` text NOT NULL,
  `businessTypeParent` int(11) NOT NULL,
  `businessTypeStatus` enum('Active','Inactive','Delete') NOT NULL,
  `businessTypeSortOrder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_type_details`
--

CREATE TABLE IF NOT EXISTS `business_type_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `businessTypeID` int(11) NOT NULL,
  `languageID` int(11) NOT NULL,
  `businessTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `businessTypeDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_campaign`
--

CREATE TABLE IF NOT EXISTS `calendar_campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) NOT NULL,
  `languageID` int(11) NOT NULL,
  `bannerDesignID` int(11) NOT NULL,
  `bannerName` varchar(100) NOT NULL,
  `campaignStartDate` date NOT NULL,
  `campaignEndDate` date NOT NULL,
  `campaignStatus` enum('Active','Deleted') NOT NULL,
  `campaignModifiedDate` datetime NOT NULL,
  `campaignCreatedDate` datetime NOT NULL,
  `destinationUrl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Deal  Ad (Banner) Campaign' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thirdPartyCampaignID` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `createdDate` datetime NOT NULL,
  `scheduledDate` datetime NOT NULL,
  `content` text NOT NULL,
  `openCount` int(11) NOT NULL,
  `clickCount` int(11) NOT NULL,
  `bounceCount` int(11) NOT NULL,
  `uniqueOpenedCount` int(11) NOT NULL,
  `uniqueClickCount` int(11) NOT NULL,
  `unsubscribedCount` int(11) NOT NULL,
  `forwardsCount` int(11) NOT NULL,
  `userCount` int(11) NOT NULL,
  `businessID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_ads`
--

CREATE TABLE IF NOT EXISTS `campaign_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adSize` varchar(9) NOT NULL,
  `campaignID` int(11) NOT NULL,
  `template` varchar(20) NOT NULL,
  `imagePath` text NOT NULL,
  `imageAttr` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_cities`
--

CREATE TABLE IF NOT EXISTS `campaign_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaignID` int(11) NOT NULL,
  `cityID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_recipients`
--

CREATE TABLE IF NOT EXISTS `campaign_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaignID` int(11) NOT NULL,
  `emailID` varchar(100) NOT NULL,
  `actionDate` datetime NOT NULL,
  `type` enum('Open','Click') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `charities`
--

CREATE TABLE IF NOT EXISTS `charities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charityTitle` varchar(100) NOT NULL,
  `charityAddress1` varchar(100) NOT NULL,
  `charityAddress2` varchar(100) DEFAULT NULL,
  `charityCity` varchar(100) NOT NULL,
  `stateID` int(11) NOT NULL,
  `charityProvince` varchar(100) DEFAULT NULL,
  `countryID` int(11) NOT NULL,
  `charityZip` varchar(20) NOT NULL,
  `charityPhone` varchar(20) NOT NULL,
  `charityFax` varchar(20) NOT NULL,
  `charityEmail` varchar(100) NOT NULL,
  `charityWebsite` varchar(255) NOT NULL,
  `charityDescription` text NOT NULL,
  `charityLogo` varchar(255) NOT NULL,
  `charityAccountName` varchar(100) NOT NULL,
  `charityAccountType` varchar(100) NOT NULL,
  `charityAccountDetails` text NOT NULL,
  `charityStatus` varchar(255) NOT NULL,
  `CharityCreatedDate` datetime NOT NULL,
  `CharityUpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `charity_payments`
--

CREATE TABLE IF NOT EXISTS `charity_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charityID` int(11) NOT NULL,
  `adminUserID` int(11) NOT NULL,
  `charityTransDescription` text NOT NULL,
  `charityTransDate` datetime NOT NULL,
  `transactionAmount` decimal(10,0) NOT NULL,
  `transactionType` varchar(50) NOT NULL,
  `orderID` int(11) NOT NULL,
  `paidAmount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryID` int(11) DEFAULT NULL,
  `stateID` int(11) DEFAULT NULL,
  `cityName` varchar(50) NOT NULL,
  `province` varchar(100) NOT NULL,
  `timeZoneID` int(11) DEFAULT NULL,
  `cityKeyID` varchar(100) NOT NULL,
  `cityLat` varchar(25) NOT NULL,
  `cityLng` varchar(25) NOT NULL,
  `citylogoImage` varchar(250) NOT NULL,
  `citybgImage` varchar(250) NOT NULL,
  `cityStatus` varchar(255) NOT NULL,
  `cityCampaignListID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cities_1` (`stateID`),
  KEY `FK_cities_2` (`countryID`),
  KEY `FK_cities_3` (`timeZoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city_charities`
--

CREATE TABLE IF NOT EXISTS `city_charities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityID` int(11) NOT NULL,
  `charityID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `city_locations`
--

CREATE TABLE IF NOT EXISTS `city_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityID` int(11) NOT NULL,
  `cityLocName` varchar(100) NOT NULL,
  `cityLocTips` text NOT NULL,
  `cityLocLat` varchar(25) NOT NULL,
  `cityLocLng` varchar(25) NOT NULL,
  `cityLocStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cms_sections`
--

CREATE TABLE IF NOT EXISTS `cms_sections` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sectionTitle` varchar(100) NOT NULL,
  `sectionStatus` varchar(255) NOT NULL,
  `sectionDefault` varchar(255) NOT NULL,
  `sectionPriority` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `content_pages`
--

CREATE TABLE IF NOT EXISTS `content_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentTitle` varchar(255) NOT NULL,
  `contentMenuName` varchar(100) NOT NULL,
  `contentDescription` text NOT NULL,
  `contentMetaTitle` varchar(255) NOT NULL,
  `contentMetaDescription` text NOT NULL,
  `contentMetaKeywords` text NOT NULL,
  `contentStatus` enum('Active','Inactive','Delete') NOT NULL,
  `contentCreatedDate` datetime NOT NULL,
  `contentIsBasic` varchar(255) NOT NULL,
  `contentIsForSubPages` varchar(255) DEFAULT NULL,
  `contentUrlKey` varchar(255) NOT NULL,
  `sectionID` int(12) NOT NULL,
  `sortOrder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(100) NOT NULL,
  `countryAvailable` enum('Yes','No') NOT NULL,
  `countryIsoA2` varchar(2) NOT NULL,
  `countryIsoA3` varchar(3) NOT NULL,
  `countryIsoNumber` varchar(4) NOT NULL,
  `countryPriority` int(11) NOT NULL,
  `addressFormatID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countryName`, `countryAvailable`, `countryIsoA2`, `countryIsoA3`, `countryIsoNumber`, `countryPriority`, `addressFormatID`) VALUES
(1, 'India', 'Yes', 'IN', 'IN', '192', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currencyName` varchar(50) NOT NULL,
  `currencyCode` varchar(4) NOT NULL,
  `currencySymbolLeft` varchar(5) NOT NULL,
  `currencySymbolRight` varchar(5) NOT NULL,
  `currencyDecimalPlaces` int(11) NOT NULL,
  `currencyValue` decimal(10,0) NOT NULL,
  `currencyDefault` enum('Yes','No') NOT NULL,
  `currencyType` enum('Standard','Custom') NOT NULL,
  `currencyActive` enum('Yes','No') NOT NULL,
  `currencyStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE IF NOT EXISTS `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealTypeID` int(11) DEFAULT NULL,
  `businessID` int(11) DEFAULT NULL,
  `isTaxable` varchar(255) NOT NULL,
  `taxClassID` int(11) NOT NULL,
  `taxRate` decimal(10,0) DEFAULT NULL,
  `dealKey` varchar(255) NOT NULL,
  `dealTitle` varchar(511) NOT NULL,
  `dealCertificateTitle` varchar(511) NOT NULL,
  `dealFinePrint` text NOT NULL,
  `dealHighlights` text NOT NULL,
  `dealDescription` text NOT NULL,
  `dealReviews` text NOT NULL,
  `certificateInstructions` text NOT NULL,
  `dealMetaTitle` text NOT NULL,
  `dealMetaDescription` text NOT NULL,
  `dealMetaKeywords` text NOT NULL,
  `dealBusinessLocations` varchar(255) NOT NULL,
  `dealTimeZone` int(11) NOT NULL,
  `dealStartTime` datetime NOT NULL,
  `dealEndTime` datetime NOT NULL,
  `dealMinBuyLimit` int(11) DEFAULT NULL,
  `dealMaxGiftBuy` int(11) DEFAULT NULL,
  `dealMaxBuyLimit` int(11) DEFAULT NULL,
  `dealMinQntyReqToTipp` int(11) NOT NULL,
  `dealExpiryDate` datetime NOT NULL,
  `dealCommissionRate` float(10,2) NOT NULL,
  `dealUseGlobalCommision` varchar(255) NOT NULL,
  `dealCommissionType` enum('$','%') NOT NULL,
  `dealServiceFee` float(10,2) NOT NULL,
  `dealShowNosBought` enum('Yes','No') NOT NULL,
  `dealShowDealTipped` enum('Yes','No') NOT NULL,
  `dealOnlineRedemption` varchar(255) NOT NULL,
  `dealImage` varchar(255) NOT NULL,
  `dealPriority` int(11) NOT NULL,
  `dealStatus` enum('Active','Inactive','Cancelled','Deleted') NOT NULL,
  `InventoryTrackLevel` enum('Deal','Options') NOT NULL,
  `dealCreatedDate` datetime NOT NULL,
  `dealTippedDate` datetime DEFAULT NULL,
  `shippingStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deals_1` (`dealTypeID`),
  KEY `FK_deals_2` (`businessID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_campaigns`
--

CREATE TABLE IF NOT EXISTS `deal_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) NOT NULL,
  `cityID` int(11) NOT NULL,
  `dealTypeKey` varchar(50) NOT NULL,
  `insertDate` datetime NOT NULL,
  `campaignDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_categories`
--

CREATE TABLE IF NOT EXISTS `deal_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealCategoryName` varchar(255) NOT NULL,
  `dealCategoryDescription` text NOT NULL,
  `dealCategoryKey` varchar(200) NOT NULL,
  `dealCategoryParent` int(11) NOT NULL,
  `dealCategoryStatus` enum('Active','Inactive','Delete') NOT NULL,
  `dealCategorySortOrder` int(11) NOT NULL,
  `dealCategoryImage` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_certificates`
--

CREATE TABLE IF NOT EXISTS `deal_certificates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) DEFAULT NULL,
  `orderID` bigint(20) NOT NULL,
  `orderItemID` bigint(20) NOT NULL,
  `userID` int(11) NOT NULL,
  `certificateCode` varchar(200) NOT NULL,
  `certificateName` varchar(200) NOT NULL,
  `certificateEmail` varchar(255) DEFAULT NULL,
  `cerCreateDate` datetime NOT NULL,
  `cerExpiryDate` datetime NOT NULL,
  `status_updated_by` enum('User','Merchant','Admin') NOT NULL,
  `status_updated_date` datetime NOT NULL,
  `cerStatus` enum('Active','Inactive','Cancelled','Used') NOT NULL,
  `mailSendStatus` enum('Sent','Not') NOT NULL,
  `mailSentBy` varchar(127) NOT NULL,
  `certificateData` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_certificates_1` (`dealID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_images`
--

CREATE TABLE IF NOT EXISTS `deal_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) DEFAULT NULL,
  `dealImage` varchar(255) NOT NULL,
  `dealImagePriority` int(11) NOT NULL,
  `dealImageStatus` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_images_1` (`dealID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_impressions`
--

CREATE TABLE IF NOT EXISTS `deal_impressions` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `dealID` int(12) NOT NULL,
  `visitorIDList` longtext NOT NULL,
  `thumbViewCount` int(11) NOT NULL,
  `visitDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_locations`
--

CREATE TABLE IF NOT EXISTS `deal_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) DEFAULT NULL,
  `cityID` int(11) NOT NULL,
  `locID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_locations_1` (`dealID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_options`
--

CREATE TABLE IF NOT EXISTS `deal_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) DEFAULT NULL,
  `dealOptionName` varchar(511) NOT NULL,
  `dealOptionCertTitle` varchar(511) DEFAULT NULL,
  `dealOptionRegularPrice` decimal(10,0) NOT NULL,
  `dealOptionDealPrice` decimal(10,0) NOT NULL,
  `dealOptionQuantity` varchar(11) DEFAULT NULL,
  `dealQuantityUnlimited` varchar(2) DEFAULT NULL,
  `dealOptionStatus` enum('Active','Inactive','Delete') NOT NULL,
  `dealOptionDefault` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_options_1` (`dealID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_priority`
--

CREATE TABLE IF NOT EXISTS `deal_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityID` int(11) DEFAULT NULL,
  `dealID` int(11) DEFAULT NULL,
  `dealPriority` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_priority_2` (`cityID`),
  KEY `FK_deal_priority_1` (`dealID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_requests`
--

CREATE TABLE IF NOT EXISTS `deal_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealTypeID` int(11) DEFAULT NULL,
  `businessID` int(11) DEFAULT NULL,
  `dealRequestKey` varchar(255) NOT NULL,
  `dealRequestBusinessLocations` varchar(255) NOT NULL,
  `dealRequestTimeZone` int(11) NOT NULL,
  `dealRequestStartTime` datetime NOT NULL,
  `dealRequestEndTime` datetime NOT NULL,
  `dealRequestMinBuyLimit` int(11) NOT NULL,
  `dealRequestMaxBuyLimit` int(11) DEFAULT NULL,
  `dealRequestMinQntyReqToTipp` int(11) NOT NULL,
  `dealRequestExpiryDate` datetime DEFAULT NULL,
  `dealRequestShowNosBought` enum('Yes','No') NOT NULL,
  `dealRequestShowDealTipped` enum('Yes','No') NOT NULL,
  `dealRequestOnlineRedemption` varchar(255) NOT NULL,
  `dealRequestImage` varchar(255) NOT NULL,
  `dealRequestDate` datetime NOT NULL,
  `dealRequestStatus` enum('Pending','Approved','Rejected') NOT NULL,
  `dealRequestMaxGiftBuy` int(11) DEFAULT NULL,
  `shippingStatus` varchar(255) NOT NULL,
  `dealRequestTitle` varchar(255) NOT NULL,
  `dealRequestCertificateTitle` varchar(255) NOT NULL,
  `dealRequestFinePrint` text NOT NULL,
  `dealRequestHighlights` text NOT NULL,
  `dealRequestDescription` text NOT NULL,
  `dealRequestReviews` text NOT NULL,
  `dealRequestCertificateInstructions` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_requests_1` (`dealTypeID`),
  KEY `FK_deal_requests_2` (`businessID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_request_images`
--

CREATE TABLE IF NOT EXISTS `deal_request_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealRequestID` int(11) NOT NULL,
  `dealRequestImage` varchar(255) NOT NULL,
  `dealRequestmagePriority` int(11) NOT NULL,
  `dealRequestImageStatus` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_request_locations`
--

CREATE TABLE IF NOT EXISTS `deal_request_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealRequestID` int(11) DEFAULT NULL,
  `cityID` int(11) DEFAULT NULL,
  `locID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_request_locations_1` (`cityID`),
  KEY `FK_deal_request_locations_2` (`dealRequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_request_options`
--

CREATE TABLE IF NOT EXISTS `deal_request_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealRequestID` int(11) DEFAULT NULL,
  `dealRequestOptionName` varchar(255) NOT NULL,
  `dealRequestOptionCertTitle` varchar(255) NOT NULL,
  `dealRequestOptionRegularPrice` decimal(10,0) NOT NULL,
  `dealRequestOptionDealPrice` decimal(10,0) NOT NULL,
  `dealRequestOptionQuantity` int(11) NOT NULL,
  `dealQuantityUnlimited` varchar(255) NOT NULL,
  `dealRequestOptionStatus` enum('Active','Inactive','Delete') NOT NULL,
  `dealRequestOptionDefault` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_request_options_1` (`dealRequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_request_to_category`
--

CREATE TABLE IF NOT EXISTS `deal_request_to_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealToCategoryID` int(10) NOT NULL,
  `dealID` int(11) NOT NULL,
  `dealCategoryID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_reviews`
--

CREATE TABLE IF NOT EXISTS `deal_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `languageID` int(11) NOT NULL,
  `reviewText` text NOT NULL,
  `reviwedDate` datetime NOT NULL,
  `reviewStatus` varchar(255) NOT NULL,
  `updatedDate` datetime NOT NULL,
  `approvedBy` int(11) NOT NULL,
  `reviewFollow` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_reviews_1` (`dealID`),
  KEY `FK_deal_reviews_2` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_to_category`
--

CREATE TABLE IF NOT EXISTS `deal_to_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) DEFAULT NULL,
  `dealCategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deal_to_category_1` (`dealID`),
  KEY `FK_deal_to_category_2` (`dealCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `deal_types`
--

CREATE TABLE IF NOT EXISTS `deal_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealTypeName` varchar(255) NOT NULL,
  `dealTypeDescription` text NOT NULL,
  `paymentCollection` enum('Order_Placed','Deal_Completed','Deal_Tipped') NOT NULL,
  `certficateGenerate` varchar(255) NOT NULL,
  `dealTypePosition` int(11) NOT NULL,
  `dealTypeStatus` varchar(255) NOT NULL,
  `isFeatured` varchar(255) NOT NULL,
  `featuredLink` int(11) DEFAULT NULL,
  `dealTypeKey` varchar(40) NOT NULL,
  `lockedStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `discounts_promo`
--

CREATE TABLE IF NOT EXISTS `discounts_promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promoName` varchar(200) NOT NULL,
  `promoDescription` longtext NOT NULL,
  `promoCode` varchar(20) NOT NULL,
  `DealID` int(11) DEFAULT NULL,
  `promoDiscount` double NOT NULL,
  `promoDiscountType` varchar(255) NOT NULL,
  `promoMinOrderAmount` double NOT NULL,
  `promoMaxUsage` int(11) NOT NULL,
  `promoMaxUsagePerUser` int(11) NOT NULL,
  `promoEffectOnDeals` varchar(255) NOT NULL,
  `promoStartDate` date NOT NULL,
  `promoExpDate` date NOT NULL,
  `promoStatus` varchar(255) NOT NULL,
  `promoAddedTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_discounts_promo_1` (`DealID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE IF NOT EXISTS `email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailFromName` varchar(200) NOT NULL,
  `emailFromEmail` varchar(200) NOT NULL,
  `emailTemplateName` varchar(255) NOT NULL,
  `emailSendToKey` varchar(100) NOT NULL,
  `emailSubject` varchar(255) NOT NULL,
  `emailHtml` text NOT NULL,
  `emailText` text,
  `editable` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_template_sectons`
--

CREATE TABLE IF NOT EXISTS `email_template_sectons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(127) NOT NULL,
  `sectionUniqueString` varchar(127) NOT NULL,
  `languageID` int(11) NOT NULL,
  `sectionContent` text NOT NULL,
  `sectionStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `geozones`
--

CREATE TABLE IF NOT EXISTS `geozones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geoZoneName` varchar(200) NOT NULL,
  `geoZoneDescription` varchar(200) NOT NULL,
  `geoZoneAdded` datetime NOT NULL,
  `geoZoneModified` datetime NOT NULL,
  `geoZoneStatus` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `geozone_to_regions`
--

CREATE TABLE IF NOT EXISTS `geozone_to_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geoZoneID` int(11) DEFAULT NULL,
  `StateID` int(11) DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_geozone_to_regions_1` (`geoZoneID`),
  KEY `FK_geozone_to_regions_2` (`StateID`),
  KEY `FK_geozone_to_regions_3` (`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gift_coupons`
--

CREATE TABLE IF NOT EXISTS `gift_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `giftFromName` varchar(126) DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  `couponTo` varchar(200) NOT NULL,
  `redeemedBy` int(11) DEFAULT NULL,
  `couponMessage` text NOT NULL,
  `couponCode` varchar(200) NOT NULL,
  `couponAmount` decimal(10,0) NOT NULL,
  `couponEmailTo` varchar(200) NOT NULL,
  `couponStatus` enum('Active','Inactive','Redeemed') NOT NULL,
  `sendMode` enum('Email','Print') NOT NULL,
  `giftEmailTemplateID` int(11) DEFAULT NULL,
  `couponExpiry` datetime NOT NULL,
  `redeemedDate` datetime DEFAULT NULL,
  `pdfData` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gift_coupons_1` (`userID`),
  KEY `FK_gift_coupons_2` (`orderID`),
  KEY `FK_gift_coupons_3` (`giftEmailTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gift_email_templates`
--

CREATE TABLE IF NOT EXISTS `gift_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gitEmailTemplateTitle` varchar(255) NOT NULL,
  `giftEmailTemplateImage` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `languageName` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `languageCode` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LanguageLCIDstring` varchar(5) NOT NULL,
  `languageLocale` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `languageImage` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `languageSortOrder` int(3) NOT NULL,
  `languageStatus` varchar(255) NOT NULL,
  `languageDefault` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `netpay_payment_methods`
--

CREATE TABLE IF NOT EXISTS `netpay_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `methodCode` varchar(50) NOT NULL,
  `methodName` varchar(100) NOT NULL,
  `Bank` enum('No','Yes') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletterFromName` varchar(200) NOT NULL,
  `newsletterFromEmail` varchar(200) NOT NULL,
  `newsLetterSubject` varchar(255) NOT NULL,
  `newsLetterContentHtml` text NOT NULL,
  `newsLetterContentText` text NOT NULL,
  `newsletterSent` enum('Yes','No') NOT NULL,
  `newsletterCreateDate` datetime NOT NULL,
  `newsletterSentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` bigint(20) NOT NULL,
  `orderStatus` enum('New','Pending','Process','Completed','Cancelled','Error') NOT NULL,
  `orderType` enum('deal','coupon') NOT NULL,
  `dealType` varchar(255) NOT NULL,
  `orderCreatedDate` datetime NOT NULL,
  `orderStatusDate` datetime NOT NULL,
  `cityID` int(11) DEFAULT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `languageID` int(11) DEFAULT NULL,
  `orderSubtotal` decimal(10,0) NOT NULL,
  `orderPromoCode` varchar(20) DEFAULT NULL,
  `orderPromoDiscountAmount` decimal(10,0) DEFAULT NULL,
  `orderUserCreditAmount` decimal(10,0) NOT NULL,
  `paymentSettingsGroupID` int(11) DEFAULT NULL,
  `orderPaymentMethodName` varchar(200) NOT NULL,
  `paymentType` enum('AUTH_ONLY','AUTH_CAPTURE') NOT NULL,
  `paymentStatus` enum('Pending','Denied','Received','Refunded','Free','Error') NOT NULL,
  `transactionID` text,
  `orderQty` int(11) NOT NULL,
  `orderTaxAmount` decimal(10,0) DEFAULT NULL,
  `orderCharityID` int(11) DEFAULT NULL,
  `orderCharityAmount` decimal(10,0) DEFAULT NULL,
  `orderCommissionAmount` decimal(10,0) DEFAULT NULL,
  `orderPaymentGatewayCharge` decimal(10,0) DEFAULT NULL,
  `orderOtherServiceCharge` decimal(10,0) DEFAULT NULL,
  `orderTotalAmount` decimal(10,0) NOT NULL,
  `billingFirstName` varchar(200) NOT NULL,
  `billingLastName` varchar(200) DEFAULT NULL,
  `billingAddress1` varchar(200) NOT NULL,
  `billingAddress2` varchar(200) DEFAULT NULL,
  `billingCity` varchar(200) NOT NULL,
  `billingState` int(11) NOT NULL,
  `billingProvince` varchar(200) DEFAULT NULL,
  `billingCountry` int(11) NOT NULL,
  `billingZip` varchar(50) DEFAULT NULL,
  `billingPhone` varchar(25) NOT NULL,
  `billingEmail` varchar(100) NOT NULL,
  `cardData` text,
  `orderRemoved` varchar(255) NOT NULL,
  `purchasedCurrency` varchar(5) DEFAULT NULL,
  `shippingAmount` float(6,2) NOT NULL,
  `shipmentStatus` enum('Pending','shipped','confirmed') NOT NULL,
  `shipmentDate` datetime NOT NULL,
  `carrierDetails` text NOT NULL,
  `paymentNotes` text NOT NULL,
  `netpayOrderID` varchar(20) NOT NULL,
  `netpayPaymentType` varchar(5) NOT NULL,
  `orderHold` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_orders_1` (`userID`),
  KEY `FK_orders_2` (`cityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) DEFAULT NULL,
  `dealID` int(11) DEFAULT NULL,
  `dealOptionID` int(11) DEFAULT NULL,
  `orderItemPrice` decimal(10,0) NOT NULL,
  `orderItemQuantity` int(11) NOT NULL,
  `orderItemSubtotal` decimal(10,0) NOT NULL,
  `isTaxable` varchar(255) NOT NULL,
  `orderItemTaxRate` decimal(10,0) DEFAULT NULL,
  `orderItemTaxDescription` text,
  `orderGiveAsGift` varchar(255) NOT NULL,
  `certificateName` varchar(200) DEFAULT NULL,
  `certificateEmail` varchar(200) DEFAULT NULL,
  `dealOptionName` varchar(511) NOT NULL,
  `dealOptionCertTitle` varchar(511) NOT NULL,
  `addedTime` datetime NOT NULL,
  `redeemSlotID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_items_1` (`orderID`),
  KEY `FK_order_items_2` (`dealID`),
  KEY `FK_order_items_3` (`dealOptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping`
--

CREATE TABLE IF NOT EXISTS `order_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `shippingFname` varchar(50) NOT NULL,
  `shippingLname` varchar(50) NOT NULL,
  `shippingCompany` varchar(50) NOT NULL,
  `shippingAddress1` varchar(100) NOT NULL,
  `shippingAddress2` varchar(100) NOT NULL,
  `shippingCity` varchar(100) NOT NULL,
  `shippingZip` varchar(50) NOT NULL,
  `shippingCountryID` int(11) NOT NULL,
  `shippingStateID` int(11) NOT NULL,
  `shippingProvince` varchar(50) NOT NULL,
  `shippingMethod` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `page_name`
--

CREATE TABLE IF NOT EXISTS `page_name` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(175) NOT NULL,
  `pageKeyword` varchar(125) NOT NULL,
  `contentID` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_accepted_cc`
--

CREATE TABLE IF NOT EXISTS `payment_accepted_cc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardTypeCode` varchar(50) NOT NULL,
  `cardType` varchar(100) NOT NULL,
  `enableCVV2` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE IF NOT EXISTS `payment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paySetGroupID` int(11) DEFAULT NULL,
  `paySetLabel` varchar(200) NOT NULL,
  `paySetKey` varchar(200) NOT NULL,
  `paySetType` varchar(200) NOT NULL,
  `paySetOptions` text NOT NULL,
  `paySetValue` text NOT NULL,
  `paySetValidate` varchar(200) NOT NULL,
  `paySetDescription` text NOT NULL,
  `paySetSortOrder` int(11) NOT NULL,
  `paySetValidateError` varchar(500) DEFAULT NULL,
  `payFieldShow` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_settings_1` (`paySetGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings_group`
--

CREATE TABLE IF NOT EXISTS `payment_settings_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paySetGroupLabel` varchar(255) NOT NULL,
  `paySetGroupKey` varchar(255) NOT NULL,
  `paySetGroupSortOrder` int(11) NOT NULL,
  `paySetGroupStatus` enum('Active','Inactive') NOT NULL,
  `paytSetGroupLastUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_supported_currencies`
--

CREATE TABLE IF NOT EXISTS `payment_supported_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currencyCode` varchar(10) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE IF NOT EXISTS `payment_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionID` text,
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `completedDate` datetime NOT NULL,
  `extra` text,
  `paymentType` varchar(100) DEFAULT NULL,
  `paymentGateway` varchar(100) DEFAULT NULL,
  `paymentResponse` text,
  `orderSubTotal` decimal(10,0) DEFAULT NULL,
  `orderTotal` decimal(10,0) DEFAULT NULL,
  `taxAmount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions_errors`
--

CREATE TABLE IF NOT EXISTS `payment_transactions_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionID` text,
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `completedDate` datetime NOT NULL,
  `extra` text,
  `paymentType` varchar(100) DEFAULT NULL,
  `paymentGateway` varchar(100) DEFAULT NULL,
  `paymentResponse` text,
  `orderSubTotal` decimal(10,0) DEFAULT NULL,
  `orderTotal` decimal(10,0) DEFAULT NULL,
  `taxAmount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `promotional_banners`
--

CREATE TABLE IF NOT EXISTS `promotional_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bannerTypeID` int(11) DEFAULT NULL,
  `bannerCaption` varchar(255) DEFAULT NULL,
  `bannerDisplayType` enum('Script','Image','Swf') NOT NULL,
  `bannerScript` text NOT NULL,
  `bannerImage` varchar(200) NOT NULL,
  `bannerSwf` varchar(200) NOT NULL,
  `bannerURL` varchar(200) NOT NULL,
  `bannerStatus` enum('Active','Inactive','Deleted') NOT NULL,
  `bannerCreatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_promotional_banners_1` (`bannerTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `promotional_banners_type`
--

CREATE TABLE IF NOT EXISTS `promotional_banners_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `bannerTypePosition` varchar(200) NOT NULL,
  `bannerTypeWidth` int(4) NOT NULL,
  `bannerTypeHeight` int(4) NOT NULL,
  `bannerTypeStatus` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `referral_purchases`
--

CREATE TABLE IF NOT EXISTS `referral_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referrerID` int(11) NOT NULL,
  `purchaseDate` datetime NOT NULL,
  `orderID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_referral_purchases_1` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `refund_executions`
--

CREATE TABLE IF NOT EXISTS `refund_executions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refundExecutionDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE IF NOT EXISTS `refund_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transactionID` text,
  `orderID` int(11) NOT NULL,
  `dealID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `completedDate` datetime NOT NULL,
  `refundType` varchar(100) DEFAULT NULL,
  `refundGateway` varchar(100) DEFAULT NULL,
  `refundResponse` text,
  `refundAmount` decimal(10,0) DEFAULT NULL,
  `refundExecutionID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `related_products`
--

CREATE TABLE IF NOT EXISTS `related_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) NOT NULL,
  `relatedDealID` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `request_shipping_rates`
--

CREATE TABLE IF NOT EXISTS `request_shipping_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) NOT NULL,
  `rateNational` float(6,2) NOT NULL,
  `rateInternational` float(6,2) NOT NULL,
  `freeShippingMinQty` int(11) NOT NULL,
  `shippingOriginCountryID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `search_engine`
--

CREATE TABLE IF NOT EXISTS `search_engine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `searchEngineName` varchar(225) NOT NULL,
  `searchEngineURL` varchar(225) NOT NULL,
  `searchParameter` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settingsGroupID` int(11) DEFAULT NULL,
  `settingsLabel` varchar(200) NOT NULL,
  `settingsKey` varchar(200) NOT NULL,
  `settingsType` varchar(200) NOT NULL,
  `settingsFieldType` varchar(255) NOT NULL,
  `settingsDependants` text NOT NULL,
  `settingsOptions` text NOT NULL,
  `settingsValue` text NOT NULL,
  `settingsValidate` varchar(200) NOT NULL,
  `settingsValidateError` varchar(255) NOT NULL,
  `settingsDescription` text NOT NULL,
  `settingsSortOrder` int(11) NOT NULL,
  `settingsSecure` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_settings_1` (`settingsGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings_group`
--

CREATE TABLE IF NOT EXISTS `settings_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settingsGroupLabel` varchar(200) NOT NULL,
  `settingsGroupDescription` text NOT NULL,
  `settingsGroupKey` varchar(200) NOT NULL,
  `settingsGroupSortOrder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_rates`
--

CREATE TABLE IF NOT EXISTS `shipping_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` int(11) NOT NULL,
  `rateNational` float(6,2) NOT NULL,
  `rateInternational` float(6,2) NOT NULL,
  `freeShippingMinQty` int(11) NOT NULL,
  `shippingOriginCountryID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `standard_currencies`
--

CREATE TABLE IF NOT EXISTS `standard_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standardCurrencyName` varchar(255) NOT NULL,
  `standardCurrencyCode` varchar(255) NOT NULL,
  `standardCurrencySymbolLeft` varchar(100) NOT NULL,
  `standardCurrencySymbolRight` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryID` int(11) DEFAULT NULL,
  `stateName` varchar(100) NOT NULL,
  `stateShortName` varchar(10) NOT NULL,
  `stateStatus` enum('Active','Inactive','Delete') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_states_1` (`countryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `countryID`, `stateName`, `stateShortName`, `stateStatus`) VALUES
(1, 1, 'Karala', 'KL', 'Active'),
(2, NULL, 'Alabama', 'ALB', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_cities`
--

CREATE TABLE IF NOT EXISTS `subscribed_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscID` int(11) DEFAULT NULL,
  `cityID` int(11) DEFAULT NULL,
  `subscribedDate` datetime NOT NULL,
  `subscStatus` varchar(255) NOT NULL,
  `unsubscrDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subscribed_cities_1` (`cityID`),
  KEY `FK_subscribed_cities_2` (`subscID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_deal_types`
--

CREATE TABLE IF NOT EXISTS `subscribed_deal_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscID` int(11) DEFAULT NULL,
  `dealTypeKey` enum('deal','product_deal','now_deal','getaway_deal') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subscribed_deal_types_1` (`subscID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscEmailID` varchar(255) NOT NULL,
  `userID` bigint(20) DEFAULT NULL,
  `contactPhone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subscribers_1` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_classes`
--

CREATE TABLE IF NOT EXISTS `tax_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxClassName` varchar(120) NOT NULL,
  `taxClassDescription` varchar(200) NOT NULL,
  `taxClassStatus` enum('Active','Inactive','Deleted') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxClassID` int(11) DEFAULT NULL,
  `geoZoneID` int(11) DEFAULT NULL,
  `taxRate` decimal(10,0) NOT NULL,
  `taxPriority` int(11) NOT NULL,
  `taxDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tax_rates_1` (`taxClassID`),
  KEY `FK_tax_rates_2` (`geoZoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE IF NOT EXISTS `timezones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeZoneName` varchar(200) NOT NULL,
  `timeZoneDetail` varchar(200) NOT NULL,
  `timeZoneAbbreviation` varchar(10) NOT NULL,
  `timeZoneDiff` varchar(10) DEFAULT NULL,
  `timeZoneDiffDST` varchar(10) DEFAULT NULL,
  `timeZoneDiffDefault` varchar(10) DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL,
  `daylightSavingsDiff` varchar(10) NOT NULL,
  `dstStartDate` varchar(255) DEFAULT NULL,
  `dstEndDate` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_timezones_1` (`countryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `url_keys`
--

CREATE TABLE IF NOT EXISTS `url_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urlKey` varchar(255) NOT NULL,
  `referanceTable` varchar(255) NOT NULL,
  `referenceField` varchar(255) NOT NULL,
  `referenceFieldID` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `userFirstName` varchar(100) DEFAULT NULL,
  `userLastName` varchar(100) DEFAULT NULL,
  `userPhone` varchar(25) DEFAULT NULL,
  `userAdress1` varchar(255) DEFAULT NULL,
  `userAdress2` varchar(255) DEFAULT NULL,
  `userCity` varchar(100) DEFAULT NULL,
  `countryID` int(11) DEFAULT NULL,
  `stateID` int(11) DEFAULT NULL,
  `userProvince` varchar(100) DEFAULT NULL,
  `userZip` varchar(10) DEFAULT NULL,
  `userReferralID` varchar(100) DEFAULT NULL,
  `userProfilePicture` varchar(100) DEFAULT NULL,
  `userDOB` date DEFAULT NULL,
  `userGender` enum('Male','Female') DEFAULT NULL,
  `userNewsletterSubscribeStatus` varchar(255) DEFAULT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  KEY `FK_users_1` (`countryID`),
  KEY `FK_users_2` (`stateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `userFirstName`, `userLastName`, `userPhone`, `userAdress1`, `userAdress2`, `userCity`, `countryID`, `stateID`, `userProvince`, `userZip`, `userReferralID`, `userProfilePicture`, `userDOB`, `userGender`, `userNewsletterSubscribeStatus`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'nisam', 'nisam', 'k', '89898', 'kkhjkh', 'jhjkhjkh', 'hkjhjk', 1, 1, 'kjklj', '85454', '85454', 'jhjh', '1963-02-02', 'Male', NULL, 'nisam', 'example@ex.com', 'example@ex.com', 1, 'mc943q63gkggcko04oskw0cos0kw80c', 'bgtA8vWS+c0eC04bcfh5+jUj8c6hCjSDN6llBwPxvboeU3Bhyt7bo/cntlnKhu9MiQpY7gdhioDW+b4b+y2GLQ==', '2012-10-30 12:25:14', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(2, 'admin', 'Admin', 'Super', '6565', 'kjhkh', 'kjhjhjkh', 'jkhjkh', 1, 1, 'hjhkj', '5765', '6545', 'jhjkh', '2004-01-01', 'Male', NULL, 'admin', 'admin@example.com', 'admin@example.com', 1, '1fben3rtfjhccwss04wwks8osocg48k', 'Ql409vvJDp7omua7koNOJ/IvxJM9JCpe6NlVKo47n6RHATUJKlNRZcyRoBNRIHIVCpgca7TlYM0MBvI3O0b2Hw==', NULL, 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_cc_info`
--

CREATE TABLE IF NOT EXISTS `users_cc_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `nameonCard` varchar(200) NOT NULL,
  `cardType` varchar(100) NOT NULL,
  `cardNumber` varchar(500) NOT NULL,
  `expMonth` tinyint(4) NOT NULL,
  `expYear` int(4) NOT NULL,
  `addedDate` datetime NOT NULL,
  `securityCode` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_cc_info_1` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users_follow_businesss`
--

CREATE TABLE IF NOT EXISTS `users_follow_businesss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `businessID` int(11) DEFAULT NULL,
  `followDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_follow_businesss_1` (`userID`),
  KEY `FK_users_follow_businesss_2` (`businessID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users_follow_category`
--

CREATE TABLE IF NOT EXISTS `users_follow_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `dealCategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_follow_category_1` (`userID`),
  KEY `FK_users_follow_category_2` (`dealCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users_referrals`
--

CREATE TABLE IF NOT EXISTS `users_referrals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referedBY` int(11) NOT NULL,
  `referedTo` int(11) NOT NULL,
  `purchaseStatus` enum('Yes','No') NOT NULL,
  `referralAmount` decimal(10,0) NOT NULL,
  `referralStatus` enum('Active','Inactive','Deleted') NOT NULL,
  `referalRegActiveDate` timestamp NULL DEFAULT NULL,
  `LastActDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users_transactions`
--

CREATE TABLE IF NOT EXISTS `users_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `transactionType` enum('Debit','Credit') NOT NULL,
  `transactionDate` datetime NOT NULL,
  `transactionAmount` decimal(10,0) NOT NULL,
  `transactionDescription` text,
  `transactionStatus` enum('Active','Cancelled') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users_transactions_1` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_api`
--

CREATE TABLE IF NOT EXISTS `user_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `userApiKey` varchar(105) NOT NULL,
  `apiKeyTitle` varchar(200) NOT NULL,
  `apiUserType` varchar(255) NOT NULL,
  `apiUserStatus` varchar(255) NOT NULL,
  `apiUserCreatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_api_1` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_privilage_city`
--

CREATE TABLE IF NOT EXISTS `user_privilage_city` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `adminuserID` int(11) DEFAULT NULL,
  `cityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_privilage_city_1` (`adminuserID`),
  KEY `FK_user_privilage_city_2` (`cityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_shipping`
--

CREATE TABLE IF NOT EXISTS `user_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) DEFAULT NULL,
  `shippingFname` varchar(50) NOT NULL,
  `shippingLname` varchar(50) NOT NULL,
  `shippingAddress1` varchar(100) NOT NULL,
  `shippingAddress2` varchar(100) NOT NULL,
  `shippingCity` varchar(100) NOT NULL,
  `shippingZip` varchar(50) NOT NULL,
  `shippingCountryID` int(11) DEFAULT NULL,
  `shippingStateID` int(11) DEFAULT NULL,
  `shippingProvince` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_shipping_1` (`userID`),
  KEY `FK_user_shipping_2` (`shippingCountryID`),
  KEY `FK_user_shipping_3` (`shippingStateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_transaction_orders`
--

CREATE TABLE IF NOT EXISTS `user_transaction_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) DEFAULT NULL,
  `userTransactionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_transaction_orders_1` (`orderID`),
  KEY `FK_user_transaction_orders_2` (`userTransactionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_count_info`
--

CREATE TABLE IF NOT EXISTS `visitor_count_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `newVisitorCount` int(11) NOT NULL,
  `returningVisitorCount` int(11) NOT NULL,
  `returningVisitCount` int(11) NOT NULL,
  `totalVisitCount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_info_log`
--

CREATE TABLE IF NOT EXISTS `visitor_info_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryPage` varchar(765) NOT NULL,
  `entryTime` datetime NOT NULL,
  `exitPage` varchar(765) NOT NULL,
  `exitTime` datetime NOT NULL,
  `userAgent` varchar(765) NOT NULL,
  `browserName` varchar(765) NOT NULL,
  `operatingSystem` varchar(765) NOT NULL,
  `httpReferer` varchar(765) NOT NULL,
  `remoteAddress` varchar(765) NOT NULL,
  `serverAddress` varchar(765) NOT NULL,
  `userID` varchar(11) NOT NULL,
  `loginTime` datetime NOT NULL,
  `logoutTime` datetime NOT NULL,
  `userType` varchar(125) NOT NULL,
  `searchKeyWord` varchar(200) NOT NULL,
  `searchEngineName` varchar(175) NOT NULL,
  `orderPlaced` int(12) NOT NULL,
  `orderAmount` decimal(10,0) NOT NULL,
  `doneSubscribe` int(12) NOT NULL,
  `doneSignUp` int(12) NOT NULL,
  `userSex` enum('Not Specified','Male','Female') NOT NULL,
  `userAge` varchar(25) NOT NULL,
  `pageCount` int(12) NOT NULL,
  `city` varchar(765) NOT NULL,
  `country` varchar(175) NOT NULL,
  `referrerType` varchar(150) NOT NULL,
  `referrerWebSite` varchar(125) NOT NULL,
  `widgetID` int(12) NOT NULL,
  `isMobileWeb` enum('No','Yes') NOT NULL,
  `languageID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_url_log`
--

CREATE TABLE IF NOT EXISTS `visitor_url_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitorID` int(11) NOT NULL,
  `currentUrl` varchar(765) NOT NULL,
  `refererUrl` varchar(765) NOT NULL,
  `visitTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD CONSTRAINT `FK_admin_users_1` FOREIGN KEY (`userTypeID`) REFERENCES `admin_user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `admin_user_type_modules`
--
ALTER TABLE `admin_user_type_modules`
  ADD CONSTRAINT `FK_admin_user_type_modules_1` FOREIGN KEY (`userTypeID`) REFERENCES `admin_user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `FK_business_1` FOREIGN KEY (`businessStateID`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_2` FOREIGN KEY (`businessCountryID`) REFERENCES `countries` (`id`);

--
-- Constraints for table `business_deal_campaigns`
--
ALTER TABLE `business_deal_campaigns`
  ADD CONSTRAINT `FK_business_deal_campaigns_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `FK_business_locations_1` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business_payments`
--
ALTER TABLE `business_payments`
  ADD CONSTRAINT `FK_business_payments_1` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_payments_2` FOREIGN KEY (`adminUserID`) REFERENCES `admin_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_payments_3` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business_ratings`
--
ALTER TABLE `business_ratings`
  ADD CONSTRAINT `FK_business_ratings_1` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_ratings_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business_requests`
--
ALTER TABLE `business_requests`
  ADD CONSTRAINT `FK_business_requests_1` FOREIGN KEY (`businessTypeID`) REFERENCES `business_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_requests_2` FOREIGN KEY (`businessReqCountryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_requests_3` FOREIGN KEY (`businessReqStateID`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business_reviews`
--
ALTER TABLE `business_reviews`
  ADD CONSTRAINT `FK_business_reviews_1` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_reviews_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `business_to_types`
--
ALTER TABLE `business_to_types`
  ADD CONSTRAINT `FK_business_to_types_1` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_business_to_types_2` FOREIGN KEY (`businessTypeID`) REFERENCES `business_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `FK_cities_1` FOREIGN KEY (`stateID`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cities_2` FOREIGN KEY (`countryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cities_3` FOREIGN KEY (`timeZoneID`) REFERENCES `timezones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deals`
--
ALTER TABLE `deals`
  ADD CONSTRAINT `FK_deals_1` FOREIGN KEY (`dealTypeID`) REFERENCES `deal_types` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `FK_deals_2` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_certificates`
--
ALTER TABLE `deal_certificates`
  ADD CONSTRAINT `FK_deal_certificates_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_images`
--
ALTER TABLE `deal_images`
  ADD CONSTRAINT `FK_deal_images_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_locations`
--
ALTER TABLE `deal_locations`
  ADD CONSTRAINT `FK_deal_locations_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_options`
--
ALTER TABLE `deal_options`
  ADD CONSTRAINT `FK_deal_options_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_priority`
--
ALTER TABLE `deal_priority`
  ADD CONSTRAINT `FK_deal_priority_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_deal_priority_2` FOREIGN KEY (`cityID`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_requests`
--
ALTER TABLE `deal_requests`
  ADD CONSTRAINT `FK_deal_requests_1` FOREIGN KEY (`dealTypeID`) REFERENCES `deal_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_deal_requests_2` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_request_locations`
--
ALTER TABLE `deal_request_locations`
  ADD CONSTRAINT `FK_deal_request_locations_1` FOREIGN KEY (`cityID`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_deal_request_locations_2` FOREIGN KEY (`dealRequestID`) REFERENCES `deal_requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_request_options`
--
ALTER TABLE `deal_request_options`
  ADD CONSTRAINT `FK_deal_request_options_1` FOREIGN KEY (`dealRequestID`) REFERENCES `deal_requests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_reviews`
--
ALTER TABLE `deal_reviews`
  ADD CONSTRAINT `FK_deal_reviews_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_deal_reviews_2` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `deal_to_category`
--
ALTER TABLE `deal_to_category`
  ADD CONSTRAINT `FK_deal_to_category_1` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_deal_to_category_2` FOREIGN KEY (`dealCategoryID`) REFERENCES `deal_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `discounts_promo`
--
ALTER TABLE `discounts_promo`
  ADD CONSTRAINT `FK_discounts_promo_1` FOREIGN KEY (`DealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `geozone_to_regions`
--
ALTER TABLE `geozone_to_regions`
  ADD CONSTRAINT `FK_geozone_to_regions_1` FOREIGN KEY (`geoZoneID`) REFERENCES `geozones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_geozone_to_regions_2` FOREIGN KEY (`StateID`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_geozone_to_regions_3` FOREIGN KEY (`countryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gift_coupons`
--
ALTER TABLE `gift_coupons`
  ADD CONSTRAINT `FK_gift_coupons_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gift_coupons_2` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_gift_coupons_3` FOREIGN KEY (`giftEmailTemplateID`) REFERENCES `gift_email_templates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_orders_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_orders_2` FOREIGN KEY (`cityID`) REFERENCES `cities` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FK_order_items_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_order_items_2` FOREIGN KEY (`dealID`) REFERENCES `deals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_order_items_3` FOREIGN KEY (`dealOptionID`) REFERENCES `deal_options` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD CONSTRAINT `FK_payment_settings_1` FOREIGN KEY (`paySetGroupID`) REFERENCES `payment_settings_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `promotional_banners`
--
ALTER TABLE `promotional_banners`
  ADD CONSTRAINT `FK_promotional_banners_1` FOREIGN KEY (`bannerTypeID`) REFERENCES `promotional_banners_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `referral_purchases`
--
ALTER TABLE `referral_purchases`
  ADD CONSTRAINT `FK_referral_purchases_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `FK_settings_1` FOREIGN KEY (`settingsGroupID`) REFERENCES `settings_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `FK_states_1` FOREIGN KEY (`countryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subscribed_cities`
--
ALTER TABLE `subscribed_cities`
  ADD CONSTRAINT `FK_subscribed_cities_1` FOREIGN KEY (`cityID`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_subscribed_cities_2` FOREIGN KEY (`subscID`) REFERENCES `subscribers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subscribed_deal_types`
--
ALTER TABLE `subscribed_deal_types`
  ADD CONSTRAINT `FK_subscribed_deal_types_1` FOREIGN KEY (`subscID`) REFERENCES `subscribers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `FK_subscribers_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `FK_tax_rates_1` FOREIGN KEY (`taxClassID`) REFERENCES `tax_classes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_tax_rates_2` FOREIGN KEY (`geoZoneID`) REFERENCES `geozones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `timezones`
--
ALTER TABLE `timezones`
  ADD CONSTRAINT `FK_timezones_1` FOREIGN KEY (`countryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_users_1` FOREIGN KEY (`countryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_users_2` FOREIGN KEY (`stateID`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_cc_info`
--
ALTER TABLE `users_cc_info`
  ADD CONSTRAINT `FK_users_cc_info_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_follow_businesss`
--
ALTER TABLE `users_follow_businesss`
  ADD CONSTRAINT `FK_users_follow_businesss_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_users_follow_businesss_2` FOREIGN KEY (`businessID`) REFERENCES `business` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_follow_category`
--
ALTER TABLE `users_follow_category`
  ADD CONSTRAINT `FK_users_follow_category_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_users_follow_category_2` FOREIGN KEY (`dealCategoryID`) REFERENCES `deal_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_transactions`
--
ALTER TABLE `users_transactions`
  ADD CONSTRAINT `FK_users_transactions_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_api`
--
ALTER TABLE `user_api`
  ADD CONSTRAINT `FK_user_api_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_privilage_city`
--
ALTER TABLE `user_privilage_city`
  ADD CONSTRAINT `FK_user_privilage_city_1` FOREIGN KEY (`adminuserID`) REFERENCES `admin_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_user_privilage_city_2` FOREIGN KEY (`cityID`) REFERENCES `cities` (`id`);

--
-- Constraints for table `user_shipping`
--
ALTER TABLE `user_shipping`
  ADD CONSTRAINT `FK_user_shipping_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_user_shipping_2` FOREIGN KEY (`shippingCountryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_user_shipping_3` FOREIGN KEY (`shippingStateID`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_transaction_orders`
--
ALTER TABLE `user_transaction_orders`
  ADD CONSTRAINT `FK_user_transaction_orders_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_user_transaction_orders_2` FOREIGN KEY (`userTransactionID`) REFERENCES `users_transactions` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
