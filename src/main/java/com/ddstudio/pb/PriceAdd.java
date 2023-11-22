package com.ddstudio.pb;

/**
 * PriceAdd 클래스입니다.
 * 요금 추가부분을 제공합니다.
 * 
 * @author 김형우
 */

import com.ddstudio.pb.model.PriceDTO;
import com.ddstudio.pb.repository.PriceDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/pb/priceadd.do")
public class PriceAdd extends HttpServlet {
    /**
     * 요금 추가 부분페이지를 불러오는 메서드입니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/price/add.jsp");
        dispatcher.forward(req, resp);


    }
    /**
     * 내용을 받아 요금을 추가해 결과를 전달하는 메서드입니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //AddOk.java

        // 1. 데이터 가져오기
        // 2. DB 작업 > insert
        // 3. 피드백

//        HttpSession session = req.getSession();

        //1.
        req.setCharacterEncoding("utf-8");
        String ticketType = req.getParameter("ticketType");
        String age = req.getParameter("age");
        String price = req.getParameter("price");

        //2.
        PriceDAO dao = new PriceDAO();

        PriceDTO dto = new PriceDTO();

        dto.setTicket_type(ticketType);
        dto.setAge(age);
        dto.setPrice(price);


        /*dto.setSubject(subject);
        dto.setContent(content);
        dto.setId(session.getAttribute("id").toString());*/

        int result = dao.add(dto);

        //3.
        if (result == 1) {

            resp.sendRedirect("/ddstudio/pb/price.do");

        }else {
            PrintWriter writer = resp.getWriter();

            writer.print("<script>alert('failed');history.back();</script>");
            writer.close();

        }

    }
}
