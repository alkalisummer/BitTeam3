package kr.or.bit.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpUpdateAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	  int resultrow = 0;
	ActionForward forward = new ActionForward();
	int empno = Integer.parseInt(request.getParameter("empno"));
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	Date hiredate = Date.valueOf(request.getParameter("hiredate"));
	int mgr = Integer.parseInt(request.getParameter("mgr"));
	int sal = Integer.parseInt(request.getParameter("sal"));
	int comm = Integer.parseInt(request.getParameter("comm"));
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	
	try {
		EmpDao dao = new EmpDao();
		Emp emp = new Emp();
		emp.setEmpno(empno);
		emp.setEname(ename);
		emp.setJob(job);
		emp.setMgr(mgr);
		emp.setSal(sal);
		emp.setHiredate(hiredate);
		emp.setComm(comm);
		emp.setDeptno(deptno);
		dao.updateEmp(emp);
		
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
    String url = "";
    String msg = "";
    if(resultrow > 0) {
    	msg = "수정이 완료되었습니다.";
    	url = "/update.do";
    }else {
    	msg = "수정이 실패하였습니다.";
    	url = "/list.do";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    
    forward.setRedirect(false);
    forward.setPath("/WEB-INF/views/redirect.jsp");
    
    return forward;
	
	
  }

}
