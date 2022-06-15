package co.edu.kanumovie.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;

public class Updateunblockcheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("업데이트언블락체크 들어옴");
		String[] checkBoxArr = request.getParameterValues("checkBoxArr[]");

		AdminService dao = new AdminServiceImpl();

		for (int i = 0; i < checkBoxArr.length; i++) {
			String email = checkBoxArr[i];
			System.out.println(email);
			int n = dao.updateUnblockCheck(email);
			if (n >= 1) {
				System.out.println("=======업데이트 성공=======");
			} else {
				System.out.println("=========업데이트 실패=========");
			}
		}
		return "admin/adminmessage";
	}

}
