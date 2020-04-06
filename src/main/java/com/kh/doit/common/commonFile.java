package com.kh.doit.common;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class commonFile {
	
	// 파일 저장용 메소드
		public static String saveFile(MultipartFile file, HttpServletRequest request, String uploadFiles) {
			// 저장할 경로를 설정
			// uploadFiles : 보드는 보드, 스터디는 스터디 이런식으로 폴더 나눠주세요
			// 웹 서버 contextPath를 불러와서 폴더의 경로를 찾음 (webapp/resources)
			String root = request.getSession().getServletContext().getRealPath("resources");

			String savePath = root + "\\" + uploadFiles; // resources 밑의 업로드 폴더 설정

			File folder = new File(savePath);

			// 만약 buploadFiles가 없으면 새로 생성해주자
			if (!folder.exists()) {
				folder.mkdir(); // 폴더가 없다면 생성해주세요
			}

			// 만약 같은 이름을 가진 파일이 있으면 안되니까 설정
			String originFileName = file.getOriginalFilename();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			// 새로 이름을 만들어준다. 현재시분초 + originFilename의 확장자명을 붙여준다.
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
			// 기존이름의 .xxx (확장자명)을 가져와서 뒤에 붙여줄것이다

			// 원본 파일은 view에서 사용자에게 보여주기 위해서 쓰고
			// rename은 DB에서 중복방지용으로 쓴다.
			System.out.println("renameFileName : " + renameFileName); // 확인용
			String renamePath = folder + "\\" + renameFileName; // 새로만든 파일의 경로

			try {
				file.transferTo(new File(renamePath));
			} catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
			} // 이 때 전달받은 file이 rename명으로 저장이 된다.

			return renameFileName;
		}

		public static void deleteFile(String fileName, HttpServletRequest request, String uploadFiles) {
			// uploadFiles : 보드는 보드, 스터디는 스터디 이런식으로 폴더 나눠주세요
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\" + uploadFiles; // 파일의 경로 설정

			File f = new File(savePath + "\\" + fileName); // 내가 지워줄 파일의 경로 + 파일명까지 주어진다
			// webapp/resources/buploadFiles/20200326110145.png

			if (f.exists()) { // 저 파일이 있다면!
				f.delete(); // 실제 파일을 지워준다
			}
		}

}
