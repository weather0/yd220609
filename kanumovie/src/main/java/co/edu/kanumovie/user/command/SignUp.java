package co.edu.kanumovie.user.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.edu.kanumovie.common.Command;
import co.edu.kanumovie.user.service.UserService;
import co.edu.kanumovie.user.serviceImpl.UserServiceImpl;
import co.edu.kanumovie.user.vo.UserVO;

public class SignUp implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원가입 정보 DB에 기입하고 홈페이지로 돌아가기.
		UserService dao = new UserServiceImpl();
		UserVO vo = new UserVO();
		
		String saveDir = "c:\\Temp\\";
		int size = 1024*1024*1024; // 파일 최대 사이즈
		String originalFile = "";
		String dirFile = "";
	
		try {
			MultipartRequest multi = new MultipartRequest(request, saveDir, size, "utf-8", new DefaultFileRenamePolicy());
			dirFile = multi.getFilesystemName("file"); // 물리공간에 저장될 파일명.
			originalFile = multi.getOriginalFileName("file"); // 실제 파일명.
			vo.setEmail(multi.getParameter("email"));
			vo.setNick(multi.getParameter("nick"));
			vo.setPw(multi.getParameter("pw"));
			vo.setPreference1(12);
			vo.setPreference2(16);
			vo.setPreference3(99);
			vo.setFileName(originalFile);
			vo.setDirectoryFileName(dirFile);
			System.out.println(vo.getEmail());
		} catch(IOException e) {
			e.printStackTrace();
		}
		dao.userInsert(vo);
		request.setAttribute("message", "signup");
		return "home/home";
	}

}
