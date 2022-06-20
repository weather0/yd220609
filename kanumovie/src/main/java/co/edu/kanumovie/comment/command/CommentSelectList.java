package co.edu.kanumovie.comment.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.serviceImpl.CommentServiceImpl;
import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.movie.vo.MovieVO;

public class CommentSelectList implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CommentService dao = new CommentServiceImpl(); 
		CommentVO vo = new CommentVO(); 
		String email = request.getParameter("email");
		vo.setEmail(email);
		List<MovieVO> commentedlist = dao.commentSelectList(vo);
		request.setAttribute("commentlist", commentedlist);
		return "comment/commentSelectList";
	}

}
