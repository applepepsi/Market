package PRODUCTLIST; 



public class ProductDTO {

	//DTO �� database transfer object�� �����̰� db�� ��ȯ�Ҷ� ����մϴ�



	int ProductNum;
	String ProductName;
	int price;
	String catecode;
	String productstate;
	String content;
	String ID;
	String PhoneNumber;
	//��Ŭ�� > Source > generate getter & setter
	public void setProductNum(int ProductNum) { this.ProductNum=ProductNum; } 
	public void setProductName(String ProductName) { this.ProductName =ProductName; }
	public void setprice() { this.price= price; }
	public void setcatecode() { this.catecode= catecode; }
	public void setproductstate() { this.productstate= productstate; }
	public void setcontent() { this.content= content; }
	public void setID() { this.ID= ID; }
	public void setPhoneNumber() { this.PhoneNumber= PhoneNumber; }
	
	public int getProductNum() { return ProductNum; }
	public String getProductName() { return ProductName; }
	public int getprice() { return price; }
	public String getcatecode() { return catecode; }
	public String getproductstate() { return productstate; }
	public String getcontent() { return content; }
	public String getID() { return ID; }
	public String getPhoneNumber() { return PhoneNumber; }
	 {
		// TODO Auto-generated method stub
		
	}
	
	

}

