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

/**
 * BenefitDel 클래스입니다.
 * 혜택 삭제 부분을 담당합니다.
 * 
 * @author 김형우
 */
@WebServlet("/pb/benefitdel.do")
public class BenefitDel extends HttpServlet {

    /**
     * del.jsp 에 삭제할 객체를 넘겨주는 메서드입니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
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

    /**
     * 삭제할 데이터를 입력받아 삭제하는 메서드입니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        //1.
        String seq = req.getParameter("seq");
        System.out.println(seq);

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
