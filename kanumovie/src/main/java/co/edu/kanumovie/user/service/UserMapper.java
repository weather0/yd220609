package co.edu.kanumovie.user.service;

import java.util.List;

import co.edu.kanumovie.user.vo.UserVO;

public interface UserMapper {
	public List<UserVO> userListSelect(); // 전체 유저 리스트.
//	public List<UserVO> userSearchList(UserVO vo); // 조건부 유저 검색 리스트.	
	public UserVO userSelect(UserVO vo); // 한 개 유저 정보.
	public int userInsert(UserVO vo); // 유저 회원가입.
	public int userUpdate(UserVO vo); // 유저 정보 변경. > 임시로 닉네임 바꾸는 거만.
	public int userDelete(UserVO vo); // 유저 회원탈퇴.
}
