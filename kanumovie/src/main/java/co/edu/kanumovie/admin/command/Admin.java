package co.edu.kanumovie.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.common.Paging;
import co.edu.kanumovie.user.vo.UserVO;

public class Admin implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		//유저 리스트 
		List<UserVO> list = new ArrayList<UserVO>();
		AdminService dao = new AdminServiceImpl();
		
		//기본 페이지 값 
		int page = 1;
		//유저가 요청한 페이지가 널이 아니라면 받은 페이지값 저장
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}
		Paging paging = new Paging();
		paging.setPage(page);
		int totalCount = dao.selectAllUserCount();
		paging.setTotalCount(totalCount);
		
		int startNum = (page-1)*10+1;
		int endNum = page*10;
		
		list = dao.selectAllUserList(startNum,endNum);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		
		//오늘 가입한 회원 수
		int todayUsersCount = dao.todayUsersCount();
		request.setAttribute("todayUsersCount", todayUsersCount);
		
		//총 회원 수 
		
		int allUserCount = dao.selectAllUserCount();
		request.setAttribute("allUsersCount", allUserCount);
		
		//신고 받은 유저 수
		
		int allReportUsers = dao.selectAllReportUsers();
		request.setAttribute("reportusers", allReportUsers);
		
		return "admin/admin";
	}

}
