package in.mindcraft.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import in.mindcraft.controllers.CustomerController;
import in.mindcraft.pojos.Customer;
import in.mindcraft.pojos.Product;
import in.mindcraft.utils.DBUtils;

public class CustomerDao {
	
	private Connection cn;
	
	private PreparedStatement psmt1;
	
	private PreparedStatement psmt2;

	private PreparedStatement psmt3;
	
	private PreparedStatement psmt4;

	private PreparedStatement psmt5;

	private PreparedStatement psmt6;

	private PreparedStatement psmt7;
	
	public void addCustomer(Customer c) throws ClassNotFoundException, SQLException {
		cn = DBUtils.openConnect();
		
		psmt1 = cn.prepareStatement("Insert into customer values(?,?,?)");
		
		psmt1.setInt(1, c.getCid());

		psmt1.setString(2, c.getName());
		
		psmt1.setDouble(3, c.getBalance());
		
		psmt1.execute();
		
		DBUtils.closeConnect();
	}
	
	public boolean checkCustomer(String username) throws ClassNotFoundException, SQLException {
		boolean b = false;
		
		cn = DBUtils.openConnect();
		
		psmt4 = cn.prepareStatement("select * from customer where cid = ?");
		
		psmt4.setString(1, username);
		
		ResultSet resultSet = psmt4.executeQuery();
        b = resultSet.next();
        
		DBUtils.closeConnect();

        return b;
	}

	public List<Customer> showCustomer() throws ClassNotFoundException, SQLException {
		cn = DBUtils.openConnect();
		
		List<Customer> customer_list = new ArrayList<>();
		
		psmt2 = cn.prepareStatement("select * from customer");
		
		ResultSet rst = psmt2.executeQuery();
		
		while(rst.next()) {
			customer_list.add(new Customer(rst.getInt(1), 
					rst.getString(2), rst.getDouble(3)));
		}
		
		DBUtils.closeConnect();
		
		return customer_list;
	}
	
	public void removeCustomer(int cid) throws ClassNotFoundException, SQLException {
		cn = DBUtils.openConnect();
		
		psmt3 = cn.prepareStatement("DELETE FROM customer WHERE cid = ?");
		
		psmt3.setInt(1, cid);
		
		psmt3.execute();

		DBUtils.closeConnect();
	}
	
	public boolean checkBalance(String username, double amt) throws ClassNotFoundException, SQLException {
		double balance = 0.0;
		boolean isSufficient = false;
		
		cn = DBUtils.openConnect();
		
		psmt4 = cn.prepareStatement("select balance from customer where cid = ?");
		
		psmt4.setString(1, username);
		
		ResultSet resultSet = psmt4.executeQuery();
        if(resultSet.next()) {
        	balance = resultSet.getDouble(1);
        }
        
        System.out.println(balance);
        if(amt < balance) {
        	isSufficient = true;
        	balance = balance - amt;
        	psmt5 = cn.prepareStatement("update customer set balance = ? where cid = ?");
        	
        	psmt5.setDouble(1, balance);
        	psmt5.setString(2, username);
        	psmt5.execute();
        	
        	psmt6 = cn.prepareStatement("update cart set invoiced = 'Yes' where cid = ?");
        	psmt6.setString(1, username);
        	psmt6.execute();
        }
		return isSufficient;
	}
	
	
	public double getBalance(String username) throws SQLException, ClassNotFoundException {
		double balance = 0;
		
		cn = DBUtils.openConnect();

		psmt7 = cn.prepareStatement("select balance from customer where cid = ?");
		
		psmt7.setString(1, username);
		
		ResultSet resultSet = psmt7.executeQuery();
        while(resultSet.next()) {
        	balance = resultSet.getDouble(1);
        }
        
        DBUtils.closeConnect();
        
		return balance;
	}
	
	
}
