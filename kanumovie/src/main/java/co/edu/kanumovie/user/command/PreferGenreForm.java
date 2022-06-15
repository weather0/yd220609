package co.edu.kanumovie.user.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.PreferVO;

public class PreferGenreForm implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 선호 영화 선택 페이지.
		UserService dao = new UserServiceImpl();
		List<PreferVO> list = new ArrayList<PreferVO>();
		list = dao.perferList();
		request.setAttribute("list", list);
		
		return "user/preferGenre";
	}

}
