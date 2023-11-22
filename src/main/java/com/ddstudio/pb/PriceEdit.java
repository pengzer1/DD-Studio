package com.ddstudio.pb;

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
import java.util.ArrayList;
import java.util.List;

/**
 * PriceEdit 클래스입니다.
 * 요금 수정을 담당합니다.
 * 
 * 작성자: 김형우
 */
@WebServlet("/pb/priceedit.do")
public class PriceEdit extends HttpServlet {

    /**
     * 수정할 요금 리스트를 넘겨주는 메서드입니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PriceDAO dao = new PriceDAO();

        ArrayList<PriceDTO> list = dao.list();
        ArrayList<PriceDTO> ticketTypeList = dao.ticketTypeList();
        ArrayList<PriceDTO> ageList = dao.ageList();

        req.setAttribute("list", list);  // 티켓 테이블 리스트 보내기
        req.setAttribute("ticketTypeList", ticketTypeList); // 중복제거된 티켓 타입 리스트(1Day,After4) 보내기
        req.setAttribute("ageList", ageList);               // 중복제거된 나이구분 리스트만(age) 보내기

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/price/edit.jsp");
        dispatcher.forward(req, resp);
    }
    /**
     * 요금을 수정하고 결과값을 전달하는 메서드입니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String ticketType = req.getParameter("ticket_type");
        String age = req.getParameter("age");
        String price = req.getParameter("price");


        PriceDAO dao = new PriceDAO();


        PriceDTO dto = new PriceDTO();
        dto.setTicket_type(ticketType);
        dto.setAge(age);
        dto.setPrice((price));

        int result = dao.edit(dto);  // 해당  티켓타입과 , 나이가 같으면 가격 수정


        if (result == 1) {

            resp.sendRedirect("/ddstudio/pb/price.do");

        }else {
            PrintWriter writer = resp.getWriter();

            writer.print("<script>alert('failed');history.back();</script>");
            writer.close();

        }



    }
}
