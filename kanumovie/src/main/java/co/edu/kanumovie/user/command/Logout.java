package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;

public class Logout implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 세션 로그아웃
		HttpSession session = request.getSession();
		session.invalidate(); // 세션객체를 완전히 삭제.
		request.setAttribute("message", "logout");
		return "home.do";
	}

}
