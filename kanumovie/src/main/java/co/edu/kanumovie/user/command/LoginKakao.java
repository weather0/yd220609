package co.edu.kanumovie.user.command;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class LoginKakao implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 카카오 로그인 처리.
		UserService dao = new UserServiceImpl();
		HttpSession session = request.getSession();
		List<UserVO> list = new ArrayList<UserVO>();
		
		String kakaoEmail = request.getParameter("kakaoEmail");
		String kakaoNick = request.getParameter("kakaoNick");
		boolean yes = false; // db뒤져서 카카오 로그인과 맞는 이메일이 있는 지 확인.
		
		list = dao.userListSelect();
		for(int i=0; i<list.size(); i++) {
			UserVO eqVO = list.get(i);
			if(eqVO.getEmail().equals(kakaoEmail)) {
				yes = true; // 카카오 로그인한 게 있음.
			}
		}
		
		UserVO vo = new UserVO();
		// 첫 카카오 로그인인지 확인 > list에 이메일이 등록되어있는 지 확인하고 없다면 유저 추가!!!!!
		if(yes==true) { // db에 카카오연결계정이 있는 경우. 
			vo.setEmail(kakaoEmail);
			vo = dao.userSelectEmail(vo);
			// 세션에 넣기.
			if(vo != null) {
				session.setAttribute("vo", vo);
				session.setAttribute("email", vo.getEmail()); 
				session.setAttribute("pw", vo.getPw());    
				session.setAttribute("signdate", vo.getSigndate());
				session.setAttribute("nick", vo.getNick());
				session.setAttribute("preference1", vo.getPreference1());
				session.setAttribute("preference2", vo.getPreference2());
				session.setAttribute("preference3", vo.getPreference3());
				session.setAttribute("authority", vo.getAuthority());
				session.setAttribute("blockCheck", vo.getBlockCheck());
				session.setAttribute("report", vo.getReport());
				
				
				if(vo.getFileName()==null) {
					session.setAttribute("fileName", "default.jpeg");
				} else {
					session.setAttribute("fileName", vo.getFileName());
				}
				
				if(vo.getFileName()==null) {
					session.setAttribute("directoryfileName", "default.jpeg");
				} else {
					session.setAttribute("directoryfileName", vo.getDirectoryFileName());
				}
				request.setAttribute("message", "login");
			} else {
				request.setAttribute("message", "login2");
			}
			
		} else { // 카카오 계정 연결이 처음일시 db에 정보 넣기.
			vo.setEmail(kakaoEmail);
			vo.setNick(kakaoNick);
			String rand = randPassword(10);
			vo.setPw(rand);
			// 가입할때 무조건 디폴트 이미지를 프로필로.
			vo.setFileName("default.jpeg");
			vo.setDirectoryFileName("default.jpeg");
			dao.userInsert(vo);
			
			vo = dao.userSelectEmail(vo);
			// 세션에 넣기.
			if(vo != null) {
				session.setAttribute("vo", vo);
				session.setAttribute("email", vo.getEmail()); 
				session.setAttribute("pw", vo.getPw());    
				session.setAttribute("signdate", vo.getSigndate());
				session.setAttribute("nick", vo.getNick());
				session.setAttribute("preference1", vo.getPreference1());
				session.setAttribute("preference2", vo.getPreference2());
				session.setAttribute("preference3", vo.getPreference3());
				session.setAttribute("authority", vo.getAuthority());
				session.setAttribute("blockCheck", vo.getBlockCheck());
				session.setAttribute("report", vo.getReport());
				session.setAttribute("fileName", vo.getFileName());
				session.setAttribute("directoryfileName", vo.getDirectoryFileName());
				
				
				if(vo.getFileName()==null) {
					session.setAttribute("fileName", "default.jpeg");
				} else {
					session.setAttribute("fileName", vo.getFileName());
				}
				
				if(vo.getFileName()==null) {
					session.setAttribute("directoryfileName", "default.jpeg");
				} else {
					session.setAttribute("directoryfileName", vo.getDirectoryFileName());
				}
			} 
		}
			
		return "ajax:";
	}
	
	public static String randPassword(int size) {
		char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<size; i++) {
            // idx = (int) (len * Math.random());
            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
            sb.append(charSet[idx]);
        }

        return sb.toString();
	}
}
