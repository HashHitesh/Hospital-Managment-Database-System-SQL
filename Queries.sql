--List all doctors with qualification of Cardiology
SELECT dd.Doctor_ID, ec.Emp_Name, dd.Doctor_Speciality, dd.Doctor_Qualification 
FROM Doctor_Details dd, Employee e, e_contacts ec
WHERE dd.Doctor_ID = e.Emp_ID and e.Emp_Contact_No = ec.Emp_Contact_No and Doctor_Qualification LIKE "%Cardiology%" ;


--List all the patients OF the age > 18 who died of covid.
SELECT p.Patient_ID, c.Patient_Name, FLOOR(DATEDIFF(NOW(), Patient_DOB)/365) AS Age
FROM Patient p, Contacts c, Admitted_Patient ap, diagonsis d
WHERE FLOOR(DATEDIFF(NOW(), Patient_DOB)/365) > 18 and Alive_Status = "Deceased" and diagonsis = "COVID-19" and p.Patient_ID = ap.Patient_ID and
c.Patient_Contact_No = p.Patient_Contact_No and d.Patient_ID = p.Patient_ID;


--To count number of patients handled by 1 doctor whose treatment was completed
select d1.Doc_Name, count(d1.Patient_ID) 
from diagonsis d1
where Treatment_Status = "Completed" and d1.Doc_Name = (select d2.Doc_Name from diagonsis d2 where d1.Patient_ID = d2.Patient_ID) group by d1.Doc_Name;


--List stock of medical equipment per dept
SELECT dept_name, sum(stock) FROM Medical_supplies GROUP BY dept_name;

   select Equipment_ID, Equipment_Name, stock, "Low stock"
        from Medical_Supplies
        where stock<=20;


--List all the doctors who have resigned but worked in the hospital more than 2 years.
select e.Emp_ID, ec.Emp_Name
from Employee e natural join e_contacts ec 
where Emp_Type = "Doctor" and  Emp_DOR is not null and FLOOR(DATEDIFF(Emp_DOR, Emp_DOJ)/365) >2;



