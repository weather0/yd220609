package co.edu.kanumovie.likes.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;

public class LikesSelectList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		LikesService dao = new LikesServiceImpl();		
		List<LikesVO> list = new ArrayList<LikesVO>();
		LikesVO vo = new LikesVO();
		vo.setId(Integer.parseInt(request.getParameter("id")));
		vo.setEmail(request.getParameter("email"));
		list = dao.likesSelectList(vo);
		if(!list.isEmpty()) {
			int likesId = list.get(0).getLikesId();
			String email = list.get(0).getEmail();
			request.setAttribute("likesId", likesId);
			request.setAttribute("email", email);
//			Gson gson = new GsonBuilder().create();
//
//			
//			resp.getWriter().print(gson.toJson(list));
		}
		
		// 요기부분에 유진 쓰고 싶은 로직 쓰면 돼


		return "movie/movieInfo";
	}

}
