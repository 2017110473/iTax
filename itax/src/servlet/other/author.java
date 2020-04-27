/*
* 功能：稿酬纳税计算
* 
* 输入：年度稿酬所得
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

@WebServlet (name="author", urlPatterns = {"/author"})
public class author extends HttpServlet{

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
		  double author = Double.parseDouble(request.getParameter("author"));
		  double taxable_value = 0;
			//结果
			Map<String, Object> result = new HashMap<String, Object>();
		    
			try {
		          if(author > 4000) {
		        	  taxable_value = author * 0.8*0.7;
		          } else {
		        	  taxable_value = (author - 800) * 0.7 > 0 ? (author - 800) * 0.7 : 0;
		          }
		          
		          double tax_value = taxable_value*0.2;

		          result.put("taxable_value", taxable_value);//应纳税额
		          result.put("tax_value",tax_value); //纳税额
		          result.put("after_tax",author-tax_value); //税后稿酬
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
