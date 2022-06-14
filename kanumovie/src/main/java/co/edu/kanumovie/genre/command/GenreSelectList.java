package co.edu.kanumovie.genre.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.genre.service.GenreService;
import co.edu.kanumovie.genre.serviceImpl.GenreServiceImpl;
import co.edu.kanumovie.genre.vo.GenreVO;

public class GenreSelectList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		GenreService dao = new GenreServiceImpl(); 
		List<GenreVO> genrelist = dao.genreSelectList();
		request.setAttribute("genrelist", genrelist);
		for (int i = 0; i < genrelist.size(); i++) {
			System.out.println(genrelist.get(i).getName());
		}
		return "genre/genreSelectList";
	}

}
