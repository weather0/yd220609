package co.edu.kanumovie.user.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class IdCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 아이디 중복 체크.
		UserService dao = new UserServiceImpl();
		List<UserVO> list = new ArrayList<UserVO>();
		
		String email = request.getParameter("email");
		String yes = "n";
		list = dao.userListSelect();
		for(int i=0; i<list.size(); i++) {
			UserVO eqVO = list.get(i);
			if(eqVO.getEmail().equals(email)) {
				yes = "y"; // 아이디 중복한 것이 있음.
			}
		}
		
		request.setAttribute("yes", yes);
		
		return "ajax:[\"yes\":"+yes+"]";
	}

}
