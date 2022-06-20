package co.edu.kanumovie.comment.service;

import java.util.List;

import co.edu.kanumovie.comment.vo.CommentVO;
import co.edu.kanumovie.movie.vo.MovieVO;

public interface CommentMapper {
	List<CommentVO> commentAllList(CommentVO vo); // comment 출력
	List<MovieVO> commentSelectList(CommentVO vo);
	List<MovieVO> commentSelectTopFiveList(); // Top 5 Comment (Release Date 기준)
	String commentSelect(int num); //comment 내용만 가져오기
	int commentInsert(CommentVO vo);
	int commentUpdate(CommentVO vo);
	int commentDelete(int num);
}
