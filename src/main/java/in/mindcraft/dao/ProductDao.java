package in.mindcraft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import in.mindcraft.pojos.Product;
import in.mindcraft.utils.DBUtils;

public class ProductDao {

	private Connection cn;
	
	private PreparedStatement psmt1;

	private PreparedStatement psmt2;
	
	public void addProduct(Product p) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		cn = DBUtils.openConnect();
		
		psmt1 = cn.prepareStatement("Insert into product values(?,?,?,?,?)");
		
		psmt1.setInt(1, p.getPid());
		
		psmt1.setString(2, p.getName());
		
		psmt1.setDouble(3, p.getCost());
		
		psmt1.setInt(4, p.getQuantity());
		
		psmt1.setDouble(5, p.getDiscount());
		
		psmt1.execute();
		
		DBUtils.closeConnect();
		
	}
	
	public List<Product> showProduct() throws ClassNotFoundException, SQLException {
		cn = DBUtils.openConnect();
		
		List<Product> product_list = new ArrayList<>();
		
		psmt2 = cn.prepareStatement("select * from product");
		
		ResultSet rst = psmt2.executeQuery();
		
		while(rst.next()) {
			product_list.add(new Product(rst.getInt(1), rst.getString(2), rst.getDouble(3), rst.getInt(4),rst.getDouble(5)));
		}
		System.out.println("running");
		
		DBUtils.closeConnect();
		
		return product_list;
		
	}
	
}
