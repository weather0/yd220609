package co.edu.kanumovie.likes.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.common.DataSource;
import co.edu.kanumovie.likes.service.LikesMapper;
import co.edu.kanumovie.likes.service.LikesService;
import co.edu.kanumovie.likes.vo.LikesVO;

public class LikesServiceImpl implements LikesService {
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	LikesMapper map = sqlSession.getMapper(LikesMapper.class);

	@Override
	public List<LikesVO> likesSelectList(LikesVO vo) {
		return map.likesSelectList(vo);
	}

	@Override
	public int likesInsert(LikesVO vo) {
		return map.likesInsert(vo);
	}

	@Override
	public int likesDelete(LikesVO vo) {
		return map.likesDelete(vo);
	}


}
