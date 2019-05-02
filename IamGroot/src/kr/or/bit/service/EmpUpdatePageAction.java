package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpUpdatePageAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    ActionForward forward = new ActionForward();
    int empno = Integer.parseInt(request.getParameter("empno"));

    try {
      EmpDao dao = new EmpDao();
      Emp emp = dao.selectByEmpno(empno);
      request.setAttribute("emp", emp);
    } catch (Exception e) {
      System.out.println(e.getMessage());
    }

    forward.setRedirect(false);
    forward.setPath("/WEB-INF/views/update.jsp");

    return forward;
  }
}
