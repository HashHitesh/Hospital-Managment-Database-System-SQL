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

INSERT INTO contacts VALUES
(0501234992,"Dipta Das"),
(0504567992,"Maxwell Thomas"),
(0504567883,"Daniel Mahone"),
(0514569420,"Lucifer Stark"),
(0514789729,"Linda Matthews"),
(0534769379,"Shea Holmes"),
(0556529424,"Collin Dan"),
(0589565421,"Elizabeth Brawn"),
(0544789129,"Danny Hills"),
(0584569420,"Paul Adams"),
(0514578620,"Lisa Johns"),
(0514599270,"Allen Watson"),
(0567869427,"Eddie Wills"),
(0584239125,"Mary Thomas"),
(0514099471,"Stacy Gweno");

INSERT INTO Patient VALUES
(1,"Female","1985-04-23","Dubai Marina",0501234992,0561264129),
(2,"Male","1983-06-13","Jebel Ali",0504567992,0513464569),
(3,"Male","1990-10-20","Buisness Bay",0504567883,0513424570),
(4,"Male","1990-05-09","Sharjah",0514569420,0563244579),
(5,"Female","1990-11-17","Silicon Oasis",0514789729,0562374575),
(6,"Female","1981-04-18","Al-Faydi",0534769379,0510334567),
(7,"Male","1981-02-09","Al-Safa",0556529424,0529334565),
(8,"Female","1989-10-19","Khawneej",0589565421,0514424579),
(9,"Others","1982-07-21","Al-Bharsa",0544789129,0568374277),
(10,"Male","1989-09-11","Downtown",0584569420,0568374277),
(11,"Female","1991-02-03","Industrial City",0514578620,0563874297),
(12,"Male","1983-06-10","Bay Avenue",0514599270,0518974290),
(13,"Male","1988-10-11","Rashidiya",0567869427,0528934291),
(14,"Female","1988-05-01","GIGICO",0584239125,0578034231),
(15,"Female","1985-02-15","UAE Exchange",0514099471,0579344564);

INSERT INTO e_contacts VALUES
(0545291420,"Polly Taylor"),
(0575136820,"John Adams"),
(0547771450,"Losef Vasilly"),
(0592291890,"Ashley Jordan"),
(0568245100,"Ygritte Snow"),
(0586952424,"Olly Stone"),
(0548622263,"Pierce Kane"),
(0532569874,"Chloe Decker"),
(0575205369,"Arthur Selmy"),
(0548621630,"Mycroft Espinoza"),
(0553209856,"Ellie Williams"),
(0510256939,"Johnny Lynn"),
(0585201476,"Daniel Joseph"),
(0578935410,"Zack Ryder"),
(0535697527,"Chris Jericho");

INSERT INTO Employee VALUES
(101,"Doctor",10000,"1980-04-13","Bay Avenue","Female",0545291420,"2016-05-23",NULL),
(102,"Doctor",30000,"1985-08-09","Industrial City","Male",0575136820,"2014-11-12",NULL),
(103,"Doctor",12000,"1989-11-24","GIGICO","Male",0547771450,"2014-09-15","2020-06-02"),
(104,"Doctor",8000,"1990-08-24","Rashidiya","Female",0592291890,"2015-10-20",NULL),
(105,"Doctor",15800,"1983-07-21","Jebel Ali","Female",0568245100,"2019-11-17",NULL),
(106,"Ward Boy",8500 ,"1991-11-24","Sharjah","Male",0586952424,"2017-02-19",NULL),
(107,"Doctor",14000,"1985-09-17","Ajman","Male",0548622263,"2016-05-23",NULL),
(108,"Nurse",8000,"1984-06-12","Atlantic City","Female",0532569874,"2016-05-23",NULL),
(109,"Doctor",20000 ,"1988-12-23","Al-Bharsha","Male",0575205369,"2016-08-15",NULL),
(110,"Doctor",25000,"1980-02-03","Buisness Bay","Male",0548621630,"2009-01-19",NULL),
(111,"Nurse",9000,"1987-05-03","Downtown","Female",0553209856,"2018-10-18",NULL),
(112,"Doctor",28000,"1991-02-24","Abu Dhabi","Male",0510256939,"2010-08-13",NULL),
(113,"Doctor",18000,"1990-08-18","Bur Juman","Male",0585201476,"2011-03-03","2019-12-21"),
(114,"Doctor",32000,"1989-09-04","Bur Dubai","Male",0578935410,"2019-05-29",NULL),
(115,"Ward Boy",8500,"1994-05-19","International City","Male",0535697527,"2013-07-12",NULL);

INSERT INTO doctor_details VALUES
(101,"Brain Tumor","MBBS,MD(Oncology)","Oncology"),
(102,"Brain Haemorrhage","MBBS,MD(Neurology),MS","Neurology"),
(104,"COVID-19","MBBS,MD","Virology"),
(105,"Hair Loss","MBBS,MD","Dermatology"),
(107,"Cardiac Arrest","MBBS,MD(Cardiology),MS","Cardiology"),
(109,"Heart Transplant","MBBS,MD(Cardiology),MS,PhD","Oncology"),
(110,"Physician","MBBS","Physician"),
(112,"Geriatrics","MBBS,MD","Physician"),
(114,"gastrointestinal dysfuntion","MBBS,MD(Gastrology),B. Med","Gastrology");

