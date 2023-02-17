-- CreateTable
CREATE TABLE `ProjectTechnology` (
    `title` VARCHAR(50) NOT NULL,
    `technology_name` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`title`, `technology_name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Projects` (
    `title` VARCHAR(50) NOT NULL,
    `project_description` TEXT NOT NULL,
    `in_progress` TINYINT NULL,
    `link` TEXT NULL,
    `is_hidden` TINYINT NULL,
    `github` TEXT NULL,

    PRIMARY KEY (`title`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ProjectTechnology` ADD CONSTRAINT `projecttechnology_ibfk_1` FOREIGN KEY (`title`) REFERENCES `Projects`(`title`) ON DELETE NO ACTION ON UPDATE NO ACTION;

