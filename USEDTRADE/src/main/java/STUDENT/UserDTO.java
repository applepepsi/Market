package STUDENT; 



public class UserDTO {

	//DTO �� database transfer object db�� ������ ��ȯ�Ҷ� ����մϴ�



	String ID; 
	
	String PassWord;
	String Department;
	String PhoneNumber;
	String StudentName;
	String Grade;
	

	

	//��Ŭ�� > Source > generate getter & setter

	public String getID() { return ID; } 
	public String getPassword() { return PassWord; }
	public String getDepartment() { return Department; } 
	
	public String getPhoneNumber() { return PhoneNumber; }
	public String getStudentName() { return StudentName; } 
	public String getGrade() { return Grade; } 
	public void setID() { this.ID= ID; } 
	public void setPassword() { this.PassWord =PassWord; }
	public void setDepartment() { this.Department =Department; } 
	 
	public void setPhoneNumber() { this.PhoneNumber= PhoneNumber; }
	public void setStudentName() { this.StudentName= StudentName; }
	public void setGrade() { this.Grade= Grade; } 
	

}