INSERT INTO OPD VALUES
("Cardiologist",2,15,"Success"),
("Neurologist",6,20,"Pending"),
("Physician",9,21,"Success"),
("Neurologist",11,25,"Success"),
("Gynecologist",12,27,"Pending"),
("Ophthalmologist",14,28,"Success"),
("Dermatologist",16,30,"Success"),
("Allergist",19,33,"Pending"),
("Gynecologist",22,34,"Success"),
("Gastroenterologist",23,37,"Success"),
("Orthopaedist",26,39,"Success"),
("Nephrologist",29,44,"Pending"),
("Physician",33,47,"Success"),
("Cardiologist",34,48,"Success");

INSERT INTO Admitted_Patient VALUES
(1001,1,"Private","Alive","2021-02-01 12:10:55",NULL,101),
(1002,2,"General","Alive","2020-12-23 15:45:29",NULL,102),
(1003,3,"ICU","Alive","2021-02-10 19:56:55",NULL,103),
(1004,4,"Discharged","Alive","2021-02-01 12:10:55","2021-02-05 09:05:30",NULL),
(1005,5,"General","Alive","2021-02-01 12:10:55",NULL,105),
(1006,6,"Morgue","Deceased","2021-04-05 06:23:55","2021-04-05 18:33:56",NULL),
(1007,7,"Private","Alive","2020-11-13 15:17:32",NULL,106),
(1008,8,"ICU","Alive","2021-01-21 07:06:21",NULL,107),
(1009,9,"Private","Alive","2021-03-17 15:39:12",NULL,108),
(1010,10,"General","Alive","2021-01-19 08:18:30",NULL,109),
(1011,11,"Discharged","Alive","2020-10-12 17:13:28","2020-10-18 12:47:17",NULL),
(1012,12,"Private","Alive","2020-10-19 20:41:31",NULL,111),
(1013,13,"Morgue","Deceased","2021-02-06 19:18:55","2021-02-08 03:09:13",NULL),
(1014,14,"General","Alive","2021-03-12 01:19:21",NULL,112),
(1015,15,"ICU","Alive","2020-12-14 05:03:29",NULL,113);

INSERT INTO diagonsis VALUES
("2021-03-05 11:10:55","Polly Taylor","Cancer","Ongoing","Chemo Therapy","Success",1),
("2021-01-02 12:45:29","John Adams","Migraine","Ongoing","Bed Rest","Success",2),
("2021-02-12 12:56:55","Ashley Jordan","COVID-19","Ongoing","Oxygen Therapy,remdivsir","Pending",3),
("2021-02-04 19:05:30","Polly Taylor","Brain Tumor","Completed","Surgery","Success",4),
("2021-02-03 14:05:21","Ygritte Snow","Acne","Ongoing","Facial","Success",5),
("2021-03-05 09:14:12","Pierce Kane","Cardiac Arrest","Completed","Defibrillation","Success",6),
("2020-11-15 10:30:00","John Adams","Alzheimer","Ongoing","Medication","Success",7),

("2021-03-05 18:20:00","Arthur Selmy","Cardiogenic Pulmonary Edema","Ongoing","Heart Transplant","Success",8),
("2021-03-07 07:06:21","Zack Ryder","Ulcers","Ongoing","Antibiotic Medications","Pending",9),
("2021-01-19 19:10:00","Johnny Lynn","Asthma","Ongoing","Inhaler","Success",10),
("2020-10-14 13:30:00","Daniel Joseph","Kidney Failure","Completed","Dialysis","Success",11),
("2020-10-19 06:15:00","John Adams","Car Accident Brain Haemorrhage","Ongoing","Brain Surgery","Success",12),
("2021-02-16 19:20:30","Ashley Jordan","COVID-19","Completed","Ventilator","Success",13),
("2021-03-12 11:30:15","Johnny Lynn","Dengue","Ongoing","Blood Transfusion","Pending",14),
("2020-12-14 15:45:00","Polly Taylor","Multiple Organ Failure","Ongoing","Ventilator,Surgery","Success",15);

INSERT INTO Medical_Supplies VALUES
(501,"Oncology","FoundationOne CDx",124500,8),
(502,"Oncology","Abbott RealTime IDH1",22060,12),
(504,"Neurology","Neurosurgery Surgical Tool Kit",134000,5),
(505,"Neurology","Transcutaneous neurostimulators",45000,10),
(508,"Cardiology","Holter Monitor – ECG",32000,18),
(509,"Cardiology","Echo cardiography machine ",50000,20),
(512,"Virology","light microscope",12500,15),
(513,"Virology","antigen testing tool kit",22000,20),
(515,"Physician","Stethoscope",3400,18),
(516,"Physician","Pulse oximeter",7800,8),
(520,"Nephrology","Adimea Dialysis Machine",28000,5),
(522,"Nephrology","StoneBreaker Pneumatic Lithotripter",28000,10),
(525,"Gastrology","Gastroscope",7900,12),
(526,"Gastrology","Ultrasound endoscope",12500,14),
(530,"Dermatology","Dermal Biopsy Punches",32150,9);

INSERT INTO Medical_Supplies_Reqd VALUES
(501,0),
(502,0),
(504,0),
(505,0),
(508,0),
(509,0),
(512,0),
(513,0),
(515,0),
(516,0),
(520,0),
(522,0),
(525,0),
(526,0),
(530,0);

INSERT INTO Medical_Supplies VALUES
(201,"Cash","Success",1000,1),
(202,"Visa Card","Success",500,2),
(203,"Master Card","Pending",3000,3),
(204,"Medical Insurance","Success",20000,4),
(205,"Cash","Success",700,5);
