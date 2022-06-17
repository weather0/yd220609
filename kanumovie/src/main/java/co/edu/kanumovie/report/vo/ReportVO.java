package co.edu.kanumovie.report.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ReportVO {
	private String reportSendEmail; // 신고자
	private String reportedNick;
	private String reportedEmail; // 신고받은사람
	private Date reportDate;  // 신고날짜
	private String reportSubject; // 신고사유
	private String reportContent; // 신고내용
	
}
