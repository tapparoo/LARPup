-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema larpdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `larpdb` ;

-- -----------------------------------------------------
-- Schema larpdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `larpdb` DEFAULT CHARACTER SET utf8 ;
USE `larpdb` ;

-- -----------------------------------------------------
-- Table `picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `picture` ;

CREATE TABLE IF NOT EXISTS `picture` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `url` TEXT NOT NULL,
  `alt` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  `zipcode` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nickname` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `role` VARCHAR(15) NOT NULL DEFAULT 'user',
  `birth_date` DATE NOT NULL,
  `picture_id` INT UNSIGNED NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_picture1_idx` (`picture_id` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`nickname` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `fk_user_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `picture_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_genre_picture1_idx` (`picture_id` ASC),
  CONSTRAINT `fk_genre_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story` ;

CREATE TABLE IF NOT EXISTS `story` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NULL,
  `address_id` INT UNSIGNED NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `genre_id` INT UNSIGNED NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_story_address1_idx` (`address_id` ASC),
  INDEX `fk_story_user1_idx` (`user_id` ASC),
  INDEX `fk_story_genre1_idx` (`genre_id` ASC),
  CONSTRAINT `fk_story_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_story_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NULL,
  `date` DATETIME NOT NULL,
  `story_id` INT UNSIGNED NOT NULL,
  `address_id` INT UNSIGNED NOT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_story1_idx` (`story_id` ASC),
  INDEX `fk_event_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_event_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_user_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_user_info` ;

CREATE TABLE IF NOT EXISTS `event_user_info` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `description` TEXT NULL,
  `story_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_user_info_story1_idx` (`story_id` ASC),
  CONSTRAINT `fk_event_user_info_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_user` ;

CREATE TABLE IF NOT EXISTS `event_user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `signup_date` DATETIME NULL,
  `user_id` INT UNSIGNED NULL,
  `event_id` INT UNSIGNED NOT NULL,
  `picture_id` INT UNSIGNED NOT NULL,
  `event_user_info_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cast_event1_idx` (`event_id` ASC),
  INDEX `fk_event_user_user1_idx` (`user_id` ASC),
  INDEX `fk_event_user_picture1_idx` (`picture_id` ASC),
  INDEX `fk_event_user_event_user_info1_idx` (`event_user_info_id` ASC),
  CONSTRAINT `fk_cast_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_user_event_user_info1`
    FOREIGN KEY (`event_user_info_id`)
    REFERENCES `event_user_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` TEXT NOT NULL,
  `post_time` DATETIME NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `event_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_picture` ;

