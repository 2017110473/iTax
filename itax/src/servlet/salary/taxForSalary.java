/*
* 功能：计算薪金所得的纳税情况
* 
* 输入：相同单位的税前工资、社会保险个人缴纳额、专项扣除、起征点
*  输出：应纳税所得额、适用税率、速算扣除数、纳税额、税后工资
* 
* 完成情况：董嘉懿完成
 */

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

@WebServlet (name="taxForSalary", urlPatterns = {"/taxForSalary"})
public class taxForSalary extends HttpServlet{

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
		  	double pre_salary = Double.parseDouble(request.getParameter("preSalary"));//税前工资
			double social_ins = Double.parseDouble(request.getParameter("socialIns"));//社保
			double special = Double.parseDouble(request.getParameter("special")); //专项
			double start = Double.parseDouble(request.getParameter("start")); //起征点
			double month = Double.parseDouble(request.getParameter("month")); //期数
			
			//应缴税所得额
			double taxable_income = (pre_salary - social_ins - special -  start) * month;
			taxable_income = taxable_income>0?taxable_income:0;
			//税率、速算扣除数、界限
			Double[] tax = new Double[] {0.0, 0.03, 0.10, 0.20, 0.25, 0.30, 0.35, 0.45}; 
			Integer[] deduction = new Integer[] {0, 0, 2520, 16920, 31920, 52920, 85920, 181920};  
			Integer[] bound = new Integer[] {-1, 0, 36000, 144000, 300000, 420000, 660000, 960000};  
			int i; //循环变量
		    try {
		          for(i=0; i < tax.length; i++) {
		        	  if(taxable_income > bound[i]) {
		        		  continue;
		        	  }
		        	  else {
		        		  break;
		        	  }
		          }
		          
		          double tax_value = taxable_income * tax[i-1] - deduction[i-1]; //纳税额
		          double after_salary = pre_salary - social_ins - tax_value; //税后工资
		          
		          Map<String, Object> result = new HashMap<String, Object>();
		          result.put("taxable_income", taxable_income); //应纳税所得额
		          result.put("tax",tax[i-1]); //税率
		          result.put("deduction", deduction[i-1]); //速算扣除数
		          result.put("tax_value", tax_value); //纳税额
		          result.put("after_salary", after_salary); //税后工资
		          
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