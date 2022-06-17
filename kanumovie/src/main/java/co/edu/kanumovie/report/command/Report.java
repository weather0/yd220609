package co.edu.kanumovie.report.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.serviceImpl.CommentServiceImpl;
import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.common.Command;

public class Report implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// command명 호출명 
		return "report/report";
	}

}
