package co.edu.kanumovie.comment.service;

import java.util.List;

import co.edu.kanumovie.comment.vo.CommentVO;

public interface CommentService {
	List<CommentVO> commentAllList(CommentVO vo); // comment 출력
	int commentInsert(CommentVO vo);
	int commentUpdate(CommentVO vo);
	int commentDelete(CommentVO vo);
	
	
}
