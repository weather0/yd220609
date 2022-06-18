package co.edu.kanumovie.likes.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;

public class LikesDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		LikesService dao = new LikesServiceImpl();
		LikesVO vo = new LikesVO();
		String cmd = request.getParameter("cmd");
		if (cmd != null) {
			vo.setId(Integer.parseInt(request.getParameter("id")));
			System.out.println(vo.getId());
			vo.setEmail(request.getParameter("email"));
			System.out.println(vo.getEmail());
			System.out.println(vo.getLikes_Id());
			int delete = dao.likesDelete(vo);
			if (delete >= 1) {
				return "ajax:{\"message\":\"deletesuccess\"}";
			} else {
				return "ajax:{\"message\":\"deletefailed\"}";
			}
		}
		System.out.println(request.getParameter("likes_Id"));
		vo.setLikes_Id(Integer.parseInt(request.getParameter("likes_Id")));
		dao.likesDelete(vo);

		return "movie/movieInfo";
	}

}
