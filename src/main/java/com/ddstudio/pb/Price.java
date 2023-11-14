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
import java.util.ArrayList;

@WebServlet("/pb/price.do")
public class Price extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PriceDAO dao = new PriceDAO();

        GroupPriceDAO groupDao = new GroupPriceDAO();


        PriceDTO dto = new PriceDTO();

        ArrayList<PriceDTO> list = dao.list();

        ArrayList<PriceDTO> personTypeList = dao.personTypeList();  // 티켓에서 개인 리스트만 가져오기

        ArrayList<PriceDTO> groupList = groupDao.groupList(); // 티켓에서 그룹 리스트만 가져오기

// 금액에 , 찍기 시작
        for (int i = 0; i < personTypeList.size(); i++) {

            String result1= String.format("%,d", Integer.parseInt(personTypeList.get(i).getPrice()));

            personTypeList.get(i).setPrice(result1);
        }

        for (int i = 0; i < groupList.size(); i++) {

            String result2 = String.format("%,d", Integer.parseInt(groupList.get(i).getPrice()));
            groupList.get(i).setPrice(result2);

        }
        // 금액에 , 찍기  끝


            req.setAttribute("list", list);
        req.setAttribute("personTypeList", personTypeList);
        req.setAttribute("groupList",groupList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/price/detail.jsp");
        dispatcher.forward(req, resp);

    }

}
