package co.edu.kanumovie.admin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.edu.kanumovie.admin.vo.BannerVO;
import co.edu.kanumovie.admin.vo.PreferredGenreVO;
import co.edu.kanumovie.admin.vo.VisitVO;
import co.edu.kanumovie.report.vo.ReportVO;
import co.edu.kanumovie.user.vo.UserVO;

 public interface AdminMapper {

	 List<UserVO> selectAllUserList(@Param("startPage") int startPage,@Param("endPage") int endPage); // 전체 유저 리스트.
	 List<UserVO> selectReportUserList(); //신고 받은 유저 리스트
	 List<UserVO> selectBlackList(); // 블랙 리스트
	 int selectCountWeeklySignUpUsersCount(String weeks); // 주간 회원 가입 유저 수
	 int todayUsersCount(); //오늘 가입한 유저 수
	 int selectAllUserCount(); // 모든 유저 수 
	 int selectAllReportUsers(); //신고 받은 유저 수 
	 int updateBlockCheck(String email); //차단 박기
	 int updateReportCheck(String email); //신고 취소 
	 int updateUnblockCheck(String email); //차단 취소
	 List<PreferredGenreVO> selectUsersPreferredGenre(); //유저 선호 장르 
	 int insertBanner(BannerVO vo); //배너 추가
	 int updateBanner(BannerVO vo); //배너 수정
	 int deleteBanner(int id); //배너 삭제 
	 List<BannerVO> selectAllBannerList(); // 전체 배너 리스트 
	 BannerVO selectBanner(int id); //배너 단건 조회
	 List<ReportVO> selectAllReportList(); //리포트 전체 조회
	 int deleteReport(String email);//리포트 삭제
	 int deleteAllComment(String email);// 커맨트 전체 삭제
	 int insertVisit();//방문자수 증가
	 int selectTodaysVisit(); //오늘 방문자수 조회 
	 String selectCountWeeklyVisit(String weeks);//일주일별 방문자 수 조회
}
