package co.edu.kanumovie.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.vo.UserVO;

public class Admin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//유저 리스트 
		List<UserVO> list = new ArrayList<UserVO>();
		AdminService dao = new AdminServiceImpl();
		
		list = dao.selectAllUserList();
		
		request.setAttribute("list", list);
		
		//오늘 가입한 회원 수
		int todayUsersCount = dao.todayUsersCount();
		request.setAttribute("usersCount", todayUsersCount);
		
		//총 회원 수 
		
		int AllUserCount = dao.selectAllUserCount();
		request.setAttribute("userscount", AllUserCount);
		
		return "admin/admin";
	}

}
