package com.ddstudio.guide;


import com.ddstudio.activity.Attraction;
import com.ddstudio.activity.model.AttractionDTO;
import com.ddstudio.activity.repository.ActDAO;
import com.ddstudio.guide.model.BusDTO;
import com.ddstudio.guide.repository.BusDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/guide/busadd.do")
public class BusAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        BusDTO dto = new BusDTO();
        BusDAO dao = new BusDAO();

        ArrayList<BusDTO> busList = dao.busList();

        ArrayList<AttractionDTO> attList = dao.attractionList("");

        ArrayList<BusDTO> busInfoList = dao.getBusInfo();


        req.setAttribute("busList", busList);
        req.setAttribute("busInfoList", busInfoList);
        req.setAttribute("attList", attList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/guide/bus/add.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String route = req.getParameter("route"); // 노선 순서
        String busNum = req.getParameter("busNum"); // 버스번호
        String startName = req.getParameter("start_name"); //시작 어트랙션
        String endName = req.getParameter("end_name");      //끝 어트랙션


        BusDTO dto = new BusDTO();
        BusDAO dao = new BusDAO();

        String startNum = dao.startNum(startName);
        String endNum = dao.endNum(endName);



        dto.setRoute_order(route);
        dto.setStart_name(startNum);
        dto.setEnd_name(endNum);
        dto.setBus_seq(busNum);


        int result = dao.add(dto);

        if (result == 1) {

            resp.sendRedirect("/ddstudio/guide/convenient.do");

        }else {
            PrintWriter writer = resp.getWriter();

            writer.print("<script>alert('failed');history.back();</script>");
            writer.close();

        }

    }
}