package co.edu.kanumovie.comment.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class CommentVO {
	private String nick;
	private String cid;
	private String comments;
	private Date wdate;
	private String id; // movies 테이블 영화아이디
	private String email; // user 테이블 email
	private String fileName; // 파일 경로 이름.
	
}
