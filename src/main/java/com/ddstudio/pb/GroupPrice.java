package com.ddstudio.pb;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * GroupPrice 클래스입니다.
 * 단체 요금을 제공합니다.
 * 
 * @author 김형우
 */
public class GroupPrice extends HttpServlet {
    /**
     * 단체해택 리스트 jsp 페이지를 불러오는 메서드입니다.
     * @param req HttpServletRequest 객체입니다.
     * @param resp HttpServletResponse 객체입니다.
     * @throws ServletException 예외 처리입니다.
     * @throws IOException   예외 처리입니다.
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/group-price/detail.jsp");
        dispatcher.forward(req, resp);


    }
}
