package servlet.other;

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

@WebServlet (name="sum", urlPatterns = {"/sum"})
public class sum extends HttpServlet{

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
		  double taxable_salary = Double.parseDouble(request.getParameter("taxable_salary"));
		  double taxable_author = Double.parseDouble(request.getParameter("taxable_author"));
		  double taxable_right = Double.parseDouble(request.getParameter("taxable_right"));
		  double taxable_labour = Double.parseDouble(request.getParameter("taxable_labour"));
		  
		  double taxable_sum = taxable_salary+taxable_author+taxable_right+taxable_labour;
		  //结果
		  taxable_sum = taxable_sum > 0 ? taxable_sum:0;
		  
		  Map<String, Object> result = new HashMap<String, Object>();
		    
		  Double[] tax = new Double[] {0.0, 0.03, 0.10, 0.20, 0.25, 0.30, 0.35, 0.45}; 
		  Integer[] deduction = new Integer[] {0, 0, 2520, 16920, 31920, 52920, 85920, 181920};  
		  Integer[] bound = new Integer[] {0, 0, 36000, 144000, 300000, 420000, 660000, 960000};  
		  int i; //循环变量
		  try {
		        for(i=0; i < tax.length; i++) {
		        	if(taxable_sum >= bound[i]) {
		        		continue;
		        	}
		        	else {
		        		break;
		        	}
		        }
		          
		          double tax_value = taxable_sum * tax[i-1] - deduction[i-1];
		          result.put("taxable_sum", taxable_sum);
		          result.put("tax",tax[i-1]);
		          result.put("tax_value",tax_value);
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