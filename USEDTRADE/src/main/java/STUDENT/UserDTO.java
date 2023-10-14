package STUDENT; 



public class UserDTO {

	//DTO 는 database transfer object db와 정보를 교환할때 사용합니다



	String ID; 
	
	String PassWord;
	String Department;
	String PhoneNumber;
	String StudentName;
	String Grade;
	

	

	//우클릭 > Source > generate getter & setter

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

