package servlet.salary;

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

@WebServlet (name="yeartax", urlPatterns = {"/yeartax"})
public class yeartax extends HttpServlet{

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

		  	double sum_salary = Double.parseDouble(request.getParameter("sumSalary"));
		  	double bonus = Double.parseDouble(request.getParameter("bonus"));
			double social_ins = Double.parseDouble(request.getParameter("socialIns"));
			double special = Double.parseDouble(request.getParameter("special"));
			double start = Double.parseDouble(request.getParameter("start"));

			//月薪应纳税所得额
			double taxable_salary = sum_salary - social_ins * 12 - special * 12 -  start * 12;
			
			//避免出现负数
			taxable_salary = taxable_salary > 0 ? taxable_salary : 0;
			//税率、速算扣除数、界限
			Double[] tax = new Double[] {0.0, 0.03, 0.10, 0.20, 0.25, 0.30, 0.35, 0.45}; 
			Integer[] deductionforSalary = new Integer[] {0, 0, 2520, 16920, 31920, 52920, 85920, 181920};  
			Integer[] bound = new Integer[] {-1, 0, 36000, 144000, 300000, 420000, 660000, 960000};  
			Integer[] deductionforBonus = new Integer[] {0, 0, 210, 1410, 2660, 4410, 7160, 15160};
			int i; //循环变量
			
			//结果
			Map<String, Object> result = new HashMap<String, Object>();
		    
			try {
		          for(i=0; i < tax.length; i++) {
		        	  if(taxable_salary > bound[i]) {
		        		  continue;
		        	  }
		        	  else {
		        		  break;
		        	  }
		          }
		          
		          double tax_salary = taxable_salary * tax[i-1] - deductionforSalary[i-1];
		          
		          for(i=0; i < tax.length; i++) {
		        	  if(bonus > bound[i]) {
		        		  continue;
		        	  }
		        	  else {
		        		  break;
		        	  }
		          }
		          
		          double tax_bonus = bonus * tax[i-1] - deductionforBonus[i-1];
		          
		          result.put("taxable_salary", taxable_salary);
		          result.put("tax_salary", tax_salary);
		          result.put("tax_bonus",tax_bonus);
		          result.put("pretax_income", sum_salary + bonus);
		          result.put("aftertax_income", sum_salary + bonus - tax_salary - tax_bonus - social_ins * 12);
		          
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