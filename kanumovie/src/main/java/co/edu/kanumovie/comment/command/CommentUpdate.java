package co.edu.kanumovie.comment.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.serviceImpl.CommentServiceImpl;
import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.common.Command;

public class CommentUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 댓글 수정
		HttpSession session = request.getSession();
		CommentService dao = new CommentServiceImpl();
		CommentVO vo = new CommentVO();
		//업데이트 하기전 값 준비 : cid, comments , session email값
		String email = (String) session.getAttribute("email");
		vo.setCid(request.getParameter("cid"));
		vo.setComments(request.getParameter("comments"));
		vo.setEmail(email);
		
		System.out.println(vo.getCid());
		System.out.println(vo.getComments());
		System.out.println(vo.getEmail());
		
		dao.commentUpdate(vo);
		
		return "movie/movieInfoghtest";
	}

}
