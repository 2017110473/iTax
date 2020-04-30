/*
* ���ܣ�����н�����õ���˰���
* 
* ���룺��ͬ��λ��˰ǰ���ʡ���ᱣ�ո��˽��ɶר��۳���������
*  �����Ӧ��˰���ö����˰�ʡ�����۳�������˰�˰����
* 
* ������������ܲ���
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
		// ������Ӧ��������
		response.setContentType("text/html");

		// ʵ�ʵ��߼���������
		PrintWriter out = response.getWriter();
		out.println("<h1>get method invalid��</h1>");
	}
	
	  public void doPost(HttpServletRequest request, HttpServletResponse response) {
		  	double pre_salary = Double.parseDouble(request.getParameter("preSalary"));//˰ǰ����
			double social_ins = Double.parseDouble(request.getParameter("socialIns"));//�籣
			double special = Double.parseDouble(request.getParameter("special")); //ר��
			double start = Double.parseDouble(request.getParameter("start")); //������
			double month = Double.parseDouble(request.getParameter("month")); //����
			
			//Ӧ��˰���ö�
			double taxable_income = (pre_salary - social_ins - special -  start) * month;
			taxable_income = taxable_income>0?taxable_income:0;
			//˰�ʡ�����۳���������
			Double[] tax = new Double[] {0.0, 0.03, 0.10, 0.20, 0.25, 0.30, 0.35, 0.45}; 
			Integer[] deduction = new Integer[] {0, 0, 2520, 16920, 31920, 52920, 85920, 181920};  
			Integer[] bound = new Integer[] {-1, 0, 36000, 144000, 300000, 420000, 660000, 960000};  
			int i; //ѭ������
		    try {
		          for(i=0; i < tax.length; i++) {
		        	  if(taxable_income > bound[i]) {
		        		  continue;
		        	  }
		        	  else {
		        		  break;
		        	  }
		          }
		          
		          double tax_value = taxable_income * tax[i-1] - deduction[i-1]; //��˰��
		          double after_salary = pre_salary - social_ins - tax_value; //˰����
		          
		          Map<String, Object> result = new HashMap<String, Object>();
		          result.put("taxable_income", taxable_income); //Ӧ��˰���ö�
		          result.put("tax",tax[i-1]); //˰��
		          result.put("deduction", deduction[i-1]); //����۳���
		          result.put("tax_value", tax_value); //��˰��
		          result.put("after_salary", after_salary); //˰����
		          
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