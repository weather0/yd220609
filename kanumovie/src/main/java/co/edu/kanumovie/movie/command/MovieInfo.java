package co.edu.kanumovie.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.serviceImpl.CommentServiceImpl;
import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.common.Command;

public class MovieInfo implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println(id);
		request.setAttribute("movieid", id);
		
		HttpSession session = request.getSession();
		CommentService dao = new CommentServiceImpl();
		List<CommentVO> comments = new ArrayList<CommentVO>();
		CommentVO vo = new CommentVO();
		String email = (String) session.getAttribute("email");
		vo.setEmail(email);
		vo.setId(id);	
		comments = dao.commentAllList(vo);
		
		// 리스트를 처리한것을 싦어서 보내야함.
		request.setAttribute("comments", comments);
		return "movie/movieInfo";
	}
}
