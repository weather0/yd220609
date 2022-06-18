package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class Login implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		UserService dao = new UserServiceImpl();
		HttpSession session = request.getSession();
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		vo.setPw(request.getParameter("pw"));
		
		vo = dao.userSelect(vo);
		
		if(vo != null) {
			session.setAttribute("vo", vo);
			session.setAttribute("email", vo.getEmail()); 
			session.setAttribute("pw", vo.getPw());    
			session.setAttribute("signdate", vo.getSigndate());
			session.setAttribute("nick", vo.getNick());
			session.setAttribute("preference1", vo.getPreference1());
			session.setAttribute("preference2", vo.getPreference2());
			session.setAttribute("preference3", vo.getPreference3());
			session.setAttribute("authority", vo.getAuthority());
			session.setAttribute("blockCheck", vo.getBlockCheck());
			session.setAttribute("report", vo.getReport());
			session.setAttribute("fileName", vo.getFileName());
			session.setAttribute("directoryfileName", vo.getDirectoryFileName());
			request.setAttribute("message", "login");
		} else {
			request.setAttribute("message", "login2");
		}
		
		return "home.do";
	}

}
