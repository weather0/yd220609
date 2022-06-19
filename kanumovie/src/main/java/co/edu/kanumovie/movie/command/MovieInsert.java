package co.edu.kanumovie.movie.command;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.movie.service.MovieService;
import co.edu.kanumovie.movie.serviceImpl.MovieServiceImpl;
import co.edu.kanumovie.movie.vo.MovieVO;

public class MovieInsert implements Command {
	private ObjectMapper mapper = new ObjectMapper(); 
	private InputStream input;
	private MovieVO vo;
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MovieService dao = new MovieServiceImpl();
		Map<String, String> map = new HashMap<String, String>(); 
		try {
			input = request.getInputStream(); 
			map = mapper.readValue(input, new TypeReference<Map<String, String>>() {});		
		} catch (IOException e) {
			e.printStackTrace();
		}
		vo = new MovieVO(); 
		vo.setAdult(map.get("adult"));
		vo.setBackdropPath(map.get("backdropPath"));
		vo.setGenreIds(map.get("genreIds"));
		vo.setId(Integer.parseInt(map.get("id")));
		vo.setOriginalLanguage(map.get("originalLanguage"));
		vo.setOriginalTitle(map.get("originalTitle"));
		vo.setOverview(map.get("overview"));
		vo.setPopularity(Double.parseDouble(map.get("popularity")));
		vo.setPosterPath(map.get("posterPath"));
		vo.setReleaseDate(Date.valueOf(map.get("releaseDate")));
		System.out.println(vo.getReleaseDate());
		vo.setTitle(map.get("title"));
		vo.setVideo(map.get("video"));
		vo.setVoteAverage(Double.parseDouble(map.get("voteAverage")));
		vo.setVoteCount(Integer.parseInt(map.get("voteCount")));
		int insert = dao.movieInsert(vo);
		if (insert == 0) {
			System.out.println("0개 병합");
		} else if (insert == 1) {
			System.out.println("1개 추가");
		}
		System.out.println(vo.getId());
		request.setAttribute("id", vo.getId());
		return "ajax:{\"id\":\"" + vo.getId() + "\"}";
	}

}
