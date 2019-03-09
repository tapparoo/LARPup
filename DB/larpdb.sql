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
-- Table `event_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_user` ;

CREATE TABLE IF NOT EXISTS `event_user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` TEXT NULL,
  `user_id` INT UNSIGNED NULL,
  `event_id` INT UNSIGNED NOT NULL,
  `picture_id` INT UNSIGNED NOT NULL,
  `signup_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cast_event1_idx` (`event_id` ASC),
  INDEX `fk_event_user_user1_idx` (`user_id` ASC),
  INDEX `fk_event_user_picture1_idx` (`picture_id` ASC),
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
INSERT INTO `event` (`id`, `name`, `description`, `date`, `story_id`, `address_id`, `create_date`) VALUES (4, 'Hands of Blue', 'The team are captured and get to meet those with hands of blue.', '2018-011-15 23:57:41', 3, 4, '2018-11-23 23:57:41');
INSERT INTO `event` (`id`, `name`, `description`, `date`, `story_id`, `address_id`, `create_date`) VALUES (5, 'Marriage of Two Races', 'Thrall and Aggra finally get together to have a marriage to bring two kingdoms together.', '2018-07-15 23:57:41', 2, 5, '2018-09-03 23:57:41');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `larpdb`;
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (1, 'Malcom Reynolds', 'Captain of the Firefly', NULL, 1, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (2, 'Hoban Washburne', 'Pilot of the Firefly', NULL, 1, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (3, 'Daenerys Targaryen', 'I know I love dragons.', NULL, 3, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (4, 'Joffrey Baratheon', 'LOL GAME OF THRONES', NULL, 3, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (5, 'Thrall', 'Orc Leader', NULL, 2, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (6, 'Jaina Proudmoore', 'A leader of the Human Empire', NULL, 2, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (7, 'Blaine Bloodhoof', 'Tauren Cheif of Tauren', NULL, 2, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (8, 'Thrall', 'Orc Leader', NULL, 5, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (9, 'Jaina Proudmoore', 'A leader of the Human Empire', NULL, 5, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (10, 'Malcom Reynolds', 'Captain of the Firefly', NULL, 4, 6, NULL);
INSERT INTO `event_user` (`id`, `name`, `description`, `user_id`, `event_id`, `picture_id`, `signup_date`) VALUES (11, 'Hoban Washburne', 'Pilot of the Firefly', NULL, 4, 6, NULL);

COMMIT;

