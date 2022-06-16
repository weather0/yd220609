package co.edu.kanumovie.user.vo;

import java.util.Date;

import co.edu.kanumovie.genre.vo.GenreVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private String email;
	private String pw;
	private Date signdate;
	private String nick;
	private int preference1;
	private int preference2;
	private int preference3;
	private String authority;
	private String blockCheck;
	private String report;
	private String fileName;
	private String directoryFileName;
}
