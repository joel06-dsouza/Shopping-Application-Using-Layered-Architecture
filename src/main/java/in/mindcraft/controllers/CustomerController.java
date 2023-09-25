package in.mindcraft.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.mindcraft.dao.CartDao;
import in.mindcraft.dao.CustomerDao;
import in.mindcraft.dao.ProductDao;
import in.mindcraft.pojos.Cart;
import in.mindcraft.pojos.Product;

@Controller
public class CustomerController {
	
	private ProductDao productdao = new ProductDao();
	private CustomerDao customerdao = new CustomerDao();
	private CartDao cartdao =  new CartDao();

	
	public boolean checkcustomer(String username) throws ClassNotFoundException, SQLException {
		System.out.println(customerdao.checkCustomer(username));
		System.out.println(username);
		boolean c = customerdao.checkCustomer(username);
		return c;
	}
	
	@RequestMapping("/addtoCart")
	public ModelAndView addtoCart() throws ClassNotFoundException, SQLException {
		ModelAndView mv = new ModelAndView();
		List<Product> list = productdao.showProduct();
		
		mv.setViewName("addcart.jsp");
		
		mv.addObject("list",list);
		
		return mv;
	}
	
	@RequestMapping("/addItems")
	public ModelAndView addItems(HttpServletRequest request, HttpServletResponse response, @RequestParam("pid") int pid, @RequestParam("name") String name, @RequestParam("cost") double cost, @RequestParam("discount") double discount) throws ClassNotFoundException, SQLException, InterruptedException, IOException {
		ModelAndView mv = new ModelAndView();
//		List<Product> list = productdao.showProduct();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");

		String invoiced = "No";
		int quantity = 1;
		cartdao.addItems(username, pid, name, cost, quantity, discount, invoiced);
				
		mv.setViewName("result.jsp");

		response.setContentType("text/html"); // Set the content type
		PrintWriter out = response.getWriter(); // Get the response writer

		out.println("<script>");
		out.println("setTimeout(function() {");
		out.println("    window.location.href = 'http://localhost:8080/ShoppingApp/addtoCart';"); // Redirect to the next page after a delay
		out.println("}, 3000);"); // 3-second delay, adjust as needed
		out.println("</script>");

		out.println("<p>Item Inserted within Cart!!!</p>");
		out.close();

		return mv;
		
	}
	
	@RequestMapping("/back")
	public ModelAndView back(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("customer.jsp");
		
		response.setContentType("text/html"); // Set the content type
		PrintWriter out = response.getWriter(); // Get the response writer

		out.println("<script>");
		out.println("setTimeout(function() {");
		out.println("    window.location.href = 'http://localhost:8080/ShoppingApp/customer.jsp';"); // Redirect to the next page after a delay
		out.println("}, 1500);"); // 3-second delay, adjust as needed
		out.println("</script>");
		
		out.println("<p>Moving Back To Menu!!!</p>");
		out.close();
		
		
		return mv;
	}
	
	@RequestMapping("/showCart")
	public ModelAndView showCart(HttpServletRequest request, HttpServletResponse reponse) throws ClassNotFoundException, SQLException {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		List<Cart> list = cartdao.showCart(username);
		
		mv.setViewName("display_cart.jsp");
		
		mv.addObject("list",list);
		
		System.out.println("Showing all Cart Items!!!");
		
		return mv;
	}
	
	@RequestMapping("/billing")
	public ModelAndView displayBill(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		List<Cart> list = cartdao.billPay(username);
		double actual_amt = cartdao.billPay1(username);
		double discount_amt = cartdao.billPay2(username);
		double saved_amt = cartdao.billPay3(username);
		
		mv.setViewName("bill.jsp");
		
		mv.addObject("list",list);
		mv.addObject("Amount_list",actual_amt);
		mv.addObject("Discount_list",discount_amt);
		mv.addObject("Saved_list",saved_amt);
		System.out.println("Moving To Bill Page!!!!");
		
		return mv;
		
	}
	
	@RequestMapping("payment")
	public ModelAndView payment(HttpServletRequest request, HttpServletResponse response,@RequestParam("discount_amt") double amt) throws ClassNotFoundException, SQLException, IOException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		if(customerdao.checkBalance(username, amt)) {
			System.out.println("Your Account has been debited with Rs. "+amt);
			mv.setViewName("result.jsp");
			response.setContentType("text/html"); // Set the content type
			PrintWriter out = response.getWriter(); // Get the response writer
			
			out.println("<script>");
			out.println("setTimeout(function() {");
			out.println("    window.location.href = 'customer.jsp';"); // Redirect to the next page after a delay
			out.println("}, 3000);"); // 3-second delay, adjust as needed
			out.println("</script>");
			
			out.println("<p>Purchase Successfully Completed!!! Check your Account Details From Main Menu.</p>");
			out.close();			
		}
		else {
			System.out.println("Your Account Balance is limited.");
			mv.setViewName("result.jsp");
			response.setContentType("text/html"); // Set the content type
			PrintWriter out = response.getWriter(); // Get the response writer
			
			out.println("<script>");
			out.println("setTimeout(function() {");
			out.println("    window.location.href = 'customer.jsp';"); // Redirect to the next page after a delay
			out.println("}, 3000);"); // 3-second delay, adjust as needed
			out.println("</script>");
			
			out.println("<p>Purchase In-Complete due to insufficient funds!!!</p>");
			out.close();		
		}
		

		return mv;
	}
	
	@RequestMapping("user")
	public ModelAndView user(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		double balance = customerdao.getBalance(username);
		mv.setViewName("user.jsp");
		mv.addObject("username",username);
		mv.addObject("balance",balance);
		
		return mv;
	}
	
	@RequestMapping("purchased")
	public ModelAndView purchased(HttpServletRequest request, HttpServletResponse reponse) throws ClassNotFoundException, SQLException {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		List<Cart> cart_list = cartdao.purchased(username);
		mv.setViewName("purchased.jsp");
		mv.addObject("list", cart_list);
		return mv;
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		response.setContentType("text/html"); // Set the content type
		PrintWriter out = response.getWriter(); // Get the response writer
		
		out.println("<script>");
		out.println("setTimeout(function() {");
		out.println("    window.location.href = 'index.jsp';"); // Redirect to the next page after a delay
		out.println("}, 3000);"); // 3-second delay, adjust as needed
		out.println("</script>");
		
		out.println("<p>Thanks for Shopping!!!</p>");
		out.close();
		return mv;
	}
}
