package co.edu.kanumovie.home.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.admin.vo.BannerVO;
import co.edu.kanumovie.common.Command;

public class Home implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService dao = new AdminServiceImpl();
		List<BannerVO> blist = new ArrayList<BannerVO>();
		
		blist = dao.selectAllBannerList();
		
		request.setAttribute("blist", blist);
		request.setAttribute("message", request.getAttribute("message"));
		

		return "home/home";
	}

}
