package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class UserDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 유저삭제 기능
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		String email = request.getParameter("email");
		vo.setEmail(email);
		dao.userDelete(vo);
		// 세션 초기화
		HttpSession session = request.getSession();
		session.invalidate(); // 세션객체를 완전히 삭제.
		return "ajax:";
	}

}
