package co.edu.kanumovie.comment.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.serviceImpl.CommentServiceImpl;
import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.common.Command;

public class Comment implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 공지사항 목록  command명 호출명 
				CommentService dao = new CommentServiceImpl();
				List<CommentVO> comments = new ArrayList<CommentVO>();
				comments = dao.commentAllList();
				// 리스트를 처리한것을 싦어서 보내야함.
				request.setAttribute("comments", comments);
				
				return "comment/comment";
	}

}
