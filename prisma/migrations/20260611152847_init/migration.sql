-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` ENUM('ADMIN', 'DOCTOR', 'NURSE', 'PATIENT') NOT NULL DEFAULT 'PATIENT',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Doctor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `specialization` VARCHAR(191) NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Doctor_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Nurse` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Nurse_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patient` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `dateOfBirth` DATETIME(3) NOT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Patient_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Appointment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `dateTime` DATETIME(3) NOT NULL,
    `status` ENUM('PENDING', 'CONFIRMED', 'CANCELLED', 'COMPLETED') NOT NULL DEFAULT 'PENDING',
    `reason` VARCHAR(191) NOT NULL,
    `notes` VARCHAR(191) NULL,
    `doctorId` INTEGER NOT NULL,
    `patientId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Diagnosis` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `description` VARCHAR(191) NOT NULL,
    `prescription` VARCHAR(191) NULL,
    `appointmentId` INTEGER NOT NULL,

    UNIQUE INDEX `Diagnosis_appointmentId_key`(`appointmentId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Doctor` ADD CONSTRAINT `Doctor_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Nurse` ADD CONSTRAINT `Nurse_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Patient` ADD CONSTRAINT `Patient_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Diagnosis` ADD CONSTRAINT `Diagnosis_appointmentId_fkey` FOREIGN KEY (`appointmentId`) REFERENCES `Appointment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
