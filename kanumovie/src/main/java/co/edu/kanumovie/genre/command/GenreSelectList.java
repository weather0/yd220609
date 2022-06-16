package co.edu.kanumovie.genre.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.genre.service.GenreService;
import co.edu.kanumovie.genre.serviceImpl.GenreServiceImpl;
import co.edu.kanumovie.genre.vo.GenreVO;

public class GenreSelectList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		GenreService dao = new GenreServiceImpl(); 
		List<GenreVO> genrelist = dao.genreSelectList();
		if (request.getParameter("type") != null) {
			ObjectMapper mapper = new ObjectMapper(); 
			String data = "";
			try {
				data = mapper.writeValueAsString(genrelist);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return "ajax:" + data;
		}
		request.setAttribute("genrelist", genrelist);
		return "genre/genreSelectList";
	}

}
