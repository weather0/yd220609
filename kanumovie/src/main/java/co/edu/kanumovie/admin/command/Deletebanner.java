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

public class Deletebanner implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("딜리트베너드렁옴");
		int bid = Integer.parseInt(request.getParameter("bid"));
		System.out.println(bid);
		String saveDir = request.getServletContext().getRealPath("img\\banner");

		AdminService dao = new AdminServiceImpl();
		BannerVO vo = new BannerVO();
		// MultipartRequest multi = new MultipartRequest(request, saveDir, size,
		// "utf-8", new DefaultFileRenamePolicy());
		// 기존 배너정보 가지고옴
		vo = dao.selectBanner(bid);

		// 이전 사진명을 통해 실제로 삭제될 사진을 가져온다
		String deleteImgName = saveDir +"\\"+vo.getBdirname();
		System.out.println("삭제될 파일 > "+deleteImgName);
		File deleteImg = new File(deleteImgName);
		
		  if(deleteImg.exists()) {    //삭제하고자 하는 파일이 해당 서버에 존재하면 삭제시킨다
			  deleteImg.delete();
	            System.out.println("사진삭제 완료"+vo.getBdirname());
	        } else {
	           System.out.println("사진 삭제 실패");
	        }
		  
		int result = dao.deleteBanner(bid);
		if (result != 0) {
			System.out.println("==delete 성공==");
		} else {
			System.out.println("==delete 실패==");
		}
		return "home.do";

	}
}
