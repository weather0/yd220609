package co.edu.kanumovie.admin.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.report.vo.ReportVO;
import co.edu.kanumovie.user.vo.UserVO;

public class AdminMessage implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//신고 받은 유저 수 
//		List<UserVO> list = new ArrayList<UserVO>();
//		AdminService dao = new AdminServiceImpl();
//		list = dao.selectReportUserList();
//		request.setAttribute("reportuserlist", list);
//		request.setAttribute("reportuserlistsize", list.size());
		
		//신고 받은 유저 수
		List<ReportVO> list = new ArrayList<ReportVO>();
		AdminService dao = new AdminServiceImpl();
		list = dao.selectAllReportList();
		
		/*
		 * for(int i = 0; i < list.size(); i++ ) {
		 * System.out.println(list.get(i).getMovieid()); }
		 */
		
		request.setAttribute("reportuserlist", list);
		request.setAttribute("reportuserlistsize", list.size());
		
		//블랙리스트 유저 수
		List<UserVO> blacklist = new ArrayList<UserVO>();
		blacklist = dao.selectBlackList();
		
		request.setAttribute("blacklist", blacklist);
		request.setAttribute("blacklistsize", blacklist.size());
		return "admin/adminmessage";
	}

}
