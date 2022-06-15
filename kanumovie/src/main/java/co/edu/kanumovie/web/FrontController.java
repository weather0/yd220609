package co.edu.kanumovie.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.kanumovie.admin.command.Admin;
import co.edu.kanumovie.admin.command.AdminMessage;
import co.edu.kanumovie.admin.command.Analytics;
import co.edu.kanumovie.admin.command.UpdateReportCheck;
import co.edu.kanumovie.admin.command.Updateblockcheck;
import co.edu.kanumovie.comment.command.Comment;
import co.edu.kanumovie.comment.command.CommentDelete;
import co.edu.kanumovie.comment.command.CommentInsert;
import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.genre.command.GenreSelectList;
import co.edu.kanumovie.home.command.Home;
import co.edu.kanumovie.movie.command.MovieInfo;
import co.edu.kanumovie.movie.command.MovieSelectGenreList;
import co.edu.kanumovie.movie.command.MovieSelectList;
import co.edu.kanumovie.user.command.FindPw;
import co.edu.kanumovie.user.command.FindPwForm;
import co.edu.kanumovie.user.command.Login;
import co.edu.kanumovie.user.command.LoginForm;
import co.edu.kanumovie.user.command.Logout;
import co.edu.kanumovie.user.command.PreferGenreForm;
import co.edu.kanumovie.user.command.PwChange;
import co.edu.kanumovie.user.command.SignUp;
import co.edu.kanumovie.user.command.SignUpForm;
import co.edu.kanumovie.user.command.UserManage;
import co.edu.kanumovie.user.command.UserManageForm;


@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Command> map = new HashMap<String, Command>(); 

    public FrontController() {
        super();
    }

	@Override
	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new Home());
		map.put("/movieSelectList.do", new MovieSelectList());
		map.put("/admin.do", new Admin());
		map.put("/adminmessage.do", new AdminMessage());
		map.put("/updateblockcheck.do", new Updateblockcheck());		
		map.put("/updatereportcheck.do", new UpdateReportCheck());		
		map.put("/analytics.do", new Analytics());
		map.put("/loginForm.do", new LoginForm());
		map.put("/login.do", new Login());
		map.put("/logout.do",new Logout());
		map.put("/userManageForm.do", new UserManageForm());
		map.put("/userManage.do", new UserManage());
		map.put("/pwChange.do", new PwChange());
		map.put("/preferGenreForm.do", new PreferGenreForm());
		map.put("/signUpForm.do", new SignUpForm());
		map.put("/signUp.do", new SignUp());
		map.put("/findPwForm.do", new FindPwForm());
		map.put("/findPw.do", new FindPw());
		map.put("/comment.do", new Comment());
		map.put("/movieInfo.do", new MovieInfo());		
		map.put("/commentInsert.do", new CommentInsert());
		map.put("/genreSelectList.do", new GenreSelectList());
		map.put("/movieSelectGenreList.do", new MovieSelectGenreList());
		map.put("/commentDelete.do", new CommentDelete());
		
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());
		
		Command command = map.get(page);
		String viewPage = command.exec(request, response);
		
		if (!viewPage.endsWith(".do")) {
			viewPage = viewPage + ".tiles";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
