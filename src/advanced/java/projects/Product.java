package advanced.java.projects;

public class Product {

	String ProductId;
	String Productdesc;
	Float Price;
	String Expiry_date;
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId2) {
		ProductId = productId2;
	}
	public String getProductdesc() {
		return Productdesc;
	}
	public void setProductdesc(String productdesc) {
		Productdesc = productdesc;
	}
	public Float getPrice() {
		return Price;
	}
	public void setPrice(Float price) {
		Price = price;
	}
	public String getExpiry_date() {
		return Expiry_date;
	}
	public void setExpiry_date(String expiry_date) {
		Expiry_date = expiry_date;
	}

	@Override
	public String toString() {
		return "Product [ProductId=" + ProductId + ", Productdesc=" + Productdesc + ", Price=" + Price
				+ ", Expiry_date=" + Expiry_date + "]";
	}

	

	
}
