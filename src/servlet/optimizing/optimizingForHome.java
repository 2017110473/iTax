package servlet.optimizing;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

@WebServlet (name="optimizingForHome", urlPatterns = {"/optimizingForHome"})
public class optimizingForHome extends HttpServlet{

	public void init() throws ServletException
	  {
	  }
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
    throws ServletException, IOException
	{
		doPost(request, response);
		// 设置响应内容类型
		response.setContentType("text/html");

		// 实际的逻辑是在这里
		PrintWriter out = response.getWriter();
		out.println("<h1>get method invalid！</h1>");
	}
	
	  public void doPost(HttpServletRequest request, HttpServletResponse response) {
		  	Map<String, Object> result = new HashMap<String, Object>();
		  	double my_salary = Double.parseDouble(request.getParameter("my_salary"));
			double my_ins = Double.parseDouble(request.getParameter("my_ins"));
			double mate_salary = Double.parseDouble(request.getParameter("mate_salary"));
			double mate_ins = Double.parseDouble(request.getParameter("mate_ins"));

			double my_taxable_income = 12*(my_salary - my_ins);
			double mate_taxable_income = 12*(mate_salary - mate_ins);
			
			if(request.getParameter("my_parent") != null && request.getParameter("my_parent") != "")
			{
				double for_my_parent = Double.parseDouble(request.getParameter("my_parent")) * 12;
				my_taxable_income -= for_my_parent;
				result.put("my_parent", for_my_parent);
			}
	
			if(request.getParameter("mate_parent") != null && request.getParameter("mate_parent") != "")
			{
				double for_mate_parent = Double.parseDouble(request.getParameter("mate_parent")) * 12;
				mate_taxable_income -= for_mate_parent;
				result.put("mate_parent",for_mate_parent);
			}
			if(request.getParameter("myrecordEducation") != null && request.getParameter("myrecordEducation") != "")
			{
				my_taxable_income -= 12 * 400;
				result.put("myrecordEducation",12*400);
			}
			if(request.getParameter("materecordEducation") != null && request.getParameter("materecordEducation") != "")
			{
				mate_taxable_income -= 12 * 400;
				result.put("materecordEducation",12*400);
			}
			if(request.getParameter("myskillEducation") != null && request.getParameter("myskillEducation") != "")
			{
				my_taxable_income -= 3600;
				result.put("myskillEducation",3600);
			}
			if(request.getParameter("mateskillEducation") != null && request.getParameter("mateskillEducation") != "")
			{
				mate_taxable_income -= 3600;
				result.put("mateskillEducation",3600);
			}
		
			int for_kids = 0;
			if(request.getParameter("number_kids") != null && request.getParameter("number_kids") != "")
			{
				 for_kids = Integer.parseInt(request.getParameter("number_kids"))*1000;
				 result.put("for_kids", for_kids);
			}
			
			int home = 0;
			if(request.getParameter("home") == "loan")
			{
				home = 1000 * 12;
			} else if (request.getParameter("home") == "rent1") {
				home = 1500 * 12;
			} else if (request.getParameter("home") == "rent2") {
				home = 1100 * 12;
			} else if (request.getParameter("home") == "rent3") {
				home = 800 * 12;
			}
			
			//税率、速算扣除数、界限
			Double[] tax = new Double[] {0.0, 0.03, 0.10, 0.20, 0.25, 0.30, 0.35, 0.45}; 
			Integer[] deduction = new Integer[] {0, 0, 2520, 16920, 31920, 52920, 85920, 181920};  
			Integer[] bound = new Integer[] {-1, 0, 36000, 144000, 300000, 420000, 660000, 960000};  
			int i, j; //循环变量
			
		    try {
		          for(i=0; i < tax.length; i++) {
		        	  if(my_taxable_income > bound[i]) {
		        		  continue;
		        	  }
		        	  else {
		        		  break;
		        	  }
		          }
		          
		          for(j=0; j < tax.length; j++) {
		        	  if(mate_taxable_income > bound[j]) {
		        		  continue;
		        	  }
		        	  else {
		        		  break;
		        	  }
		          }
		          
		          if(for_kids > home) {
		        	  if(my_taxable_income - mate_taxable_income >= for_kids) {
			        	  my_taxable_income -= for_kids;
			        	  result.put("who_for_kids", "m");
			        	  if(my_taxable_income - mate_taxable_income >= home/2) {
			        		  my_taxable_income -= home;
				        	  result.put("who_for_home", "m");
			        	  }else if(my_taxable_income - mate_taxable_income >= -home/2){
			        		  my_taxable_income -= home/2;
			        		  mate_taxable_income -=home/2;
				        	  result.put("who_for_home", "mandmate");  
			        	  } else {
			        		  mate_taxable_income -= home;
				        	  result.put("who_for_home", "mate");
			        	  }
			          } else if(mate_taxable_income - my_taxable_income >= for_kids) {
			        	  mate_taxable_income -= for_kids;
			        	  result.put("who_for_kids", "mate");
			        	  if(mate_taxable_income - my_taxable_income >= home/2) {
			        		  mate_taxable_income -= home;
				        	  result.put("who_for_home", "mate");
			        	  }else if(mate_taxable_income - my_taxable_income >= -home/2){
			        		  my_taxable_income -= home/2;
			        		  mate_taxable_income -=home/2;
				        	  result.put("who_for_home", "mandmate");  
			        	  } else {
			        		  my_taxable_income -= home;
				        	  result.put("who_for_home", "m");
			        	  }
			          } else {
			        	  my_taxable_income -= for_kids/2;
		        		  mate_taxable_income -=for_kids/2;
			        	  result.put("who_for_kids", "mandmate");
			        	  if(my_taxable_income - mate_taxable_income >= home/2) {
			        		  my_taxable_income -= home;
				        	  result.put("who_for_home", "m");
			        	  }else if(my_taxable_income - mate_taxable_income >= -home/2){
			        		  my_taxable_income -= home/2;
			        		  mate_taxable_income -=home/2;
				        	  result.put("who_for_home", "mandmate");  
			        	  } else {
			        		  mate_taxable_income -= home;
				        	  result.put("who_for_home", "mate");
			          }
		          }
		          }else {
		        	  if(my_taxable_income - mate_taxable_income >= home) {
			        	  my_taxable_income -= home;
			        	  result.put("who_for_home", "m");
			        	  if(my_taxable_income - mate_taxable_income >= for_kids/2) {
			        		  my_taxable_income -= for_kids;
				        	  result.put("who_for_kids", "m");
			        	  }else if(my_taxable_income - mate_taxable_income >= -for_kids/2){
			        		  my_taxable_income -= for_kids/2;
			        		  mate_taxable_income -=for_kids/2;
				        	  result.put("who_for_kids", "mandmate");  
			        	  } else {
			        		  mate_taxable_income -= for_kids;
				        	  result.put("who_for_kids", "mate");
			        	  }
			          } else if(mate_taxable_income - my_taxable_income >= home) {
			        	  mate_taxable_income -= home;
			        	  result.put("who_for_home", "mate");
			        	  if(mate_taxable_income - my_taxable_income >= for_kids/2) {
			        		  mate_taxable_income -= for_kids;
				        	  result.put("who_for_kids", "mate");
			        	  }else if(mate_taxable_income - my_taxable_income >= -for_kids/2){
			        		  my_taxable_income -= for_kids/2;
			        		  mate_taxable_income -=for_kids/2;
				        	  result.put("who_for_kids", "mandmate");  
			        	  } else {
			        		  my_taxable_income -= for_kids;
				        	  result.put("who_for_kids", "m");
			        	  }
			          } else {
			        	  my_taxable_income -= home/2;
		        		  mate_taxable_income -=home/2;
			        	  result.put("who_for_home", "mandmate");
			        	  if(my_taxable_income - mate_taxable_income >= for_kids/2) {
			        		  my_taxable_income -= for_kids;
				        	  result.put("who_for_kids", "m");
			        	  }else if(my_taxable_income - mate_taxable_income >= -for_kids/2){
			        		  my_taxable_income -= for_kids/2;
			        		  mate_taxable_income -=for_kids/2;
				        	  result.put("who_for_kids", "mandmate");  
			        	  } else {
			        		  mate_taxable_income -= for_kids;
				        	  result.put("who_for_kids", "mate");
			          }
		          }
		          }
		          
		          System.out.println(result);
		          String CONTENT_TYPE = "application/json; charset = GBK";
		          response.setContentType(CONTENT_TYPE);
		          PrintWriter out = response.getWriter();
		          out.println(JSONArray.toJSONString(result));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  }
	  public void destroy()
	  {
	  }
}
