package in.mindcraft.pojos;

public class Product {

	private int pid;
	
	private String name;
	
	private double cost;
	
	private int quantity;
	
	private double discount;

	public Product() {
		super();
	}

	public Product(int pid, String name, double cost, int quantity, double discount) {
		super();
		this.pid = pid;
		this.name = name;
		this.cost = cost;
		this.quantity = quantity;
		this.discount = discount;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", name=" + name + ", cost=" + cost + ", quantity=" + quantity + ", discount="
				+ discount + "]";
	}
	
	
}
