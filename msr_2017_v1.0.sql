-- MySQL Script for MSR_2017
-- 02/18/17 21:03:56
-- Model: MSR2017   Version: 1.0
-- Tamer Abdou

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema msr_2017
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema msr_2017
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `msr_2017` DEFAULT CHARACTER SET utf8 ;
USE `msr_2017` ;

-- -----------------------------------------------------
-- Table `msr_2017`.`collection.bug`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`collection.bug` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`collection.bug` (
  `bg_id` INT(11) NOT NULL,
  `bg_assigned_to` TEXT NULL DEFAULT NULL,
  `bg_classification` TEXT NULL DEFAULT NULL,
  `bg_comment_count` INT(11) NULL DEFAULT NULL,
  `bg_component` TEXT NULL DEFAULT NULL,
  `bg_creation_time` TEXT NULL DEFAULT NULL,
  `bg_creator` TEXT NULL DEFAULT NULL,
  `bg_dupe_of` TEXT NULL DEFAULT NULL,
  `bg_groups` JSON NULL DEFAULT NULL,
  `bg_is_cc_accessible` TEXT NULL DEFAULT NULL,
  `bg_is_confirmed` TEXT NULL DEFAULT NULL,
  `bg_is_creator_accessible` TEXT NULL DEFAULT NULL,
  `bg_is_open` TEXT NULL DEFAULT NULL,
  `bg_last_change_time` TEXT NULL DEFAULT NULL,
  `bg_op_sys` TEXT NULL DEFAULT NULL,
  `bg_platform` TEXT NULL DEFAULT NULL,
  `bg_priority` TEXT NULL DEFAULT NULL,
  `bg_product` TEXT NULL DEFAULT NULL,
  `bg_qa_contact` TEXT NULL DEFAULT NULL,
  `bg_resolution` TEXT NULL DEFAULT NULL,
  `bg_severity` TEXT NULL DEFAULT NULL,
  `bg_status` TEXT NULL DEFAULT NULL,
  `bg_summary` TEXT NULL DEFAULT NULL,
  `bg_target_milestone` TEXT NULL DEFAULT NULL,
  `bg_url` TEXT NULL DEFAULT NULL,
  `bg_version` TEXT NULL DEFAULT NULL,
  `bg_votes` INT(11) NULL DEFAULT NULL,
  `bg_whiteboard` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`bg_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug.assignedto_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug.assignedto_detail` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug.assignedto_detail` (
  `bg_assign_uid` INT(11) NOT NULL,
  `bg_assignedto_detail_email` TEXT NULL DEFAULT NULL,
  `bg_assignedto_detail_id` INT(11) NULL DEFAULT NULL,
  `bg_ssignedto_detail_name` TEXT NULL DEFAULT NULL,
  `bg_assignedto_detail_real_name` TEXT NULL DEFAULT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bg_assign_uid`),
  INDEX `FK_assgn_idx` (`bg_id` ASC),
  CONSTRAINT `FK_assgn`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug.blockers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug.blockers` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug.blockers` (
  `block_uid` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `bg_blocks_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`block_uid`),
  INDEX `Fk_2_idx` (`bg_id` ASC),
  CONSTRAINT `Fk_2`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug.cc_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug.cc_detail` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug.cc_detail` (
  `bg_cc_uid` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `bg_cc_detail_realname` TEXT NULL DEFAULT NULL,
  `bg_cc_detail_email` TEXT NULL DEFAULT NULL,
  `bg_cc_detail_name` TEXT NULL DEFAULT NULL,
  `bg_cc_detail_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bg_cc_uid`),
  INDEX `fk_cc_idx` (`bg_id` ASC),
  CONSTRAINT `fk_cc`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug.creator_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug.creator_detail` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug.creator_detail` (
  `bg_creator_uid` INT(11) NOT NULL,
  `bg_creator_detail.email` TEXT NULL DEFAULT NULL,
  `bg_creator_detail.id` INT(11) NULL DEFAULT NULL,
  `bg_creator_detail.name` TEXT NULL DEFAULT NULL,
  `bg_creator_detail.real_name` TEXT NULL DEFAULT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bg_creator_uid`),
  INDEX `fk_1_idx` (`bg_id` ASC),
  CONSTRAINT `fk_1`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug.flag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug.flag` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug.flag` (
  `bg_flag_id` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `bg_flag_status` TEXT NULL DEFAULT NULL,
  `bg_flag_name` TEXT NULL DEFAULT NULL,
  `bg_flag_modification_date` TEXT NULL DEFAULT NULL,
  `bg_flag_type_id` INT(11) NULL DEFAULT NULL,
  `bg_flag_creation_date` TEXT NULL DEFAULT NULL,
  `pt_flag_setter` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`bg_flag_id`),
  INDEX `Fk_3_idx` (`bg_id` ASC),
  CONSTRAINT `Fk_3`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug.keywords`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug.keywords` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug.keywords` (
  `bg_keyword_uid` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `bg_keyword_text` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`bg_keyword_uid`),
  INDEX `FK_bugkey_idx` (`bg_id` ASC),
  CONSTRAINT `FK_bugkey`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug.qa_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug.qa_detail` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug.qa_detail` (
  `bg_qa_uid` INT(11) NOT NULL,
  `bg_qa_detail_email` TEXT NULL DEFAULT NULL,
  `bg_qa_detail_id` INT(11) NULL DEFAULT NULL,
  `bg_qa_detail_name` TEXT NULL DEFAULT NULL,
  `bg_qa_detail_real_name` TEXT NULL DEFAULT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bg_qa_uid`),
  INDEX `FK_QA_idx` (`bg_id` ASC),
  CONSTRAINT `FK_QA`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`bug_dependson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`bug_dependson` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`bug_dependson` (
  `bg_depend_uid` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `bg_dependson_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`bg_depend_uid`),
  INDEX `fk_dp_idx` (`bg_id` ASC),
  CONSTRAINT `fk_dp`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`collection_changeset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`collection_changeset` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`collection_changeset` (
  `cs_index` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `date` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `pt_id` TEXT NULL DEFAULT NULL,
  `user` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`cs_index`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`changeset.diffs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`changeset.diffs` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`changeset.diffs` (
  `cs_diff_uid` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `cs_index` INT(11) NULL DEFAULT NULL,
  `filename` TEXT NULL DEFAULT NULL,
  `value` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`cs_diff_uid`),
  INDEX `fk_cs_diff_idx` (`cs_index` ASC),
  INDEX `fk_bg_diff_idx` (`bg_id` ASC),
  CONSTRAINT `fk_bg_diff`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cs_diff`
    FOREIGN KEY (`cs_index`)
    REFERENCES `msr_2017`.`collection_changeset` (`cs_index`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`changeset.file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`changeset.file` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`changeset.file` (
  `cs_file_uid` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `cs_index` INT(11) NULL DEFAULT NULL,
  `cs_file_name` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`cs_file_uid`),
  INDEX `fk_cs_file_idx` (`cs_index` ASC),
  INDEX `fk_cs_file_bg_idx` (`bg_id` ASC),
  CONSTRAINT `fk_cs_file`
    FOREIGN KEY (`cs_index`)
    REFERENCES `msr_2017`.`collection_changeset` (`cs_index`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cs_file_bg`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`changeset.mozreview_commits`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`changeset.mozreview_commits` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`changeset.mozreview_commits` (
  `cs_moz_uid` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `cs_index` INT(11) NULL DEFAULT NULL,
  `mozreview_commit_id` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`cs_moz_uid`),
  INDEX `fk_cs_moz_idx` (`cs_index` ASC),
  INDEX `fk_bg_moz_idx` (`bg_id` ASC),
  CONSTRAINT `fk_bg_moz`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cs_moz`
    FOREIGN KEY (`cs_index`)
    REFERENCES `msr_2017`.`collection_changeset` (`cs_index`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`patch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`patch` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`patch` (
  `pt_id` INT(11) NOT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `creation_time` TEXT NULL DEFAULT NULL,
  `attacher` TEXT NULL DEFAULT NULL,
  `content_type` TEXT NULL DEFAULT NULL,
  `creator` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `is_obsolete` INT(11) NULL DEFAULT NULL,
  `is_patch` INT(11) NULL DEFAULT NULL,
  `is_private` INT(11) NULL DEFAULT NULL,
  `last_change_time` TEXT NULL DEFAULT NULL,
  `size` INT(11) NULL DEFAULT NULL,
  `summary` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`pt_id`),
  INDEX `fk_pt_bg_idx` (`bg_id` ASC),
  CONSTRAINT `fk_pt_bg`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`patch.file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`patch.file` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`patch.file` (
  `pt_file_uid` INT(11) NOT NULL,
  `pt_id` INT(11) NULL DEFAULT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `pt_file_name` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`pt_file_uid`),
  INDEX `fk_pt_file__idx` (`pt_id` ASC),
  INDEX `fk_bg_file_idx` (`bg_id` ASC),
  CONSTRAINT `fk_bg_file`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pt_file_`
    FOREIGN KEY (`pt_id`)
    REFERENCES `msr_2017`.`patch` (`pt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msr_2017`.`patch.flag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `msr_2017`.`patch.flag` ;

CREATE TABLE IF NOT EXISTS `msr_2017`.`patch.flag` (
  `pt_flag_uid` INT(11) NOT NULL,
  `pt_id` INT(11) NULL DEFAULT NULL,
  `bg_id` INT(11) NULL DEFAULT NULL,
  `pt_flag_creation_date` TEXT NULL DEFAULT NULL,
  `pt_flag_id` INT(11) NULL DEFAULT NULL,
  `pt_modification_date` TEXT NULL DEFAULT NULL,
  `pt_flag_name` TEXT NULL DEFAULT NULL,
  `pt_status` TEXT NULL DEFAULT NULL,
  `pt_setter` TEXT NULL DEFAULT NULL,
  `pt_flag_type_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pt_flag_uid`),
  INDEX `fk_pt_idx` (`pt_id` ASC),
  INDEX `fk_bg_idx` (`bg_id` ASC),
  CONSTRAINT `fk_bg`
    FOREIGN KEY (`bg_id`)
    REFERENCES `msr_2017`.`collection.bug` (`bg_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pt`
    FOREIGN KEY (`pt_id`)
    REFERENCES `msr_2017`.`patch` (`pt_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
