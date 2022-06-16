package co.edu.kanumovie.likes.service;

import java.util.List;

import co.edu.kanumovie.likes.vo.LikesVO;

public interface LikesMapper {
	List<LikesVO> likesSelectList();
	int likesInsert(LikesVO vo); 
	int likesDelete(LikesVO vo); 

}
