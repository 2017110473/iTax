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

@WebServlet (name="optimizingForSalary", urlPatterns = {"/optimizingForSalary"})
public class optimizingForSalary extends HttpServlet{
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
		  	double pre_salary = Double.parseDouble(request.getParameter("preSalary"));
			double social_ins = Double.parseDouble(request.getParameter("socialIns"));
			double bonus = Double.parseDouble(request.getParameter("bonus"));
			double special = Double.parseDouble(request.getParameter("special"));
			double start = Double.parseDouble(request.getParameter("start"));
	
			double sum = pre_salary * 12 + bonus - social_ins * 12 - special * 12 -  start * 12;
			
			sum = sum > 0? sum:0;
			//总值界限
			//Integer[] sumLimit = new Integer[] {0, 36000, 203100, 672000, 1277500, 1452500};
			
			//税率、速算扣除数、界限
			Double[] tax = new Double[] {0.0, 0.03, 0.10, 0.20, 0.25, 0.30, 0.35, 0.45}; 
			Integer[] deductionforSalary = new Integer[] {0, 0, 2520, 16920, 31920, 52920, 85920, 181920};  
			Integer[] bound = new Integer[] {0, 0, 36000, 144000, 300000, 420000, 660000, 960000};  
			Integer[] deductionforBonus = new Integer[] {0, 0, 210, 1410, 2660, 4410, 7160, 15160};
			int i,j; //循环变量
			double mintax = Double.MAX_VALUE;
			int best_i, best_j;
			
		    try {
		          for(i=1; sum-bound[i] > 0; i++) {
		        	  double tmptax = bound[i] * tax[i-1] - deductionforBonus[i-1];
		        	  double tmpsalary = sum - bound[i];
		        	  for(j=0; j < tax.length; j++) {
			        	  if(tmpsalary >= bound[j]) {
			        		  continue;
			        	  }
			        	  else {
			        		  break;
			        	  }
		        	  }
		        	  tmptax += tmpsalary  * tax[j-1] - deductionforSalary[j-1];
		        	  if(tmptax < mintax) {
		        		  best_i = i;
		        		  best_j = j;
		        		  mintax = tmptax;
		        	  }
		          }
		          mintax = mintax == Double.MAX_VALUE ? 0:mintax;
		          Map<String, Object> result = new HashMap<String, Object>();
		          result.put("after_bonus", bound[i-1]);
		          result.put("after_salary",pre_salary*12+bonus-bound[i-1]);
		          result.put("after_tax", mintax);
		          
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