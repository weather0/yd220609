package co.edu.kanumovie.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.edu.kanumovie.admin.vo.BannerVO;
import co.edu.kanumovie.admin.vo.PreferredGenreVO;
import co.edu.kanumovie.report.vo.ReportVO;
import co.edu.kanumovie.user.vo.UserVO;

public interface AdminMapper {

	public List<UserVO> selectAllUserList(@Param("startPage") int startPage,@Param("endPage") int endPage); // 전체 유저 리스트.
	public List<UserVO> selectReportUserList(); //신고 받은 유저 리스트
	public List<UserVO> selectBlackList(); // 블랙 리스트
	public int selectCountWeeklySignUpUsersCount(String weeks); // 주간 회원 가입 유저 수
	public int todayUsersCount(); //오늘 가입한 유저 수
	public int selectAllUserCount(); // 모든 유저 수 
	public int selectAllReportUsers(); //신고 받은 유저 수 
	public int updateBlockCheck(String email); //차단 박기
	public int updateReportCheck(String email); //신고 취소 
	public int updateUnblockCheck(String email); //차단 취소
	public List<PreferredGenreVO> selectUsersPreferredGenre(); //유저 선호 장르 
	public int insertBanner(BannerVO vo); //배너 추가
	public int updateBanner(BannerVO vo); //배너 수정
	public int deleteBanner(int id); //배너 삭제 
	public List<BannerVO> selectAllBannerList(); // 전체 배너 리스트 
	public BannerVO selectBanner(int id); //배너 단건 조회
	public List<ReportVO> selectAllReportList(); //리포트 전체 조회
	public int deleteReport(String email);//리포트 삭제
	public int deleteAllComment(String email);// 커맨트 전체 삭제
}
