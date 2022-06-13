package co.edu.kanumovie.movie.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.movie.service.MovieService;
import co.edu.kanumovie.movie.serviceImpl.MovieServiceImpl;
import co.edu.kanumovie.movie.vo.MovieVO;

public class MovieSelectList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieService dao = new MovieServiceImpl();
		List<MovieVO> movielist = new ArrayList<MovieVO>();
		movielist = dao.movieSelectList();
		request.setAttribute("movielist", movielist);
		return "movie/movieSelectList";
	}

}
