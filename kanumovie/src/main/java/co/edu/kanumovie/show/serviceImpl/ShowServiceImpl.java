package co.edu.kanumovie.show.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.common.DataSource;
import co.edu.kanumovie.genre.vo.GenreVO;
import co.edu.kanumovie.show.service.ShowMapper;
import co.edu.kanumovie.show.service.ShowService;
import co.edu.kanumovie.show.vo.ShowVO;

public class ShowServiceImpl implements ShowService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ShowMapper map = sqlSession.getMapper(ShowMapper.class);
	
	@Override
	public List<ShowVO> showSelectList() {
		return map.showSelectList();
	}

	@Override
	public List<ShowVO> showSelectGenreList(GenreVO vo) {
		return map.showSelectGenreList(vo);
	}

	@Override
	public ShowVO showSelect() {
		return map.showSelect();
	}

	@Override
	public int showInsert() {
		return map.showInsert();
	}

	@Override
	public int showUpdate() {
		return map.showUpdate();
	}

	@Override
	public int showDelete() {
		return map.showDelete();
	}

}
