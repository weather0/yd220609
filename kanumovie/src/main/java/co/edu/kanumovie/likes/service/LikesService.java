package co.edu.kanumovie.likes.service;

import java.util.List;

import co.edu.kanumovie.likes.vo.LikesVO;

public interface LikesService {
	List<LikesVO> likesSelectList(LikesVO vo);
	int likesInsert(LikesVO vo); 
	int likesDelete(LikesVO vo); 

}
