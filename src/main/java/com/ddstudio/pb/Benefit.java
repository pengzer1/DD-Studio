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

/**
 * Benefit 클래스 입니다.
 * 혜택 관련 부분의 모든 기능을 제공합니다.
 *
 * 작성자: 김형우
 */
@WebServlet("/pb/benefit.do")
public class Benefit extends HttpServlet {

    /**
     * 일반혜택,카드/혜택 리스트를 jsp로 넘겨줍니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        BenefitDTO dto = new BenefitDTO();
        BenefitDAO dao = new BenefitDAO();

        ArrayList<BenefitDTO> list = dao.list();

        ArrayList<BenefitDTO> normalList = dao.nomalList();
        ArrayList<BenefitDTO> cardList = dao.cardList();


        req.setAttribute("cardList", cardList);
        req.setAttribute("normalList",normalList);
        req.setAttribute("list", list);

        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/benefit/list.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
