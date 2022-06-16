package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class UserManage implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 유저 정보 변경 DB보내고 세션 변경하고 홈페이지로. >> 변경: 닉네임 변경 기능만.
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		vo.setNick(request.getParameter("nick"));
		System.out.println(vo.getNick());
		System.out.println(vo.getEmail());

		dao.userUpdate(vo);
		
		// 세션 변경
		HttpSession session = request.getSession();
		session.invalidate();
		HttpSession session2 = request.getSession();
		UserVO vo2 = new UserVO();
		vo2.setEmail(request.getParameter("email"));
		vo2.setPw(request.getParameter("pw"));
		
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
		
		return "home/home";
	}

}
