package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class PwChange implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 비밀번호 변경 db에 넣고 유저 관리로 돌아가기.
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		vo.setPw(request.getParameter("pw"));
		dao.userUpdatePw(vo);
		
		// 세션 변경
		HttpSession session = request.getSession();
		session.invalidate();
		HttpSession session2 = request.getSession();
		UserVO vo2 = new UserVO();
		vo2.setEmail(request.getParameter("email"));
		
		vo2 = dao.userSelect(vo2);
		
		if(vo != null) {
			session2.setAttribute("vo", vo2);
			session2.setAttribute("email", vo2.getEmail()); 
			session2.setAttribute("pw", vo2.getPw());    
			session2.setAttribute("signdate", vo2.getSigndate());
			session2.setAttribute("nick", vo2.getNick());
			session2.setAttribute("preference1", vo2.getPreference1());
			session2.setAttribute("preference2", vo2.getPreference2());
			session2.setAttribute("preference3", vo2.getPreference3());
			session2.setAttribute("authority", vo2.getAuthority());
		}
		
		return "user/userManageForm";
	}

}
