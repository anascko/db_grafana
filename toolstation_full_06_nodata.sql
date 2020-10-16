
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bundle_id` bigint(20) NOT NULL,
  `order_id` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_id_idx` (`bundle_id`),
  KEY `order_id_idx` (`order_id`),
  KEY `bundle_order_idx` (`bundle_id`,`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=137375 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `depot_id` char(2) COLLATE latin1_general_ci NOT NULL,
  `depot_name` varchar(128) COLLATE latin1_general_ci NOT NULL,
  `bundle_size` int(11) NOT NULL DEFAULT '0',
  `order_count` int(11) NOT NULL,
  `part_count` int(11) NOT NULL,
  `qty_count` int(11) NOT NULL,
  `total_value` double(8,2) NOT NULL,
  `total_currency` char(3) COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_depot_idx` (`depot_id`),
  KEY `bundle_status_idx` (`status`),
  KEY `bundle_depot_status_idx` (`depot_id`,`status`),
  KEY `bundle_full_id_idx` (`full_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74324 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courier_dpd_domestic_postcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postcode_sector` varchar(8) NOT NULL,
  `dpd_depot` varchar(8) DEFAULT NULL,
  `dpd_service_group` varchar(8) DEFAULT NULL,
  `dpd_offshore_zone` varchar(8) NOT NULL,
  `timeslots_code` varchar(8) NOT NULL,
  `cluster` varchar(8) NOT NULL,
  `ilk_depot` varchar(8) NOT NULL,
  `ilk_services_group` varchar(8) NOT NULL,
  `ilk_offshore_zone` varchar(8) NOT NULL,
  `ilk_alternate_service` varchar(8) NOT NULL,
  `dpd_alternate_service` varchar(8) NOT NULL,
  `new_postcode` varchar(8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `use_from` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `use_from` (`use_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Groups for DPD courier';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courier_dpd_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  `lookup_code` varchar(6) DEFAULT NULL,
  `available_services` varchar(255) DEFAULT NULL,
  `business` varchar(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `use_from` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `use_from` (`use_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Groups for DPD courier';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courier_dpd_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_code_2d` varchar(2) DEFAULT NULL,
  `service_code_3d` varchar(3) DEFAULT NULL,
  `dpd_product_desc` varchar(64) NOT NULL,
  `dpd_label_service_desc` varchar(64) NOT NULL,
  `ilk_product_desc` varchar(64) NOT NULL,
  `ilk_label_service_desc` varchar(64) NOT NULL,
  `ilk_alt_service_desc` varchar(64) NOT NULL,
  `dpd_premium` varchar(1) NOT NULL,
  `old_dpd` int(4) NOT NULL,
  `old_ilk` int(4) NOT NULL,
  `ilk_max_parcels` int(4) NOT NULL,
  `ilk_max_weight` decimal(5,2) NOT NULL,
  `dpd_max_parcels` int(4) NOT NULL,
  `dpd_max_weight` decimal(5,2) NOT NULL,
  `dpd_alt_service_desc` varchar(64) NOT NULL,
  `ilk_premium` varchar(1) NOT NULL,
  `dpd_sec` int(4) NOT NULL,
  `ilk_sec` int(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `use_from` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `use_from` (`use_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Services for DPD courier';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courier_dpd_timeslots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timeslot_code` int(4) DEFAULT NULL,
  `available_timeslots` varchar(26) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `use_from` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `use_from` (`use_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Timeslots for DPD courier';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_addresses` (
  `dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dad_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dad_type` int(8) NOT NULL DEFAULT '0',
  `dad_1house` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `dad_2Aroad` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `dad_2Broad` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_3town` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_4county` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_5zip` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_5zip_condensed` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_6country` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dad_uid`),
  KEY `dad_type` (`dad_type`),
  KEY `dad_5zip` (`dad_5zip`),
  KEY `dad_start` (`dad_start`),
  KEY `dad_end` (`dad_end`),
  KEY `dad_5zip_condensed` (`dad_5zip_condensed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_addresses_problempostcodes` (
  `dap_zip` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dap_active` tinyint(1) NOT NULL DEFAULT '1',
  `dap_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dap_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dap_note` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`dap_zip`),
  KEY `dap_active` (`dap_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_calendars` (
  `dca_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dca_sst_uid` int(16) NOT NULL DEFAULT '0',
  `dca_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dca_ts_end` datetime DEFAULT NULL,
  `dca_desc` varchar(250) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dca_sus_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dca_ruid`),
  KEY `dca_sst_uid` (`dca_sst_uid`),
  KEY `dca_ts` (`dca_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_comments` (
  `dcm_id` int(11) NOT NULL AUTO_INCREMENT,
  `dcm_linkto` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dcm_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dcm_who` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dcm_data` text COLLATE latin1_general_ci NOT NULL,
  `dcm_active` tinyint(1) NOT NULL DEFAULT '1',
  `dcm_group` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dcm_id`),
  UNIQUE KEY `dcm_id` (`dcm_id`),
  KEY `dcm_linkto` (`dcm_linkto`),
  KEY `dcm_ts` (`dcm_ts`),
  KEY `dcm_active` (`dcm_active`),
  KEY `dcm_group` (`dcm_group`)
) ENGINE=InnoDB AUTO_INCREMENT=68858802 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Text comments associated to UIDs';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_countries` (
  `dco_uid` int(8) NOT NULL DEFAULT '0',
  `dco_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dco_iso3166_2` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dco_iso3166_3` char(3) COLLATE latin1_general_ci DEFAULT NULL,
  `dco_currency_iso4217` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dco_uid`),
  KEY `dco_iso3166_2` (`dco_iso3166_2`),
  KEY `dco_iso3166_3` (`dco_iso3166_3`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_currencies` (
  `dcu_iso4217` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dcu_exponent` tinyint(1) NOT NULL DEFAULT '0',
  `dcu_ascii` char(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dcu_html` char(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dcu_iso4217`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_demographics_zip` (
  `ddz_dco_uid` int(8) NOT NULL DEFAULT '0',
  `ddz_zip` varchar(9) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ddz_population` int(8) NOT NULL DEFAULT '0',
  `ddz_households` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ddz_dco_uid`,`ddz_zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Demographic data - population and households by postcode';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_marketing` (
  `dma_sst_uid` int(16) NOT NULL DEFAULT '0',
  `dma_ref` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dma_desc` text COLLATE latin1_general_ci NOT NULL,
  `dma_ts_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dma_ts_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`dma_ref`),
  KEY `dma_sst_uid` (`dma_sst_uid`,`dma_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Marketing campaigns';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_postcodes_anc_depots` (
  `dpd_zip` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `dpd_depot` int(3) unsigned zerofill NOT NULL DEFAULT '000',
  `dpd_southern` tinyint(1) NOT NULL DEFAULT '0',
  `dpd_location_gbr` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpd_zip`),
  UNIQUE KEY `dpd_zip` (`dpd_zip`),
  KEY `dpd_depot` (`dpd_depot`),
  KEY `dpd_southern` (`dpd_southern`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ANC Postcode/PAF Data';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_postcodes_dhl_branch` (
  `dpdb_branchterminalid` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdb_branchterminalname` varchar(21) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdb_terminalcode` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdb_terminalsortnumber` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpdb_branchterminalid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_postcodes_dhl_postcode` (
  `dpdp_postcodearea` varchar(4) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_onbranch` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_onterminal` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_slbranch` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_slterminal` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_offshore` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_null1` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_standard` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_null2` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_diamond` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_null3` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_null4` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_sdbranch` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpdp_filler` varchar(4) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpdp_postcodearea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_postcodes_dhl_service` (
  `dpds_serviceid` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_servicedesc` varchar(45) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_prodline1` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_prodline2` varchar(35) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_prodcode` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_datecode` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_datetext` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_timecode` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_timetext` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_handingtext` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_featureid` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_i2of5prefix` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_filetype` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpds_consignmentflag` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpds_serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_postcodes_parceline` (
  `dpl_zip` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `dpl_7digit` varchar(7) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpl_zip`),
  UNIQUE KEY `dpl_zip` (`dpl_zip`),
  KEY `dpl_7digit` (`dpl_7digit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Parceline Postcode 7-Digit Data';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_postcodes_remote` (
  `dpr_uid` int(16) NOT NULL AUTO_INCREMENT,
  `dpr_txt` varchar(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpr_frm` int(8) DEFAULT NULL,
  `dpr_to` int(8) DEFAULT NULL,
  PRIMARY KEY (`dpr_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_postcodes_tuffnells` (
  `dpt_zip` varchar(9) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpt_depot_short_code` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpt_round_number` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpt_depot_number` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpt_zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_pricematches` (
  `dpm_uid` int(16) NOT NULL AUTO_INCREMENT,
  `dpm_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dpm_status` int(16) NOT NULL DEFAULT '0',
  `dpm_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpm_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `dpm_company` int(16) NOT NULL DEFAULT '0',
  `dpm_desc` text COLLATE latin1_general_ci,
  `dpm_answer` text COLLATE latin1_general_ci,
  PRIMARY KEY (`dpm_uid`),
  KEY `dpm_spa_uid` (`dpm_spa_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3790 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_pricematches_orig` (
  `dpm_uid` int(16) NOT NULL AUTO_INCREMENT,
  `dpm_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dpm_status` int(16) NOT NULL DEFAULT '0',
  `dpm_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpm_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `dpm_company` int(16) NOT NULL DEFAULT '0',
  `dpm_desc` text COLLATE latin1_general_ci,
  `dpm_answer` text COLLATE latin1_general_ci,
  PRIMARY KEY (`dpm_uid`),
  KEY `dpm_spa_uid` (`dpm_spa_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3790 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Pricematch data on any parts.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_prices_competitor` (
  `dpc_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpc_sst_uid` int(16) NOT NULL DEFAULT '0',
  `dpc_their_code` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpc_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `dpc_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dpc_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpc_spa_uid`,`dpc_sst_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_prices_competitor_orig` (
  `dpc_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpc_sst_uid` int(16) NOT NULL DEFAULT '0',
  `dpc_their_code` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpc_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `dpc_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dpc_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpc_spa_uid`,`dpc_sst_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_vat` (
  `dvt_uid` int(8) NOT NULL AUTO_INCREMENT,
  `dvt_dco_uid` int(8) NOT NULL DEFAULT '0',
  `dvt_value` double(8,3) NOT NULL DEFAULT '0.000',
  `dvt_desc` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dvt_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dvt_uid`),
  KEY `dvt_dco_uid` (`dvt_dco_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='World VAT rates';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_orderstatus` (
  `hos_id` int(11) NOT NULL AUTO_INCREMENT,
  `hos_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hos_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hos_status` int(16) NOT NULL DEFAULT '0',
  `hos_sus_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hos_id`),
  UNIQUE KEY `hos_id` (`hos_id`),
  KEY `hos_uor_uid` (`hos_uor_uid`),
  KEY `hos_ts` (`hos_ts`),
  KEY `hos_status` (`hos_status`)
) ENGINE=InnoDB AUTO_INCREMENT=74498949 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='History of customer order status changes';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_stockincident` (
  `hsi_id` int(11) NOT NULL AUTO_INCREMENT,
  `hsi_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hsi_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hsi_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hsi_qty_wanted` int(16) NOT NULL DEFAULT '0',
  `hsi_qty_available` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hsi_id`),
  UNIQUE KEY `hsi_id` (`hsi_id`),
  KEY `hsi_ssi_uid` (`hsi_ssi_uid`),
  KEY `hsi_ts` (`hsi_ts`),
  KEY `hsi_spa_uid` (`hsi_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_sysusers` (
  `hsu_id` int(11) NOT NULL AUTO_INCREMENT,
  `hsu_type` int(16) NOT NULL DEFAULT '0',
  `hsu_ref` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hsu_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hsu_sus_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hsu_id`),
  UNIQUE KEY `hsu_id` (`hsu_id`),
  KEY `hsu_ref` (`hsu_ref`),
  KEY `hsu_type` (`hsu_type`),
  KEY `hsu_sus_uid` (`hsu_sus_uid`),
  KEY `hsu_ts` (`hsu_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=10295801 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnk_addresses` (
  `lna_address` char(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `lna_linkto` char(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`lna_address`,`lna_linkto`),
  KEY `lna_linkto` (`lna_linkto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Address relationships';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnk_order_pricematch` (
  `lop_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `lop_dpm_uid` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lop_uor_uid`,`lop_dpm_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Link table between user_orders and data_pricematches';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnk_parts_supplierparts` (
  `lps_part` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `lps_supplierpart` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `lps_pref` tinyint(1) NOT NULL DEFAULT '0',
  `lps_cert` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lps_supplierpart`),
  UNIQUE KEY `lps_supplierpart` (`lps_supplierpart`),
  KEY `lps_part` (`lps_part`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Links parts to (multiple) supplier parts.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnk_site_supplier` (
  `lss_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `lss_spp_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`lss_ssi_uid`,`lss_spp_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_history` (
  `record_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT NULL,
  `uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `message_title` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `message_content` text COLLATE latin1_general_ci NOT NULL,
  `message_id` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `message_status` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `message_payload` text COLLATE latin1_general_ci,
  `read` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=935 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_requests` (
  `request_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `message` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `url` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `image` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `push` tinyint(1) DEFAULT NULL,
  `platforms` text COLLATE latin1_general_ci,
  `languages` text COLLATE latin1_general_ci,
  `customers` text COLLATE latin1_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_targets` (
  `target_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hashed_target_id` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `uuid` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `token` text COLLATE latin1_general_ci,
  `uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `platform` varchar(7) COLLATE latin1_general_ci NOT NULL,
  `preferred_language` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13017 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `print_queue` (
  `pdu_id` int(11) NOT NULL AUTO_INCREMENT,
  `pqu_depot` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pqu_status` int(16) NOT NULL DEFAULT '0',
  `pqu_data` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pqu_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`pdu_id`),
  UNIQUE KEY `pdu_id` (`pdu_id`),
  KEY `pqu_depot` (`pqu_depot`),
  KEY `pqu_status` (`pqu_status`),
  KEY `pqu_data` (`pqu_data`),
  KEY `pqu_ts` (`pqu_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=5682099 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Print Queue';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendation_unsubscribes` (
  `run_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `run_email` varchar(64) COLLATE latin1_general_ci NOT NULL COMMENT 'The email address to not send recommendation emails to.',
  `run_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `run_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`run_id`),
  UNIQUE KEY `run_email` (`run_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendations` (
  `rec_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rec_invite_code` varchar(32) COLLATE latin1_general_ci NOT NULL COMMENT 'A hash of the customer creating the invite with a timestamp.',
  `rec_friend_email` varchar(64) COLLATE latin1_general_ci NOT NULL COMMENT 'The email address to send the invite email.',
  `rec_friend_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'ID of the invited customer that signed up using the invite code.',
  `rec_friend_uor_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'The UID of the invited customers order that utilised the invite promotion discount.',
  `rec_recommender_uid` varchar(11) COLLATE latin1_general_ci NOT NULL COMMENT 'ID of customer making the recommendation (if available)',
  `rec_recommender_uor_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'The UID of the recommenders order that utilised the invite promotion discount',
  `rec_cancelled` tinyint(1) DEFAULT '0' COMMENT 'A flag to indicate if the recommender has cancelled the invitation (cas being typos etc)',
  `rec_expires_at` datetime DEFAULT NULL COMMENT 'A date in the future when the invite code should no longer be valid.',
  `rec_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rec_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rec_id`),
  UNIQUE KEY `rec_invite_code` (`rec_invite_code`),
  KEY `rec_friend_email` (`rec_friend_email`),
  KEY `rec_invite_code_2` (`rec_invite_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replen_simple_recent_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rsrl_ruid` varchar(11) COLLATE latin1_general_ci DEFAULT '',
  `rsrl_depot_to` char(2) COLLATE latin1_general_ci DEFAULT '',
  `rsrl_spa_uid` varchar(11) COLLATE latin1_general_ci DEFAULT '',
  `rsrl_sld_desc` varchar(64) COLLATE latin1_general_ci DEFAULT '',
  `rsrl_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rsrl_ruid` (`rsrl_ruid`,`rsrl_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_attributes` (
  `sa_uid` int(16) NOT NULL AUTO_INCREMENT,
  `sa_sde_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sa_sde_has_parent` tinyint(1) NOT NULL COMMENT 'Set 1 or 0, a 0 indicates its a dept, 1 means its a subdept',
  `sa_sst_uid` int(16) NOT NULL DEFAULT '0',
  `sa_val` text COLLATE latin1_general_ci NOT NULL,
  `sa_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sa_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sa_uid`),
  KEY `sa_sde_uid` (`sa_sde_uid`,`sa_sst_uid`),
  KEY `val_prefix` (`sa_val`(16))
) ENGINE=InnoDB AUTO_INCREMENT=283525 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_departments` (
  `sde_uid` int(16) NOT NULL AUTO_INCREMENT,
  `sde_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sde_desc` text COLLATE latin1_general_ci,
  `sde_keywords` text COLLATE latin1_general_ci,
  `sde_img` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sde_colour` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sde_nudge` int(8) NOT NULL DEFAULT '0',
  `sde_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sde_uid`),
  UNIQUE KEY `sde_uid` (`sde_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_parts_like4like` (
  `spl4l_spa_uid_from` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spl4l_spa_uid_to` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`spl4l_spa_uid_from`,`spl4l_spa_uid_to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_subdepartments` (
  `ssd_uid` int(16) NOT NULL AUTO_INCREMENT,
  `ssd_sde_uid` int(16) NOT NULL DEFAULT '0',
  `ssd_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssd_desc` text COLLATE latin1_general_ci,
  `ssd_keywords` text COLLATE latin1_general_ci,
  `ssd_img` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssd_nudge` int(8) NOT NULL DEFAULT '0',
  `ssd_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ssd_uid`),
  UNIQUE KEY `sde_uid` (`ssd_uid`),
  KEY `ssd_sde_uid` (`ssd_sde_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3655 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_table_parts` (
  `stp_id` int(11) NOT NULL AUTO_INCREMENT,
  `stp_sta_uid` int(16) NOT NULL DEFAULT '0',
  `stp_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `stp_primary` tinyint(1) NOT NULL DEFAULT '0',
  `stp_nudge` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stp_id`),
  UNIQUE KEY `stp_id` (`stp_id`),
  KEY `stp_sta_uid` (`stp_sta_uid`,`stp_spa_uid`),
  KEY `stp_spa_uid` (`stp_spa_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=46816 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_tables` (
  `sta_uid` int(16) NOT NULL AUTO_INCREMENT,
  `sta_keypart` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sta_displayprice` tinyint(1) NOT NULL DEFAULT '0',
  `sta_displaysize` tinyint(1) NOT NULL DEFAULT '1',
  `sta_displaytitle` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sta_displayprice_pretext` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sta_displayprice_price` double(8,2) NOT NULL DEFAULT '0.00',
  `sta_displayprice_price_dvt_uid` int(8) DEFAULT NULL,
  `sta_cert` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sta_uid`),
  KEY `sta_keypart` (`sta_keypart`)
) ENGINE=InnoDB AUTO_INCREMENT=24792 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_depot_override` (
  `sdo_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sdo_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sdo_ssi_uid` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `sdo_status` int(16) NOT NULL DEFAULT '0',
  `sdo_req_qty` int(16) NOT NULL DEFAULT '0',
  `sdo_req_rpl` int(16) DEFAULT NULL,
  `sdo_req_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sdo_req_who` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sdo_req_why` text COLLATE latin1_general_ci NOT NULL,
  `sdo_auth_qty` int(16) DEFAULT NULL,
  `sdo_auth_rpl` int(16) DEFAULT NULL,
  `sdo_auth_ts` datetime DEFAULT NULL,
  `sdo_auth_who` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `sdo_auth_why` text COLLATE latin1_general_ci,
  PRIMARY KEY (`sdo_ruid`),
  KEY `sdo_spa_uid` (`sdo_spa_uid`),
  KEY `sdo_ssi_uid` (`sdo_ssi_uid`),
  KEY `sdo_status` (`sdo_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_location_capacity` (
  `slc_sld_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `slc_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `slc_qty` int(16) DEFAULT NULL,
  `slc_replen_here` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`slc_sld_uid`,`slc_spa_uid`),
  KEY `slc_replen_here` (`slc_replen_here`),
  KEY `slc_spa_uid` (`slc_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_location_capacity_types` (
  `slt_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `slt_sst_uid` int(16) NOT NULL DEFAULT '0',
  `slt_capacity` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slt_spa_uid`,`slt_sst_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_location_depot_prefs` (
  `sldp_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `sldp_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `sldp_priority` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Lower number = more priority',
  PRIMARY KEY (`sldp_spa_uid`,`sldp_ssi_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='List of parts and depots where parts like to be put to';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_location_desc` (
  `sld_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sld_pickable` tinyint(1) NOT NULL DEFAULT '1',
  `sld_closed` tinyint(1) NOT NULL DEFAULT '0',
  `sld_movable` tinyint(1) NOT NULL DEFAULT '0',
  `sld_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `sld_depot` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sld_area` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `sld_zone` int(1) unsigned zerofill DEFAULT NULL,
  `sld_bay` int(2) unsigned zerofill DEFAULT NULL,
  `sld_level` int(1) unsigned zerofill DEFAULT NULL,
  `sld_position` int(1) unsigned zerofill DEFAULT NULL,
  `sld_seq` int(16) DEFAULT NULL,
  `sld_type` int(16) NOT NULL DEFAULT '0',
  `sld_type_multiplier` int(16) NOT NULL DEFAULT '1',
  `sld_containlocations` tinyint(1) NOT NULL DEFAULT '0',
  `sld_replen` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sld_desc` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`sld_uid`),
  KEY `sld_depot` (`sld_depot`),
  KEY `sld_area` (`sld_area`),
  KEY `sld_closed` (`sld_closed`),
  KEY `sld_desc` (`sld_desc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_locations` (
  `slo_place` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `slo_item` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`slo_place`,`slo_item`),
  KEY `slo_item` (`slo_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_move_reqs` (
  `smr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `smr_sst_uid` int(16) NOT NULL DEFAULT '0',
  `smr_location_move` tinyint(1) NOT NULL DEFAULT '0',
  `smr_ignorestocklevels` tinyint(1) NOT NULL DEFAULT '0',
  `smr_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `smr_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `smr_sld_uid_from` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `smr_qty` int(16) NOT NULL DEFAULT '0',
  `smr_qty_actual` int(16) NOT NULL DEFAULT '0',
  `smr_sld_uid_to` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `smr_closed` tinyint(1) NOT NULL DEFAULT '0',
  `smr_note` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`smr_uid`),
  KEY `smr_closed` (`smr_closed`),
  KEY `smr_sst_uid` (`smr_sst_uid`),
  KEY `smr_note` (`smr_note`),
  KEY `smr_sld_uid_from` (`smr_sld_uid_from`),
  KEY `smr_location_move` (`smr_location_move`),
  KEY `smr_spa_uid` (`smr_spa_uid`),
  KEY `smr_sld_uid_to` (`smr_sld_uid_to`),
  KEY `smr_ts` (`smr_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_part_notes` (
  `spn_uid` int(16) NOT NULL AUTO_INCREMENT,
  `spn_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spn_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spn_val` text COLLATE latin1_general_ci NOT NULL,
  `spn_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spn_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`spn_uid`),
  KEY `spn_spa_uid` (`spn_spa_uid`,`spn_sst_uid`),
  KEY `val_prefix` (`spn_val`(16))
) ENGINE=InnoDB AUTO_INCREMENT=1003783726 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_part_notes_validation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `part_id` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `territory_code` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `wrong_value` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attribute_name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `part_notes_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_part_updates` (
  `spu_spa_uid` char(11) NOT NULL,
  `spu_ts` datetime DEFAULT NULL,
  `spu_type` enum('insert','update','delete') DEFAULT 'update',
  `spu_indexed` tinyint(1) NOT NULL DEFAULT '0',
  `spu_synced` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spu_spa_uid`),
  KEY `spu_ts` (`spu_ts`),
  KEY `spu_synced` (`spu_synced`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_parts` (
  `spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spa_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spa_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spa_ssd_uid` int(16) NOT NULL DEFAULT '0',
  `spa_code` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spa_name` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_name_type` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_name_qty` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_desc` text COLLATE latin1_general_ci,
  `spa_img` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_manufacturer_sst_uid` int(16) DEFAULT NULL,
  `spa_manufacturer_id` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_warranty_years` int(16) DEFAULT NULL,
  `spa_weight` int(16) DEFAULT NULL,
  `spa_quoteoldprice_spe_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_estimatedsales` double(8,2) NOT NULL DEFAULT '0.00',
  `spa_initialpurchaseqty` int(8) NOT NULL DEFAULT '0',
  `spa_type_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_status_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_buyingstatus_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_ts_rundownby` datetime DEFAULT NULL,
  `spa_stock_shop_replen_delay` tinyint(4) NOT NULL DEFAULT '0',
  `spa_stock_replen_multiple` int(16) DEFAULT NULL,
  `spa_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `spa_cert` tinyint(1) NOT NULL DEFAULT '0',
  `spa_careful` tinyint(1) NOT NULL DEFAULT '0',
  `spa_nudge` int(8) NOT NULL DEFAULT '0',
  `spa_latest_cat` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_latest_page` int(1) DEFAULT NULL,
  `spa_endoflife_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_individual` tinyint(1) NOT NULL DEFAULT '0',
  `spa_channel` tinyint(4) unsigned DEFAULT '0',
  PRIMARY KEY (`spa_uid`),
  KEY `spa_code` (`spa_code`),
  KEY `spa_name` (`spa_name`),
  KEY `spa_name_type` (`spa_name_type`),
  KEY `spa_type_sst_uid` (`spa_type_sst_uid`),
  KEY `spa_status_sst_uid` (`spa_status_sst_uid`),
  KEY `spa_buyingstatus_sst_uid` (`spa_buyingstatus_sst_uid`),
  KEY `spa_nudge` (`spa_nudge`),
  KEY `spa_manufacturer_sst_uid` (`spa_manufacturer_sst_uid`),
  KEY `spa_manufacturer_id` (`spa_manufacturer_id`),
  KEY `spa_ssd_uid` (`spa_ssd_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_price_types` (
  `spt_uid` int(8) NOT NULL AUTO_INCREMENT,
  `spt_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`spt_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Types of prices for stock (TS price, RRP, etc...)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_prices` (
  `spe_uid` char(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spe_spa_uid` char(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spe_spt_uid` int(8) NOT NULL DEFAULT '1',
  `spe_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spe_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spe_dvt_uid` int(8) NOT NULL DEFAULT '0',
  `spe_price` double(8,2) NOT NULL DEFAULT '0.00',
  `spe_qty` double(8,2) NOT NULL DEFAULT '0.00',
  `spe_cert` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spe_uid`),
  KEY `spe_spa_uid` (`spe_spa_uid`),
  KEY `spe_spt_uid` (`spe_spt_uid`),
  KEY `spe_start` (`spe_start`),
  KEY `spe_end` (`spe_end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_config_distribution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `distribution_depot` char(2) COLLATE latin1_general_ci NOT NULL,
  `target_depot` char(2) COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `distribution_target_depot` (`distribution_depot`,`target_depot`),
  KEY `distribution_depot` (`distribution_depot`)
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_config_overrides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `spa_code` varchar(5) COLLATE latin1_general_ci NOT NULL,
  `site_id` char(2) COLLATE latin1_general_ci NOT NULL,
  `exclude_ind` tinyint(1) DEFAULT '0',
  `max_shop_qty` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `spa_code_site_id` (`spa_code`,`site_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29668 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_from` (
  `srf_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL COMMENT 'Part',
  `srf_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL COMMENT 'Depot for',
  `srf_site_from` varchar(32) COLLATE latin1_general_ci NOT NULL COMMENT 'Replen from',
  `srf_qty_max` int(16) DEFAULT NULL COMMENT 'Max qty allowed in any one replenishment line',
  PRIMARY KEY (`srf_spa_uid`,`srf_ssi_uid`,`srf_site_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Where stock should be sourced from for individual shops/depo';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_list_items` (
  `sri_auid` int(16) NOT NULL AUTO_INCREMENT,
  `sri_srl_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sri_srn_ruid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sri_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sri_sld_uid_from` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sri_sld_uid_to` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sri_qty` int(16) NOT NULL DEFAULT '0',
  `sri_qty_moved` int(16) DEFAULT NULL,
  PRIMARY KEY (`sri_auid`),
  KEY `sri_srl_ruid` (`sri_srl_ruid`),
  KEY `sri_srn_ruid` (`sri_srn_ruid`),
  KEY `sri_spa_uid` (`sri_spa_uid`),
  KEY `sri_sld_uid_from` (`sri_sld_uid_from`),
  KEY `sri_sld_uid_to` (`sri_sld_uid_to`)
) ENGINE=InnoDB AUTO_INCREMENT=125307100 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_lists` (
  `srl_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srl_status` int(16) NOT NULL DEFAULT '0',
  `srl_depot_from` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srl_depot_to` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srl_created_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `srl_created_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srl_sld_uid_interim` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `srl_updated_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`srl_ruid`),
  UNIQUE KEY `srl_ruid` (`srl_ruid`),
  KEY `srl_status` (`srl_status`),
  KEY `srl_depot_from` (`srl_depot_from`),
  KEY `srl_depot_to` (`srl_depot_to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_needs` (
  `srn_id` int(11) NOT NULL AUTO_INCREMENT,
  `srn_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srn_depot_for` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srn_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srn_days_remaining` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `srn_qty_ideal` int(16) NOT NULL DEFAULT '0',
  `srn_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`srn_id`),
  UNIQUE KEY `srn_ruid` (`srn_ruid`),
  UNIQUE KEY `srn_id` (`srn_id`),
  KEY `srn_depot_for` (`srn_depot_for`),
  KEY `srn_spa_uid` (`srn_spa_uid`),
  KEY `srn_days_remaining` (`srn_days_remaining`),
  KEY `srn_qty_ideal` (`srn_qty_ideal`)
) ENGINE=InnoDB AUTO_INCREMENT=614947520 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_needs_orig` (
  `srn_id` int(11) NOT NULL AUTO_INCREMENT,
  `srn_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srn_depot_for` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srn_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `srn_days_remaining` decimal(8,4) NOT NULL DEFAULT '0.0000',
  `srn_qty_ideal` int(16) NOT NULL DEFAULT '0',
  `srn_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`srn_id`),
  UNIQUE KEY `srn_ruid` (`srn_ruid`),
  UNIQUE KEY `srn_id` (`srn_id`),
  KEY `srn_depot_for` (`srn_depot_for`),
  KEY `srn_spa_uid` (`srn_spa_uid`),
  KEY `srn_days_remaining` (`srn_days_remaining`),
  KEY `srn_qty_ideal` (`srn_qty_ideal`)
) ENGINE=InnoDB AUTO_INCREMENT=468623570 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_units` (
  `sun_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sun_sld_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sun_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sun_qty` int(16) NOT NULL DEFAULT '0',
  `sun_sst_uid` int(16) NOT NULL DEFAULT '0',
  `sun_transaction_id` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  KEY `sun_sld_uid` (`sun_sld_uid`),
  KEY `sun_ts` (`sun_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci
/*!50500 PARTITION BY RANGE  COLUMNS(sun_ts)
(PARTITION p_su_2001 VALUES LESS THAN ('2002-01-01') ENGINE = InnoDB,
 PARTITION p_su_2002 VALUES LESS THAN ('2003-01-01') ENGINE = InnoDB,
 PARTITION p_su_2003 VALUES LESS THAN ('2004-01-01') ENGINE = InnoDB,
 PARTITION p_su_2004 VALUES LESS THAN ('2005-01-01') ENGINE = InnoDB,
 PARTITION p_su_2005 VALUES LESS THAN ('2006-01-01') ENGINE = InnoDB,
 PARTITION p_su_2006 VALUES LESS THAN ('2007-01-01') ENGINE = InnoDB,
 PARTITION p_su_2007 VALUES LESS THAN ('2008-01-01') ENGINE = InnoDB,
 PARTITION p_su_2008 VALUES LESS THAN ('2009-01-01') ENGINE = InnoDB,
 PARTITION p_su_2009 VALUES LESS THAN ('2010-01-01') ENGINE = InnoDB,
 PARTITION p_su_2010 VALUES LESS THAN ('2011-01-01') ENGINE = InnoDB,
 PARTITION p_su_2011 VALUES LESS THAN ('2012-01-01') ENGINE = InnoDB,
 PARTITION p_su_2012 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p_su_2013 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB,
 PARTITION p_su_2014 VALUES LESS THAN ('2015-01-01') ENGINE = InnoDB,
 PARTITION p_su_2015 VALUES LESS THAN ('2016-01-01') ENGINE = InnoDB,
 PARTITION p_su_2016 VALUES LESS THAN ('2017-01-01') ENGINE = InnoDB,
 PARTITION p_su_2017 VALUES LESS THAN ('2018-01-01') ENGINE = InnoDB,
 PARTITION p_su_2018 VALUES LESS THAN ('2019-01-01') ENGINE = InnoDB,
 PARTITION p_su_2019 VALUES LESS THAN ('2020-01-01') ENGINE = InnoDB,
 PARTITION p_su_2020 VALUES LESS THAN ('2021-01-01') ENGINE = InnoDB,
 PARTITION p_su_2021 VALUES LESS THAN ('2022-01-01') ENGINE = InnoDB,
 PARTITION p_su_2022 VALUES LESS THAN ('2023-01-01') ENGINE = InnoDB,
 PARTITION p_su_2023 VALUES LESS THAN ('2024-01-01') ENGINE = InnoDB,
 PARTITION p_su_2024 VALUES LESS THAN ('2025-01-01') ENGINE = InnoDB,
 PARTITION p_su_catch_all VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_units_tally` (
  `sut_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sut_sld_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sut_qty` int(16) NOT NULL DEFAULT '0',
  `sut_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sut_spa_uid`,`sut_sld_uid`),
  KEY `sut_spa_uid` (`sut_spa_uid`),
  KEY `sut_sld_uid` (`sut_sld_uid`),
  KEY `sut_qty` (`sut_qty`),
  KEY `sut_ts` (`sut_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Stock units tally';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_units_tally_updates` (
  `stu_spa_uid` char(11) COLLATE latin1_general_ci NOT NULL,
  `stu_sld_uid` char(11) COLLATE latin1_general_ci NOT NULL,
  `stu_ts` datetime DEFAULT NULL,
  `stu_type` enum('insert','update','delete') COLLATE latin1_general_ci DEFAULT 'update',
  `stu_synced` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stu_spa_uid`,`stu_sld_uid`),
  KEY `stu_synced` (`stu_synced`),
  KEY `stu_ts` (`stu_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_order_adjustments` (
  `soa_uid` int(11) NOT NULL AUTO_INCREMENT,
  `soa_sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `soa_type` int(11) NOT NULL DEFAULT '1',
  `soa_value` decimal(10,3) NOT NULL DEFAULT '0.000',
  `soa_notes` text COLLATE latin1_general_ci,
  `soa_ts` datetime DEFAULT NULL,
  `soa_who` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`soa_uid`),
  KEY `soa_type` (`soa_type`) USING BTREE,
  KEY `soa_sor_uid` (`soa_sor_uid`) USING BTREE,
  KEY `soa_value` (`soa_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28780 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_order_adjustments_orig` (
  `soa_uid` int(11) NOT NULL AUTO_INCREMENT,
  `soa_sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `soa_type` int(11) NOT NULL DEFAULT '1',
  `soa_value` decimal(10,3) NOT NULL DEFAULT '0.000',
  `soa_notes` text COLLATE latin1_general_ci,
  `soa_ts` datetime DEFAULT NULL,
  `soa_who` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`soa_uid`),
  KEY `soa_type` (`soa_type`) USING BTREE,
  KEY `soa_sor_uid` (`soa_sor_uid`) USING BTREE,
  KEY `soa_value` (`soa_value`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27526 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_order_items` (
  `soi_sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_qty` int(8) NOT NULL DEFAULT '0',
  `soi_packqty` int(16) NOT NULL DEFAULT '0',
  `soi_packcost` decimal(10,3) NOT NULL DEFAULT '0.000',
  `soi_packcost_native` decimal(10,3) NOT NULL DEFAULT '0.000',
  `soi_packcost_native_iso4217` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_receivedqty` int(16) NOT NULL DEFAULT '0',
  `soi_receivedqty_tally` int(16) DEFAULT NULL,
  `soi_acceptedin` tinyint(1) NOT NULL DEFAULT '0',
  `soi_receivednotes` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`soi_sor_uid`,`soi_spr_uid`,`soi_spa_uid`),
  KEY `soi_qty` (`soi_qty`),
  KEY `soi_acceptedin` (`soi_acceptedin`),
  KEY `soi_receivedqty` (`soi_receivedqty`),
  KEY `soi_spa_uid` (`soi_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_order_items_orig` (
  `soi_sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_qty` int(8) NOT NULL DEFAULT '0',
  `soi_packqty` int(16) NOT NULL DEFAULT '0',
  `soi_packcost` decimal(10,3) NOT NULL DEFAULT '0.000',
  `soi_packcost_native` decimal(10,3) NOT NULL DEFAULT '0.000',
  `soi_packcost_native_iso4217` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `soi_receivedqty` int(16) NOT NULL DEFAULT '0',
  `soi_receivedqty_tally` int(16) DEFAULT NULL,
  `soi_acceptedin` tinyint(1) NOT NULL DEFAULT '0',
  `soi_receivednotes` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`soi_sor_uid`,`soi_spr_uid`,`soi_spa_uid`),
  KEY `soi_qty` (`soi_qty`),
  KEY `soi_acceptedin` (`soi_acceptedin`),
  KEY `soi_receivedqty` (`soi_receivedqty`),
  KEY `soi_spa_uid` (`soi_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_order_notes` (
  `son_uid` int(16) NOT NULL AUTO_INCREMENT,
  `son_sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `son_sst_uid` int(16) NOT NULL DEFAULT '0',
  `son_val` text COLLATE latin1_general_ci NOT NULL,
  `son_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `son_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`son_uid`),
  KEY `son_spa_uid` (`son_sor_uid`,`son_sst_uid`),
  KEY `val_prefix` (`son_val`(16))
) ENGINE=InnoDB AUTO_INCREMENT=812 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_orders` (
  `sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_spp_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_ts_placed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sor_ts_expected` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sor_ts_delivered` datetime DEFAULT NULL,
  `sor_ts_completed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sor_address_supplier` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_address_destination` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_destination_id` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_initiatedby_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_completedby_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_completed` tinyint(1) NOT NULL DEFAULT '0',
  `sor_closed` tinyint(1) NOT NULL DEFAULT '0',
  `sor_authorisedforpayment` datetime DEFAULT NULL,
  `sor_sup_inv_no` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `sor_sup_inv_date` datetime DEFAULT NULL,
  `sor_sup_inv_net` decimal(8,2) DEFAULT NULL,
  `sor_notes` text COLLATE latin1_general_ci,
  PRIMARY KEY (`sor_uid`),
  KEY `sor_ts_expected` (`sor_ts_expected`),
  KEY `sor_completed` (`sor_completed`),
  KEY `sor_destination_id` (`sor_destination_id`),
  KEY `sor_ts_completed` (`sor_ts_completed`),
  KEY `sor_spp_uid` (`sor_spp_uid`),
  KEY `sor_closed` (`sor_closed`),
  KEY `sor_ts_placed` (`sor_ts_placed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_orders_orig` (
  `sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_spp_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_ts_placed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sor_ts_expected` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sor_ts_delivered` datetime DEFAULT NULL,
  `sor_ts_completed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sor_address_supplier` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_address_destination` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_destination_id` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_initiatedby_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_completedby_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sor_completed` tinyint(1) NOT NULL DEFAULT '0',
  `sor_closed` tinyint(1) NOT NULL DEFAULT '0',
  `sor_authorisedforpayment` datetime DEFAULT NULL,
  `sor_sup_inv_no` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `sor_sup_inv_date` datetime DEFAULT NULL,
  `sor_sup_inv_net` decimal(8,2) DEFAULT NULL,
  `sor_notes` text COLLATE latin1_general_ci,
  PRIMARY KEY (`sor_uid`),
  KEY `sor_ts_expected` (`sor_ts_expected`),
  KEY `sor_completed` (`sor_completed`),
  KEY `sor_destination_id` (`sor_destination_id`),
  KEY `sor_ts_completed` (`sor_ts_completed`),
  KEY `sor_spp_uid` (`sor_spp_uid`),
  KEY `sor_closed` (`sor_closed`),
  KEY `sor_ts_placed` (`sor_ts_placed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_part_barcodes` (
  `spb_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spb_barcode` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`spb_barcode`),
  UNIQUE KEY `spb_barcode` (`spb_barcode`),
  KEY `spb_spr_uid` (`spb_spr_uid`,`spb_barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Supplier barcodes and supplier parts...';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_part_status` (
  `sps_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `sps_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sps_usage` decimal(8,3) NOT NULL DEFAULT '0.000',
  `sps_actual` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_minimum` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_trigger` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_target` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_status` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sps_status_in_mindays` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sps_needed` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_5wk_sales` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sps_spr_uid`),
  UNIQUE KEY `sps_spr_uid` (`sps_spr_uid`),
  KEY `sps_spa_uid` (`sps_spa_uid`),
  KEY `sps_status` (`sps_status`),
  KEY `sps_status_in_mindays` (`sps_status_in_mindays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_part_status_orig` (
  `sps_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `sps_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sps_usage` decimal(8,3) NOT NULL DEFAULT '0.000',
  `sps_actual` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_minimum` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_trigger` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_target` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_status` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sps_status_in_mindays` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sps_needed` decimal(8,0) NOT NULL DEFAULT '0',
  `sps_5wk_sales` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sps_spr_uid`),
  UNIQUE KEY `sps_spr_uid` (`sps_spr_uid`),
  KEY `sps_spa_uid` (`sps_spa_uid`),
  KEY `sps_status` (`sps_status`),
  KEY `sps_status_in_mindays` (`sps_status_in_mindays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_part_status_override` (
  `spo_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spo_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spo_qty` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spo_ssi_uid`,`spo_spa_uid`),
  UNIQUE KEY `spo_ssi_uid` (`spo_ssi_uid`,`spo_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_parts` (
  `spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spr_spp_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spr_ssd_uid` int(16) NOT NULL DEFAULT '0',
  `spr_ean` varchar(13) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_no` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_intrastat` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_supplier_qty_display_factor` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT 'Multiply the ordered qty as displayed on the supplier purchase order - purely presentational - no effect on any real numbers',
  `spr_name` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_name_type` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_name_qty` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_packqty` int(16) NOT NULL DEFAULT '0',
  `spr_cost4pack` decimal(8,3) NOT NULL DEFAULT '0.000',
  `spr_cost4pack_native` decimal(8,3) DEFAULT NULL,
  `spr_cost4pack_native_iso4217` char(3) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_quoteref` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_leadtime` int(8) DEFAULT NULL,
  `spr_reorderfreq` int(8) DEFAULT NULL,
  `spr_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`spr_uid`),
  KEY `spr_ssd_uid` (`spr_ssd_uid`),
  KEY `spr_spp_uid` (`spr_spp_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_parts_orig` (
  `spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spr_spp_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spr_ssd_uid` int(16) NOT NULL DEFAULT '0',
  `spr_ean` varchar(13) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_no` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_intrastat` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_supplier_qty_display_factor` decimal(8,2) NOT NULL DEFAULT '1.00' COMMENT 'Multiply the ordered qty as displayed on the supplier purchase order - purely presentational - no effect on any real numbers',
  `spr_name` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_name_type` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_name_qty` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_packqty` int(16) NOT NULL DEFAULT '0',
  `spr_cost4pack` decimal(8,3) NOT NULL DEFAULT '0.000',
  `spr_cost4pack_native` decimal(8,3) DEFAULT NULL,
  `spr_cost4pack_native_iso4217` char(3) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_quoteref` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spr_leadtime` int(8) DEFAULT NULL,
  `spr_reorderfreq` int(8) DEFAULT NULL,
  `spr_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`spr_uid`),
  KEY `spr_ssd_uid` (`spr_ssd_uid`),
  KEY `spr_spp_uid` (`spr_spp_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_parts_prices` (
  `sppr_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sppr_packqty` int(16) NOT NULL DEFAULT '0',
  `sppr_cost4pack` decimal(8,3) NOT NULL DEFAULT '0.000',
  `sppr_cost4pack_native` decimal(8,3) NOT NULL DEFAULT '0.000',
  `sppr_cost4pack_native_iso4217` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sppr_date_entered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sppr_date_scheduled` datetime DEFAULT NULL,
  `sppr_date_started` datetime DEFAULT NULL,
  `sppr_who_entered` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sppr_who_started` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`sppr_spr_uid`,`sppr_date_entered`),
  UNIQUE KEY `sppr_spr_uid` (`sppr_spr_uid`,`sppr_date_entered`),
  KEY `sppr_date_started` (`sppr_date_started`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_parts_prices_orig` (
  `sppr_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sppr_packqty` int(16) NOT NULL DEFAULT '0',
  `sppr_cost4pack` decimal(8,3) NOT NULL DEFAULT '0.000',
  `sppr_cost4pack_native` decimal(8,3) NOT NULL DEFAULT '0.000',
  `sppr_cost4pack_native_iso4217` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sppr_date_entered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sppr_date_scheduled` datetime DEFAULT NULL,
  `sppr_date_started` datetime DEFAULT NULL,
  `sppr_who_entered` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sppr_who_started` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`sppr_spr_uid`,`sppr_date_entered`),
  UNIQUE KEY `sppr_spr_uid` (`sppr_spr_uid`,`sppr_date_entered`),
  KEY `sppr_date_started` (`sppr_date_started`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_shortagenote_items` (
  `shi_id` int(11) NOT NULL AUTO_INCREMENT,
  `shi_sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `shi_spr_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `shi_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `shi_qty` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`shi_id`),
  UNIQUE KEY `shi_id` (`shi_id`),
  KEY `shi_sor_uid` (`shi_sor_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=38121 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_shortagenotes` (
  `shn_sor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `shn_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shn_ts_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`shn_sor_uid`),
  KEY `shn_ts_completed` (`shn_ts_completed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_supplier_notes` (
  `ssn_uid` int(16) NOT NULL AUTO_INCREMENT,
  `ssn_spp_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssn_sst_uid` int(16) NOT NULL DEFAULT '0',
  `ssn_val` text COLLATE latin1_general_ci NOT NULL,
  `ssn_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ssn_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ssn_uid`),
  KEY `ssn_spa_uid` (`ssn_spp_uid`,`ssn_sst_uid`),
  KEY `val_prefix` (`ssn_val`(16))
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sup_suppliers` (
  `spp_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spp_name` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_contact` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_tel` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_tel_tech` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_fax` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_email` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_www` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_ordertype` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spp_mcp` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_mcptype` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spp_leadtime` int(8) DEFAULT NULL,
  `spp_reorderfreq` int(8) DEFAULT NULL,
  `spp_reorderday` tinyint(1) DEFAULT NULL,
  `spp_paymentterms` int(8) DEFAULT NULL,
  `spp_account` tinyint(1) NOT NULL DEFAULT '0',
  `spp_accountnumber` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `spp_creditlimit` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_settlementdiscount_days` int(8) NOT NULL DEFAULT '0',
  `spp_settlementdiscount_per` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_nra` tinyint(1) NOT NULL DEFAULT '0',
  `spp_nra_per` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_rebate_min` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_rebate_max` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_rebate_per` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_adcont_per` double(8,2) NOT NULL DEFAULT '0.00',
  `spp_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`spp_uid`),
  UNIQUE KEY `spp_uid` (`spp_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `sus_uid` varchar(32) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_groups_revs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_groups_shops` (
  `group_rev_id` int(11) NOT NULL DEFAULT '0',
  `ssi_uid` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`group_rev_id`,`ssi_uid`),
  KEY `group_id` (`group_rev_id`),
  KEY `ssi_uid` (`ssi_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_a` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=843913 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Supplier Order';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_anc` (
  `inc` int(7) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=8164585 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - ANC consignment number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_anc_batch` (
  `inc` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - ANC batch number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_b` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=64200 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Supplier Part';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_c` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=12422562 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Customer';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_d` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=15768161 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Address';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_dhl` (
  `inc` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=40018 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=0 COMMENT='ID - DHL consignment number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_dhl_batch` (
  `inc` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=0 COMMENT='ID - DHL batch number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_dpd` (
  `inc` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=0 COMMENT='ID - DPD consignment number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_e` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=1302 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Supplier';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_l` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=2836586 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Location';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_m` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=99381440 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Supplier Order';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_n` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=28645441 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Stock Move';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_o` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=99757245 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Customer Order';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_p` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=46622 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Part';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_parcelforce` (
  `inc` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=998521 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Parcelforce consignment number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_parcelforce_batch` (
  `inc` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=8983 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Parcelforce batch number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_parceline` (
  `inc` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=376036 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=0 COMMENT='ID - Parceline consignment number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_parceline_batch` (
  `inc` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Parceline batch number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_q` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=44411654 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Order';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_r` (
  `inc` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=2118677 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Price';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_inc_tuffnells` (
  `inc` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`inc`)
) ENGINE=InnoDB AUTO_INCREMENT=4039 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='ID - Tuffnells consignment number';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_site_details` (
  `ssde_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssde_pickzone` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `ssde_return` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `ssde_goodsin` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `ssde_goodsout` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `ssde_intransport` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `ssde_virtual` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `ssde_eposol_key` varchar(32) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'EPOS-Offline access key',
  PRIMARY KEY (`ssde_ssi_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sites` (
  `ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssi_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssi_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssi_sst_uid` int(16) DEFAULT NULL,
  `ssi_ts_opened` datetime DEFAULT NULL,
  `ssi_group` int(16) NOT NULL DEFAULT '0' COMMENT 'Site group/region',
  `ssi_profile` int(1) DEFAULT '0',
  PRIMARY KEY (`ssi_uid`),
  KEY `ssi_sst_uid` (`ssi_sst_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_status` (
  `sst_id` int(11) NOT NULL AUTO_INCREMENT,
  `sst_uid` int(16) NOT NULL DEFAULT '0',
  `sst_type` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sst_desc` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sst_settings` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`sst_id`),
  UNIQUE KEY `sst_id` (`sst_id`),
  KEY `sst_uid` (`sst_uid`),
  KEY `sst_type` (`sst_type`)
) ENGINE=InnoDB AUTO_INCREMENT=1596 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='System / Item Status''';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_epos` (
  `sye_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `sye_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL COMMENT 'Default site ID',
  `sye_ts_start` datetime NOT NULL,
  `sye_ts_end` datetime NOT NULL,
  `sye_commidea_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Commidea PDQ Active (1) or not (0)',
  `sye_commidea_account` varchar(16) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Commidea PDQ account',
  `sye_commidea_device` varchar(16) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Commidea PDQ IP',
  `sye_who` varchar(64) COLLATE latin1_general_ci NOT NULL COMMENT 'Who last updated this record',
  PRIMARY KEY (`sye_ucu_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='EPOS account details (unique acc. attrs ie PDQ assoc. etc)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_levels` (
  `sul_uid` int(8) unsigned NOT NULL DEFAULT '0',
  `sul_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sul_sst_uid` int(16) DEFAULT NULL,
  `sul_data` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`sul_uid`),
  KEY `sul_name` (`sul_name`),
  KEY `sul_sst_uid` (`sul_sst_uid`),
  KEY `sul_data` (`sul_data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_privs` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_sus_uid` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sup_sul_uid` int(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sup_id`),
  UNIQUE KEY `sup_id` (`sup_id`),
  KEY `sup_sus_uid` (`sup_sus_uid`),
  KEY `sup_sul_uid` (`sup_sul_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=154820 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_users` (
  `sus_uid` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_pw` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_pin` int(4) unsigned zerofill DEFAULT '0000',
  `sus_access` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT 'r',
  `sus_firstname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_lastname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_email` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_tel` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_tel_office` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_fax` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `sus_base_site` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_created_when` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sus_created_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_updated_when` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sus_updated_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_ended_when` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sus_sa` tinyint(1) NOT NULL DEFAULT '0',
  `sus_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sus_ssi_uid_lock` tinyint(1) NOT NULL DEFAULT '1',
  `sus_cert_need` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sus_uid`),
  KEY `sus_pin` (`sus_pin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_vars` (
  `sva_key` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sva_value` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`sva_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_results` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `depot` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `employee_number` int(7) unsigned zerofill NOT NULL,
  `score` double(5,2) unsigned NOT NULL DEFAULT '0.00',
  `module` char(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `completed_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `completed_on` (`completed_on`)
) ENGINE=InnoDB AUTO_INCREMENT=976 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_fa` (
  `ucf_id` int(11) NOT NULL AUTO_INCREMENT,
  `ucf_user_id` varchar(45) COLLATE latin1_general_ci NOT NULL,
  `ucf_type` int(11) NOT NULL,
  `ucf_options` longtext COLLATE latin1_general_ci,
  `ucf_primary` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ucf_id`),
  KEY `user` (`ucf_user_id`),
  KEY `user_type` (`ucf_user_id`,`ucf_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_issues` (
  `uci_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uci_sst_uid` int(16) NOT NULL DEFAULT '0',
  `uci_ts_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uci_ts_completed` datetime DEFAULT NULL,
  `uci_who_created` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uci_who_completed` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `uci_ucu_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `uci_uor_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `uci_comment_created` text COLLATE latin1_general_ci NOT NULL,
  `uci_comment_completed` text COLLATE latin1_general_ci,
  `uci_last_acknowledged` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uci_spa_code` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `uci_category_sst_uid` smallint(16) unsigned DEFAULT NULL,
  `uci_action_sst_uid` smallint(16) unsigned DEFAULT NULL,
  `uci_additional_notes` text COLLATE latin1_general_ci NOT NULL,
  `uci_claim_logged` tinyint(8) NOT NULL DEFAULT '0',
  `uci_ticket_duration` bigint(64) unsigned DEFAULT NULL,
  `uci_owner` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `uci_extra_sst_uid` smallint(16) unsigned DEFAULT NULL,
  PRIMARY KEY (`uci_ruid`),
  KEY `uci_sst_uid` (`uci_sst_uid`),
  KEY `uci_ucu_uid` (`uci_ucu_uid`),
  KEY `uci_uor_uid` (`uci_uor_uid`),
  KEY `uci_ticket_duration` (`uci_ticket_duration`),
  KEY `uci_ts_completed` (`uci_ts_completed`,`uci_sst_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_merges` (
  `ucm_ucu_uid_master` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucm_ucu_uid_child` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucm_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ucm_sus_uid` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucm_uor_uids` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ucm_ucu_uid_master`,`ucm_ucu_uid_child`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_merges_working` (
  `ucmw_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucmw_done` tinyint(1) NOT NULL DEFAULT '0',
  `ucmw_zip` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucmw_lastname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucmw_addr1` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ucmw_ucu_uid`),
  KEY `ucmw_done` (`ucmw_done`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_notes` (
  `ucn_uid` int(16) NOT NULL AUTO_INCREMENT,
  `ucn_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucn_sst_uid` int(16) NOT NULL DEFAULT '0',
  `ucn_val` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `ucn_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ucn_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ucn_uid`),
  KEY `ucn_ucu_uid` (`ucn_ucu_uid`,`ucn_sst_uid`),
  KEY `ucn_val` (`ucn_val`),
  KEY `attribute_value` (`ucn_val`(11),`ucn_sst_uid`) COMMENT 'Lookup customer by note value & optional note type.'
) ENGINE=InnoDB AUTO_INCREMENT=43181920 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_stats` (
  `ucs_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucs_worldposition_current_id` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucs_worldposition_current_val` int(4) NOT NULL DEFAULT '0',
  `ucs_worldposition_previous_id` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucs_worldposition_previous_val` int(4) NOT NULL DEFAULT '0',
  `ucs_orders_count` double(8,2) NOT NULL DEFAULT '0.00',
  `ucs_orders_sum` double(8,2) NOT NULL DEFAULT '0.00',
  `ucs_stm_uid` int(16) DEFAULT NULL,
  `ucs_stt_uid` int(16) DEFAULT NULL,
  `ucs_sts_id` int(16) DEFAULT NULL,
  PRIMARY KEY (`ucs_ucu_uid`),
  KEY `ucs_worldposition_current_id` (`ucs_worldposition_current_id`),
  KEY `ucs_worldposition_current_val` (`ucs_worldposition_current_val`),
  KEY `ucs_worldposition_previous_id` (`ucs_worldposition_previous_id`),
  KEY `ucs_worldposition_previous_val` (`ucs_worldposition_previous_val`),
  KEY `ucs_stm_uid` (`ucs_stm_uid`),
  KEY `ucs_stt_uid` (`ucs_stt_uid`),
  KEY `ucs_sts_id` (`ucs_sts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Customer statistics';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_updates` (
  `ucup_ucu_uid` char(11) COLLATE latin1_general_ci NOT NULL,
  `ucup_ts` datetime DEFAULT NULL,
  `ucup_type` enum('insert','update','delete') COLLATE latin1_general_ci DEFAULT 'update',
  PRIMARY KEY (`ucup_ucu_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customers` (
  `ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_username` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_password` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_cookie` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_title` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_firstname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_lastname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_tel` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_mob` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_fax` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_email` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_company` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_jobtitle` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_created_when` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ucu_created_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_updated_when` datetime DEFAULT NULL,
  `ucu_updated_who` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_dma_sst_uid` int(16) DEFAULT NULL,
  `ucu_dma_ref` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_allow_mailing` int(1) NOT NULL DEFAULT '1',
  `ucu_allow_orderquery` varchar(8) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_allow_orderprocess` varchar(8) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_allow_offers` varchar(8) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_epos` tinyint(1) NOT NULL DEFAULT '0',
  `ucu_active` tinyint(1) NOT NULL DEFAULT '1',
  `ucu_company_num` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ucu_uid`),
  UNIQUE KEY `ucu_username` (`ucu_username`),
  UNIQUE KEY `ucu_cookie` (`ucu_cookie`),
  KEY `ucu_firstname` (`ucu_firstname`),
  KEY `ucu_lastname` (`ucu_lastname`),
  KEY `ucu_active` (`ucu_active`),
  KEY `ucu_dma_sst_uid` (`ucu_dma_sst_uid`),
  KEY `ucu_dma_ref` (`ucu_dma_ref`),
  KEY `ucu_epos` (`ucu_epos`),
  KEY `ucu_created_when` (`ucu_created_when`),
  KEY `ucu_email` (`ucu_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order_deliveries` (
  `uod_id` int(11) NOT NULL AUTO_INCREMENT,
  `uod_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uod_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uod_courier_type` int(16) NOT NULL DEFAULT '0',
  `uod_courier_sub_prefix` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `uod_courier_id` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uod_courier_boxes` tinyint(2) NOT NULL DEFAULT '0',
  `uod_courier_processed` datetime DEFAULT NULL,
  PRIMARY KEY (`uod_id`),
  UNIQUE KEY `uod_uor_uid` (`uod_uor_uid`,`uod_ssi_uid`),
  UNIQUE KEY `uod_id` (`uod_id`),
  KEY `uod_courier_type` (`uod_courier_type`),
  KEY `uod_courier_processed` (`uod_courier_processed`)
) ENGINE=InnoDB AUTO_INCREMENT=5381752 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order_item_notes` (
  `uin_uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uin_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `uin_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `uin_uoi_qty` int(11) NOT NULL,
  `uin_sst_uid` int(11) NOT NULL DEFAULT '0',
  `uin_val` text COLLATE latin1_general_ci,
  `uin_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uin_who` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`uin_uid`),
  KEY `uin_uoi_uid` (`uin_uor_uid`,`uin_spa_uid`,`uin_uoi_qty`,`uin_sst_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6018978 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order_items` (
  `uoi_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uoi_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uoi_spa_code` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uoi_spa_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uoi_spe_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uoi_spe_price` double(8,2) NOT NULL DEFAULT '0.00',
  `uoi_vat_rate` int(8) NOT NULL DEFAULT '0',
  `uoi_qty` int(16) NOT NULL DEFAULT '0',
  KEY `uoi_uor_uid` (`uoi_uor_uid`),
  KEY `uoi_spa_uid` (`uoi_spa_uid`),
  KEY `uoi_spa_code` (`uoi_spa_code`),
  KEY `uoi_qty` (`uoi_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order_links` (
  `uol_uor_uids_linked` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uol_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uol_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uol_who` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uol_uor_uids_linked`),
  UNIQUE KEY `uol_ruid` (`uol_ruid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Customer order associations';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order_notes` (
  `uon_uid` int(16) NOT NULL AUTO_INCREMENT,
  `uon_uor_uid` varchar(11) DEFAULT NULL,
  `uon_sst_uid` int(16) NOT NULL DEFAULT '0',
  `uon_val` text,
  `uon_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uon_who` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`uon_uid`),
  KEY `uon_uor_uid` (`uon_uor_uid`,`uon_sst_uid`),
  KEY `val_prefix` (`uon_val`(16)),
  KEY `site_lookup` (`uon_sst_uid`,`uon_val`(2)) COMMENT 'Lookup order by note type & optional site id'
) ENGINE=InnoDB AUTO_INCREMENT=26003613 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order_payments_streamline` (
  `uos_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uos_merchtxnref` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uos_ts_started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uos_ts_ended` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uos_amount` double(8,2) DEFAULT NULL,
  `uos_successful` tinyint(4) DEFAULT NULL,
  `uos_qsiresponsecode` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `uos_transactionno` varchar(19) COLLATE latin1_general_ci DEFAULT NULL,
  `uos_sus_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uos_notes` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`uos_merchtxnref`),
  UNIQUE KEY `uos_merchtxnref` (`uos_merchtxnref`),
  KEY `uos_uor_uid` (`uos_uor_uid`),
  KEY `uos_transactionno` (`uos_transactionno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_order_pickinglists` (
  `uop_id` int(11) NOT NULL AUTO_INCREMENT,
  `uop_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_sld_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `uop_qty` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uop_id`),
  UNIQUE KEY `uop_id` (`uop_id`),
  KEY `uop_uor_uid` (`uop_uor_uid`),
  KEY `uop_ssi_uid` (`uop_ssi_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=26874591 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_orders` (
  `uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_status` int(16) NOT NULL DEFAULT '0',
  `uor_status_previous` int(16) NOT NULL DEFAULT '0',
  `uor_status_holdreason` int(16) DEFAULT NULL,
  `uor_ordertype` int(16) NOT NULL DEFAULT '0',
  `uor_ordertype_special` int(16) NOT NULL DEFAULT '0',
  `uor_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uor_ts_completeby` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uor_ts_completed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uor_total` double(8,2) NOT NULL DEFAULT '0.00',
  `uor_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_sus_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_contact_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_payment_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_delivery_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_tel` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_payment_type` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_card_name` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `uor_card_no` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `uor_card_start` date DEFAULT NULL,
  `uor_card_end` date DEFAULT NULL,
  `uor_card_issue` tinyint(2) DEFAULT NULL,
  `uor_card_security_number` varchar(4) COLLATE latin1_general_ci DEFAULT NULL,
  `uor_special_requests` text COLLATE latin1_general_ci,
  `uor_ucs_worldposition_current_id` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uor_ucs_worldposition_current_val` int(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `uor_uid` (`uor_uid`),
  KEY `uor_sus_uid` (`uor_sus_uid`),
  KEY `uor_ordertype` (`uor_ordertype`),
  KEY `uor_ssi_uid` (`uor_ssi_uid`),
  KEY `uor_ts_completed` (`uor_ts_completed`),
  KEY `uor_ucs_worldposition_current_id` (`uor_ucs_worldposition_current_id`,`uor_ucs_worldposition_current_val`),
  KEY `uor_ts` (`uor_ts`),
  KEY `uor_ucu_uid` (`uor_ucu_uid`),
  KEY `uor_tel` (`uor_tel`),
  KEY `uor_card_no` (`uor_card_no`),
  KEY `uor_status` (`uor_status`),
  KEY `uor_ts_completeby` (`uor_ts_completeby`),
  KEY `uor_total` (`uor_total`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Orders';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_parent_order_items` (
  `upi_uoi_id` int(11) NOT NULL AUTO_INCREMENT,
  `upi_uop_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `upi_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `upi_spa_code` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `upi_spa_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `upi_spe_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `upi_spe_price` double(8,2) NOT NULL DEFAULT '0.00',
  `upi_vat_rate` int(8) NOT NULL DEFAULT '0',
  `upi_qty` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`upi_uoi_id`),
  KEY `upi_uop_uid` (`upi_uop_uid`),
  KEY `upi_spa_uid` (`upi_spa_uid`),
  KEY `upi_spa_code` (`upi_spa_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4072106 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_parent_orders` (
  `uop_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_status` int(16) NOT NULL DEFAULT '0',
  `uop_status_previous` int(16) NOT NULL DEFAULT '0',
  `uop_status_holdreason` int(16) DEFAULT NULL,
  `uop_ordertype` int(16) NOT NULL DEFAULT '0',
  `uop_ordertype_special` int(16) NOT NULL DEFAULT '0',
  `uop_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uop_ts_completeby` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uop_ts_completed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uop_total` double(8,2) NOT NULL DEFAULT '0.00',
  `uop_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_sus_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_contact_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_payment_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_delivery_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_collection_dad_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `uop_tel` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_payment_type` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_special_requests` text COLLATE latin1_general_ci,
  `uop_ucs_worldposition_current_id` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uop_ucs_worldposition_current_val` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uop_uid`),
  UNIQUE KEY `uop_uid` (`uop_uid`),
  KEY `uop_ts_completed` (`uop_ts_completed`),
  KEY `uop_ts` (`uop_ts`),
  KEY `uop_ucu_uid` (`uop_ucu_uid`),
  KEY `uop_ts_completeby` (`uop_ts_completeby`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_related_orders` (
  `uro_uor_id` int(11) NOT NULL AUTO_INCREMENT,
  `uro_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `uro_uop_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `channel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uro_uor_id`),
  UNIQUE KEY `uor_orders` (`uro_uor_uid`,`uro_uop_uid`),
  KEY `uro_uor_uid` (`uro_uor_uid`),
  KEY `uro_uop_uid` (`uro_uop_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1176028 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_requests` (
  `ucr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ucr_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucr_dad_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucr_sst_uid` int(16) NOT NULL DEFAULT '0',
  `ucr_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ucr_completed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ucr_id`),
  UNIQUE KEY `ucr_id` (`ucr_id`),
  KEY `ucr_ucu_uid` (`ucr_ucu_uid`,`ucr_dad_uid`),
  KEY `ucr_ts` (`ucr_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=982108 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Catalogue requests';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_pricemorph` (
  `wpm_ip` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wpm_percentage` double(8,2) NOT NULL DEFAULT '0.00',
  `wpm_desc` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`wpm_ip`),
  UNIQUE KEY `wpm_ip` (`wpm_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_assets` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `adr_uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `adr_syt_type` bigint(20) NOT NULL DEFAULT '0',
  `adr_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `adr_line1` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `adr_line2` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `adr_town` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `adr_county` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `adr_postcode` varchar(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `adr_country` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `adr_phone` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `adr_fax` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `adr_email` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `adr_web` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `adr_notes` text COLLATE latin1_general_ci,
  PRIMARY KEY (`adr_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `ast_uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `ast_number` varchar(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ast_makeID` bigint(20) NOT NULL DEFAULT '0',
  `ast_modelID` bigint(20) NOT NULL DEFAULT '0',
  `ast_typeID` bigint(20) NOT NULL DEFAULT '0',
  `ast_vendorID` bigint(20) NOT NULL DEFAULT '0',
  `ast_locationID` bigint(20) NOT NULL DEFAULT '0',
  `ast_serial` varchar(40) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ast_aquired` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ast_po` varchar(24) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ast_notes` text COLLATE latin1_general_ci NOT NULL,
  `ast_scrapped` date DEFAULT NULL,
  PRIMARY KEY (`ast_uid`),
  KEY `ast_number` (`ast_number`),
  KEY `ast_serial` (`ast_serial`),
  KEY `ast_aquired` (`ast_aquired`),
  KEY `ast_po` (`ast_po`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_link_types` (
  `slt_uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `slt_syt_uid` bigint(20) NOT NULL DEFAULT '0',
  `slt_link_syt_uid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slt_uid`),
  KEY `slt_sys_uid` (`slt_syt_uid`,`slt_link_syt_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_types` (
  `syt_uid` int(11) NOT NULL AUTO_INCREMENT,
  `syt_type` int(11) NOT NULL DEFAULT '0',
  `syt_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `syt_notes` text COLLATE latin1_general_ci,
  PRIMARY KEY (`syt_uid`),
  KEY `stype_Type_2` (`syt_type`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_audit` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `toolstation_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_notices` (
  `ant_uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ant_created` datetime DEFAULT NULL,
  `ant_expires` datetime NOT NULL,
  `ant_note` text,
  `ant_type` varchar(16) NOT NULL,
  `ant_who` varchar(32) DEFAULT NULL,
  `ant_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`ant_uid`),
  KEY `ant_expires` (`ant_expires`) USING BTREE,
  KEY `idx_type` (`ant_type`) USING HASH,
  KEY `idx_deleted` (`ant_deleted`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1442 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `user_id` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `event` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text COLLATE latin1_general_ci,
  `new_values` text COLLATE latin1_general_ci,
  `url` text COLLATE latin1_general_ci,
  `ip_address` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bundle_audit_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `bundle_audit_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=411254 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courier_audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courier_id` int(16) DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Audit trail for courier table updates';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_user_admin_audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text,
  `new_values` text,
  `url` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `epos_user_admin_audit_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `epos_user_admin_audit_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=26090 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_links` (
  `link_uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_prefix` text COLLATE latin1_general_ci NOT NULL,
  `link_url` text COLLATE latin1_general_ci NOT NULL,
  `link_text` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`link_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_signup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailAddress` text NOT NULL,
  `ip` text,
  `when` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109508 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_terminal` (
  `serial` varchar(64) NOT NULL,
  `location` varchar(64) NOT NULL,
  `lastInspectedDate` datetime NOT NULL,
  `lastInspectedUser` varchar(64) DEFAULT '',
  `make` int(11) NOT NULL,
  `model` int(11) NOT NULL,
  `connection` int(11) NOT NULL,
  `firmwareVersion` int(11) NOT NULL,
  `applicationVersion` int(11) NOT NULL,
  `sealIntegrity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `mac` varchar(64) DEFAULT NULL,
  `ptid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`serial`),
  UNIQUE KEY `ptid_unique` (`ptid`),
  UNIQUE KEY `mac_unique` (`mac`),
  KEY `applicationVersion_key` (`serial`),
  KEY `connection_key` (`connection`),
  KEY `make_key` (`make`),
  KEY `lastInspectedUser_key` (`lastInspectedUser`),
  KEY `lastInspectedDate` (`lastInspectedDate`),
  KEY `location_key` (`location`),
  KEY `model_key` (`model`),
  KEY `firmwareVersion_key` (`firmwareVersion`),
  KEY `sealIntegrity_key` (`serial`),
  KEY `mac_key` (`mac`),
  KEY `ptid_key` (`ptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_terminal_log` (
  `ptl_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(64) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(64) NOT NULL DEFAULT '',
  `value` varchar(64) DEFAULT '',
  `from` text,
  `to` text,
  `detailsCorrect` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`ptl_id`),
  UNIQUE KEY `ptl_id` (`ptl_id`),
  KEY `serial_key` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=44823 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_score_data` (
  `rsk_uor_uid` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `rsk_ts` datetime DEFAULT NULL,
  `rsk_data` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`rsk_uor_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_replen_config_audit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text,
  `new_values` text,
  `url` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_replen_config_audit_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `stock_replen_config_audit_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=29698 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_users_audit_trail` (
  `susa_uid` int(11) NOT NULL AUTO_INCREMENT,
  `susa_sus_uid` varchar(32) NOT NULL,
  `susa_ts` datetime NOT NULL,
  `susa_old_data` text,
  `susa_new_data` text,
  `susa_who` varchar(32) NOT NULL,
  `susa_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`susa_uid`),
  KEY `idx_sus_uid_ts` (`susa_sus_uid`,`susa_ts`) USING BTREE,
  KEY `idx_ip` (`susa_ip`) USING BTREE,
  FULLTEXT KEY `idx_data` (`susa_new_data`)
) ENGINE=InnoDB AUTO_INCREMENT=1797 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customer_audit_trail` (
  `ucua_uid` int(11) NOT NULL AUTO_INCREMENT,
  `ucua_ucu_uid` varchar(11) NOT NULL,
  `ucua_ts` datetime NOT NULL,
  `ucua_data` text,
  `ucua_who` varchar(32) NOT NULL,
  `ucua_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ucua_uid`),
  KEY `idx_sus_uid_ts` (`ucua_ucu_uid`,`ucua_ts`) USING BTREE,
  KEY `idx_ip` (`ucua_ip`) USING BTREE,
  FULLTEXT KEY `idx_data` (`ucua_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_customers_updates` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `ucu_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ucu_action` enum('insert','update','delete') DEFAULT NULL,
  `ucu_uid` varchar(11) NOT NULL DEFAULT '',
  `ucu_username` varchar(64) DEFAULT NULL,
  `ucu_password` varchar(100) DEFAULT NULL,
  `ucu_cookie` varchar(64) DEFAULT NULL,
  `ucu_title` varchar(32) NOT NULL DEFAULT '',
  `ucu_firstname` varchar(32) NOT NULL DEFAULT '',
  `ucu_lastname` varchar(32) NOT NULL DEFAULT '',
  `ucu_tel` varchar(32) NOT NULL DEFAULT '',
  `ucu_mob` varchar(32) NOT NULL DEFAULT '',
  `ucu_fax` varchar(32) NOT NULL DEFAULT '',
  `ucu_email` varchar(254) DEFAULT NULL,
  `ucu_company` varchar(32) DEFAULT NULL,
  `ucu_jobtitle` varchar(32) DEFAULT NULL,
  `ucu_created_when` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ucu_created_who` varchar(32) NOT NULL DEFAULT '',
  `ucu_updated_when` datetime DEFAULT NULL,
  `ucu_updated_who` varchar(32) DEFAULT NULL,
  `ucu_dma_sst_uid` int(16) DEFAULT NULL,
  `ucu_dma_ref` varchar(64) DEFAULT NULL,
  `ucu_allow_mailing` int(1) NOT NULL DEFAULT '1',
  `ucu_allow_orderquery` varchar(8) DEFAULT NULL,
  `ucu_allow_orderprocess` varchar(8) DEFAULT NULL,
  `ucu_allow_offers` varchar(8) DEFAULT NULL,
  `ucu_epos` tinyint(1) NOT NULL DEFAULT '0',
  `ucu_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  KEY `ucu_uid` (`ucu_uid`),
  KEY `ucu_action` (`ucu_action`),
  KEY `ucu_firstname` (`ucu_firstname`),
  KEY `ucu_lastname` (`ucu_lastname`),
  KEY `ucu_active` (`ucu_active`),
  KEY `ucu_dma_sst_uid` (`ucu_dma_sst_uid`),
  KEY `ucu_dma_ref` (`ucu_dma_ref`),
  KEY `ucu_epos` (`ucu_epos`),
  KEY `ucu_created_when` (`ucu_created_when`),
  KEY `ucu_email` (`ucu_email`)
) ENGINE=InnoDB AUTO_INCREMENT=36863045 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_cat` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_errors` (
  `cer_id` int(11) NOT NULL AUTO_INCREMENT,
  `cer_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cer_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cer_type` int(16) NOT NULL DEFAULT '0',
  `cer_page_number` int(16) DEFAULT NULL,
  `cer_sta_uid` int(16) DEFAULT NULL,
  `cer_notes` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`cer_id`),
  UNIQUE KEY `cer_id` (`cer_id`),
  KEY `cer_catalogue_number` (`cer_catalogue_number`),
  KEY `cer_type` (`cer_type`),
  KEY `cer_page_number` (`cer_page_number`),
  KEY `cer_sta_uid` (`cer_sta_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=48600 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_page_backups` (
  `cpb_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cpb_page_number` int(16) NOT NULL DEFAULT '0',
  `cpb_who` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cpb_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cpb_note` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `cpb_data` text COLLATE latin1_general_ci,
  KEY `cpb_catalogue_number` (`cpb_catalogue_number`),
  KEY `cpb_page_number` (`cpb_page_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_page_items` (
  `cpi_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cpi_page_number` int(16) NOT NULL DEFAULT '0',
  `cpi_sta_uid` int(16) NOT NULL DEFAULT '0',
  `cpi_w` decimal(8,3) DEFAULT NULL,
  `cpi_h` decimal(8,3) DEFAULT NULL,
  `cpi_x` decimal(8,3) DEFAULT NULL,
  `cpi_y` decimal(8,3) DEFAULT NULL,
  PRIMARY KEY (`cpi_catalogue_number`,`cpi_page_number`,`cpi_sta_uid`),
  KEY `cpi_catalogue_number` (`cpi_catalogue_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Catalogue page item properties';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_page_items_orig` (
  `cpi_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cpi_page_number` int(16) NOT NULL DEFAULT '0',
  `cpi_sta_uid` int(16) NOT NULL DEFAULT '0',
  `cpi_w` decimal(8,3) DEFAULT NULL,
  `cpi_h` decimal(8,3) DEFAULT NULL,
  `cpi_x` decimal(8,3) DEFAULT NULL,
  `cpi_y` decimal(8,3) DEFAULT NULL,
  PRIMARY KEY (`cpi_catalogue_number`,`cpi_page_number`,`cpi_sta_uid`),
  KEY `cpi_catalogue_number` (`cpi_catalogue_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Catalogue page item properties';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_pages` (
  `cap_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cap_page_number` int(16) NOT NULL DEFAULT '0',
  `cap_default_page_settings` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cap_default_table_settings` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cap_department` int(16) NOT NULL DEFAULT '0',
  `cap_title` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`cap_catalogue_number`,`cap_page_number`),
  KEY `cap_catalogue_number` (`cap_catalogue_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_catalogue` (
  `csca_CAT_NAME` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_CAT_ID` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_CAT_ID_PRICE` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_CUR` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `csca_CUR_POST` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_CUR_SEP` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_CUR_SHOW_EX` tinyint(1) NOT NULL DEFAULT '0',
  `csca_CUR_SHOW_EU` tinyint(1) NOT NULL DEFAULT '0',
  `csca_ABB_EACH` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_ABB_EACH_S` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_ABB_PACK` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_ABB_PACK_S` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_ABB_PIECE` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_ABB_PIECE_S` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_ABB_PIECES` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_ABB_PIECES_S` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_STR_INCTAX` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_STR_EXCTAX` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csca_extra_details` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`csca_CAT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_colour` (
  `csco_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csco_c` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csco_m` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csco_y` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csco_k` decimal(8,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`csco_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_colour_orig` (
  `csco_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csco_c` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csco_m` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csco_y` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csco_k` decimal(8,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`csco_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_colourstyle` (
  `csc_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csc_bg` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `csc_lines` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `csc_text` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`csc_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_constants` (
  `css_k` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `css_v` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`css_k`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_departmentdata` (
  `csd_sde_uid` int(16) NOT NULL DEFAULT '0',
  `csd_sde_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csd_c` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csd_m` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csd_y` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csd_k` decimal(8,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`csd_sde_uid`),
  UNIQUE KEY `csd_ssd_name` (`csd_sde_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_page` (
  `csp_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csp_PAGE_HEIGHT_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_WIDTH_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_BLEED_HEIGHT_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_BLEED_WIDTH_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_SCALE_FACTOR` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_COLS` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_ROWS` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_COL_MARGIN_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_ROW_MARGIN_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_BACKGROUND_COLOUR` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csp_PAGE_ASSETS_DIR` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`csp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_page_orig` (
  `csp_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csp_PAGE_HEIGHT_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_WIDTH_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_BLEED_HEIGHT_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_BLEED_WIDTH_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_SCALE_FACTOR` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_COLS` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_ROWS` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_COL_MARGIN_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_ROW_MARGIN_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csp_PAGE_BACKGROUND_COLOUR` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csp_PAGE_ASSETS_DIR` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`csp_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_table` (
  `csta_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csta_TABLE_STYLE_DEFAULT` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '0.000',
  `csta_TABLE_HEIGHT_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csta_TABLE_WIDTH_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csta_TABLE_HEIGHT_DEFAULT_MULTIPLE` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csta_TABLE_WIDTH_DEFAULT_MULTIPLE` decimal(8,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`csta_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_table_orig` (
  `csta_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `csta_TABLE_STYLE_DEFAULT` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '0.000',
  `csta_TABLE_HEIGHT_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csta_TABLE_WIDTH_MM` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csta_TABLE_HEIGHT_DEFAULT_MULTIPLE` decimal(8,3) NOT NULL DEFAULT '0.000',
  `csta_TABLE_WIDTH_DEFAULT_MULTIPLE` decimal(8,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`csta_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_settings_tablestyle` (
  `cst_name` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cst_style` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cst_header` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cst_priceloz` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cst_pricetable` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cst_table` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cst_headerAlignment` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cst_mainbgcolour` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`cst_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_table_items` (
  `cti_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cti_sta_uid` int(16) NOT NULL DEFAULT '0',
  `cti_type` varchar(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cti_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cti_data` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cti_w` decimal(8,3) DEFAULT NULL,
  `cti_h` decimal(8,3) DEFAULT NULL,
  `cti_x` decimal(8,3) DEFAULT NULL,
  `cti_y` decimal(8,3) DEFAULT NULL,
  `cti_depth` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cti_catalogue_number`,`cti_sta_uid`,`cti_name`),
  KEY `cti_catalogue_number` (`cti_catalogue_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Catalogue table item properties';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_table_items_orig` (
  `cti_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cti_sta_uid` int(16) NOT NULL DEFAULT '0',
  `cti_type` varchar(8) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cti_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cti_data` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cti_w` decimal(8,3) DEFAULT NULL,
  `cti_h` decimal(8,3) DEFAULT NULL,
  `cti_x` decimal(8,3) DEFAULT NULL,
  `cti_y` decimal(8,3) DEFAULT NULL,
  `cti_depth` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cti_catalogue_number`,`cti_sta_uid`,`cti_name`),
  KEY `cti_catalogue_number` (`cti_catalogue_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Catalogue table item properties';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tables` (
  `cat_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cat_sta_uid` int(16) NOT NULL DEFAULT '0',
  `cat_w` decimal(8,3) DEFAULT NULL,
  `cat_h` decimal(8,3) DEFAULT NULL,
  `cat_style` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cat_cert` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_catalogue_number`,`cat_sta_uid`),
  KEY `cat_catalogue_number` (`cat_catalogue_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Catalogue table properties';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_tables_orig` (
  `cat_catalogue_number` int(16) NOT NULL DEFAULT '0',
  `cat_sta_uid` int(16) NOT NULL DEFAULT '0',
  `cat_w` decimal(8,3) DEFAULT NULL,
  `cat_h` decimal(8,3) DEFAULT NULL,
  `cat_style` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `cat_cert` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_catalogue_number`,`cat_sta_uid`),
  KEY `cat_catalogue_number` (`cat_catalogue_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Catalogue table properties';
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_code_master` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_code_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_master` (
  `com_code` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `com_iso3166_2` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `com_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`com_code`,`com_iso3166_2`),
  KEY `com_iso3166_2` (`com_iso3166_2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Master database of used product 5-digit codes';
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_content` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `toolstation_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_content_status` (
  `rid` bigint(20) NOT NULL,
  `nid` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `md5` varchar(32) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_core_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `module` varchar(16) NOT NULL,
  `origin` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(10) NOT NULL,
  `flag` varchar(32) NOT NULL,
  `from_template` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `english_name` varchar(128) NOT NULL,
  `major` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL,
  `default_locale` varchar(8) DEFAULT NULL,
  `tag` varchar(8) DEFAULT NULL,
  `encode_url` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `english_name` (`english_name`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_languages_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(7) NOT NULL,
  `display_language_code` varchar(7) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`,`display_language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4097 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_locale_map` (
  `code` varchar(7) NOT NULL,
  `locale` varchar(8) NOT NULL,
  PRIMARY KEY (`code`,`locale`),
  UNIQUE KEY `code` (`code`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `from_language` varchar(10) NOT NULL,
  `to_language` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md5` varchar(32) NOT NULL,
  `object_type` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid` (`rid`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_node` (
  `nid` bigint(20) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `links_fixed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_reminders` (
  `id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `url` text NOT NULL,
  `can_delete` tinyint(4) NOT NULL,
  `show` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) NOT NULL,
  `kind` tinyint(4) DEFAULT NULL,
  `position_in_page` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_id` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `string_translation_id` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md5` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_translation_id` (`string_translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) unsigned NOT NULL,
  `language` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `value` text,
  `translator_id` bigint(20) unsigned DEFAULT NULL,
  `translation_service` varchar(16) NOT NULL DEFAULT '',
  `batch_id` int(11) NOT NULL DEFAULT '0',
  `translation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_language` (`string_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_strings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(7) NOT NULL,
  `context` varchar(160) NOT NULL,
  `name` varchar(160) NOT NULL,
  `value` text NOT NULL,
  `string_package_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(40) NOT NULL DEFAULT 'LINE',
  `title` varchar(160) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `gettext_context` text NOT NULL,
  `domain_name_context_md5` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_domain_name_context_md5` (`domain_name_context_md5`) USING BTREE,
  KEY `language_context` (`language`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translate` (
  `tid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `field_type` varchar(160) NOT NULL,
  `field_format` varchar(16) NOT NULL,
  `field_translate` tinyint(4) NOT NULL,
  `field_data` longtext NOT NULL,
  `field_data_translated` longtext NOT NULL,
  `field_finished` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translate_job` (
  `job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `translator_id` int(10) unsigned NOT NULL,
  `translated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `rid` (`rid`,`translator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translation_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_name` text NOT NULL,
  `tp_id` int(11) DEFAULT NULL,
  `ts_url` text,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translation_status` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `translation_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `translator_id` bigint(20) NOT NULL,
  `needs_update` tinyint(4) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `translation_service` varchar(16) NOT NULL,
  `batch_id` int(11) NOT NULL DEFAULT '0',
  `translation_package` longtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `links_fixed` tinyint(4) NOT NULL DEFAULT '0',
  `_prevstate` longtext,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `translation_id` (`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translations` (
  `translation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `element_type` varchar(36) NOT NULL DEFAULT 'post_post',
  `element_id` bigint(20) DEFAULT NULL,
  `trid` bigint(20) NOT NULL,
  `language_code` varchar(7) NOT NULL,
  `source_language_code` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  UNIQUE KEY `trid_lang` (`trid`,`language_code`),
  UNIQUE KEY `el_type_id` (`element_type`,`element_id`),
  KEY `trid` (`trid`),
  KEY `id_type_language` (`element_id`,`element_type`,`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) DEFAULT NULL,
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6695 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=13276 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=5835 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_content_new` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `toolstation_content_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_content_status` (
  `rid` bigint(20) NOT NULL,
  `nid` bigint(20) NOT NULL,
  `timestamp` datetime NOT NULL,
  `md5` varchar(32) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_core_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `module` varchar(16) NOT NULL,
  `origin` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(10) NOT NULL,
  `flag` varchar(32) NOT NULL,
  `from_template` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `english_name` varchar(128) NOT NULL,
  `major` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL,
  `default_locale` varchar(8) DEFAULT NULL,
  `tag` varchar(8) DEFAULT NULL,
  `encode_url` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `english_name` (`english_name`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_languages_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(7) NOT NULL,
  `display_language_code` varchar(7) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_code` (`language_code`,`display_language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4097 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_locale_map` (
  `code` varchar(7) NOT NULL,
  `locale` varchar(8) NOT NULL,
  PRIMARY KEY (`code`,`locale`),
  UNIQUE KEY `code` (`code`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_message_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL,
  `from_language` varchar(10) NOT NULL,
  `to_language` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md5` varchar(32) NOT NULL,
  `object_type` varchar(64) NOT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rid` (`rid`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_node` (
  `nid` bigint(20) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `links_fixed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_reminders` (
  `id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `url` text NOT NULL,
  `can_delete` tinyint(4) NOT NULL,
  `show` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) NOT NULL,
  `kind` tinyint(4) DEFAULT NULL,
  `position_in_page` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_id` (`string_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) NOT NULL,
  `string_translation_id` bigint(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md5` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `string_translation_id` (`string_translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_string_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `string_id` bigint(20) unsigned NOT NULL,
  `language` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `value` text,
  `translator_id` bigint(20) unsigned DEFAULT NULL,
  `translation_service` varchar(16) NOT NULL DEFAULT '',
  `batch_id` int(11) NOT NULL DEFAULT '0',
  `translation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `string_language` (`string_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_strings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(7) NOT NULL,
  `context` varchar(160) NOT NULL,
  `name` varchar(160) NOT NULL,
  `value` text NOT NULL,
  `string_package_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(40) NOT NULL DEFAULT 'LINE',
  `title` varchar(160) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `gettext_context` text NOT NULL,
  `domain_name_context_md5` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_domain_name_context_md5` (`domain_name_context_md5`) USING BTREE,
  KEY `language_context` (`language`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translate` (
  `tid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `content_id` bigint(20) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `field_type` varchar(160) NOT NULL,
  `field_format` varchar(16) NOT NULL,
  `field_translate` tinyint(4) NOT NULL,
  `field_data` longtext NOT NULL,
  `field_data_translated` longtext NOT NULL,
  `field_finished` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translate_job` (
  `job_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) unsigned NOT NULL,
  `translator_id` int(10) unsigned NOT NULL,
  `translated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `rid` (`rid`,`translator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translation_batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_name` text NOT NULL,
  `tp_id` int(11) DEFAULT NULL,
  `ts_url` text,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translation_status` (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `translation_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `translator_id` bigint(20) NOT NULL,
  `needs_update` tinyint(4) NOT NULL,
  `md5` varchar(32) NOT NULL,
  `translation_service` varchar(16) NOT NULL,
  `batch_id` int(11) NOT NULL DEFAULT '0',
  `translation_package` longtext NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `links_fixed` tinyint(4) NOT NULL DEFAULT '0',
  `_prevstate` longtext,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `translation_id` (`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_icl_translations` (
  `translation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `element_type` varchar(36) NOT NULL DEFAULT 'post_post',
  `element_id` bigint(20) DEFAULT NULL,
  `trid` bigint(20) NOT NULL,
  `language_code` varchar(7) NOT NULL,
  `source_language_code` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  UNIQUE KEY `trid_lang` (`trid`,`language_code`),
  UNIQUE KEY `el_type_id` (`element_type`,`element_id`),
  KEY `trid` (`trid`),
  KEY `id_type_language` (`element_id`,`element_type`,`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) DEFAULT NULL,
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25605 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=615808 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=19776 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=897 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_dropship` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `toolstation_dropship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_setting` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`as_id`),
  UNIQUE KEY `account_setting_setting_id_account_id_unique` (`setting_id`,`account_id`),
  UNIQUE KEY `as_id` (`as_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `spp_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_status` enum('PORTAL','INTEGRATED','INACTIVE') COLLATE utf8_unicode_ci DEFAULT 'PORTAL',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_site_id_unique` (`site_id`),
  UNIQUE KEY `accounts_spp_uid_unique` (`spp_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_id` (`pr_id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `ru_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ru_id`),
  UNIQUE KEY `role_user_role_code_user_id_unique` (`role_code`,`user_id`),
  UNIQUE KEY `ru_id` (`ru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `policies` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `global_setting` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_id_unique` (`id`),
  UNIQUE KEY `settings_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `request` text COLLATE utf8_unicode_ci NOT NULL,
  `errors` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_account_id_index` (`account_id`),
  KEY `transactions_action_index` (`action`),
  KEY `transactions_order_uid_index` (`order_uid`),
  KEY `transactions_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191801 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `receives_notifications` tinyint(1) NOT NULL DEFAULT '1',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `g2fa_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_googleadwords` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_googleadwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abbreviations` (
  `pk_abbreviation_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_abbreviation_from` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `c_abbreviation_to` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`pk_abbreviation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorised_adwords` (
  `pk_adword_id` int(11) NOT NULL DEFAULT '0',
  `authorisation_status` tinyint(1) NOT NULL DEFAULT '0',
  `authorisation_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_adword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creatives` (
  `pk_creativeid` int(11) NOT NULL AUTO_INCREMENT,
  `c_creativetext` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`pk_creativeid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exclusions` (
  `exclusion_id` int(11) NOT NULL AUTO_INCREMENT,
  `exclusion_term` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `exclusion_active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`exclusion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exported_names` (
  `export_name_id` int(4) NOT NULL AUTO_INCREMENT,
  `export_name_campaign` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `export_name_adgroup` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`export_name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5145 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `pk_keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_adword_id` int(11) NOT NULL DEFAULT '0',
  `c_keywords` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `b_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `b_manuallyset` tinyint(1) NOT NULL DEFAULT '0',
  `b_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `c_randomUID` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_keyword_id`),
  KEY `i_adword_id` (`i_adword_id`),
  KEY `c_randomUID` (`c_randomUID`),
  KEY `c_keywords` (`c_keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=4216573 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `known_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `user_denied` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `order_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `keyword_uid` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `order_value` double(8,2) NOT NULL DEFAULT '0.00',
  `order_status` int(16) NOT NULL DEFAULT '0',
  `order_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ref_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_uid`),
  KEY `keyword_uid` (`keyword_uid`,`order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Simple view of orders with adwords as last ref';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_products` (
  `rp_spa_uid` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `rp_key_ranUID` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `rp_keyword` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `rp_productarray` longtext COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`rp_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_management` (
  `management_stat_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_adwords_authorised` int(11) NOT NULL DEFAULT '0',
  `num_adwords_nonauth` int(11) NOT NULL DEFAULT '0',
  `num_keywords_total` int(11) NOT NULL DEFAULT '0',
  `num_keywords_excellent` int(11) NOT NULL DEFAULT '0',
  `num_keywords_good` int(11) NOT NULL DEFAULT '0',
  `num_keywords_poor` int(11) NOT NULL DEFAULT '0',
  `num_keywords_bad` int(11) NOT NULL DEFAULT '0',
  `num_keywords_notrated` int(11) NOT NULL DEFAULT '0',
  `cost_keywords_total` int(11) NOT NULL DEFAULT '0',
  `cost_keywords_excellent` int(11) NOT NULL DEFAULT '0',
  `cost_keywords_good` int(11) NOT NULL DEFAULT '0',
  `cost_keywords_poor` int(11) NOT NULL DEFAULT '0',
  `cost_keywords_bad` int(11) NOT NULL DEFAULT '0',
  `cost_keywords_notrated` int(11) NOT NULL DEFAULT '0',
  `sales_keywords_total` int(11) NOT NULL DEFAULT '0',
  `sales_keywords_excellent` int(11) NOT NULL DEFAULT '0',
  `sales_keywords_good` int(11) NOT NULL DEFAULT '0',
  `sales_keywords_poor` int(11) NOT NULL DEFAULT '0',
  `sales_keywords_bad` int(11) NOT NULL DEFAULT '0',
  `sales_keywords_notrated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`management_stat_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_vars` (
  `sysvar_name` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sysvar_value` longtext COLLATE latin1_general_ci,
  PRIMARY KEY (`sysvar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_history` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` smallint(6) NOT NULL DEFAULT '0',
  `transaction_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_type` smallint(6) NOT NULL DEFAULT '0',
  `adword_id` int(11) DEFAULT NULL,
  `keyword_id` int(11) DEFAULT NULL,
  `other_id` int(11) DEFAULT NULL,
  `api_required` tinyint(1) NOT NULL DEFAULT '0',
  `api_sent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_id`),
  KEY `user_id` (`user_id`),
  KEY `adword_id` (`adword_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136078 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_types` (
  `pk_transaction_type` int(3) NOT NULL AUTO_INCREMENT,
  `api_required` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_type_desc` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_transaction_type`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trial_process_logs` (
  `pk_trial_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `tpl_adwordid` int(11) NOT NULL DEFAULT '0',
  `tpl_ontrial_ts` datetime DEFAULT NULL,
  `tpl_upload_ts` datetime DEFAULT NULL,
  `tpl_offtrial_ts` datetime DEFAULT NULL,
  `tpl_authorisedupload` int(1) NOT NULL DEFAULT '0',
  `tpl_awaitingupload` int(1) NOT NULL DEFAULT '0',
  `tpl_uploadsent` int(1) NOT NULL DEFAULT '0',
  `tpl_trialended` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_trial_log_id`),
  KEY `tpl_adwordid` (`tpl_adwordid`)
) ENGINE=InnoDB AUTO_INCREMENT=11645 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_history` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc_issue_history` (
  `cih_uid` int(24) unsigned NOT NULL AUTO_INCREMENT,
  `cih_sst_uid` smallint(16) unsigned NOT NULL DEFAULT '0',
  `cih_uci_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cih_who` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cih_when` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cih_notes` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`cih_uid`),
  KEY `cih_sst_uid` (`cih_sst_uid`),
  KEY `cih_uci_ruid` (`cih_uci_ruid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_mailings` (
  `cat` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `cat_note` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `company` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `addr1` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `addr2` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `addr3` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `addr4` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `addr5` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `addr6` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `town` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `county` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `zip` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_uid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `aui` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ref` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `ucu_uid` (`ucu_uid`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_stats_grouped` (
  `hcsg_ts` date NOT NULL DEFAULT '0000-00-00',
  `hcsg_id` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hcsg_val` int(16) NOT NULL DEFAULT '0',
  `hcsg_count` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hcsg_ts`,`hcsg_id`,`hcsg_val`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_stats_orig` (
  `hcs_uor_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hcs_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hcs_uor_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `hcs_uor_ordertype_special` int(16) NOT NULL DEFAULT '0',
  `hcs_uor_ucs_worldposition_current_id` char(1) COLLATE latin1_general_ci DEFAULT NULL,
  `hcs_uor_ucs_worldposition_current_val` int(4) DEFAULT NULL,
  `hcs_ts_order` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hcs_ts_order_previous` datetime DEFAULT NULL,
  `hcs_ts_customer_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hcs_contact_zip` varchar(9) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hcs_depot_used` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `hcs_nearest_depot` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `hcs_nearest_depot_km` decimal(8,2) DEFAULT NULL,
  `hcs_epos` tinyint(1) NOT NULL DEFAULT '0',
  `hcs_dma_sst_uid` tinyint(1) DEFAULT NULL,
  `hcs_dma_ref` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `hcs_wwe_uid` tinyint(1) DEFAULT NULL,
  `hcs_mailings` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`hcs_uor_uid`,`hcs_ucu_uid`),
  KEY `hcs_ts_order` (`hcs_ts_order`),
  KEY `hcs_contact_zip` (`hcs_contact_zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_tsc` (
  `tsclog_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsclog_ip` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `tsclog_user` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `tsclog_ts` datetime NOT NULL,
  `tsclog_ts_took` decimal(16,6) DEFAULT NULL,
  `tsclog_page` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `tsclog_sst_uid` int(16) DEFAULT NULL COMMENT 'sst_type=user_actions_log',
  `tsclog_extra_info` text COLLATE latin1_general_ci,
  PRIMARY KEY (`tsclog_id`),
  UNIQUE KEY `tsclog_id` (`tsclog_id`),
  KEY `tsclog_ts` (`tsclog_ts`),
  KEY `tsclog_sst_uid` (`tsclog_sst_uid`),
  KEY `tsclog_user` (`tsclog_user`,`tsclog_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=17743645 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Extranet user actions logging table';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_users_actions` (
  `lua_id` int(11) NOT NULL AUTO_INCREMENT,
  `lua_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lus_sus_uid` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `lus_sst_uid` int(16) NOT NULL DEFAULT '0',
  `lus_success` tinyint(1) NOT NULL DEFAULT '0',
  `lus_ip` varchar(15) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`lua_id`),
  UNIQUE KEY `lua_id` (`lua_id`),
  KEY `lua_ts` (`lua_ts`),
  KEY `lus_sus_uid` (`lus_sus_uid`),
  KEY `lus_sst_uid` (`lus_sst_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5085752 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_users_passwords` (
  `lup_id` int(11) NOT NULL AUTO_INCREMENT,
  `lup_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lup_sus_uid` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `lup_pw` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`lup_id`),
  UNIQUE KEY `lup_id` (`lup_id`),
  KEY `lup_sus_uid` (`lup_sus_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_referrals` (
  `order_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `order_status` int(11) NOT NULL DEFAULT '0',
  `order_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_total` double(8,2) NOT NULL DEFAULT '0.00',
  `order_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT 'GBP',
  `referral_id` int(11) DEFAULT NULL,
  `referral_spa` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `referral_extra` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `referral_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_previous_orders` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_uid`),
  KEY `referral_id` (`referral_id`,`referral_spa`,`referral_extra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopscreen_source_history` (
  `ssh_uid` int(24) unsigned NOT NULL AUTO_INCREMENT,
  `ssh_version_major` smallint(16) unsigned NOT NULL DEFAULT '0',
  `ssh_version_minor` smallint(16) unsigned NOT NULL DEFAULT '0',
  `ssh_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ssh_by_whom` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssh_notes` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ssh_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_check` (
  `sch_id` int(11) NOT NULL AUTO_INCREMENT,
  `sch_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sch_sld_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sch_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sch_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sch_qty_should` int(16) NOT NULL DEFAULT '0',
  `sch_qty_actual` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sch_id`),
  UNIQUE KEY `sch_id` (`sch_id`),
  KEY `sch_spa_uid` (`sch_spa_uid`),
  KEY `sch_sld_uid` (`sch_sld_uid`),
  KEY `sch_ts` (`sch_ts`)
) ENGINE=InnoDB AUTO_INCREMENT=16249006 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_history_orig` (
  `sth_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sth_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sth_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sth_qty_instock` int(1) NOT NULL DEFAULT '0',
  `sth_use_weighted` decimal(8,3) NOT NULL DEFAULT '0.000',
  `sth_qty_sold` int(1) NOT NULL DEFAULT '0',
  `sth_qty_returned` int(1) NOT NULL DEFAULT '0',
  `sth_qty_virtual` int(1) NOT NULL DEFAULT '0',
  `sth_status` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sth_status_in_mindays` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sth_status_special` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sth_qty_minimum` int(1) NOT NULL DEFAULT '0',
  `sth_qty_trigger` int(1) NOT NULL DEFAULT '0',
  `sth_qty_target` int(1) NOT NULL DEFAULT '0',
  `sth_qty_onorder` int(1) NOT NULL DEFAULT '0',
  `sth_qty_pending` int(1) NOT NULL DEFAULT '0',
  `sth_qty_ordersheldup` int(1) NOT NULL DEFAULT '0',
  `sth_qty_needed` int(1) NOT NULL DEFAULT '0',
  `sth_qty_soq` int(1) NOT NULL DEFAULT '0',
  `sth_missed_orders` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sth_spa_uid`,`sth_ssi_uid`,`sth_ts`),
  KEY `sth_ts` (`sth_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci MAX_ROWS=80000000;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_level_updates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `slu_ssi_uid` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `slu_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `slu_qty` int(11) NOT NULL,
  `slu_updated` datetime NOT NULL,
  `slu_processed` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slu_ssi_uid` (`slu_ssi_uid`),
  KEY `slu_spa_uid` (`slu_spa_uid`),
  KEY `idx_slu_processed` (`slu_processed`)
) ENGINE=InnoDB AUTO_INCREMENT=129924649 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_levels_changed` (
  `stk_lev_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `stk_lev_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `stk_lev_qty` int(11) NOT NULL,
  PRIMARY KEY (`stk_lev_ssi_uid`,`stk_lev_spa_uid`),
  KEY `stk_lev_spa_uid` (`stk_lev_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_picking_needs` (
  `spn_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spn_qty_needed` int(11) NOT NULL DEFAULT '0',
  `spn_orders` int(11) NOT NULL DEFAULT '0',
  `spn_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`spn_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Cached picking needs - parts needed to supply all pending or';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stats_sales` (
  `sss_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sss_uor_ts` date NOT NULL DEFAULT '0000-00-00',
  `sss_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sss_qty` int(16) NOT NULL DEFAULT '0',
  `sss_orders` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sss_ssi_uid`,`sss_uor_ts`,`sss_spa_uid`),
  KEY `sss_uor_ts` (`sss_uor_ts`,`sss_spa_uid`),
  KEY `xsss_spa` (`sss_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stats_soq2basics` (
  `ssb_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssb_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ssb_data` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`ssb_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stats_soq2cache` (
  `id` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stats_usage` (
  `ssu_id` int(11) NOT NULL AUTO_INCREMENT,
  `ssu_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `ssu_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssu_usage` decimal(8,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`ssu_id`),
  UNIQUE KEY `ssu_ssi_uid` (`ssu_ssi_uid`,`ssu_spa_uid`),
  UNIQUE KEY `ssu_id` (`ssu_id`),
  KEY `ssu_spa_uid` (`ssu_spa_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=195119677 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_stats_usage_orig` (
  `ssu_id` int(11) NOT NULL AUTO_INCREMENT,
  `ssu_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `ssu_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssu_usage` decimal(8,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`ssu_id`),
  UNIQUE KEY `ssu_ssi_uid` (`ssu_ssi_uid`,`ssu_spa_uid`),
  UNIQUE KEY `ssu_id` (`ssu_id`),
  KEY `ssu_spa_uid` (`ssu_spa_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1914107 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_laravel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `toolstation_laravel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundle_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `depot_id` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `depot_id_idx` (`depot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `part_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrier` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `unicarrier_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carrier_name_unique` (`name`),
  UNIQUE KEY `carrier_unicarrier_name_unique` (`unicarrier_name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrier_transaction_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `send_receive` varchar(7) NOT NULL,
  `carrier` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `transaction_data` blob NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236684 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  `who` varchar(64) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_request_asset_issues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_request_asset_id` int(10) unsigned NOT NULL,
  `resolved` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Authorisers can mark issues they''ve raised as resolved',
  `resolved_by` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The Extranet user resolved this issue',
  `reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The Extranet user who raised this issue.',
  `updated_by` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The last Extranet user to write to this record.',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_request_asset_issues_resolved_index` (`resolved`),
  KEY `data_request_asset_issues_deleted_at_index` (`deleted_at`),
  KEY `data_request_asset_issues_created_at_index` (`created_at`),
  KEY `data_request_asset_issues_updated_at_index` (`updated_at`),
  KEY `data_request_asset_issues_data_request_asset_id_foreign` (`data_request_asset_id`),
  CONSTRAINT `data_request_asset_issues_data_request_asset_id_foreign` FOREIGN KEY (`data_request_asset_id`) REFERENCES `data_request_assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_request_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_request_subject_id` int(10) unsigned NOT NULL,
  `asset_date` timestamp NULL DEFAULT NULL,
  `in_scope` tinyint(1) NOT NULL DEFAULT '1',
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `checked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The Extranet user who checked the redaction before submission',
  `checked_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The resource type; typically the table name/resource i.e. order, address, note etc',
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `redacted_value` text COLLATE utf8_unicode_ci,
  `created_by` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The Extranet user who associated this asset with the data request',
  `updated_by` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The last Extranet user to write to this record.',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_request_assets_asset_date_index` (`asset_date`),
  KEY `data_request_assets_in_scope_index` (`in_scope`),
  KEY `data_request_assets_checked_index` (`checked`),
  KEY `data_request_assets_type_index` (`type`),
  KEY `data_request_assets_deleted_at_index` (`deleted_at`),
  KEY `data_request_assets_created_at_index` (`created_at`),
  KEY `data_request_assets_updated_at_index` (`updated_at`),
  KEY `data_request_assets_data_request_subject_id_foreign` (`data_request_subject_id`),
  CONSTRAINT `data_request_assets_data_request_subject_id_foreign` FOREIGN KEY (`data_request_subject_id`) REFERENCES `data_request_subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=419202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_request_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_request_id` int(10) unsigned NOT NULL,
  `created_by` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_request_comments_data_request_id_foreign` (`data_request_id`),
  KEY `data_request_comments_deleted_at_index` (`deleted_at`),
  KEY `data_request_comments_created_at_index` (`created_at`),
  KEY `data_request_comments_updated_at_index` (`updated_at`),
  CONSTRAINT `data_request_comments_data_request_id_foreign` FOREIGN KEY (`data_request_id`) REFERENCES `data_requests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_request_communications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_request_id` int(10) unsigned NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email_access, email_deletion, audio, video',
  `sent_by` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Extranet user id of who sent the mail',
  `to` varchar(254) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The recipient of the email',
  `from` varchar(254) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The sender of the email',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mail subject',
  `body` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Body of the email',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_request_communications_type_index` (`type`),
  KEY `data_request_communications_deleted_at_index` (`deleted_at`),
  KEY `data_request_communications_created_at_index` (`created_at`),
  KEY `data_request_communications_updated_at_index` (`updated_at`),
  KEY `data_request_communications_data_request_id_foreign` (`data_request_id`),
  CONSTRAINT `data_request_communications_data_request_id_foreign` FOREIGN KEY (`data_request_id`) REFERENCES `data_requests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_request_subjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_request_id` int(10) unsigned NOT NULL,
  `customer_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `updated_by` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The last Extranet user to write to this record.',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_request_subjects_customer_id_index` (`customer_id`),
  KEY `data_request_subjects_deleted_at_index` (`deleted_at`),
  KEY `data_request_subjects_created_at_index` (`created_at`),
  KEY `data_request_subjects_updated_at_index` (`updated_at`),
  KEY `data_request_subjects_data_request_id_foreign` (`data_request_id`),
  CONSTRAINT `data_request_subjects_data_request_id_foreign` FOREIGN KEY (`data_request_id`) REFERENCES `data_requests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2220 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `issue_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT 'uci_ruid',
  `status` varchar(18) COLLATE utf8_unicode_ci NOT NULL COMMENT 'new, in_progress, on_hold, cancelled, awaiting_approval, approved, actioned',
  `type` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'access, deletion',
  `authority_request` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is this request for a local authority i.e. police.',
  `created_by` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The Extranet user who created this Data Request',
  `approved_by` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The Extranet user who approved this Data Request',
  `approved_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `start_date` datetime NOT NULL COMMENT 'The start date for the period of time this request covers',
  `end_date` datetime NOT NULL COMMENT 'The end date for the period of time this request covers',
  `due_date` datetime NOT NULL COMMENT 'The date this request needs to be completed by and actioned',
  `updated_by` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The last Extranet user to write to this record.',
  `recipient_id` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_name` varchar(96) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_email` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_telephone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_method` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email' COMMENT 'post, email',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `data_requests_issue_id_index` (`issue_id`),
  KEY `data_requests_status_index` (`status`),
  KEY `data_requests_type_index` (`type`),
  KEY `data_requests_authority_request_index` (`authority_request`),
  KEY `data_requests_deleted_at_index` (`deleted_at`),
  KEY `data_requests_created_at_index` (`created_at`),
  KEY `data_requests_updated_at_index` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1958 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enhancements` (
  `id` varchar(255) NOT NULL,
  `shipment_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`shipment_id`),
  KEY `enhancements_shipment_id_foreign` (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6845927 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_user_permissions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_user_permissions_pivot` (
  `epos_user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `permission` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`epos_user_id`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Not used.',
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Not used.',
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Not used.',
  `notes` text COLLATE utf8_unicode_ci,
  `google2fa_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_token` blob,
  `refresh_token` blob,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `change_password` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `login_attempts` int(11) NOT NULL DEFAULT '0',
  `last_login_at` timestamp NULL DEFAULT NULL,
  `password_set_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enable_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `epos_users_username_unique` (`username`),
  KEY `epos_users_username_index` (`username`),
  KEY `epos_users_extension_index` (`extension`),
  KEY `epos_users_enabled_index` (`enabled`),
  KEY `epos_users_login_attempts_index` (`login_attempts`),
  KEY `epos_users_last_login_at_index` (`last_login_at`),
  KEY `epos_users_expires_at_index` (`expires_at`),
  KEY `epos_users_password_set_at_index` (`password_set_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8666 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_users_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inactive_period` int(8) unsigned NOT NULL,
  `pwd_min_length` tinyint(4) unsigned NOT NULL,
  `pwd_max_failure` tinyint(4) unsigned NOT NULL,
  `pwd_lowercase` tinyint(4) unsigned NOT NULL,
  `pwd_uppercase` tinyint(4) unsigned NOT NULL,
  `pwd_digits` tinyint(4) unsigned NOT NULL,
  `pwd_nonalpha` tinyint(4) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_users_sites` (
  `epos_user_id` int(11) NOT NULL,
  `site_id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`epos_user_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2779 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs_epos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502930 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs_web` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4268 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manifest` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `batch` varchar(255) NOT NULL,
  `pdf` blob NOT NULL,
  `carrier_id` bigint(20) unsigned NOT NULL,
  `uploaded_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `manifest_carrier_id_foreign` (`carrier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcel` (
  `id` varchar(255) NOT NULL,
  `weight_value` varchar(255) NOT NULL,
  `weight_units` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `label` blob NOT NULL,
  `shipment_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `printed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parcel_shipment_id_foreign` (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_conditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promo_id` int(10) unsigned NOT NULL,
  `item_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_field` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_value` text COLLATE utf8_unicode_ci NOT NULL,
  `item_multi` tinyint(1) NOT NULL DEFAULT '0',
  `operator` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '==',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_conditions_promo_id_index` (`promo_id`),
  KEY `item_tf` (`item_type`,`item_field`)
) ENGINE=InnoDB AUTO_INCREMENT=5815 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_grants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promo_id` int(10) unsigned NOT NULL,
  `grant_type` enum('monetary','percentage','product','vat') COLLATE utf8_unicode_ci DEFAULT NULL,
  `grant_amount` decimal(5,2) DEFAULT NULL,
  `grant_item_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grant_qty` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotion_grants_promo_id_index` (`promo_id`),
  KEY `promotion_grants_grant_type_grant_item_id_index` (`grant_type`,`grant_item_id`),
  KEY `promotion_grants_grant_item_id_index` (`grant_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2085 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promo_id` int(10) unsigned NOT NULL,
  `customer_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `promotion_logs_promo_id_index` (`promo_id`),
  KEY `promotion_logs_customer_id_index` (`customer_id`),
  KEY `promotion_logs_order_id_index` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1211642 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `valid_from` datetime NOT NULL,
  `valid_to` datetime NOT NULL,
  `minimum_total` decimal(5,2) NOT NULL DEFAULT '0.00',
  `max_uses` int(11) DEFAULT NULL,
  `operator` enum('and','or') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'and',
  `combi` tinyint(1) NOT NULL,
  `one_each` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `promotions_campaign_id_foreign` (`campaign_id`),
  KEY `promotions_valid_from_index` (`valid_from`),
  KEY `promotions_valid_to_index` (`valid_to`)
) ENGINE=InnoDB AUTO_INCREMENT=1939 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `service_occurrence` varchar(255) DEFAULT NULL,
  `service_type` varchar(255) NOT NULL,
  `site_id` varchar(255) NOT NULL,
  `shipping_date` datetime NOT NULL,
  `service_format` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) NOT NULL,
  `address_id` varchar(255) NOT NULL,
  `department_reference` varchar(255) DEFAULT NULL,
  `customer_reference` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) NOT NULL,
  `carrier_id` bigint(20) unsigned NOT NULL,
  `manifest_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `shipment_carrier_id_foreign` (`carrier_id`),
  KEY `shipment_manifest_id_foreign` (`manifest_id`),
  KEY `shipment_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104836 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=333367 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traits_user` (
  `user_id` int(10) unsigned NOT NULL,
  `trait_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`trait_id`),
  KEY `role_user_role_id_foreign` (`trait_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `google2fa_secret` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3847 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_lingo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `toolstation_lingo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL,
  `who` varchar(64) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `territory_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departments_code_territory_code_index` (`code`,`territory_code`),
  KEY `departments_code_index` (`code`),
  KEY `departments_territory_code_index` (`territory_code`),
  KEY `departments_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14747 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_territory` (
  `language_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `territory_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`language_code`,`territory_code`),
  UNIQUE KEY `language_territory_language_code_territory_code_unique` (`language_code`,`territory_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_user` (
  `language_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`language_code`,`user_id`),
  UNIQUE KEY `language_user_language_code_user_id_unique` (`language_code`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primary_territory_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`,`name`),
  KEY `languages_code_index` (`code`),
  KEY `languages_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mappings` (
  `nl_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_territory_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `other_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nl_id`,`other_territory_code`),
  KEY `mappings_nl_id_other_territory_code_index` (`nl_id`,`other_territory_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` int(10) unsigned NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `policies` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `data_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'string',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_part_notes_validation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `part_id` varchar(255) NOT NULL,
  `territory_code` varchar(255) NOT NULL,
  `wrong_value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `part_notes_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_transaction` (
  `task_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'OPEN',
  `assignee_id` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `due_at` date DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `assignee_id` (`assignee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `territories` (
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `tld` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `base_language_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EU',
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_part_required` tinyint(1) NOT NULL DEFAULT '1',
  `default_department_uid` int(11) NOT NULL DEFAULT '1',
  `standard_vat_rate` int(11) NOT NULL DEFAULT '1',
  `system_id` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`code`),
  KEY `territories_code_index` (`code`),
  KEY `territories_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  `row` text COLLATE utf8_unicode_ci NOT NULL,
  `error` text COLLATE utf8_unicode_ci,
  `product` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `headers` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=509482 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `request` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `response` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `action` (`action`)
) ENGINE=InnoDB AUTO_INCREMENT=8255 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `territory_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `spa_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_language_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `to_language_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `google_hints` text COLLATE utf8_unicode_ci,
  `fields_before` text COLLATE utf8_unicode_ci,
  `fields_after` text COLLATE utf8_unicode_ci NOT NULL,
  `fields_translated` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `part` (`territory_code`,`spa_uid`),
  KEY `to_language_code` (`to_language_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `territory_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NL',
  `locale` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_misc` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cache_md5uid` varchar(32) COLLATE latin1_general_ci NOT NULL COMMENT 'MD5 UID (function and attributes)',
  `cache_ts` datetime NOT NULL COMMENT 'Timestamp created',
  `cache_hint` varchar(64) COLLATE latin1_general_ci NOT NULL,
  `cache_data` text COLLATE latin1_general_ci NOT NULL COMMENT 'Serialised / base64 / etc data',
  PRIMARY KEY (`cache_md5uid`),
  KEY `tcache_ts` (`cache_ts`),
  KEY `cache_hint` (`cache_hint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Cache of function outputs';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_import_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(200) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `added` datetime DEFAULT CURRENT_TIMESTAMP,
  `ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_title` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_firstname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_lastname` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_name` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_email` varchar(254) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_tel` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_mob` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_fax` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ucu_dma_sst_uid` int(16) DEFAULT NULL,
  `ucu_dma_ref` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_company` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_jobtitle` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_allow_mailing` int(1) NOT NULL DEFAULT '1',
  `ucu_allow_orderquery` varchar(8) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_allow_orderprocess` varchar(8) COLLATE latin1_general_ci DEFAULT NULL,
  `ucu_allow_offers` varchar(8) COLLATE latin1_general_ci DEFAULT NULL,
  `dad_1house` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `dad_2Aroad` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `dad_2Broad` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_3town` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_4county` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_5zip` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dad_6country` int(8) NOT NULL DEFAULT '0',
  `dupe` int(1) NOT NULL DEFAULT '0',
  `cat_request` int(1) NOT NULL DEFAULT '0',
  `done` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_import_templates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE latin1_general_ci,
  `added` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_import_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `session` varchar(200) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE latin1_general_ci,
  `added` datetime DEFAULT CURRENT_TIMESTAMP,
  `locked` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `epos_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_sales_ledger` (
  `fsl_date` date NOT NULL DEFAULT '0000-00-00',
  `fsl_depots` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `fsl_banked` tinyint(1) NOT NULL DEFAULT '0',
  `fsl_sage` tinyint(1) NOT NULL DEFAULT '0',
  `fsl_stream` tinyint(1) NOT NULL DEFAULT '0',
  `fsl_cash` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq1` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq2` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq3` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq4` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq5` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq6` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_cheque` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_tradepro` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_eposdirect` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_directship` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_payref` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `fsl_comments` text COLLATE latin1_general_ci NOT NULL,
  `fsl_general` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`fsl_date`,`fsl_depots`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finance_sales_ledger_orig` (
  `fsl_date` date NOT NULL DEFAULT '0000-00-00',
  `fsl_depots` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `fsl_banked` tinyint(1) NOT NULL DEFAULT '0',
  `fsl_sage` tinyint(1) NOT NULL DEFAULT '0',
  `fsl_stream` tinyint(1) NOT NULL DEFAULT '0',
  `fsl_cash` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq1` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq2` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq3` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq4` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq5` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_pdq6` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_cheque` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_tradepro` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_eposdirect` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_directship` decimal(8,3) NOT NULL DEFAULT '0.000',
  `fsl_payref` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `fsl_comments` text COLLATE latin1_general_ci NOT NULL,
  `fsl_general` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`fsl_date`,`fsl_depots`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_signup_updates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emailAddress` text COLLATE latin1_general_ci NOT NULL,
  `ucup_ts` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `newsletter_signup_updates_emailAddress_IDX` (`emailAddress`(255)) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=109508 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcodes_latlon_gb` (
  `plg_zip` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `plg_lat` decimal(24,18) NOT NULL DEFAULT '0.000000000000000000',
  `plg_lon` decimal(24,18) NOT NULL DEFAULT '0.000000000000000000',
  PRIMARY KEY (`plg_zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcodes_latlon_gb_orig` (
  `plg_zip` varchar(10) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `plg_lat` decimal(24,18) NOT NULL DEFAULT '0.000000000000000000',
  `plg_lon` decimal(24,18) NOT NULL DEFAULT '0.000000000000000000',
  PRIMARY KEY (`plg_zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replen_simple` (
  `rsi_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `rsi_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `rsi_actual` smallint(11) NOT NULL,
  `rsi_target` smallint(11) NOT NULL,
  `rsi_done` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `rsi_min` smallint(11) NOT NULL,
  PRIMARY KEY (`rsi_spa_uid`,`rsi_ssi_uid`),
  KEY `rsi_ssi_uid` (`rsi_ssi_uid`),
  KEY `rsi_done` (`rsi_done`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replen_simple_exceptions` (
  `rse_id` int(11) NOT NULL AUTO_INCREMENT,
  `rse_site_from` varchar(32) COLLATE latin1_general_ci NOT NULL COMMENT 'Site perspective',
  `rse_ts` datetime NOT NULL,
  `rse_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `rse_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `rse_qty_taken` smallint(11) NOT NULL DEFAULT '0',
  `rse_qty_stillneeded` smallint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rse_id`),
  UNIQUE KEY `rse_id` (`rse_id`),
  KEY `rse_ts` (`rse_ts`),
  KEY `rse_spa_uid` (`rse_spa_uid`),
  KEY `rse_qty_stillneeded` (`rse_qty_stillneeded`),
  KEY `rse_spa_uid_2` (`rse_spa_uid`,`rse_qty_stillneeded`),
  KEY `rse_site_from` (`rse_site_from`)
) ENGINE=InnoDB AUTO_INCREMENT=126287948 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Last 30 days exceptions log of stock that could not be suppl';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replen_simple_last_seen` (
  `rsl_id` int(11) NOT NULL AUTO_INCREMENT,
  `rsl_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `rsl_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `rsl_sld_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`rsl_id`),
  UNIQUE KEY `rsl_id` (`rsl_id`),
  KEY `rsl_ssi_uid` (`rsl_ssi_uid`,`rsl_spa_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=292409221 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='List of locations parts have last been seen in (updated nigh';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replen_simple_schedule` (
  `rss_site_from` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `rss_day` tinyint(4) NOT NULL,
  `rss_slot` tinyint(4) NOT NULL,
  `rss_site_for` char(2) COLLATE latin1_general_ci NOT NULL,
  `rss_ts_created` datetime NOT NULL,
  `rss_ts_completed` datetime DEFAULT NULL,
  `rss_ts_who` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `rss_lines_done` smallint(11) NOT NULL DEFAULT '0',
  `rss_lines_poss` int(16) DEFAULT NULL,
  PRIMARY KEY (`rss_site_from`,`rss_day`,`rss_slot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Weekly schdule of how to supply shops';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `replen_simple_stats_orders_parts` (
  `part` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `order` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`order`,`part`),
  KEY `part` (`part`),
  KEY `date` (`date`),
  KEY `part_2` (`part`,`qty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Last years part/qty sales';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_configuration` (
  `cfg_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cfg_type` enum('boolean','date','dateTime','decimal','integer','string') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cfg_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cfg_desc` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cfg_default` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_logs` (
  `log_uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_sessionID` int(11) NOT NULL DEFAULT '0',
  `log_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_level` smallint(6) NOT NULL,
  `log_notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_uid`),
  KEY `log_sessionID` (`log_sessionID`,`log_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_remote_clients` (
  `rmt_uid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rmt_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rmt_soapKey` varchar(29) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rmt_sourceIP` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rmt_status` enum('Disabled','Enabled','Deleted') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Disabled',
  PRIMARY KEY (`rmt_uid`),
  KEY `rmt_soapKey` (`rmt_soapKey`),
  KEY `rmt_sourceIP` (`rmt_sourceIP`),
  KEY `rmt_name` (`rmt_name`),
  KEY `rmt_status` (`rmt_status`,`rmt_soapKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_requests` (
  `sso_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sso_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sso_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sso_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_item_translations` (
  `sitr_uid` int(16) NOT NULL AUTO_INCREMENT,
  `sitr_source_system_id` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `sitr_source_item_id` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `sitr_target_system_id` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `sitr_target_item_id` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `sitr_ts` datetime NOT NULL,
  `sitr_who` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `sitr_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`sitr_uid`),
  KEY `sitr_source_system_id` (`sitr_source_system_id`,`sitr_source_item_id`,`sitr_target_system_id`,`sitr_active`),
  KEY `sitr_source_item_id` (`sitr_source_item_id`),
  KEY `sitr_target_system_id` (`sitr_target_system_id`),
  KEY `sitr_target_item_id` (`sitr_target_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Relationships between items (parts) of one tsc system to ano';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w3_related_by_purchase` (
  `rbp_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `rbp_rel_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `rbp_rel_qty` int(1) NOT NULL,
  PRIMARY KEY (`rbp_spa_uid`,`rbp_rel_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w3_search_shop_departments` (
  `sde_uid` int(16) NOT NULL AUTO_INCREMENT,
  `sde_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sde_desc` text COLLATE latin1_general_ci,
  `sde_keywords` text COLLATE latin1_general_ci,
  `sde_img` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sde_colour` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sde_nudge` int(8) NOT NULL DEFAULT '0',
  `sde_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sde_uid`),
  UNIQUE KEY `sde_uid` (`sde_uid`),
  FULLTEXT KEY `ft_shop_departments` (`sde_name`,`sde_desc`,`sde_keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w3_search_shop_subdepartments` (
  `ssd_uid` int(16) NOT NULL AUTO_INCREMENT,
  `ssd_sde_uid` int(16) NOT NULL DEFAULT '0',
  `ssd_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssd_desc` text COLLATE latin1_general_ci,
  `ssd_keywords` text COLLATE latin1_general_ci,
  `ssd_img` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ssd_nudge` int(8) NOT NULL DEFAULT '0',
  `ssd_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ssd_uid`),
  UNIQUE KEY `sde_uid` (`ssd_uid`),
  KEY `ssd_sde_uid` (`ssd_sde_uid`),
  FULLTEXT KEY `ft_shop_subdepartments` (`ssd_name`,`ssd_desc`,`ssd_keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=3399 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w3_search_stock_parts` (
  `spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spa_start` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spa_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `spa_ssd_uid` int(16) NOT NULL DEFAULT '0',
  `spa_code` varchar(5) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `spa_name` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_name_type` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_name_qty` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_desc` text COLLATE latin1_general_ci,
  `spa_img` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_manufacturer_sst_uid` int(16) DEFAULT NULL,
  `spa_manufacturer_id` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_warranty_years` int(16) DEFAULT NULL,
  `spa_weight` int(16) DEFAULT NULL,
  `spa_quoteoldprice_spe_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_estimatedsales` double(8,2) NOT NULL DEFAULT '0.00',
  `spa_initialpurchaseqty` int(8) NOT NULL DEFAULT '0',
  `spa_type_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_status_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_buyingstatus_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_ts_rundownby` datetime DEFAULT NULL,
  `spa_stock_shop_replen_delay` tinyint(4) NOT NULL DEFAULT '0',
  `spa_stock_replen_multiple` int(16) DEFAULT NULL,
  `spa_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `spa_cert` tinyint(1) NOT NULL DEFAULT '0',
  `spa_careful` tinyint(1) NOT NULL DEFAULT '0',
  `spa_nudge` int(8) NOT NULL DEFAULT '0',
  `spa_latest_cat` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `spa_latest_page` int(1) DEFAULT NULL,
  `spa_endoflife_sst_uid` int(16) NOT NULL DEFAULT '0',
  `spa_individual` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spa_uid`),
  KEY `spa_code` (`spa_code`),
  KEY `spa_name` (`spa_name`),
  KEY `spa_name_type` (`spa_name_type`),
  KEY `spa_type_sst_uid` (`spa_type_sst_uid`),
  KEY `spa_status_sst_uid` (`spa_status_sst_uid`),
  KEY `spa_buyingstatus_sst_uid` (`spa_buyingstatus_sst_uid`),
  KEY `spa_nudge` (`spa_nudge`),
  KEY `spa_manufacturer_sst_uid` (`spa_manufacturer_sst_uid`),
  KEY `spa_manufacturer_id` (`spa_manufacturer_id`),
  KEY `spa_ssd_uid` (`spa_ssd_uid`),
  FULLTEXT KEY `ft_stock_parts` (`spa_code`,`spa_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w3_stock_levels_depot` (
  `stk_lev_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `stk_lev_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `stk_lev_qty` int(11) NOT NULL,
  `stk_lev_ts_updated` datetime NOT NULL,
  `stk_lev_ts_expected` date DEFAULT NULL COMMENT 'When new stock is next expected',
  PRIMARY KEY (`stk_lev_ssi_uid`,`stk_lev_spa_uid`),
  KEY `stk_lev_spa_uid` (`stk_lev_spa_uid`),
  KEY `stk_lev_ts_updated` (`stk_lev_ts_updated`,`stk_lev_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `w3_stock_levels_depot_test` (
  `stk_lev_ssi_uid` char(2) COLLATE latin1_general_ci NOT NULL,
  `stk_lev_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `stk_lev_qty` int(11) NOT NULL DEFAULT '0',
  `stk_lev_ts_updated` datetime NOT NULL,
  `stk_lev_ts_expected` date DEFAULT NULL COMMENT 'When new stock is next expected',
  PRIMARY KEY (`stk_lev_ssi_uid`,`stk_lev_spa_uid`),
  KEY `stk_lev_spa_uid` (`stk_lev_spa_uid`),
  KEY `stk_lev_ts_updated` (`stk_lev_ts_updated`,`stk_lev_qty`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xs_orders_xref` (
  `xso_uid` int(11) NOT NULL AUTO_INCREMENT,
  `xso_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xso_uor_uid` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xso_3p_uor_uid` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xso_received` datetime NOT NULL,
  `xso_processed` datetime NOT NULL,
  `xso_who` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xso_data` longtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  PRIMARY KEY (`xso_uid`),
  KEY `xso_uor_uid` (`xso_uor_uid`),
  KEY `xso_3p_uor_uid` (`xso_3p_uor_uid`),
  KEY `xso_supplier` (`xso_supplier`),
  KEY `xso_received` (`xso_received`)
) ENGINE=InnoDB AUTO_INCREMENT=11820 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xs_stock_xref` (
  `xsx_uid` int(11) NOT NULL AUTO_INCREMENT,
  `xsx_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xsx_3p_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xsx_spa_uid` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xsx_outbound` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If an outbound line then "1", if inbound then "0"',
  `xsx_who` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `xsx_start_date` datetime NOT NULL,
  `xsx_end_date` datetime NOT NULL,
  `xsx_rule_type` int(11) NOT NULL DEFAULT '0',
  `xsx_rule_value` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`xsx_uid`),
  KEY `xsx_supplier` (`xsx_supplier`),
  KEY `xsx_3p_code` (`xsx_3p_code`),
  KEY `xsx_spa_uid` (`xsx_spa_uid`),
  KEY `xsx_outbound` (`xsx_outbound`),
  KEY `xsx_start_date` (`xsx_start_date`,`xsx_end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_payment_se` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_payment_se`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_payment_types` (
  `dpt_uid` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `dpt_name` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`dpt_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_response_log` (
  `slog_id` int(11) NOT NULL AUTO_INCREMENT,
  `slog_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slog_ref` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `slog_corr_uid` varchar(50) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Paypal Correlation ID (Unique identifier for communication/api call)',
  `slog_ruid` varchar(128) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Paypal token (Unique per transaction)',
  `slog_type` varchar(20) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Paypal API Method',
  `slog_data` text COLLATE latin1_general_ci COMMENT 'Response data in JSON fornm',
  PRIMARY KEY (`slog_id`),
  UNIQUE KEY `slog_id` (`slog_id`),
  KEY `xlog_ts` (`slog_ts`),
  KEY `xlog_ruid` (`slog_ruid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Log of XML transactions';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_submit_log` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_ruid` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_trans_type` varchar(10) COLLATE latin1_general_ci DEFAULT 'order',
  `sub_transid` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_parent_transid` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_corr_uid` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sub_data` longtext COLLATE latin1_general_ci,
  `sub_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_ts_updated` datetime DEFAULT NULL,
  `sub_ts_captured` datetime DEFAULT NULL,
  `sub_last_event` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_amount_authorised` decimal(8,2) DEFAULT NULL,
  `sub_amount_captured` decimal(8,2) DEFAULT NULL,
  `sub_uor_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `special_requests` text COLLATE latin1_general_ci,
  `contact_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `payment_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_code` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `sub_id` (`sub_id`),
  KEY `sub_uor_uid` (`sub_uor_uid`),
  KEY `sub_ucu_uid` (`sub_ucu_uid`),
  KEY `sub_last_event` (`sub_last_event`),
  KEY `sub_ts` (`sub_ts`),
  KEY `sub_ts_captured` (`sub_ts_captured`),
  KEY `sub_ruid` (`sub_ruid`),
  KEY `sub_trans_type` (`sub_trans_type`),
  KEY `sub_transid` (`sub_transid`),
  KEY `sub_parent_transid` (`sub_parent_transid`),
  KEY `sub_corr_uid` (`sub_corr_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=13403632 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submit_log` (
  `sub_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_transtype` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sub_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_ts_updated` datetime DEFAULT NULL,
  `sub_ts_captured` datetime DEFAULT NULL,
  `sub_last_event` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_amount_authorised` decimal(8,2) DEFAULT NULL,
  `sub_amount_captured` decimal(8,2) DEFAULT NULL,
  `sub_uor_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_who` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `special_requests` text COLLATE latin1_general_ci,
  `contact_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `payment_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_code` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`sub_ruid`),
  KEY `sub_uor_uid` (`sub_uor_uid`),
  KEY `sub_ucu_uid` (`sub_ucu_uid`),
  KEY `sub_last_event` (`sub_last_event`),
  KEY `sub_ts` (`sub_ts`),
  KEY `sub_ts_captured` (`sub_ts_captured`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submit_log_orig` (
  `sub_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_transtype` varchar(16) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `sub_currency` char(3) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_ts_updated` datetime DEFAULT NULL,
  `sub_ts_captured` datetime DEFAULT NULL,
  `sub_last_event` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_amount_authorised` decimal(8,2) DEFAULT NULL,
  `sub_amount_captured` decimal(8,2) DEFAULT NULL,
  `sub_uor_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `sub_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sub_who` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `special_requests` text COLLATE latin1_general_ci,
  `contact_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `payment_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_address_id` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `delivery_code` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`sub_ruid`),
  KEY `sub_uor_uid` (`sub_uor_uid`),
  KEY `sub_ucu_uid` (`sub_ucu_uid`),
  KEY `sub_last_event` (`sub_last_event`),
  KEY `sub_ts` (`sub_ts`),
  KEY `sub_ts_captured` (`sub_ts_captured`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xml_log` (
  `xlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `xlog_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `xlog_ruid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `xlog_type` tinyint(1) NOT NULL DEFAULT '0',
  `xlog_inout` tinyint(1) NOT NULL DEFAULT '0',
  `xlog_who` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `xlog_xml` text COLLATE latin1_general_ci,
  PRIMARY KEY (`xlog_id`),
  UNIQUE KEY `xlog_id` (`xlog_id`),
  KEY `xlog_ts` (`xlog_ts`),
  KEY `xlog_ruid` (`xlog_ruid`),
  KEY `xlog_type` (`xlog_type`),
  KEY `xlog_inout` (`xlog_inout`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Log of XML transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_timesheets` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_assignments` (
  `proj_id` int(11) NOT NULL DEFAULT '0',
  `username` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`proj_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_client` (
  `client_id` int(8) NOT NULL AUTO_INCREMENT,
  `organisation` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `description` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `address1` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `city` varchar(60) COLLATE latin1_general_ci DEFAULT NULL,
  `state` varchar(80) COLLATE latin1_general_ci DEFAULT NULL,
  `country` char(2) COLLATE latin1_general_ci DEFAULT NULL,
  `postal_code` varchar(13) COLLATE latin1_general_ci DEFAULT NULL,
  `contact_first_name` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `contact_last_name` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `username` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `contact_email` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `fax_number` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `gsm_number` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `http_url` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `address2` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_config` (
  `config_set_id` int(1) NOT NULL DEFAULT '0',
  `version` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '__TIMESHEET_VERSION__',
  `headerhtml` mediumtext COLLATE latin1_general_ci NOT NULL,
  `bodyhtml` mediumtext COLLATE latin1_general_ci NOT NULL,
  `footerhtml` mediumtext COLLATE latin1_general_ci NOT NULL,
  `errorhtml` mediumtext COLLATE latin1_general_ci NOT NULL,
  `bannerhtml` mediumtext COLLATE latin1_general_ci NOT NULL,
  `tablehtml` mediumtext COLLATE latin1_general_ci NOT NULL,
  `locale` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `timezone` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `timeformat` enum('12','24') COLLATE latin1_general_ci NOT NULL DEFAULT '12',
  `weekstartday` tinyint(4) NOT NULL DEFAULT '0',
  `useLDAP` tinyint(4) NOT NULL DEFAULT '0',
  `LDAPScheme` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `LDAPHost` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `LDAPPort` int(11) DEFAULT NULL,
  `LDAPBaseDN` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `LDAPUsernameAttribute` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `LDAPSearchScope` enum('base','sub','one') COLLATE latin1_general_ci NOT NULL DEFAULT 'base',
  `LDAPFilter` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `LDAPProtocolVersion` varchar(255) COLLATE latin1_general_ci DEFAULT '3',
  `LDAPBindUsername` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  `LDAPBindPassword` varchar(255) COLLATE latin1_general_ci DEFAULT '',
  PRIMARY KEY (`config_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_note` (
  `note_id` int(6) NOT NULL AUTO_INCREMENT,
  `proj_id` int(8) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subject` varchar(127) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `body` text COLLATE latin1_general_ci NOT NULL,
  `to_contact` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_project` (
  `proj_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '1970-01-01',
  `deadline` date NOT NULL DEFAULT '0000-00-00',
  `http_link` varchar(127) COLLATE latin1_general_ci DEFAULT NULL,
  `proj_status` enum('Pending','Started','Suspended','Complete') COLLATE latin1_general_ci NOT NULL DEFAULT 'Pending',
  `proj_leader` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`proj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `proj_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(127) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `description` text COLLATE latin1_general_ci,
  `assigned` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `suspended` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `completed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('Pending','Assigned','Started','Suspended','Complete') COLLATE latin1_general_ci NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_task_assignments` (
  `task_id` int(8) NOT NULL DEFAULT '0',
  `username` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `proj_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ts_times` (
  `uid` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `start_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trans_num` int(11) NOT NULL AUTO_INCREMENT,
  `proj_id` int(11) NOT NULL DEFAULT '1',
  `task_id` int(11) NOT NULL DEFAULT '1',
  `log_message` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_num`),
  UNIQUE KEY `trans_num` (`trans_num`),
  KEY `uid` (`uid`,`trans_num`)
) ENGINE=InnoDB AUTO_INCREMENT=1282 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `toolstation_web` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;

USE `toolstation_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bazaar_voice_seo` (
  `client_name` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `content_type` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `subject_type` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `page` int(5) DEFAULT NULL,
  `subject_id` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `html` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `client_name` (`client_name`(20),`content_type`(10),`subject_type`(5),`page`)
) ENGINE=InnoDB AUTO_INCREMENT=20389078 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call_saved_trolleys` (
  `ctr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ctr_opp_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ctr_cus_ucu_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ctr_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ctr_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ctr_qty` int(16) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctr_id`),
  UNIQUE KEY `ctr_id` (`ctr_id`),
  KEY `ctr_ts` (`ctr_ts`),
  KEY `ctr_opp_ucu_uid` (`ctr_opp_ucu_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=121567 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `token` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=1211067 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_featureproducts` (
  `wfp_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wfp_desc` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`wfp_spa_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_language_strings` (
  `uid` int(16) NOT NULL AUTO_INCREMENT COMMENT 'Auto UID',
  `lang` char(2) NOT NULL COMMENT 'Lang ISO639 2 (i.e. EN, NL, etc)',
  `ts` datetime NOT NULL COMMENT 'Last updated timestamp',
  `who` varchar(32) NOT NULL COMMENT 'Last updated by user',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active 1 (public live) or not 0',
  `id_type` varchar(32) NOT NULL COMMENT 'Type (i.e. sde_uid, spa_uid, etc)',
  `id` varchar(64) NOT NULL COMMENT 'ID (i.e. PXX00001234, 123, 76428, etc)',
  `string_type` varchar(32) NOT NULL COMMENT 'Type (i.e. sde_name, spa_name, etc)',
  `string` text NOT NULL COMMENT 'Data',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `lang` (`lang`,`id_type`,`id`,`string_type`),
  KEY `id_type` (`id_type`,`id`),
  KEY `id` (`id`),
  KEY `string_type` (`string_type`,`lang`),
  FULLTEXT KEY `string` (`string`)
) ENGINE=InnoDB AUTO_INCREMENT=4007 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_language_strings_new` (
  `uid` int(16) NOT NULL AUTO_INCREMENT COMMENT 'Auto UID',
  `lang` char(2) COLLATE latin1_general_ci NOT NULL COMMENT 'Lang ISO639 2 (i.e. EN, NL, etc)',
  `ts` datetime NOT NULL COMMENT 'Last updated timestamp',
  `who` varchar(32) COLLATE latin1_general_ci NOT NULL COMMENT 'Last updated by user',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active 1 (public live) or not 0',
  `id_type` varchar(32) COLLATE latin1_general_ci NOT NULL COMMENT 'Type (i.e. sde_uid, spa_uid, etc)',
  `id` varchar(64) COLLATE latin1_general_ci NOT NULL COMMENT 'ID (i.e. PXX00001234, 123, 76428, etc)',
  `string_type` varchar(32) COLLATE latin1_general_ci NOT NULL COMMENT 'Type (i.e. sde_name, spa_name, etc)',
  `string` text COLLATE latin1_general_ci NOT NULL COMMENT 'Data',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `lang` (`lang`,`id_type`,`id`,`string_type`),
  KEY `id_type` (`id_type`,`id`),
  KEY `id` (`id`),
  KEY `string_type` (`string_type`,`lang`),
  FULLTEXT KEY `string` (`string`)
) ENGINE=InnoDB AUTO_INCREMENT=38771 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_languages` (
  `wla_uid` int(16) NOT NULL DEFAULT '0',
  `wla_iso639_2` char(2) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wla_txt` text COLLATE latin1_general_ci,
  `wla_last_ts` datetime DEFAULT NULL,
  `wla_last_who` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`wla_uid`,`wla_iso639_2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_previous_buys` (
  `wpb_sessionuid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wpb_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wpb_items` text COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`wpb_sessionuid`),
  UNIQUE KEY `wpb_sessionuid` (`wpb_sessionuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_previous_compares` (
  `wpc_sessionuid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wpc_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wpc_compares` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`wpc_sessionuid`),
  UNIQUE KEY `wpc_sessionuid` (`wpc_sessionuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_previous_items` (
  `wpi_sessionuid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wpi_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wpi_items` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`wpi_sessionuid`),
  UNIQUE KEY `wpi_sessionuid` (`wpi_sessionuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_recommendafriend` (
  `wraf_ruid` varchar(11) COLLATE latin1_general_ci NOT NULL,
  `wraf_ts_created` datetime NOT NULL,
  `wraf_ucu_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'ID of customer making the recommendation (if available)',
  `wraf_firstname` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `wraf_lastname` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `wraf_email` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `wraf_dad_1house` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `wraf_dad_2Broad` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `wraf_dad_3town` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `wraf_dad_4county` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `wraf_dad_5zip` varchar(16) COLLATE latin1_general_ci NOT NULL,
  `wraf_dad_6country` int(8) NOT NULL,
  PRIMARY KEY (`wraf_ruid`),
  KEY `wraf_ucu_uid` (`wraf_ucu_uid`),
  KEY `wraf_dad_1house` (`wraf_dad_1house`,`wraf_dad_5zip`),
  KEY `wraf_ts_created` (`wraf_ts_created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_searches` (
  `wse_sessionuid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wse_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wse_searches` varchar(255) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  UNIQUE KEY `wse_sessionuid` (`wse_sessionuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sites` (
  `wcc_uid` int(16) NOT NULL AUTO_INCREMENT COMMENT 'Auto UID',
  `wcc_name` varchar(32) COLLATE latin1_general_ci NOT NULL,
  `wcc_ssi_uid` varchar(2) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Site UID (if proper Toolstation site)',
  `wcc_group_sst_uid` int(16) NOT NULL COMMENT 'Group type (TS, TP, etc)',
  `wcc_dad_uid` varchar(11) COLLATE latin1_general_ci DEFAULT NULL,
  `wcc_lat` decimal(24,18) DEFAULT NULL,
  `wcc_lon` decimal(24,18) DEFAULT NULL,
  `wcc_address` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `wcc_zip` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `wcc_country` varchar(2) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'GB, NL, etc',
  `wcc_clickcollect` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Inc in click and collect list',
  `wcc_map` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Inc in branches map',
  `wcc_map_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 comming soon, 1 live, 2 coming distant future',
  `wcc_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Active or not',
  PRIMARY KEY (`wcc_uid`),
  KEY `clickcollect` (`wcc_group_sst_uid`,`wcc_clickcollect`,`wcc_active`),
  KEY `map` (`wcc_map`,`wcc_active`)
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_sysvars` (
  `wsv_key` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wsv_value` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`wsv_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_taxonomy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` longtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  `colour` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `image` int(11) DEFAULT '0',
  `nudge` int(11) DEFAULT '0',
  `public_visible` tinyint(4) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_taxonomy_attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE latin1_general_ci DEFAULT NULL,
  `settings` text COLLATE latin1_general_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_taxonomy_hierarchy` (
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `_lft` int(10) unsigned DEFAULT NULL,
  `_rgt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`parent_id`,`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_taxonomy_hierarchy_orig_160818` (
  `parent_id` int(11) NOT NULL,
  `child_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent_id`,`child_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_taxonomy_notes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `taxonomy_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `value` text COLLATE latin1_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3501 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_trolley_prints` (
  `wtp_id` int(11) NOT NULL AUTO_INCREMENT,
  `wtp_sessionuid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wtp_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wtp_ref` varchar(6) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wtp_trolley` text COLLATE latin1_general_ci NOT NULL,
  `wtp_label` text COLLATE latin1_general_ci,
  PRIMARY KEY (`wtp_id`),
  UNIQUE KEY `wtp_ref` (`wtp_ref`),
  UNIQUE KEY `wtp_id` (`wtp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1034012 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_trolleys` (
  `wtr_id` int(11) NOT NULL AUTO_INCREMENT,
  `wtr_sessionuid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wtr_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wtr_spa_uid` varchar(11) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wtr_qty` int(16) NOT NULL DEFAULT '0',
  `free_items` int(16) DEFAULT '0',
  `wtr_channel` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`wtr_id`),
  UNIQUE KEY `sespart` (`wtr_sessionuid`,`wtr_spa_uid`),
  UNIQUE KEY `wtr_id` (`wtr_id`),
  KEY `wtr_ts` (`wtr_ts`),
  KEY `wtr_spa_uid` (`wtr_spa_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=70019695 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_votes` (
  `wvo_sst_uid` int(16) NOT NULL DEFAULT '0',
  `wvo_ip` varchar(18) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wvo_answer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wvo_sst_uid`,`wvo_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_welcome` (
  `wwe_uid` int(16) NOT NULL AUTO_INCREMENT,
  `wwe_string` varchar(128) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `wwe_title` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `wwe_titlesub` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `wwe_searchphrase` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `wwe_link` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  `wwe_welcome` text COLLATE latin1_general_ci,
  `wwe_codes` varchar(128) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`wwe_uid`),
  UNIQUE KEY `wwe_string` (`wwe_string`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Customer welcome variables dependent on ''r'' entry.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_welcome_stats` (
  `wws_id` int(11) NOT NULL AUTO_INCREMENT,
  `wws_wwe_uid` int(16) NOT NULL DEFAULT '0',
  `wws_ts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wws_spa_code` varchar(5) COLLATE latin1_general_ci DEFAULT NULL,
  `wws_extra` varchar(16) COLLATE latin1_general_ci DEFAULT NULL,
  `wws_sessionuid` varchar(64) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`wws_id`),
  UNIQUE KEY `wws_id` (`wws_id`),
  KEY `wws_wwe_uid` (`wws_wwe_uid`),
  KEY `wws_sessionuid` (`wws_sessionuid`),
  KEY `wws_ts` (`wws_ts`),
  KEY `wws_spa_code` (`wws_spa_code`),
  KEY `wws_extra` (`wws_extra`)
) ENGINE=InnoDB AUTO_INCREMENT=20042349 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Who came in on what keyword?';
/*!40101 SET character_set_client = @saved_cs_client */;
