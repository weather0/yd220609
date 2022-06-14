package co.edu.kanumovie.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class FindPw implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 비밀번호 찾아서 돌려주기.
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		vo = dao.userSelect(vo);
		
		
		request.setAttribute("pw", vo.getPw());
		
		return "user/findPw";
	}

}
