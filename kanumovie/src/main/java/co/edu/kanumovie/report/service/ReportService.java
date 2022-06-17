package co.edu.kanumovie.report.service;

import co.edu.kanumovie.report.vo.ReportVO;

public interface ReportService {
	int reportInsert(ReportVO vo); // 신고 등록
	void reportUpdate(String name); // 신고 후 user table 업데이트
	
	
}
