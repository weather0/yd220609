package co.edu.kanumovie.comment.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.comment.service.CommentMapper;
import co.edu.kanumovie.comment.service.CommentService;
import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.common.DataSource;

public class CommentServiceImpl implements CommentService {
	// db와의 연결을 위해 선언 openSession = true 자동 커밋
		private SqlSession sqlSession = DataSource.getInstance().openSession(true);
		// mybatis-config.xml에 있는 mapper들을 모두 가져온다.
		private CommentMapper map = sqlSession.getMapper(CommentMapper.class);
	@Override
	public List<CommentVO> commentAllList() {
		// TODO Auto-generated method stub
		return map.commentAllList();
	}

	@Override
	public int commentInsert(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentInsert(vo);
	}

	@Override
	public int commentUpdate(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentUpdate(vo);
	}

	@Override
	public int commentDelete(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentDelete(vo);
	}

}
