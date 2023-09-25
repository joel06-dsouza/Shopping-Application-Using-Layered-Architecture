package in.mindcraft.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import in.mindcraft.dao.CustomerDao;

@Controller
public class HomeController {
	
	private CustomerDao customerdao = new CustomerDao();
	
	@RequestMapping("/home")
	public ModelAndView checkStatus(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		
		double balance = customerdao.getBalance(username);
		session.setAttribute("balance", balance);
		
		
		CustomerController customerctrl = new CustomerController();
		
		
		if(username.equals("admin") && password.equals("admin")) {
			System.out.println("Admin Login SuccesFully Completed!!");
			mv.setViewName("admin.jsp");
		} else {
			boolean isValidCustomer = customerctrl.checkcustomer(username);
			if(isValidCustomer) {
				System.out.println("Customer Present");
				mv.setViewName("result.jsp");
				
				response.setContentType("text/html"); // Set the content type
				PrintWriter out = response.getWriter(); // Get the response writer

				// Generate the JavaScript code for delayed redirection
				out.println("<script>");
				out.println("setTimeout(function() {");
				out.println("    window.location.href = 'customer.jsp';"); // Redirect to the next page after a delay
				out.println("}, 3000);"); // 3-second delay, adjust as needed
				out.println("</script>");

				out.println("<p>User Present in the Database!!!</p>");
				out.close();
			} else {
				System.out.println("Customer Absent");
				mv.setViewName("index.jsp");
				
				response.setContentType("text/html"); // Set the content type
				PrintWriter out = response.getWriter(); // Get the response writer

				// Generate the JavaScript code for delayed redirection
				out.println("<script>");
				out.println("setTimeout(function() {");
				out.println("    window.location.href = 'index.jsp';"); // Redirect to the next page after a delay
				out.println("}, 3000);"); // 3-second delay, adjust as needed
				out.println("</script>");

				out.println("<p>User not in the Database!!!</p>");
				out.close();
			}
		}
		return mv;

	}
}
