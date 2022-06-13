package co.edu.kanumovie.movie.service;

import java.util.List;

import co.edu.kanumovie.movie.vo.MovieVO;

public interface MovieMapper {
	
	public List<MovieVO> movieSelectList();
	public MovieVO movieSelect(MovieVO vo);
	public int movieInsert(MovieVO vo); 
	public int movieUpdate(MovieVO vo);
	public int movieDelete(MovieVO vo);

}
