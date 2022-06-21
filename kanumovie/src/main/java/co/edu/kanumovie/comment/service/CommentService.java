package co.edu.kanumovie.comment.service;

import java.util.List;

import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.movie.vo.MovieVO;

public interface CommentService {
	List<CommentVO> commentAllList(CommentVO vo); // comment 출력
	List<MovieVO> commentSelectList(CommentVO vo);
	List<MovieVO> commentSelectTopFiveList();
	String commentSelect(int num); //comment 내용만 가져오기
	int commentInsert(CommentVO vo);
	int commentUpdate(CommentVO vo);
	int commentDelete(int num);
	
	
}
