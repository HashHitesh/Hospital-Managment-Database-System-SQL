CREATE TABLE Patient(
        	Patient_ID int NOT NULL AUTO_INCREMENT,
        	Patient_Gender VARCHAR(50) NOT NULL,
        	Patient_DOB DATE NOT NULL,
        	Patient_Address VARCHAR(100) NOT NULL,
        	Patient_Contact_No VARCHAR(24),
        	Patient_Relative_Contact_No VARCHAR(24) NOT NULL,
        	check(Patient_Gender in ('Male', 'Female', 'Others')),
	     	FOREIGN KEY (Patient_Contact_No) REFERENCES Contacts(Patient_Contact_No) ON DELETE SET NULL,
        	PRIMARY KEY (Patient_ID)
);

CREATE TABLE Contacts(
Patient_Contact_No VARCHAR(24) NOT NULL,
Patient_Name VARCHAR(60) NOT NULL,
PRIMARY KEY(Patient_Contact_No)
);

CREATE TABLE Admitted_Patient(
        	File_ID VARCHAR(10) NOT NULL PRIMARY KEY,
        	Patient_ID int NOT NULL,
        	Ward_Type VARCHAR(20) NOT NULL,
        	Alive_Status VARCHAR(8) NOT NULL,
        	Admitted_Date_Time DATETIME NOT NULL,
        	Discharge_Date_Time DATETIME ,
        	Room_No VARCHAR(20),
	     	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
        	);

CREATE TABLE OPD(
        	Doctor_Specialisation varchar(30) NOT NULL,
	Patients_per_Doctor int ,
	Token_No int PRIMARY KEY NOT NULL auto_increment,
	Payment_Status varchar(10) NOT NULL
	);

CREATE TABLE Employee(
        	Emp_ID int PRIMARY KEY,
	Emp_Type varchar(50) NOT NULL,
	Emp_Salary int,
	Emp_DOB date NOT NULL,
	Emp_Address varchar(70) NOT NULL,
	Emp_Gender VARCHAR(50) NOT NULL,
	Emp_Contact_No VARCHAR(50),
	Emp_DOJ date NOT NULL,
	Emp_DOR date,
	FOREIGN KEY (Emp_Contact_No) REFERENCES e_contacts(Emp_Contact_No) ON DELETE SET NULL
	);

CREATE TABLE e_contacts(
Emp_Contact_No VARCHAR(50) NOT NULL,
Emp_Name VARCHAR(60) NOT NULL,
PRIMARY KEY(Emp_Contact_No)
);

CREATE TABLE Doctor_Details(
        	Doctor_ID int PRIMARY KEY,
	Doctor_Speciality varchar(50) NOT NULL,
	Doctor_Qualification varchar(60) NOT NULL,
	Dept_Name varchar(50) NOT NULL,
	FOREIGN KEY (Doctor_ID) REFERENCES Employee(Emp_ID) ON DELETE SET NULL
	);

CREATE TABLE diagonsis(
        	Appointment datetime NOT NULL,
	Doc_Name varchar(60) NOT NULL,
	Diagonsis varchar(70) NOT NULL,
        	Treatment_Status varchar(90) NOT NULL,
	Prescription varchar(50) NOT NULL,
        	Payment_Status varchar(10),
	Patient_ID int,
	PRIMARY KEY(Appointment,Doc_Name),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE SET NULL
	);

CREATE TABLE Medical_Supplies(
Equipment_ID int PRIMARY KEY,
	dept_name varchar(70),
	Equipment_name varchar(70),
	cost int,
	stock int
	);

CREATE TABLE Medical_Supplies_Reqd(
        	Equip_ID int PRIMARY KEY,
        	Stock_Reqd int DEFAULT NULL
        	);

CREATE TABLE Payment_Details(
        	Payment_ID int AUTO_INCREMENT PRIMARY KEY,
	Payment_Mode varchar(50),
	Payment_Status varchar(20),
	Payment_Amt int,
	Patient_ID int,
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ON DELETE SET NULL
	);
