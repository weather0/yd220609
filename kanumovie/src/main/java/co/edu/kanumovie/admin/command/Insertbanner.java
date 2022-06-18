package co.edu.kanumovie.admin.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.admin.vo.BannerVO;
import co.edu.kanumovie.common.Command;

public class Insertbanner implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		AdminService dao = new AdminServiceImpl();
		BannerVO vo = new BannerVO();
		
		String saveDir = request.getServletContext().getRealPath("img\\banner");
		int size = 1024*1024*1024; // 파일 최대 사이즈
		String originalFile = "";
		String dirFile = "";
		String savefile = "img";
			
		System.out.println(request.getServletContext().getRealPath("img\\banner"));


	
		try {
			MultipartRequest multi = new MultipartRequest(request, saveDir, size, "utf-8", new DefaultFileRenamePolicy());
			dirFile = multi.getFilesystemName("file"); // 물리공간에 저장될 파일명.
			originalFile = multi.getOriginalFileName("file"); // 실제 파일명.
			vo.setBtitle(multi.getParameter("title"));
			vo.setBcontent(multi.getParameter("content"));
			vo.setGenrename(multi.getParameter("selectedgenre"));
			vo.setBimgsrc(originalFile);
			vo.setBdirname(dirFile);
			System.out.println(vo.getBtitle() + " " + vo.getBcontent() + " " + vo.getGenrename());
			System.out.println(vo.getBimgsrc());
			System.out.println(vo.getBdirname());
		} catch(IOException e) {
			e.printStackTrace();
		}
		int n = dao.insertBanner(vo);
		
		if(n != 0) {
			System.out.println("=====인설트성공====");
		} else {
			System.out.println("====인설트실패===");
		}
			
		return "home.do";
	}

}
