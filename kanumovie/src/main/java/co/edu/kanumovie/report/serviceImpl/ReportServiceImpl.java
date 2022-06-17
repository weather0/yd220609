package co.edu.kanumovie.report.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.common.DataSource;
import co.edu.kanumovie.report.service.ReportMapper;
import co.edu.kanumovie.report.service.ReportService;
import co.edu.kanumovie.report.vo.ReportVO;

public class ReportServiceImpl implements ReportService {
	// db와의 연결을 위해 선언 openSession = true 자동 커밋
		private SqlSession sqlSession = DataSource.getInstance().openSession(true);
		// mybatis-config.xml에 있는 mapper들을 모두 가져온다.
		private ReportMapper map = sqlSession.getMapper(ReportMapper.class);
	@Override
	public int reportInsert(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportInsert(vo);
	}
	
	@Override
	public void reportUpdate(String name) {
		map.reportUpdate(name);
	}

	

}
