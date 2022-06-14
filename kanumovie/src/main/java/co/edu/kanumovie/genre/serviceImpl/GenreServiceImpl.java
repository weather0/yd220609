package co.edu.kanumovie.genre.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.common.DataSource;
import co.edu.kanumovie.genre.service.GenreMapper;
import co.edu.kanumovie.genre.service.GenreService;
import co.edu.kanumovie.genre.vo.GenreVO;

public class GenreServiceImpl implements GenreService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	GenreMapper map = sqlSession.getMapper(GenreMapper.class);

	@Override
	public List<GenreVO> genreSelectList() {
		return map.genreSelectList();
	}

	@Override
	public GenreVO genreSelect() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int genreInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int genreUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int genreDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

}
