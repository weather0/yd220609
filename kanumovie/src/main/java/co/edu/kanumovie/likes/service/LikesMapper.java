package co.edu.kanumovie.likes.service;

import java.util.List;

import co.edu.kanumovie.likes.vo.LikesVO;
import co.edu.kanumovie.user.vo.UserVO;

public interface LikesMapper {
	List<LikesVO> userLikesSelectList(UserVO vo);
	List<LikesVO> likesSelectList(LikesVO vo);
	int likesInsert(LikesVO vo); 
	int likesDelete(LikesVO vo); 

}
