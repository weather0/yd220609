package co.edu.kanumovie.likes.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;

public class LikesSelectList implements Command {
	
	private ObjectMapper map = new ObjectMapper(); 

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		LikesService dao = new LikesServiceImpl();
		LikesVO vo = new LikesVO();
		
		List<LikesVO> list = new ArrayList<LikesVO>();
		list = dao.likesSelectList();
		// 장르별 영화 페이지 좋아요 리스트 조회
		if (request.getParameter("genre") != null) {
			request.setAttribute("likelist", list);
			return "movie/movieSelectGenreList";
		}
		for(int i = 0; i<list.size(); i++){
			// 작업 진행중
		}
		
		
		
		return "movie/movieInfo";
	}

}
