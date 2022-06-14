package co.edu.kanumovie.comment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.serviceImpl.CommentServiceImpl;
import co.edu.kanumovie.common.Command;

public class CommentDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 int cid = Integer.parseInt(request.getParameter("cid"));
		 System.out.println(cid);
		 CommentService dao = new CommentServiceImpl();
		
		 dao.commentDelete(cid);
		
		return "comment/comment";
	}
}
