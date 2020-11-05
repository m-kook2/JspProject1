package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommDao;
import dao.CommDto;

public class CommMngListAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CommDao com = CommDao.getInstance();
		try {
			String idx[]=request.getParameterValues("c_idx");//체크박스를 배열로 받는다. ex: 1-Y
			String delChk="";
			if(idx!=null) {
				for(int i=0; i < idx.length; i++) {
					String gubun[]=idx[i].split("-");//split을 이용해서 - 기준으로 나눈다. 1은 0번째 Y는 1번째 [1,Y]
/*					System.out.println("idx[i] : "+idx[i]);
					System.out.println("gubun[0] : "+gubun[0]);
					System.out.println("gubun[1] : "+gubun[1]);*/
					if(gubun[1].equals("Y")) {
						delChk="N";
						com.update(delChk, Integer.parseInt(gubun[0]));// update comm set del_yn=? where c_idx=?
					}else {
						delChk="Y";
						com.update(delChk, Integer.parseInt(gubun[0]));
					}
				}
			}
			int totCnt  = com.getTotalCnt();			
			String pageNum = request.getParameter("pageNum");	
			if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
			int currentPage = Integer.parseInt(pageNum);	
			int pageSize  = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow   = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			List<CommDto> list = com.commMngList(startRow, endRow);	
			for (int i = 0; i < list.size(); i++) {
				System.out.println("list:"+list.get(i).getC_content());
			}
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;	
			if (endPage > pageCnt) endPage = pageCnt;	
		
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("list", list);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			 
			System.out.println("-----------------------------------------------");  // /ch16/list.do
			System.out.println("startNum-->" + startNum);  // /ch16/list.do
			System.out.println("totCnt-->" + totCnt);  // /ch16/list.do
			System.out.println("currentPage-->" + currentPage);  // /ch16/list.do
			System.out.println("blockSize-->" + blockSize);  // /ch16/list.do
			System.out.println("pageSize-->" + pageSize);  // /ch16/list.do
			System.out.println("pageCnt-->" + pageCnt);  // /ch16/list.do
			System.out.println("startPage-->" + startPage);  // /ch16/list.do
			System.out.println("endPage-->" + endPage);  // /ch16/list.do
		
	} catch (Exception e) {
		System.out.println(e.getMessage());
	} 
		return "mng/commMngList.jsp";
	}
}
