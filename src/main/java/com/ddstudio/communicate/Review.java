package com.ddstudio.communicate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ddstudio.communicate.model.ReviewDTO;
import com.ddstudio.communicate.repository.CommuDAO;

/**
 * Review 서블릿은 리뷰 목록을 제공하는 기능을 담당합니다.
 * 
 * @author 차수민
 */
@WebServlet("/communicate/review.do")
public class Review extends HttpServlet {

	/**
     * HTTP GET 요청을 처리하여 리뷰 목록 페이지로 이동합니다.
     * 
     * @param req  클라이언트의 HttpServletRequest 객체입니다.
     * @param resp 클라이언트에게 응답을 보내기 위한 HttpServletResponse 객체입니다.
     * @throws ServletException 서블릿 요청을 처리하는 동안 오류가 발생한 경우 예외가 발생합니다.
     * @throws IOException      입력 또는 출력 예외가 발생한 경우 예외가 발생합니다.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String sort = req.getParameter("sort");

        HashMap<String, String> map = new HashMap<String, String>();

        map.put("sort", sort);

        int currentPage = 0;

        String page = req.getParameter("page");

        if (page == null || page.equals("")) {

            currentPage = 1;

        } else {

            currentPage = Integer.parseInt(page);

        }

        int reviewsPerPage = 9;

        int startIndex = ((currentPage - 1) * reviewsPerPage) + 1;

        int endIndex = startIndex + reviewsPerPage - 1;

        map.put("startIndex", String.format("%d", startIndex));
        map.put("endIndex", String.format("%d", endIndex));
        
        HttpSession session = req.getSession();
		
		session.setAttribute("read", "n");

        CommuDAO dao = new CommuDAO();

        ArrayList<ReviewDTO> list = dao.getReviewList(map);
        
        for (ReviewDTO dto : list) {

            String subject = dto.getSubject();

            if (subject.length() > 15) {

                subject = subject.substring(0, 15) + " ...";

            }

            subject = subject.replace("<", "&lt;");
            subject = subject.replace(">", "&gt;");

            dto.setSubject(subject);

            String regdate = dto.getRegdate();

            regdate = regdate.substring(0, 10);

            dto.setRegdate(regdate);

        }

        int blockSize = 5;

        int pageNumber = ((currentPage - 1) / blockSize) * blockSize + 1;

        StringBuilder sb = new StringBuilder();

        int totalReviews = dao.getTotalReviews(map);

        int totalPages = (int)Math.ceil((double)totalReviews / reviewsPerPage);

        if (pageNumber != 1) {

            sb.append(String.format("<a href='/ddstudio/communicate/review.do?page=%d&sort=%s' id='previous-button'><span class='material-symbols-outlined'>navigate_before</span></a>", pageNumber - 1, sort));

        }

        int loop = 1;

        while (!(loop > blockSize || pageNumber > totalPages)) {

            if (pageNumber == currentPage) {

                sb.append(String.format("<a href='#!' id='current-page'>%d</a>", pageNumber));

            } else {

                sb.append(String.format("<a href='/ddstudio/communicate/review.do?page=%d&sort=%s' id='other-pages'>%d</a>", pageNumber, sort, pageNumber));

            }

            loop++;
            pageNumber++;

        }

        if (pageNumber <= totalPages) {

            sb.append(String.format("<a href='/ddstudio/communicate/review.do?page=%d&sort=%s' id='next-button'><span class='material-symbols-outlined'>navigate_next</span></a>", pageNumber, sort));

        }

        req.setAttribute("list", list);

        req.setAttribute("map", map);

        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalReviews", totalReviews);
        req.setAttribute("totalPages", totalPages);

        req.setAttribute("pageBar", sb.toString());

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/communicate/review/list.jsp");

        dispatcher.forward(req, resp);

    }

}
