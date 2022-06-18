package co.edu.kanumovie.user.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class ProfileChange implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// file 변경
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		
		// saveDir의 경로는 img/profile
		String saveDir = request.getServletContext().getRealPath("img\\profile");
		System.out.println(request.getServletContext().getRealPath("img\\profile"));
		
//		String saveDir = "C:\\Users\\admin\\git\\Kanumovie\\kanumovie\\src\\main\\webapp\\img\\profile\\";
		
		int size = 1024*1024*1024; // 파일 최대 사이즈
		String originalFile = "";
		String dirFile = "";
		String e2 = "";
		String p2 = "";
		try {
			MultipartRequest multi = new MultipartRequest(request, saveDir, size, "utf-8", new DefaultFileRenamePolicy());
			dirFile = multi.getFilesystemName("file"); // 물리공간에 저장될 파일명.
			originalFile = multi.getOriginalFileName("file"); // 실제 파일명.
			vo.setEmail(multi.getParameter("email"));
			e2 = multi.getParameter("email");
			p2 = multi.getParameter("pw");
			vo.setFileName(originalFile);
			vo.setDirectoryFileName(dirFile);
			
		
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		dao.userUpdateProfile(vo);
		
		// 세션 변경
		HttpSession session = request.getSession();
		session.invalidate();
		HttpSession session2 = request.getSession();
		UserVO vo2 = new UserVO();
		vo2.setEmail(e2);
		vo2.setPw(p2);
		
		vo2 = dao.userSelect(vo2);
		
		if(vo2 != null) {
			session2.setAttribute("vo", vo2);
			session2.setAttribute("email", vo2.getEmail()); 
			session2.setAttribute("pw", vo2.getPw());    
			session2.setAttribute("signdate", vo2.getSigndate());
			session2.setAttribute("nick", vo2.getNick());
			session2.setAttribute("preference1", vo2.getPreference1());
			session2.setAttribute("preference2", vo2.getPreference2());
			session2.setAttribute("preference3", vo2.getPreference3());
			session2.setAttribute("authority", vo2.getAuthority());
			session2.setAttribute("blockCheck", vo2.getBlockCheck());
			session2.setAttribute("report", vo2.getReport());
			session2.setAttribute("fileName", vo2.getFileName());
			session2.setAttribute("directoryfileName", vo2.getDirectoryFileName());
		}
		
		
		return "user/userManageForm";
	}

}
