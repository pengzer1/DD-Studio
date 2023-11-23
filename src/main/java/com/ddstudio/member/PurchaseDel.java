package com.ddstudio.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.ddstudio.member.repository.UserBuyDAO;

/**
 * 구매취소를 담당하는 서블릿 클래스입니다.
 * 
 * @author 황주원
 *
 */
@WebServlet("/member/purchasedel.do")
public class PurchaseDel extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PurchaseDel.java
		String[] UserBuySeqStr = req.getParameterValues("user_buy_seq");

		int result = 0;

		UserBuyDAO dao = new UserBuyDAO();

		// 여러 예약을 삭제하기 위해 배열을 순회합니다.
		//System.out.println(Arrays.toString(BookuserSeqStr));
		for (String UserBuySeq : UserBuySeqStr) {
			result += dao.del(UserBuySeq);
		}

		// 예약 취소 후에 어떤 동작을 할지에 대한 로직을 추가할 수 있습니다.

		// 예약 취소 후에 어떤 페이지로 이동할지 결정합니다. 아래는 예시로 새로고침하는 코드입니다.
		// resp.sendRedirect(req.getContextPath() + "/member/ticketList.jsp");

		if (UserBuySeqStr.length == result) {
			result = 1;
		} else {
			result = 0;
		}

		resp.setContentType("application/json");

		JSONObject obj = new JSONObject();
		obj.put("result", result);

		PrintWriter writer = resp.getWriter();
		writer.write(obj.toString()); // { "result" : 1 }
		writer.close();

	}
}
