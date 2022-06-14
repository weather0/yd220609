package co.edu.kanumovie.admin.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.edu.kanumovie.admin.service.AdminMapper;
import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.common.DataSource;
import co.edu.kanumovie.user.vo.UserVO;

public class AdminServiceImpl implements AdminService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private AdminMapper map = sqlSession.getMapper(AdminMapper.class);
	
	
	@Override
	public List<UserVO> selectAllUserList() {
		return map.selectAllUserList();
	}

	@Override
	public int todayUsersCount() {
		return map.todayUsersCount();
	}

	@Override
	public int selectAllUserCount() {
		
		return map.selectAllUserCount();
	}


}
