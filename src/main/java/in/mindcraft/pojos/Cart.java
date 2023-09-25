package in.mindcraft.pojos;

public class Cart {
	private String username;
	
	private int pid;
	
	private String name;
	
	private double cost;
	
	private int quantity;
	
	private double discount;
	
	private String invoiced;

	public Cart() {
		super();
	}

	public Cart(String username, int pid, String name, double cost,int quantity, double discount, String invoiced) {
		super();
		this.username = username;
		this.pid = pid;
		this.name = name;
		this.cost = cost;
		this.quantity = quantity;
		this.discount = discount;
		this.invoiced = invoiced;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getInvoiced() {
		return invoiced;
	}

	public void setInvoiced(String invoiced) {
		this.invoiced = invoiced;
	}
	
	
	
	
}
