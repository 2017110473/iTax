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

@WebServlet (name="labour", urlPatterns = {"/labour"})
public class labour extends HttpServlet{

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
		  	double labour = Double.parseDouble(request.getParameter("labour"));

			double taxable_value = 0;
			double tax_value=0;
			//结果
			Map<String, Object> result = new HashMap<String, Object>();
		    
			try {
		          if(labour > 4000) {
		        	  taxable_value = labour *  (1-0.2);
		          } else {
		        	  taxable_value = labour - 800 > 0 ? labour - 800 : 0;
		          }

		          Double[] tax = new Double[] {0.0, 0.2, 0.3, 0.4}; 
		          Integer[] deduction = new Integer[] {0, 0, 2000,7000};  
		          Integer[] bound = new Integer[] {0, 0, 20000, 50000};  
		          int i; //循环变量
		          for(i=0; i < tax.length; i++) {
		        	  if(taxable_value >= bound[i]) {
		        		  continue;
		        	  }
		        	  else {
		        		  break;
		        	  }
		          }
		          
		          tax_value = taxable_value * tax[i-1] - deduction[i-1];
		          result.put("tax",tax[i-1]);
		          result.put("deduction", deduction[i-1]);
		          result.put("tax_value", tax_value);
		          result.put("taxable_value", taxable_value);
		          result.put("after_tax",labour-tax_value);
		          
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
