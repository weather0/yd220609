package co.edu.kanumovie.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;

public class SessionListener implements HttpSessionListener {

	//session 실행될 떄 실행되는 메소드
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println("sessionCreated 호출");
		AdminService dao = new AdminServiceImpl();
		dao.insertVisit();//방문자 수+1
		
		int todayvisitant = dao.selectTodaysVisit();
		System.out.println("오늘 방문자 수 > "+todayvisitant);
		HttpSession session = se.getSession();
		
		session.setAttribute("todayCount", todayvisitant);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
