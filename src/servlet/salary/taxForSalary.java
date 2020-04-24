package servlet.salary;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

import bean.insurance;
import dao.InsDao;

@WebServlet (name="taxForSalary", urlPatterns = {"/taxForSalary"})
public class taxForSalary extends HttpServlet{

	public void init() throws ServletException
	  {
	  }
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
    throws ServletException, IOException
	{
		Double preSalary = Double.valueOf(request.getParameter("preSalary"));
		Double socialIns = Double.valueOf(request.getParameter("socialIns"));
		Double special = Double.valueOf(request.getParameter("special"));
		Double start = Double.valueOf(request.getParameter("start"));
		
		List<double> tax = new
	    try {
	          if()
	          
	          
	          String CONTENT_TYPE = "application/json; charset = GBK";
	          response.setContentType(CONTENT_TYPE);
	          PrintWriter out = response.getWriter();
	          out.println(JSONArray.toJSONString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doPost(request, response);
		// 设置响应内容类型
		response.setContentType("text/html");

		// 实际的逻辑是在这里
		PrintWriter out = response.getWriter();
		out.println("<h1>get method invalid！</h1>");
	}
	
	  public void doPost(HttpServletRequest request, HttpServletResponse response) {
		  
	  }
	  public void destroy()
	  {
	  }
}