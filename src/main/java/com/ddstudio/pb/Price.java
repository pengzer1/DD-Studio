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
import java.util.ArrayList;

@WebServlet("/pb/price.do")
public class Price extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        PriceDAO dao = new PriceDAO();

        ArrayList<PriceDTO> list = dao.list();

        ArrayList<PriceDTO> personTypeList = dao.personTypeList();

        req.setAttribute("list", list);
        req.setAttribute("personTypeList", personTypeList);



        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/price/detail.jsp");
        dispatcher.forward(req, resp);


    }
}