CREATE TABLE IF NOT EXISTS `story_picture` (
  `picture_id` INT UNSIGNED NOT NULL,
  `story_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`picture_id`, `story_id`),
  INDEX `fk_picture_has_story_story1_idx` (`story_id` ASC),
  INDEX `fk_picture_has_story_picture1_idx` (`picture_id` ASC),
  CONSTRAINT `fk_picture_has_story_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_picture_has_story_story1`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_picture` ;

CREATE TABLE IF NOT EXISTS `event_picture` (
  `event_id` INT UNSIGNED NOT NULL,
  `picture_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`event_id`, `picture_id`),
  INDEX `fk_event_has_picture_picture1_idx` (`picture_id` ASC),
  INDEX `fk_event_has_picture_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_event_has_picture_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_picture_picture1`
    FOREIGN KEY (`picture_id`)
    REFERENCES `picture` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `story_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `story_comment` ;

CREATE TABLE IF NOT EXISTS `story_comment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` TEXT NOT NULL,
  `post_time` DATETIME NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `story_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_event10_idx` (`story_id` ASC),
  CONSTRAINT `fk_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_event10`
    FOREIGN KEY (`story_id`)
    REFERENCES `story` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS larper@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'larper'@'localhost' IDENTIFIED BY 'larper';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'larper'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `picture`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `picture` (`id`, `url`, `alt`) VALUES (1, 'https://m.media-amazon.com/images/M/MV5BMjEzMjk1NTA1Ml5BMl5BanBnXkFtZTcwNjQyNjAwOQ@@._V1_UX214_CR0,0,214,317_AL_.jpg', 'profile image');
INSERT INTO `picture` (`id`, `url`, `alt`) VALUES (2, 'https://m.media-amazon.com/images/M/MV5BMTY4NTEwNDg1MV5BMl5BanBnXkFtZTgwODMwMDA0ODE@._V1_UY317_CR20,0,214,317_AL_.jpg', 'profile image');
INSERT INTO `picture` (`id`, `url`, `alt`) VALUES (3, 'https://m.media-amazon.com/images/M/MV5BMTQyNjUzMDk5N15BMl5BanBnXkFtZTcwNzk0Nzk5Mw@@._V1_UY317_CR10,0,214,317_AL_.jpg', 'profile image');
INSERT INTO `picture` (`id`, `url`, `alt`) VALUES (4, 'https://starwarsblog.starwars.com/wp-content/uploads/2018/08/battlefront-2-clone-troopers-tall.jpg', 'genre image');
INSERT INTO `picture` (`id`, `url`, `alt`) VALUES (5, 'https://i.pinimg.com/originals/9f/73/d4/9f73d4cfd7c0004838021368610070be.jpg', 'genre image');
INSERT INTO `picture` (`id`, `url`, `alt`) VALUES (6, 'https://upload.wikimedia.org/wikipedia/en/1/13/MalReynoldsFirefly.JPG', 'Malcolm Reynolds');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES (1, '631 N Institute Street', 'Colorado Springs', 'Colorado', '80903', '8143307304');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES (2, '374 Hordor Lane', 'Denver', 'Colorado', '82952', '3037693492');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES (3, '3753 Firehose Circle', 'Raleigh', 'North Carolina', '27616', '9197686467');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES (4, '18300 W Alameda Pkwy', 'Lakewood', 'Colorado', '80465', '7208652492');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES (5, '1701 Bryant St', 'Denver', 'Colorado', '80204', '7202583000');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES (6, NULL, 'Colorado Springs', 'Colorado', '80903', NULL);
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zipcode`, `phone`) VALUES (7, NULL, 'Denver', 'Colorado', '80237', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `user` (`id`, `nickname`, `first_name`, `last_name`, `password`, `email`, `role`, `birth_date`, `picture_id`, `address_id`, `create_date`) VALUES (1, 'NerdAvenger', 'Greg', 'Kraehenbuehl', 'greg', 'KingNerd@gmail.com', 'admin', '1981-03-06', 1, 1, '2018-02-15 23:57:41');
INSERT INTO `user` (`id`, `nickname`, `first_name`, `last_name`, `password`, `email`, `role`, `birth_date`, `picture_id`, `address_id`, `create_date`) VALUES (2, 'Exorcist', 'Adam', 'Whatever', 'adam', 'Excecutioner@aol.com', 'user', '1955-06-22', 2, 2, '2018-02-15 23:57:41');
INSERT INTO `user` (`id`, `nickname`, `first_name`, `last_name`, `password`, `email`, `role`, `birth_date`, `picture_id`, `address_id`, `create_date`) VALUES (3, 'Pikachu', 'Young', 'Awesome', 'young', 'ClassicRed@hotmail.com', 'user', '1999-04-01', 3, 3, '2018-02-15 23:57:41');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `genre` (`id`, `name`, `picture_id`) VALUES (1, 'Space Operah', 4);
INSERT INTO `genre` (`id`, `name`, `picture_id`) VALUES (2, 'Medievil', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `story` (`id`, `name`, `description`, `address_id`, `user_id`, `genre_id`, `create_date`) VALUES (1, 'Game of Thrones', 'An epic story about battles, and possibly dragons.', 6, 3, 2, '2018-03-15 23:57:41');
INSERT INTO `story` (`id`, `name`, `description`, `address_id`, `user_id`, `genre_id`, `create_date`) VALUES (2, 'World of Warcraft', 'An epic story about Thrall falling in love with a human.', 7, 2, 2, '2018-04-15 23:57:41');
INSERT INTO `story` (`id`, `name`, `description`, `address_id`, `user_id`, `genre_id`, `create_date`) VALUES (3, 'Firefly', 'An space drama with a crew of unrelated people surviving on nothing.', 6, 3, 1, '2018-04-26 23:57:41');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `event` (`id`, `name`, `description`, `date`, `story_id`, `address_id`, `create_date`) VALUES (1, 'Train Heist', 'The team are on a mission to take some much needed medical suplies from a train.', '2018-06-15 23:57:41', 3, 4, '2018-06-17 23:57:41');
INSERT INTO `event` (`id`, `name`, `description`, `date`, `story_id`, `address_id`, `create_date`) VALUES (2, 'First Banquette', 'Two kingdoms call peace and a risky banquette is had.', '2018-04-15 23:57:41', 2, 4, '2018-07-15 23:57:41');
INSERT INTO `event` (`id`, `name`, `description`, `date`, `story_id`, `address_id`, `create_date`) VALUES (3, 'Battle for Hodor', 'An epic battle between the three nations!', '2018-08-15 23:57:41', 1, 5, '2018-08-12 23:57:41');
INSERT INTO `event` (`id`, `name`, `description`, `date`, `story_id`, `address_id`, `create_date`) VALUES (4, 'Hands of Blue', 'The team are captured and get to meet those with hands of blue.', '2018-11-15 23:57:41', 3, 4, '2018-11-23 23:57:41');
INSERT INTO `event` (`id`, `name`, `description`, `date`, `story_id`, `address_id`, `create_date`) VALUES (5, 'Marriage of Two Races', 'Thrall and Aggra finally get together to have a marriage to bring two kingdoms together.', '2018-07-15 23:57:41', 2, 5, '2018-09-03 23:57:41');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_user_info`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `event_user_info` (`id`, `name`, `description`, `story_id`) VALUES (1, 'Thrall', 'An orc, that wants a human wife, for whatever reason.', 2);
INSERT INTO `event_user_info` (`id`, `name`, `description`, `story_id`) VALUES (2, 'Jaina', 'Someone in world of warcraft about to marry and orc', 2);
INSERT INTO `event_user_info` (`id`, `name`, `description`, `story_id`) VALUES (3, 'Malcom', 'Captain of the Firefly', 3);
INSERT INTO `event_user_info` (`id`, `name`, `description`, `story_id`) VALUES (4, 'Wash', 'I am a leaf on the wind.', 3);
INSERT INTO `event_user_info` (`id`, `name`, `description`, `story_id`) VALUES (5, 'Daenerys Targaryen', 'I like dragons!', 1);
INSERT INTO `event_user_info` (`id`, `name`, `description`, `story_id`) VALUES (6, 'Joffrey', 'I ... am in game of thrones.', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (1, '2018-11-28 23:57:41', NULL, 4, 6, 3);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (2, '2018-11-25 23:57:41', NULL, 4, 6, 4);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (3, '2018-06-19 23:57:41', NULL, 1, 6, 3);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (4, '2018-07-18 23:57:41', NULL, 2, 6, 1);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (5, '2018-09-07 23:57:41', NULL, 5, 6, 2);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (6, '2018-07-16 23:57:41', NULL, 2, 6, 2);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (7, '2018-09-10 23:57:41', NULL, 5, 6, 1);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (8, '2018-08-17 23:57:41', NULL, 3, 6, 5);
INSERT INTO `event_user` (`id`, `signup_date`, `user_id`, `event_id`, `picture_id`, `event_user_info_id`) VALUES (9, '2018-08-15 23:57:41', NULL, 3, 6, 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `event_comment` (`id`, `comment`, `post_time`, `user_id`, `event_id`) VALUES (1, 'Dude that guy was such a tool.', '2019-03-06 23:57:41', 1, 1);
INSERT INTO `event_comment` (`id`, `comment`, `post_time`, `user_id`, `event_id`) VALUES (2, 'Working with the bar wench was amazing.', '2019-03-06 23:57:41', 2, 2);
INSERT INTO `event_comment` (`id`, `comment`, `post_time`, `user_id`, `event_id`) VALUES (3, 'Woot! I leveled up!', '2019-03-06 23:57:41', 3, 3);
INSERT INTO `event_comment` (`id`, `comment`, `post_time`, `user_id`, `event_id`) VALUES (4, 'Can\'t wait for the next event.', '2019-03-06 23:57:41', 2, 4);
INSERT INTO `event_comment` (`id`, `comment`, `post_time`, `user_id`, `event_id`) VALUES (5, 'I made so many friends!', '2019-03-06 23:57:41', 1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `story_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `story_comment` (`id`, `comment`, `post_time`, `user_id`, `story_id`) VALUES (1, 'This story is amazing.', '2019-03-06 23:57:41', 1, 3);
INSERT INTO `story_comment` (`id`, `comment`, `post_time`, `user_id`, `story_id`) VALUES (2, 'The DM is such a dumb ass.', '2019-03-06 23:57:41', 2, 1);
INSERT INTO `story_comment` (`id`, `comment`, `post_time`, `user_id`, `story_id`) VALUES (3, 'This should be the only story you come to.', '2019-03-06 23:57:41', 3, 2);

COMMIT;

