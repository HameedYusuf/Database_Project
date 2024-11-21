CREATE DATABASE HealthHeroDB;

USE HealthHeroDB;

-- Patients Table
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

-- Doctors Table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Consultations Table
CREATE TABLE Consultations (
    ConsultationID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    ConsultationDate DATETIME,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Diagnoses Table
CREATE TABLE Diagnoses (
    DiagnosisID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultationID INT,
    DiagnosisDescription TEXT,
    DiagnosisDate DATETIME,
    FOREIGN KEY (ConsultationID) REFERENCES Consultations(ConsultationID)
);

-- Medications Table
CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultationID INT,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ConsultationID) REFERENCES Consultations(ConsultationID)
);

-- Treatment Plans Table
CREATE TABLE TreatmentPlans (
    PlanID INT AUTO_INCREMENT PRIMARY KEY,
    ConsultationID INT,
    TreatmentDescription TEXT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ConsultationID) REFERENCES Consultations(ConsultationID)
);

-- Insert 10 dummy records into Patients
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email, Address) VALUES
('John', 'Doe', '1985-06-15', 'Male', '1234567890', 'john.doe@example.com', '123 Elm Street'),
('Jane', 'Smith', '1990-02-20', 'Female', '0987654321', 'jane.smith@example.com', '456 Oak Avenue'),
('Emily', 'Johnson', '2000-11-05', 'Female', '9876543210', 'emily.johnson@example.com', '789 Pine Lane'),
('Michael', 'Brown', '1975-07-22', 'Male', '8765432109', 'michael.brown@example.com', '101 Maple Road'),
('Chris', 'Taylor', '1982-12-30', 'Male', '7654321098', 'chris.taylor@example.com', '202 Birch Blvd'),
('Olivia', 'Anderson', '1995-05-10', 'Female', '6543210987', 'olivia.anderson@example.com', '303 Willow Way'),
('Liam', 'Martin', '1988-09-15', 'Male', '5432109876', 'liam.martin@example.com', '404 Cedar Street'),
('Sophia', 'Harris', '2001-01-25', 'Female', '4321098765', 'sophia.harris@example.com', '505 Walnut Avenue'),
('Noah', 'Clark', '1993-03-12', 'Male', '3210987654', 'noah.clark@example.com', '606 Cherry Lane'),
('Ava', 'Walker', '1987-08-18', 'Female', '2109876543', 'ava.walker@example.com', '707 Sycamore Drive');

-- Insert 10 dummy records into Doctors
INSERT INTO Doctors (FirstName, LastName, Specialization, ContactNumber, Email) VALUES
('Dr. Sarah', 'Connor', 'Cardiology', '1111111111', 'sarah.connor@example.com'),
('Dr. James', 'Wilson', 'Neurology', '2222222222', 'james.wilson@example.com'),
('Dr. Karen', 'Adams', 'Orthopedics', '3333333333', 'karen.adams@example.com'),
('Dr. William', 'Turner', 'Pediatrics', '4444444444', 'william.turner@example.com'),
('Dr. Emily', 'Davis', 'Oncology', '5555555555', 'emily.davis@example.com'),
('Dr. Michael', 'Jones', 'Dermatology', '6666666666', 'michael.jones@example.com'),
('Dr. Jessica', 'Lee', 'General Practice', '7777777777', 'jessica.lee@example.com'),
('Dr. Daniel', 'Miller', 'Psychiatry', '8888888888', 'daniel.miller@example.com'),
('Dr. Laura', 'Scott', 'Endocrinology', '9999999999', 'laura.scott@example.com'),
('Dr. Robert', 'Taylor', 'Gastroenterology', '0000000000', 'robert.taylor@example.com');

-- Insert 10 dummy records into Consultations
INSERT INTO Consultations (PatientID, DoctorID, ConsultationDate, Notes) VALUES
(1, 1, '2023-10-01 10:00:00', 'Routine heart checkup'),
(2, 2, '2023-10-02 11:00:00', 'Migraine consultation'),
(3, 3, '2023-10-03 12:00:00', 'Knee pain assessment'),
(4, 4, '2023-10-04 09:30:00', 'Child vaccination'),
(5, 5, '2023-10-05 10:45:00', 'Cancer screening'),
(6, 6, '2023-10-06 14:00:00', 'Skin rash consultation'),
(7, 7, '2023-10-07 15:00:00', 'Annual physical checkup'),
(8, 8, '2023-10-08 16:00:00', 'Anxiety management session'),
(9, 9, '2023-10-09 13:00:00', 'Thyroid function test'),
(10, 10, '2023-10-10 10:15:00', 'Digestive issue assessment');

-- Insert 10 dummy records into Diagnoses
INSERT INTO Diagnoses (ConsultationID, DiagnosisDescription, DiagnosisDate) VALUES
(1, 'Mild arrhythmia', '2023-10-01'),
(2, 'Chronic migraine', '2023-10-02'),
(3, 'Torn ACL', '2023-10-03'),
(4, 'Routine vaccination', '2023-10-04'),
(5, 'Breast cancer stage 1', '2023-10-05'),
(6, 'Eczema', '2023-10-06'),
(7, 'Normal results', '2023-10-07'),
(8, 'Generalized anxiety disorder', '2023-10-08'),
(9, 'Hypothyroidism', '2023-10-09'),
(10, 'Irritable bowel syndrome', '2023-10-10');

-- Insert 10 dummy records into Medications
INSERT INTO Medications (ConsultationID, MedicationName, Dosage, StartDate, EndDate) VALUES
(1, 'Aspirin', '81mg daily', '2023-10-01', '2023-12-01'),
(2, 'Sumatriptan', '50mg as needed', '2023-10-02', '2023-12-02'),
(3, 'Ibuprofen', '400mg daily', '2023-10-03', '2023-11-03'),
(4, 'Tylenol', '5ml every 6 hours', '2023-10-04', '2023-10-07'),
(5, 'Tamoxifen', '20mg daily', '2023-10-05', '2023-12-05'),
(6, 'Hydrocortisone cream', 'Apply twice daily', '2023-10-06', '2023-10-20'),
(7, 'Multivitamin', 'One daily', '2023-10-07', '2023-12-07'),
(8, 'Sertraline', '50mg daily', '2023-10-08', '2024-01-08'),
(9, 'Levothyroxine', '100mcg daily', '2023-10-09', '2024-01-09'),
(10, 'Loperamide', '2mg as needed', '2023-10-10', '2023-10-20');

-- Insert 10 dummy records into Treatment Plans
INSERT INTO TreatmentPlans (ConsultationID, TreatmentDescription, StartDate, EndDate) VALUES
(1, 'Lifestyle changes, low-sodium diet', '2023-10-01', '2023-12-01'),
(2, 'Stress management and medication', '2023-10-02', '2023-12-02'),
(3, 'Physical therapy for knee', '2023-10-03', '2023-12-03'),
(4, 'Routine follow-up after vaccination', '2023-10-04
