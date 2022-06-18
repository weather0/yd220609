package co.edu.kanumovie.likes.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;

=======
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;
//import com.google.gson.GsonBuilder;
>>>>>>> refs/remotes/origin/dev
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;

public class LikesSelectList implements Command {
	
	private ObjectMapper map = new ObjectMapper(); 

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
<<<<<<< HEAD

=======
>>>>>>> refs/remotes/origin/dev
		LikesService dao = new LikesServiceImpl();
		List<LikesVO> list = new ArrayList<LikesVO>();
		LikesVO vo = new LikesVO();
		list = dao.likesSelectList(vo);
<<<<<<< HEAD
=======
		// 장르별 영화 페이지 좋아요 리스트 조회
		if (request.getParameter("genre") != null) {
			request.setAttribute("likelist", list);
			return "movie/movieSelectGenreList";
		}
		for(int i = 0; i<list.size(); i++){
			// 작업 진행중
		}
		
>>>>>>> refs/remotes/origin/dev

		// 요청 넘어오는지 확인
//		System.out.println(Integer.parseInt(request.getParameter("id")));
//		System.out.println(request.getParameter("email")); // 로그아웃상태면 null값으로 넘어옴(요청실패하지는 않음!)

//		Gson gson = new GsonBuilder().create();
		ObjectMapper mapper = new ObjectMapper();

		// 로그인O 좋아요O
		if (!list.isEmpty()) {
			try {
//				System.out.println(mapper.writeValueAsString(list.get(0)));
				return "ajax:" + mapper.writeValueAsString(list.get(0)); // 밑의 return은 무시됨
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 로그인O 좋아요X
		} else {
			vo = new LikesVO();
			list.add(vo);
			vo.setEmail("0");
			vo.setId(0);
			vo.setLikes_Id(0);
			try {
//				System.out.println(mapper.writeValueAsString(vo));
				return "ajax:" + mapper.writeValueAsString(vo);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}

		// 실패코드
		// 아무리해도 Gson으로는 계속 실패남ㅜ 
		// js단에서 result 찍어보면 "SyntaxError: Unexpected token < in JSON at position" 로 나옴. 
		// 무슨 수를 써도 죽어도 안 됨ㅜ sysout해보면 ObjectMapper방식과 백퍼 동일한데도 js로만 넘어가면 파싱오류 남. 이유는 알 수 없음.
//		if (!list.isEmpty()) {
//			int likesId = list.get(0).getLikesId();
//			String email = list.get(0).getEmail();
//			request.setAttribute("likesId", likesId);
//			request.setAttribute("email", email);
//			try {
//				System.out.println(gson.toJson(list));
//				System.out.println("ajax:" + gson.toJson(list.get(0)));
//				return "ajax:" + (list.get(0));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}

		return "movie/movieInfo";
	}

}
