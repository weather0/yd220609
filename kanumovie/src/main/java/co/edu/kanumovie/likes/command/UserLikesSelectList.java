package co.edu.kanumovie.likes.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;
import co.edu.kanumovie.user.vo.UserVO;

public class UserLikesSelectList implements Command {	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		LikesService dao = new LikesServiceImpl(); 
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		List<LikesVO> likes = dao.userLikesSelectList(vo);
		request.setAttribute("likeslist", likes);
		return "likes/userLikesSelectList";    
	}


}
