package co.edu.kanumovie.comment.service;

import java.util.List;

import co.edu.kanumovie.comment.vo.CommentVO;

public interface CommentMapper {
	List<CommentVO> commentAllList(CommentVO vo); // comment 출력
	String commentSelect(int num); //comment 내용만 가져오기
	int commentInsert(CommentVO vo);
	int commentUpdate(CommentVO vo);
	int commentDelete(int num);
}
