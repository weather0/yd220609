package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;

public class LoginForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 로그인폼으로 이동.
		return "user/loginForm";
	}

}
