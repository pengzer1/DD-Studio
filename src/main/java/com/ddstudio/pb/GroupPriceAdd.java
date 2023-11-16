package com.ddstudio.pb;


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

@WebServlet("/pb/group-priceadd.do")
public class GroupPriceAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/group-price/add.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



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
        GroupPriceDAO dao = new GroupPriceDAO();

        PriceDTO dto = new PriceDTO();

        dto.setTicket_type(ticketType);
        dto.setAge(age);
        dto.setPrice((price));


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
