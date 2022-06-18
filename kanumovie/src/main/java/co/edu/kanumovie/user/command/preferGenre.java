package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class preferGenre implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 선호영화장르 바꾸기 > preferGenreForm에서 ajax로 받아옴. 바꾸고 유저관리창으로 돌아가기.
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		vo.setPw(request.getParameter("pw"));
		if(request.getParameter("preference1")!= null) {
			vo.setPreference1(Integer.parseInt(request.getParameter("preference1")));
		} else {
			vo.setPreference1(0);
		}
		
		if(request.getParameter("preference2")!= null) {
			vo.setPreference2(Integer.parseInt(request.getParameter("preference2")));
		} else {
			vo.setPreference2(0);
		}
		
		if(request.getParameter("preference2")!= null) {
			vo.setPreference3(Integer.parseInt(request.getParameter("preference3")));
		} else {
			vo.setPreference3(0);
		}
		// 선호 장르 선택 중 장르 선택이 안되어 null이 넘어오면 0으로 기본값 설정.
		
		dao.userUpdatePrefer(vo);
		
		// 세션 변경
		HttpSession session = request.getSession();
		session.invalidate();
		HttpSession session2 = request.getSession();
		UserVO vo2 = new UserVO();
		vo2.setEmail(request.getParameter("email"));
		vo2.setPw(request.getParameter("pw"));
		
		vo2 = dao.userSelect(vo2);
		
		if(vo2 != null) {
			session2.setAttribute("vo", vo2);
			session2.setAttribute("email", vo2.getEmail()); 
			session2.setAttribute("pw", vo2.getPw());    
			session2.setAttribute("signdate", vo2.getSigndate());
			session2.setAttribute("nick", vo2.getNick());
			session2.setAttribute("preference1", vo2.getPreference1());
			session2.setAttribute("preference2", vo2.getPreference2());
			session2.setAttribute("preference3", vo2.getPreference3());
			session2.setAttribute("authority", vo2.getAuthority());
			session2.setAttribute("blockCheck", vo2.getBlockCheck());
			session2.setAttribute("report", vo2.getReport());
			session2.setAttribute("fileName", vo2.getFileName());
			session2.setAttribute("directoryfileName", vo2.getDirectoryFileName());
		}
		
		return "ajax:";
	}

}
