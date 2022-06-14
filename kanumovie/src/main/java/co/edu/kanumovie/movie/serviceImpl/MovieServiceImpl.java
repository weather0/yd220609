package co.edu.kanumovie.movie.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.common.DataSource;
import co.edu.kanumovie.genre.vo.GenreVO;
import co.edu.kanumovie.movie.service.MovieMapper;
import co.edu.kanumovie.movie.service.MovieService;
import co.edu.kanumovie.movie.vo.MovieVO;

public class MovieServiceImpl implements MovieService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MovieMapper map = sqlSession.getMapper(MovieMapper.class);
	
	@Override
	public List<MovieVO> movieSelectList() {
		return map.movieSelectList();
	}

	@Override
	public MovieVO movieSelect(MovieVO vo) {
		return map.movieSelect(vo);
	}

	@Override
	public int movieInsert(MovieVO vo) {
		return map.movieInsert(vo);
	}

	@Override
	public int movieUpdate(MovieVO vo) {
		return map.movieUpdate(vo);
	}

	@Override
	public int movieDelete(MovieVO vo) {
		return map.movieDelete(vo);
	}

	@Override
	public List<MovieVO> movieSelectGenreList(GenreVO vo) {
		return map.movieSelectGenreList(vo);
	}

}
