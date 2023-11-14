package com.ddstudio.pb;


import com.ddstudio.pb.model.BenefitDTO;
import com.ddstudio.pb.repository.BenefitDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

@WebServlet("/pb/benefitdel.do")
public class BenefitDel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String seq = req.getParameter("seq");


        BenefitDAO dao = new BenefitDAO();

        BenefitDTO dto = dao.get(seq);


        req.setAttribute("dto", dto);
        req.setAttribute("seq", seq);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/benefit/del.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        //1.
        String seq = req.getParameter("seq");

        //2.
        BenefitDAO dao = new BenefitDAO();

        int result = dao.del(seq);

        if (result == 1) {


            resp.sendRedirect("/ddstudio/pb/benefit.do");

        }else {
            PrintWriter writer = resp.getWriter();

            writer.print("<script>alert('failed');history.back();</script>");
            writer.close();

        }
    }
}
