package com.ddstudio.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddstudio.user.repository.UserDAO;

@WebServlet("/user/searchhashtag.do")
public class SearchHashtag extends HttpServlet {

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // DAO 객체 생성
            UserDAO userDAO = new UserDAO();

            // 해시태그 목록 가져오기
            ArrayList<String> hashtagList = userDAO.getHashtagList();

            System.out.println(hashtagList);
            // 해시태그 목록을 JSON 형식으로 변환
            StringBuilder hashtagJson = new StringBuilder("[");
            for (int i = 0; i < hashtagList.size(); i++) {
                hashtagJson.append("\"").append(hashtagList.get(i)).append("\"");
                if (i < hashtagList.size() - 1) {
                    hashtagJson.append(",");
                }
            }
            hashtagJson.append("]");

            // 클라이언트에 전송
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(hashtagJson.toString());
        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}