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
import java.util.ArrayList;

@WebServlet("/pb/benefit.do")
public class Benefit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        BenefitDTO dto = new BenefitDTO();
        BenefitDAO dao = new BenefitDAO();

        ArrayList<BenefitDTO> list = dao.list();

        req.setAttribute("list", list);

        


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/benefit/detail.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
