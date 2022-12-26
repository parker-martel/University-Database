-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cs332t22
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs332t22
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs332t22` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cs332t22` ;

-- -----------------------------------------------------
-- Table `cs332t22`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Department` (
  `Dept_num` INT NOT NULL,
  `Dept_name` VARCHAR(45) NOT NULL,
  `Phone_#` VARCHAR(45) NOT NULL,
  `Office_location` VARCHAR(45) NOT NULL,
  `Chair_person` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Dept_num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs332t22`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Course` (
  `Course_num` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Textbook` VARCHAR(45) NOT NULL,
  `Prereq_courses` VARCHAR(45) NOT NULL,
  `Units` INT NOT NULL,
  `Dept_num` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Course_num`),
  INDEX `Dept_num_idx` (`Dept_num` ASC) VISIBLE,
  CONSTRAINT `Dept_number`
    FOREIGN KEY (`Dept_num`)
    REFERENCES `cs332t22`.`Department` (`Dept_num`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs332t22`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Student` (
  `CWID` INT NOT NULL,
  `FName` VARCHAR(45) NOT NULL,
  `LName` VARCHAR(45) NOT NULL,
  `S_address` VARCHAR(45) NOT NULL,
  `Phone_#` VARCHAR(11) NOT NULL,
  `Dept_num` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CWID`),
  INDEX `Dept_num_idx` (`Dept_num` ASC) VISIBLE,
  CONSTRAINT `Dept_num`
    FOREIGN KEY (`Dept_num`)
    REFERENCES `cs332t22`.`Department` (`Dept_num`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs332t22`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Professor` (
  `SSN` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Degrees` VARCHAR(45) NOT NULL,
  `Area_code` INT NOT NULL,
  `7_dig_num` INT NOT NULL,
  `Sex` VARCHAR(10) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Zip _code` INT NOT NULL,
  PRIMARY KEY (`SSN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs332t22`.`Section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Section` (
  `Sec_num` INT NOT NULL,
  `Classroom` VARCHAR(45) NOT NULL,
  `Num_of_seats` INT NOT NULL,
  `end_time` VARCHAR(45) NOT NULL,
  `beg_time` VARCHAR(45) NOT NULL,
  `meeting_days` VARCHAR(45) NOT NULL,
  `SSN` INT NOT NULL,
  `course_num` INT NOT NULL,
  PRIMARY KEY (`Sec_num`),
  INDEX `SSN_idx` (`SSN` ASC) VISIBLE,
  INDEX `course_num_idx` (`course_num` ASC) VISIBLE,
  CONSTRAINT `course_num`
    FOREIGN KEY (`course_num`)
    REFERENCES `cs332t22`.`Course` (`Course_num`),
  CONSTRAINT `SSN`
    FOREIGN KEY (`SSN`)
    REFERENCES `cs332t22`.`Professor` (`SSN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs332t22`.`Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Enrollment` (
  `CWID_number` INT NOT NULL,
  `Sec_num` INT NOT NULL,
  `Grade` VARCHAR(45) NOT NULL,
  INDEX `CWID_number_idx` (`CWID_number` ASC) VISIBLE,
  INDEX `Sec_num_idx` (`Sec_num` ASC) VISIBLE,
  CONSTRAINT `CWID_number`
    FOREIGN KEY (`CWID_number`)
    REFERENCES `cs332t22`.`Student` (`CWID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Sec_num`
    FOREIGN KEY (`Sec_num`)
    REFERENCES `cs332t22`.`Section` (`Sec_num`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs332t22`.`Major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Major` (
  `CWID_num` INT NOT NULL,
  `Dep_number` INT NOT NULL,
  PRIMARY KEY (`CWID_num`),
  INDEX `fk_Major_Department1_idx` (`Dep_number` ASC) VISIBLE,
  CONSTRAINT `CWID_num`
    FOREIGN KEY (`CWID_num`)
    REFERENCES `cs332t22`.`Student` (`CWID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Dept_num_number`
    FOREIGN KEY (`Dep_number`)
    REFERENCES `cs332t22`.`Department` (`Dept_num`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cs332t22`.`Minor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs332t22`.`Minor` (
  `CWID` INT NOT NULL,
  `Dept_num` INT NOT NULL,
  PRIMARY KEY (`CWID`),
  INDEX `Dept_#_idx` (`Dept_num` ASC) VISIBLE,
  INDEX `CWID_idx` (`CWID` ASC) VISIBLE,
  CONSTRAINT `CWID`
    FOREIGN KEY (`CWID`)
    REFERENCES `cs332t22`.`Student` (`CWID`),
  CONSTRAINT `Dept_#`
    FOREIGN KEY (`Dept_num`)
    REFERENCES `cs332t22`.`Department` (`Dept_num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO `Course` (`Course_num`,`Title`,`Textbook`,`Prereq_courses`,`Units`,`Dept_num`) VALUES (5745,'Econ 101','Required','N/A',4,49);

INSERT INTO `Course` (`Course_num`,`Title`,`Textbook`,`Prereq_courses`,`Units`,`Dept_num`) VALUES (5746,'Econ 201','Not Required','Econ 101',4,49);

INSERT INTO `Course` (`Course_num`,`Title`,`Textbook`,`Prereq_courses`,`Units`,`Dept_num`) VALUES (5893,'CPSC 332','Required','N/A',3,59);

INSERT INTO `Course` (`Course_num`,`Title`,`Textbook`,`Prereq_courses`,`Units`,`Dept_num`) VALUES (5894,'CPSC 351','Required','CPSC 131',3,59);

INSERT INTO `Course` (`Course_num`,`Title`,`Textbook`,`Prereq_courses`,`Units`,`Dept_num`) VALUES (5895,'CPSC 362','Required','CPSC 131',3,59);

INSERT INTO `Course` (`Course_num`,`Title`,`Textbook`,`Prereq_courses`,`Units`,`Dept_num`) VALUES (5896,'CPSC 353','Not Required','N/A',3,59);


INSERT INTO `Department` (`Dept_num`,`Dept_name`,`Phone_#`,`Office_location`,`Chair_person`) VALUES (49,'Econonics','9491847274','EC 101','Mike Smith');

INSERT INTO `Department` (`Dept_num`,`Dept_name`,`Phone_#`,`Office_location`,`Chair_person`) VALUES (59,'Computer Science','9495824472','CS 201','James Smith');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (83759184,69,'A');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (89457297,70,'B-');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (95827434,71,'B+');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (99362748,70,'B-');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (99362749,70,'A');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (95827434,71,'C');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (95827434,70,'A-');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (95827434,69,'F');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (99362748,69,'A-');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (99362748,70,'A');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (99362748,71,'A+');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (99362748,72,'C');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (88572747,45,'C+');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (88572747,46,'B+');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (93757375,45,'B+');

INSERT INTO `Enrollment` (`CWID_number`,`Sec_num`,`Grade`) VALUES (93757375,46,'A');


INSERT INTO `Minor` (`CWID`,`Dept_num`) VALUES (83759184,49);

INSERT INTO `Minor` (`CWID`,`Dept_num`) VALUES (89457297,59);

INSERT INTO `Minor` (`CWID`,`Dept_num`) VALUES (99362748,59);


INSERT INTO `Professor` (`SSN`,`Name`,`Degrees`,`Area_code`,`7_dig_num`,`Sex`,`Title`,`Salary`,`Street`,`City`,`State`,`Zip _code`) VALUES (2378487,'Tom Smith','Econonics',949,1234567,'Male','Mr.',69000,'828 N Whitewater Dr','Fullerton','CA',69420);

INSERT INTO `Professor` (`SSN`,`Name`,`Degrees`,`Area_code`,`7_dig_num`,`Sex`,`Title`,`Salary`,`Street`,`City`,`State`,`Zip _code`) VALUES (2847874,'Jimmy Smith        \n\n','Computer Science',949,1234567,'Male','Dr        ',69420,'4821 Oakwood Circle','Fullerton','CA',42069);

INSERT INTO `Professor` (`SSN`,`Name`,`Degrees`,`Area_code`,`7_dig_num`,`Sex`,`Title`,`Salary`,`Street`,`City`,`State`,`Zip _code`) VALUES (4892547,'James Smith','Computer Science',949,1235678,'Male','Mr.',420000,'1531 Melody Ln','Fullerton','Ca',69420);


INSERT INTO `Section` (`Sec_num`,`Classroom`,`Num_of_seats`,`end_time`,`beg_time`,`meeting_days`,`SSN`,`course_num`) VALUES (45,'ECON 300',105,'12:30','1:45','TTH',2378487,5745);

INSERT INTO `Section` (`Sec_num`,`Classroom`,`Num_of_seats`,`end_time`,`beg_time`,`meeting_days`,`SSN`,`course_num`) VALUES (46,'ECON 300',55,'8:30','7:30','MW',2378487,5746);

INSERT INTO `Section` (`Sec_num`,`Classroom`,`Num_of_seats`,`end_time`,`beg_time`,`meeting_days`,`SSN`,`course_num`) VALUES (69,'CS101',32,'1','2','MW',2847874,5893);

INSERT INTO `Section` (`Sec_num`,`Classroom`,`Num_of_seats`,`end_time`,`beg_time`,`meeting_days`,`SSN`,`course_num`) VALUES (70,'CS102',42,'2','3','TTH',2847874,5894);

INSERT INTO `Section` (`Sec_num`,`Classroom`,`Num_of_seats`,`end_time`,`beg_time`,`meeting_days`,`SSN`,`course_num`) VALUES (71,'CS301',52,'3','4','FR',4892547,5895);

INSERT INTO `Section` (`Sec_num`,`Classroom`,`Num_of_seats`,`end_time`,`beg_time`,`meeting_days`,`SSN`,`course_num`) VALUES (72,'CS302',40,'5','6:30','MW',4892547,5896);


INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (83759184,'Tom','Smith','24922 Muirlands Blvd','9499825564',49);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (88572747,'Mark','Jones','4398 Edsel Road','9492756385',49);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (89457297,'Christopher','Anderson','24621 Del Rio Via','9495572947',59);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (93757375,'Matthew','White','3151 Glendale Avenue','9498512498',49);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (95827434,'David','Wilson','3879 Denver Avenue','9495572785',59);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (97736248,'Robert','Johnson','1015 Bellecour Way','9492234885',59);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (99362748,'James','Davis','1410 S Peckham St','9491048264',59);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (99362749,'Daniel','Smith','8573 Crescent Dr','9497302753',59);

INSERT INTO `Student` (`CWID`,`FName`,`LName`,`S_address`,`Phone_#`,`Dept_num`) VALUES (99362750,'Charlie','Rodriguez','1420 S Peckham St','9497563221',49);


INSERT INTO Major (CWID_num, Dep_number)
SELECT CWID, Dept_num
FROM Student S
WHERE NOT EXISTS (SELECT CWID_num FROM Major M WHERE S.CWID = M.CWID_num);