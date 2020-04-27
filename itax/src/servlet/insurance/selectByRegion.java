/*
* ���ܣ����ճ�������������
* 
* ���룺������
*  �����ĳһ���е��������
* 
* ������������ܲ���
 */

package servlet.insurance;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

import bean.insurance;
import dao.InsDao;

@WebServlet (name="selectByRegion", urlPatterns = {"/selectByRegion"})
public class selectByRegion extends HttpServlet{
	
	InsDao dao = new InsDao();
	public void init() throws ServletException
	  {
	  }
	
	public void doGet(HttpServletRequest request,
            HttpServletResponse response)
    throws ServletException, IOException
	{
		doPost(request, response);
		// ������Ӧ��������
		response.setContentType("text/html");

		// ʵ�ʵ��߼���������
		PrintWriter out = response.getWriter();
		out.println("<h1>get method invalid��</h1>");
	}
	
	 public void doPost(HttpServletRequest request, HttpServletResponse response) {
		 String region = request.getParameter("region");
		 insurance I = new insurance();
	     try {
	         I = dao.selectByRegion(region);
	         System.out.println(I);
	         String CONTENT_TYPE = "application/json; charset = GBK";
	         response.setContentType(CONTENT_TYPE);
	         PrintWriter out = response.getWriter();
	         out.println(JSONArray.toJSONString(I));
	         
	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}
	}
	 public void destroy()
	  {
	  }

}
