package co.edu.kanumovie.admin.service;

import java.util.List;

import co.edu.kanumovie.user.vo.UserVO;

public interface AdminMapper {

	public List<UserVO> selectAllUserList(); // 전체 유저 리스트.
	
	public int todayUsersCount();
	
	public int selectAllUserCount();
}
