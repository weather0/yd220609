package co.edu.kanumovie.user.command;

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
import co.edu.kanumovie.genre.vo.GenreVO;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class UserPreference implements Command {
	private ObjectMapper mapper = new ObjectMapper(); 
	private InputStream input;
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		UserService dao = new UserServiceImpl(); 
		Map<String, String> map = new HashMap<String, String>(); 
		UserVO vo = new UserVO(); 
		try {
			input = request.getInputStream();
			map = mapper.readValue(input, new TypeReference<Map<String, String>>() {});
			vo.setEmail(map.get("email"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		List<GenreVO> genrelist = dao.userPreference(vo);
		String jsonData = "";
		try {
			jsonData = mapper.writeValueAsString(genrelist);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:"+jsonData;
	}

}
