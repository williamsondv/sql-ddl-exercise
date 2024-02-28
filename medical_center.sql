 DROP DATABASE IF EXISTS medical_center;
 
 CREATE DATABASE medical_center;

 /c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name varchar(25) NOT NULL,
    last_name varchar(45) NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name varchar(25) NOT NULL,
    last_name varchar(45) NOT NULL
);

CREATE TABLE diagnoses(
    id SERIAL PRIMARY KEY,
    condition_name varchar(255) NOT NULL
);

CREATE TABLE doctors_patients (
    doctor_id INT,
    patient_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

CREATE TABLE patients_diagnoses (
    patient_id INT,
    diagnosis_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    FOREIGN KEY (diagnosis_id) REFERENCES diagnoses(id) ON DELETE CASCADE
);

INSERT INTO doctors (first_name, last_name)
VALUES
('Andrew', 'Parks'),
('Michelle', 'Webber'),
('Richard', 'Reed'),
('Thaddeus', 'Venture');

INSERT INTO patients (first_name, last_name)
VALUES
('Fred', 'Newland'),
('Derek', 'Zwei'),
('Remy', 'LeBeau'),
('Greg', 'Ventress');

INSERT INTO diagnoses (condition_name)
VALUES
('hypertension'),
('gout'),
('bipolar disorder'),
('arrhythmia');

INSERT INTO doctors_patients (doctor_id, patient_id)
VALUES 
(1,1),
(1,2),
(1,3),
(2,4),
(2,3),
(3,1),
(4,1);

INSERT INTO patients_diagnoses (patient_id, diagnosis_id)
VALUES 
(1,1),
(1,2),
(1,3),
(2,4),
(2,3),
(3,1),
(4,1);