package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;

public class SignUpForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 유저 회원가입 페이지로 돌리기.
		return "user/signUpForm";
	}

}
