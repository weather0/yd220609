package co.edu.kanumovie.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.genre.vo.GenreVO;
import co.edu.kanumovie.movie.service.MovieService;
import co.edu.kanumovie.movie.serviceImpl.MovieServiceImpl;
import co.edu.kanumovie.movie.vo.MovieVO;

public class MovieSelectGenreList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieService dao = new MovieServiceImpl(); 
		GenreVO vo = new GenreVO(); 
		vo.setId(Integer.valueOf(request.getParameter("id")));
		vo.setName(request.getParameter("name"));
		List<MovieVO> movielist = dao.movieSelectGenreList(vo);
		request.setAttribute("movielist", movielist);
		return "movie/movieSelectGenreList";
	}

}
