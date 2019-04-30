package kr.or.bit.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class EmpUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uploadpath = request.getServletContext().getRealPath("images");
		System.out.println(uploadpath);

		int size = 1024 * 1024 * 10;

		String filename1 = "";
		String orifilename1 = "";

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadpath, size, "UTF-8",
					new DefaultFileRenamePolicy());
			      Enumeration filenames = multi.getFileNames();
			     String file =(String)filenames.nextElement();
			      String face = multi.getFilesystemName(file);
			      int empno =  Integer.parseInt(multi.getParameter("empno"));
			     System.out.println(face + empno);
			     
			       
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
