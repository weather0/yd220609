package co.edu.kanumovie.user.command;

import java.util.ArrayList;
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
		UserVO vo = new UserVO();
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
		
		
		// 첫 카카오 로그인인지 확인 > list에 이메일이 등록되어있는 지 확인하고 없다면 유저 추가!!!!!
		if(yes==false) { // 첫 로그인이므로 
			vo.setEmail(kakaoEmail);
			
		}
			
		return "ajax:";
	}

}
