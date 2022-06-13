package co.edu.kanumovie.user.vo;

import java.util.Date;

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
}
