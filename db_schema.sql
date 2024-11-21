CREATE DATABASE HealthHeroDB;

USE HealthHeroDB;

CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Consultations (
    ConsultationID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    ConsultationDate DATETIME,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Diagnoses (
    DiagnosisID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultationID INT,
    DiagnosisDescription TEXT,
    DiagnosisDate DATETIME,
    FOREIGN KEY (ConsultationID) REFERENCES Consultations(ConsultationID)
);

CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultationID INT,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ConsultationID) REFERENCES Consultations(ConsultationID)
);

CREATE TABLE TreatmentPlans (
    PlanID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultationID INT,
    TreatmentDescription TEXT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ConsultationID) REFERENCES Consultations(ConsultationID)
);

-- Insert Dummy Data
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email, Address)
VALUES ('John', 'Doe', '1985-06-15', 'Male', '1234567890', 'john.doe@example.com', '123 Elm Street');
