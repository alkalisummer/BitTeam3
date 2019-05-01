package kr.or.bit.ajax;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.EmpDao;

@WebServlet("/stat")
public class EmpStatAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpStatAjax() {

	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String chart = request.getParameter("chart");
		Map<String, Integer> list = null;
		
		EmpDao dao = new EmpDao();
		
		if(chart.equals("deptno")) {
			list = dao.countByDeptno();
		} else {
			list = dao.countByJob();
		}
		request.setAttribute("list", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/stat.jsp");
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
