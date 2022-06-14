package co.edu.kanumovie.movie.service;

import java.util.List;

import co.edu.kanumovie.genre.vo.GenreVO;
import co.edu.kanumovie.movie.vo.MovieVO;

public interface MovieService {
	
	public List<MovieVO> movieSelectList();
	public List<MovieVO> movieSelectGenreList(GenreVO vo);
	public MovieVO movieSelect(MovieVO vo);
	public int movieInsert(MovieVO vo); 
	public int movieUpdate(MovieVO vo);
	public int movieDelete(MovieVO vo);

}
