package util;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil extends HttpServlet {
	public void filUpload(HttpServletRequest request, String path){
		try {
			request.setCharacterEncoding("utf-8");
			int maxSize = 5 * 1024 * 1024;  // 5 * 1K * 1K = 5M
			String fileSave = path; //ex:) /images/main/photo/
			//String realPath = request.getServletContext().getRealPath(fileSave);
			
			String realPath = fileSave;
			System.out.println(System.getProperty ( "user.home" )) ;
			System.out.println("realPath->"+realPath);
			MultipartRequest multi;
		
			multi = new MultipartRequest(request,realPath,	maxSize,"utf-8", new DefaultFileRenamePolicy());
		
			Enumeration en = multi.getFileNames();
			while(en.hasMoreElements()) {
				//input 태그의 속성이 file인 태그의 name 속성값 :파라미터이름
				String filename1 = (String)en.nextElement(); 
				//서버에 저장된 파일 이름 
				String filename = multi.getFilesystemName(filename1); 
				//전송전 원래의 파일 이름 
				String original = multi.getOriginalFileName(filename1);
				//전송된 파일의 내용 타입 
				String type = multi.getContentType(filename1); 
				//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체생성 
				File file = multi.getFile(filename1); 
				//폴더 없음 생성
				if (!file.exists()) {
					file.mkdirs();
				}
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}
}
