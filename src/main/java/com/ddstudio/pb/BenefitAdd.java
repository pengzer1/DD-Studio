package com.ddstudio.pb;


import com.ddstudio.pb.model.BenefitDTO;
import com.ddstudio.pb.repository.BenefitDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/pb/benefitadd.do")
public class BenefitAdd extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pb/benefit/add.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
            MultipartRequest multi = new MultipartRequest(
                    req, //Request
                    req.getRealPath("/asset/image"), //업로드 폴더 경로
                    1024 * 1024 * 10, //파일의 크기
                    "UTF-8", //인코딩 방식을 바꾸기 때문에 따로 한글 처리를 하지 않아도 된다.
                    policy
            );

            String benefitName = multi.getParameter("benefitName");
            String start = multi.getParameter("start");
            String end = multi.getParameter("end");
            String discount = multi.getParameter("discount");
            String pic = multi.getFilesystemName("pic"); //사진은 geteParameter로 가져오지 않으며, 파일 이름으로 가져와야 한다.


            BenefitDTO dto = new BenefitDTO();
            dto.setName(benefitName);
            dto.setStart_date(start);
            dto.setEnd_date(end);
            dto.setDiscount_rate(discount);
            dto.setImg(pic);


            BenefitDAO dao = new BenefitDAO();

            int result = dao.benefitAdd(dto);

            if (result == 1) {
                resp.sendRedirect("/ddstudio/pb/benefit.do");
            }

        } catch (Exception e) {
            System.out.println("Register.doPost()");
            e.printStackTrace();
        }

        PrintWriter writer = resp.getWriter();

        writer.print("<script>alert('failed');history.back();</script>");


    }
}
