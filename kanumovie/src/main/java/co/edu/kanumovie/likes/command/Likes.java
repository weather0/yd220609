package co.edu.kanumovie.likes.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;

public class Likes implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		LikesService dao = new LikesServiceImpl();
		
		LikesVO vo = new LikesVO();
		vo.setId(Integer.parseInt(request.getParameter("id")));
		vo.setEmail("abc@abc.com"); // 나중에 로그인세션ID로 수정할 것
		dao.likesInsert(vo);
		
		return "movie/movieInfo";
	}

}
