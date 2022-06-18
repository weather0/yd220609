package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class preferGenre implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 선호영화장르 바꾸기 > preferGenreForm에서 ajax로 받아옴. 바꾸고 유저관리창으로 돌아가기.
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		vo.setPw(request.getParameter("pw"));
		vo.setPreference1(Integer.parseInt(request.getParameter("preference1")));
		vo.setPreference2(Integer.parseInt(request.getParameter("preference2")));
		vo.setPreference3(Integer.parseInt(request.getParameter("preference3")));
		
		dao.userUpdatePrefer(vo);
		
		return "user/userManageForm";
	}

}
