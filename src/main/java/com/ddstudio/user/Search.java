package com.ddstudio.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.repository.SearchDTO;
import com.ddstudio.user.repository.UserDAO;

@WebServlet("/user/search.do")
public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchWord = req.getParameter("word");

        UserDAO dao = new UserDAO();
        
        // 검색
        ArrayList<SearchDTO> searchResults = dao.search(searchWord);

        // 검색 결과를 request 속성에 저장
        req.setAttribute("searchResults", searchResults);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/user/search.jsp");
        dispatcher.forward(req, resp);
    }
}
