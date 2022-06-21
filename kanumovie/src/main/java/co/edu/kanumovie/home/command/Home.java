package co.edu.kanumovie.home.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.admin.vo.BannerVO;
import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.serviceImpl.CommentServiceImpl;
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.movie.vo.MovieVO;
import co.edu.kanumovie.report.vo.ReportVO;

public class Home implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService dao = new AdminServiceImpl();
		List<BannerVO> blist = new ArrayList<BannerVO>();
		
		blist = dao.selectAllBannerList();
		
		request.setAttribute("blist", blist);
		request.setAttribute("message", request.getAttribute("message"));
		
		
		//신고 받은 유저 수
		List<ReportVO> list = new ArrayList<ReportVO>();
		list = dao.selectAllReportList();
		request.setAttribute("reportuserlistsize", list.size());
		
		CommentService dao2 = new CommentServiceImpl(); 
		List<MovieVO> movielist = dao2.commentSelectTopFiveList();
		request.setAttribute("latestclist", movielist);
		System.out.println(movielist.size());

		return "home/home";
	}

}
