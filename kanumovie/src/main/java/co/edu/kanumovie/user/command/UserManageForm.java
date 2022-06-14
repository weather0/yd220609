package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;

public class UserManageForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 유저 정보 관리 페이지 이동.
		return "user/userManageForm";
	}

}
