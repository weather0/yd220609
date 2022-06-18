package co.edu.kanumovie.admin.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.edu.kanumovie.admin.service.AdminService;
import co.edu.kanumovie.admin.serviceimpl.AdminServiceImpl;
import co.edu.kanumovie.admin.vo.BannerVO;
import co.edu.kanumovie.common.Command;

public class Updatebanner implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("업데이트배너 클래스 들어옴");
		AdminService dao = new AdminServiceImpl();
		BannerVO vo = new BannerVO();
		String saveDir = request.getServletContext().getRealPath("img\\banner");
		int size = 1024 * 1024 * 1024; // 파일 최대 사이즈
		String originalFile = "";
		String dirFile = "";
		String savefile = "img";

		System.out.println(request.getServletContext().getRealPath("img\\banner"));		

		try {
			MultipartRequest multi = new MultipartRequest(request, saveDir, size, "utf-8",
					new DefaultFileRenamePolicy());
			int bid = Integer.valueOf(multi.getParameter("bid"));
			System.out.println("넘겨받은 아이디 > "+ bid);
			String bdirname = multi.getParameter("bdirname");
			System.out.println("넘겨받은 이미지이름 >"+ bdirname);
			// 이전 사진명을 통해 실제로 삭제될 사진을 가져온다
			String deleteImgName = saveDir + "\\" + bdirname;
			System.out.println("삭제될 파일 > " + deleteImgName);
			File deleteImg = new File(deleteImgName);
			
			if (deleteImg.exists()) { // 삭제하고자 하는 파일이 해당 서버에 존재하면 삭제시킨다
				deleteImg.delete();
				System.out.println("사진삭제 완료" + bdirname);
			} else {
				System.out.println("사진 삭제 실패");
			}
			dirFile = multi.getFilesystemName("file"); // 물리공간에 저장될 파일명.
			originalFile = multi.getOriginalFileName("file"); // 실제 파일명.
			vo.setBtitle(multi.getParameter("title"));
			vo.setBcontent(multi.getParameter("content"));
			vo.setGenrename(multi.getParameter("selectedgenre"));
			vo.setBimgsrc(originalFile);
			vo.setBdirname(dirFile);
			vo.setBid(bid);
			System.out.println(vo.getBtitle() + " " + vo.getBcontent() + " " + vo.getGenrename());
			System.out.println(vo.getBimgsrc());
			System.out.println(vo.getBdirname());
			
			int n = dao.updateBanner(vo);
			if (n != 0) {
				System.out.println("=====업데이트성공====");
			} else {
				System.out.println("====업데이트실패===");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	

		return "home.do";

	}

}
