package co.edu.kanumovie.admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.admin.vo.BannerVO;
import co.edu.kanumovie.common.Command;

public class bannerupdateform implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int bid = Integer.parseInt(request.getParameter("bid")); 

		AdminService dao = new AdminServiceImpl();
		BannerVO vo = new BannerVO();
		vo = dao.selectBanner(bid);
		request.setAttribute("banner", vo);
	
		return "admin/bannerupdateform";
	}

}
