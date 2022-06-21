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
		System.out.println("업데이트 블락 체크 들어옴");
		
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
			
			//차단 후 report테이블 데이터 삭제 
			int deleteresult = dao.deleteReport(email);
			
			//차단 후 comment 삭제 
			/*
			 * int commentdeleteresult = dao.deleteAllComment(email);
			 * 
			 * if(commentdeleteresult != 0) { System.out.println("코멘트 전체 삭제 완"); } else {
			 * System.out.println("코멘트 삭제 실패 "); }
			 */
			
			
			if(deleteresult != 0) {
				System.out.println("리포트데이터 삭제 완");
			} else {
				System.out.println("리포트데이터 삭제 싪");
			}
			
			
			
		}
		
		
		return "admin/adminmessage";
	}

}
