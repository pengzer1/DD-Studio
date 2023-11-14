package com.ddstudio.pb;


import com.ddstudio.pb.model.BenefitDTO;
import com.ddstudio.pb.model.PriceDTO;
import com.ddstudio.pb.repository.BenefitDAO;
import com.ddstudio.pb.repository.PriceDAO;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/pb/benefitdetail.do")
public class BenefitDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PriceDAO dao = new PriceDAO();

        ArrayList<PriceDTO> list = dao.personTypeList();  // 개인/단체중 개인껏만 가져오기

        BenefitDAO benefitDAO = new BenefitDAO();

        ArrayList<BenefitDTO> benefitList = benefitDAO.list(); // 혜택 리스트 가져오기

        BenefitDTO dto = new BenefitDTO();

        // 할인율 적용 로직
        int seq = Integer.parseInt(req.getParameter("seq"));

        int percent = Integer.parseInt(benefitList.get(seq).getDiscount_rate()); // 할인율 가져오기 ex) 25 숫자로


        double calculate = (double) (100 - percent) / 100;


        ArrayList<String> discountList1Day = new ArrayList<>();
        ArrayList<String> discountListAfter4 = new ArrayList<>();

        for (int i = 0; i < list.size(); i++) {

            if (list.get(i).getTicket_type().equals("1Day")) {

                int discount = (int) (((double) Integer.parseInt(list.get(i).getPrice())) * calculate); // 금액 * 계산된 할인율 적용

                String str = String.format("%,d", discount);

                discountList1Day.add(str);

            } else {

                int discount = (int) (((double) Integer.parseInt(list.get(i).getPrice())) * calculate); // 금액 * 계산된 할인율 적용


                String str = String.format("%,d", discount);

                discountListAfter4.add(str);

            }

        }

        // 할인율 적용 로직 끝

        // 금액 , 찍기 로직 시작

        for (int i = 0; i < list.size(); i++) {

            String result = String.format("%,d", Integer.parseInt(list.get(i).getPrice()));

            list.get(i).setPrice(result);
        }

        // 금액 , 찍기 끝

        // seq로 받은 해당 혜택 리스트의 정보 가져오기
        ArrayList<BenefitDTO> benefitInfoList = benefitDAO.benefitInfo(String.valueOf((seq+1)));


        req.setAttribute("seq", seq);
        req.setAttribute("benefitList", benefitList);
        req.setAttribute("benefitInfoList",benefitInfoList);
        req.setAttribute("discountList1Day", discountList1Day);
        req.setAttribute("discountListAfter4", discountListAfter4);
        req.setAttribute("list", list);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/benefit/detail.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
