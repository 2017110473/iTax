/*
* 功能：特许使用纳税计算
* 
* 输入：特许权使用所得
*  输出：应纳税所得额、纳税额、税后稿酬
* 
* 完成情况：董嘉懿完成
 */


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

@WebServlet (name="right", urlPatterns = {"/right"})
public class right extends HttpServlet{

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
		  	double right = Double.parseDouble(request.getParameter("right"));
			double taxable_value = 0;
			//结果
			Map<String, Object> result = new HashMap<String, Object>();
		    
			try {
		          if(right > 4000) {
		        	  taxable_value = right * (1-0.2);
		          } else {
		        	  taxable_value = right - 800 > 0 ? right - 800 : 0 ;
		          }
		          
		          double tax_value = taxable_value*0.2;

		          result.put("taxable_value", taxable_value);
		          result.put("tax_value",tax_value);
		          result.put("after_tax",right-tax_value);
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
