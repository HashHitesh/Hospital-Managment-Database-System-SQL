--PROCEDURES

--Patient Detail Retrieval
delimiter //
CREATE PROCEDURE PatientDetail_Retrieval(IN ID int)
BEGIN
 	SELECT Patient.Patient_ID,Patient_Name, Patient_Gender, Patient_DOB, Diagonsis, Prescription, Admitted_Date_Time, Doc_Name, Contacts.Patient_Contact_No , Patient_Address
	From Patient inner join Contacts on Patient.Patient_Contact_No = Contacts.Patient_Contact_No
    inner join diagonsis on diagonsis.Patient_ID = Patient.Patient_ID
    inner join Admitted_Patient on Admitted_Patient.Patient_ID = Patient.Patient_ID
	Where Patient.Patient_ID = ID ;
END; //
delimiter ;
CALL PatientDetail_Retrieval(VARIABLE); -- Variable is any Patient ID


--Low Stock Display
delimiter //
CREATE PROCEDURE LowStock ()
BEGIN
 	 select Equipment_ID, Equipment_Name, stock, "Low stock"
        from Medical_Supplies
        where stock<=20;
END;//
delimiter ;
CALL LowStock();


--Age of patient
delimiter //
CREATE PROCEDURE PatientAge(IN ID int)
BEGIN
 	SELECT Patient.Patient_ID, Contacts.Patient_Name, FLOOR(DATEDIFF(NOW(), Patient_DOB)/365) AS Age
	From Patient natural join Contacts
	Where Patient_ID = ID ;
END; // 
delimiter ;
CALL PatientAge(VARIABLE); -- Variable is any Patient ID


--Employee details
delimiter //
CREATE PROCEDURE EmployeeDetails(IN ID int(11))
BEGIN
 	SELECT Employee.Emp_ID, Emp_Name,  Emp_Type, Emp_DOB, Emp_Gender, Emp_Salary, Emp_Address, Employee.Emp_Contact_No
	From Employee natural join e_contacts
	Where Employee.Emp_ID = ID ;
END;//
delimiter ;
CALL EmployeeDetails(VARIABLE); -- Variable is Employee ID


--Patient Admission
delimiter //
CREATE PROCEDURE PatientAdmission(IN Name varchar(60), IN Gender varchar(50), IN DOB date, IN Addr varchar(100), IN CNo varchar(24), IN RelCNo varchar(24) )
BEGIN
	insert into Contacts values (CNo, Name);  
 	insert into Patient (Patient_Gender, Patient_DOB, Patient_Address, Patient_Contact_No, Patient_Relative_Contact_No) values (Gender, DOB, Addr, CNo, RelCNo);
    
END; //
delimiter ;
CALL PatientAdmission("Betty Adams", "Male", "1997-09-10", " 15, Al Barsha North", "0599289918", "0516554432" ); 



-- TRIGGERS

--Trigger Name: update_Medical_Suplies_Reqd
--It updates the stock reqd in medical_supplies_reqd table
delimiter //
create trigger update_Medical_Suplies_Reqd
after update on Medical_Supplies
for each row
begin
if new.Equipment_ID is not null then
 update Medical_Supplies_Reqd
        set Stock_Reqd = new.stock 
        where Equip_ID = new.Equipment_ID;
end if;
end //
delimiter ;


-- Trigger Name: update_2_Medical_Suplies_Reqd
--It inserts new equip id in medical_supplies_reqd as per insertion in medical_supplies
delimiter //
create trigger update_2_Medical_Suplies_Reqd
after insert on Medical_Supplies
for each row
begin
if new.Equipment_ID is not null then
 insert into Medical_Supplies_Reqd 
	values (new.Equipment_ID,0);
end if;
end //
delimiter ;



