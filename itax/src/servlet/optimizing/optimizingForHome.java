/*
* 功能：家庭优化计算
* 
* 输入：我和配偶的薪金、社会保险以及家庭专项扣除情况
*  输出：专项扣除优化方案数据
* 
* 完成情况：董嘉懿完成
 */

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
			
			//赡养老人
			double for_my_parent = 0.0;
			if(request.getParameter("my_parent") != null && request.getParameter("my_parent") != "")
			{
				for_my_parent = Double.parseDouble(request.getParameter("my_parent")) * 12;
				my_taxable_income -= for_my_parent;
			}
			result.put("my_parent", for_my_parent);
				
			double for_mate_parent= 0.0;
			if(request.getParameter("mate_parent") != null && request.getParameter("mate_parent") != "")
			{
				for_mate_parent = Double.parseDouble(request.getParameter("mate_parent")) * 12;
				mate_taxable_income -= for_mate_parent;
			}
			result.put("mate_parent",for_mate_parent);
			
			//继续教育
			if(request.getParameter("myrecordEducation") != null && request.getParameter("myrecordEducation") != "")
			{
				my_taxable_income -= 12 * 400;
				result.put("myrecordEducation",12*400);
			}else {
				result.put("myrecordEducation",0);
			}
			if(request.getParameter("materecordEducation") != null && request.getParameter("materecordEducation") != "")
			{
				mate_taxable_income -= 12 * 400;
				result.put("materecordEducation",12*400);
			}else {
				result.put("materecordEducation",0);
			}
			
			if(request.getParameter("myskillEducation") != null && request.getParameter("myskillEducation") != "")
			{
				my_taxable_income -= 3600;
				result.put("myskillEducation",3600);
			}else {
				result.put("myskillEducation",0);
			}
			
			if(request.getParameter("mateskillEducation") != null && request.getParameter("mateskillEducation") != "")
			{
				mate_taxable_income -= 3600;
				result.put("mateskillEducation",3600);
			}else {
				result.put("mateskillEducation",0);
			}
		
			//子女教育
			int for_kids = 0;
			if(request.getParameter("number_kids") != null && request.getParameter("number_kids") != "")
			{
				for_kids = Integer.parseInt(request.getParameter("number_kids"))*1000*12;	 
			}
				result.put("for_kids", for_kids);

			//住房情况
			int home = 0;
			String homeselect = request.getParameter("homeselect");
			String house = request.getParameter("home");
			if(homeselect != null && homeselect.equals("house")) {
				if(house != null && house.equals("loan"))
				{
					home = 1000 * 12;
					result.put("for_home", home);
				} else if (house != null && house.equals("rent1")) {
					home = 1500 * 12;
					result.put("for_home", home);
				} else if (house != null && house.equals("rent2")) {
					home = 1100 * 12;
					result.put("for_home", home);
				} else if (house != null && house.equals("rent3")) {
					home = 800 * 12;
					result.put("for_home", home);
				}
			} else {
				result.put("for_home", home);
			}
			
			double i, j; //循环变量
			double difference = Double.MAX_VALUE; //我和配偶应纳税额差值
			double best_i = 0, best_j = 0;
			
			//方案产生
		    try {
		         for(i=0; i<=1; i+=0.5) {
		        	  for(j=0; j<=1; j+=0.5) {
		        		  double mytmp = my_taxable_income - i * home - j * for_kids;
		        		  double matetmp = mate_taxable_income - (1-i) * home - (1-j) * for_kids;
		        		  if(Math.abs(mytmp-matetmp) < difference) {
		        			  difference =  Math.abs(mytmp-matetmp);
		        			  best_i = i;
		        			  best_j = j;
		        		  }
		        	  }	        	  
		          }
		          
		         if(home > 0) {
		        	 if(best_i == 1) {
		        		 result.put("who_for_home", "m");
		        	 }else if(best_i == 0) {
		        		 result.put("who_for_home", "mate");
		        	 }else {
		        		 result.put("who_for_home", "mandmate");
		        	 }
		         }
		    	
		         if(for_kids > 0) {
		        	 if(best_j == 1) {
		        		 result.put("who_for_kids", "m");
		        	 }else if(best_j == 0) {
		        		 result.put("who_for_kids", "mate");
		        	 }else {
		        		 result.put("who_for_kids", "mandmate");
		        	 }
		         }
		    	
		         my_taxable_income = my_taxable_income > 0 ? my_taxable_income:0;
		         mate_taxable_income = mate_taxable_income > 0 ? mate_taxable_income:0;
		         
		         //输出最优方案下我和配偶的应纳税额
		         result.put("my_taxable_income", my_taxable_income);
		         result.put("mate_taxable_income", mate_taxable_income);
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
