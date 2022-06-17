package co.edu.kanumovie.likes.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;

public class LikesSelectList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		LikesService dao = new LikesServiceImpl();
		LikesVO vo = new LikesVO();

		List<LikesVO> list = new ArrayList<LikesVO>();
		list = dao.likesSelectList();
//		for (int i = 0; i < list.size(); i++) {
//			list.get(i).getEmail();
//		}
//		request.setAttribute(", vo);

		return "movie/movieInfo";
	}

}
