package co.edu.kanumovie.admin.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.vo.UserVO;

public class Updateblockcheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String[] checkBoxArr = request.getParameterValues("checkBoxArr[]");
		
		AdminService dao = new AdminServiceImpl();
		
		for(int i = 0; i < checkBoxArr.length; i++) {
			String email = checkBoxArr[i];
			System.out.println(email);
//			email = email.strip(); 
//			int n = dao.updateBlockCheck("test1");
			int n = dao.updateBlockCheck(email);
			if(n >= 1) {
				System.out.println("=======업데이트 성공=======");
			} else {
				System.out.println("=========업데이트 실패=========");
			}
		}
		
		
		return "admin/adminmessage";
	}

}
