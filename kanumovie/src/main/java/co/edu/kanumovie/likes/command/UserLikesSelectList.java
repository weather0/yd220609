package co.edu.kanumovie.likes.command;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.serviceImpl.LikesServiceImpl;
import co.edu.kanumovie.likes.vo.LikesVO;
import co.edu.kanumovie.user.vo.UserVO;

public class UserLikesSelectList implements Command {	
	private ObjectMapper mapper = new ObjectMapper(); 
	private InputStream input;
	 
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		LikesService dao = new LikesServiceImpl(); 
		UserVO vo = new UserVO();
		vo.setEmail(request.getParameter("email"));
		if(request.getParameter("email") == null) {
			Map<String, String> map = new HashMap<String, String>();
			try {
				input = request.getInputStream(); 
				map = mapper.readValue(input, new TypeReference<Map<String, String>>() {});
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo = new UserVO(); 
			vo.setEmail(map.get("email"));
			List<LikesVO> likes = dao.userLikesSelectList(vo);
			String jsonData = "";
			try {
				jsonData = mapper.writeValueAsString(likes);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return "ajax:"+jsonData;		
			}
		List<LikesVO> likes = dao.userLikesSelectList(vo);
		request.setAttribute("likeslist", likes);
		return "likes/userLikesSelectList";    
	}


}
