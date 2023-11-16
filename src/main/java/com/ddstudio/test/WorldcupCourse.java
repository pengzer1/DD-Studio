package com.ddstudio.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ddstudio.test.model.CourseDTO;
import com.ddstudio.test.repository.TestDAO;

@WebServlet("/test/worldcup/course/detail.do")
public class WorldcupCourse extends HttpServlet {

	private ArrayList<CourseDTO> courseList;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		TestDAO dao = new TestDAO();

		// 코스 리스트 가져오기
		courseList = dao.getCourseList();

		// 세션 가져오기
		HttpSession session = req.getSession();

		// 세션에서 선택한 코스 리스트 가져오기
		@SuppressWarnings("unchecked") // 제네릭 경고 무시
		ArrayList<String> selectedCourses = (ArrayList<String>) session.getAttribute("selectedCourses");

		// selectedCourses = new ArrayList<>();

		// 선택하지 않은 코스 리스트 생성
		ArrayList<CourseDTO> remainingCourses = new ArrayList<>();
		for (CourseDTO course : courseList) {
			remainingCourses.add(course);
		}

		// 선택하지 않은 코스 중에서 랜덤으로 두 개 선택
		ArrayList<CourseDTO> selectedTwoCourses = getRandomTwoCourses(remainingCourses);

		// 선택한 코스과 선택한 두 코스를 request에 저장
		req.setAttribute("selectedCourses", selectedCourses);
		req.setAttribute("selectedTwoCourses", selectedTwoCourses);

		// 코스 월드컵 페이지 이동
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/test/worldcup/course/detail.jsp");
		dispatcher.forward(req, resp);
	}

	// 랜덤으로 두 코스를 선택하는 메서드
	private ArrayList<CourseDTO> getRandomTwoCourses(ArrayList<CourseDTO> courses) {
		ArrayList<CourseDTO> selectedTwoCourses = new ArrayList<>();

		Random random = new Random();

		// 코스 리스트가 있고, 크기가 1보다 큰 경우
		if (courses != null && courses.size() > 1) {
			int index1 = random.nextInt(courses.size());
			int index2;

			// index1과 다른 index2 선택 (중복 회피)
			do {
				index2 = random.nextInt(courses.size());
			} while (index1 == index2);

			// 두 개의 코스를 리스트에 추가
			selectedTwoCourses.add(courses.get(index1));
			selectedTwoCourses.add(courses.get(index2));
		} else if (courses != null && courses.size() == 1) {
			// 코스가 하나만 남았을 경우
			selectedTwoCourses.add(courses.get(0));
		}

		return selectedTwoCourses;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String selectedCourseseq = req.getParameter("courseSeq"); // 선택한 코스 시퀀스

		HttpSession session = req.getSession(); // 세션 가져오기

		// 세션에서 선택한 코스 리스트
		@SuppressWarnings("unchecked")
		ArrayList<String> selectedCourses = (ArrayList<String>) session.getAttribute("selectedCourses");

		// 새로운 세션일 경우에만 초기화
		if (req.getParameter("isNewSession") != null) {
			selectedCourses = new ArrayList<>();
			session.setAttribute("selectedCourses", selectedCourses);
		}

		// System.out.println(req.getParameter("isNewSession"));

		// 선택한 코스가 중복되지 않았을 경우 추가
		if (!selectedCourses.contains(selectedCourseseq)) {
			selectedCourses.add(selectedCourseseq);
			session.setAttribute("selectedCourses", selectedCourses);

			// 두 개의 코스를 다시 선택
			ArrayList<CourseDTO> remainingCourses = new ArrayList<>();
			for (CourseDTO course : courseList) {
				if (!selectedCourses.contains(course.getCourse_seq())) {
					remainingCourses.add(course);
				}
			}
			ArrayList<CourseDTO> selectedTwoCourses = getRandomTwoCourses(remainingCourses);

			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");

			JSONObject jsonResponse = new JSONObject();
			jsonResponse.put("selectedCourse", selectedCourseseq);
			jsonResponse.put("selectedCourses", selectedCourses);

			// 이미지 정보를 JSON으로 추가
			JSONArray selectedTwoCoursesJsonArray = new JSONArray();
			for (CourseDTO course : selectedTwoCourses) {
				JSONObject courseJson = new JSONObject();
				courseJson.put("course_seq", course.getCourse_seq());
				courseJson.put("name", course.getName());
				courseJson.put("img", course.getImg());
				selectedTwoCoursesJsonArray.add(courseJson);
			}

			// 선택되지 않은 코스 시퀀스 추가
			ArrayList<String> remainingCourseSeqs = new ArrayList<>();
			for (CourseDTO course : remainingCourses) {
				remainingCourseSeqs.add(course.getCourse_seq());
			}
			
			// JSON에 데이터 추가 및 전송
			jsonResponse.put("remainingCourseSeqs", remainingCourseSeqs);
			jsonResponse.put("selectedTwoCourses", selectedTwoCoursesJsonArray);
			resp.getWriter().write(jsonResponse.toString());
		}

	}

}
