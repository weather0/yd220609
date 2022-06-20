package co.edu.kanumovie.report.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.report.service.ReportService;
import co.edu.kanumovie.report.serviceImpl.ReportServiceImpl;
import co.edu.kanumovie.report.vo.ReportVO;

public class ReportInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * 신고하기를 누르면 처리됨 해당내용을 불러와 REPORT DB에 insert
		 * 
		 * 1) 신고자 email : 세션에서 가져옴.
		 * 2) 신고 당한사람 email : 해당 댓글의 email 값을 가져옴
		 * 3) 신고 날짜 : * sysdate로 넘김
		 * 4) 신고 사유 : radio 박스에 체크된 value값을 읽어야함.
		 * 5) 신고 내용 : textarea에 있는 내용을 읽어야함.
		 */		
		
		// 신고
		HttpSession session = request.getSession();
		ReportService dao = new ReportServiceImpl(); 
		ReportVO vo = new ReportVO();

		String email = (String) session.getAttribute("email");
		vo.setReportSendEmail(email);// 신고한 사람의 email을 set
		vo.setReportContent(request.getParameter("content"));  // 내용
		vo.setReportSubject(request.getParameter("report")); // 신고사유
		vo.setReportedEmail(request.getParameter("reported_name"));// 신고당한사람 닉네임
		vo.setMovieid(request.getParameter("movie_id")); // 신고댓글이 있는 영화 id
		
		dao.reportInsert(vo);

		System.out.println(vo.getReportSendEmail());
		System.out.println(vo.getReportContent());
		System.out.println(vo.getReportSubject());
		System.out.println(vo.getReportedEmail());
		System.out.println(vo.getMovieid());
		
		// user table update
		
		String Nick = request.getParameter("reported_name"); // 신고당한사람 닉네임
		dao.reportUpdate(Nick);
		
		// 신고후 화면 출력

		
		
		
		return "report/reportInsert";
	}

}
