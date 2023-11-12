package com.ddstudio.pb;

import com.ddstudio.DBUtil;
import com.ddstudio.pb.model.PriceDTO;
import com.ddstudio.pb.repository.GroupPriceDAO;
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

@WebServlet("/pb/group-pricedel.do")

public class GroupPriceDel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        GroupPriceDAO dao = new GroupPriceDAO();
//        PriceDAO dao = new PriceDAO();

        ArrayList<PriceDTO> list = dao.groupList();
//        ArrayList<PriceDTO> list = dao.list();
        ArrayList<PriceDTO> ticketTypeList = dao.ticketTypeList();
        ArrayList<PriceDTO> ageList = dao.ageList();

        req.setAttribute("list", list);  // 티켓 테이블 리스트 보내기
        req.setAttribute("ticketTypeList", ticketTypeList); // 중복제거된 티켓 타입 리스트(1Day,After4) 보내기
        req.setAttribute("ageList", ageList);               // 중복제거된 나이구분 리스트만(age) 보내기




        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/group-price/del.jsp");
        dispatcher.forward(req, resp);


    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String ticketType = req.getParameter("ticket_type");
        String age = req.getParameter("age");


        GroupPriceDAO dao = new GroupPriceDAO();
//        PriceDAO dao = new PriceDAO();

        PriceDTO dto = new PriceDTO();
        dto.setTicket_type(ticketType);
        dto.setAge(age);

        int result = dao.del(dto);

        if (result == 1) {

            resp.sendRedirect("/ddstudio/pb/price.do");

        } else {
            PrintWriter writer = resp.getWriter();

            writer.print("<script>alert('failed');history.back();</script>");
            writer.close();

        }
    }
}