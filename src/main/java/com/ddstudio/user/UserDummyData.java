package com.ddstudio.user;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

/*
 * tblUser 테이블에 추가할 회원 더미데이터를 생성하는 클래스입니다.
 * 
 * 작성자: 이승원
 */
public class UserDummyData {

	private static Set<String> generatedTelephoneNumbers = new HashSet<>();

	public static void main(String[] args) {
		try {
			String filePath = "C:\\Class\\code\\server\\DD-Studio\\src\\main\\java\\com\\ddstudio\\user\\user_dml.sql"; // 파일

			try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
				Random random = new Random();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

				// 1,000개의 더미 데이터 생성
				for (int i = 1; i <= 1000; i++) {
					String name = getRandomName();
					String email = getRandomEmail();
					String tel = getRandomUniqueTelephone();
					String birth = getRandomBirthdate();
					String password = getRandomPassword(email, birth);
					String lv = "1";
					String ing = getRandomIng();
					String zipCode = getRandomNumericString(5);
					String address = generateRandomAddress(zipCode);

					// SQL 쿼리문
					String insertStatement = String.format(
							"INSERT INTO tblUser (user_seq, name, email, pw, tel, address, birth, lv, ing)\r\n"
									+ "VALUES (seqtblUser.nextVal, '%s', '%s', '%s', '%s', '%s', TO_DATE('%s', 'yyyy-mm-dd'), '%s', '%s');\r\n",
							name, email, password, tel, address, birth, lv, ing, zipCode);

					writer.println(insertStatement);
				}

				System.out.println("User DML 생성 성공");

			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 무작위 이메일 생성
	private static String getRandomEmail() {
		Random random = new Random();

		// 이메일 도메인
		String[] domains = { "chol.com", "daum.net", "gmail.com", "kakao.com", "nate.com", "naver.com", "outlook.com", "msn.com", "me.com" };
		String domain = domains[random.nextInt(domains.length)];

		// 무작위 문자열을 이메일 앞에 추가
		int prefixLength = random.nextInt(6) + 3;
		String prefix = getRandomAlphabeticString(prefixLength);

		return prefix + "@" + domain;
	}

	private static String getRandomAlphabeticString(int length) {
		String alphabet = "abcdefghijklmnopqrstuvwxyz";
		StringBuilder randomString = new StringBuilder();
		Random random = new Random();

		for (int i = 0; i < length; i++) {
			randomString.append(alphabet.charAt(random.nextInt(alphabet.length())));
		}

		return randomString.toString();
	}

	// 이름 생성
	private static String getRandomName() {
		Random random = new Random();
		int rand = random.nextInt(100);

		if (rand < 80) {
			return generateRandomName(3);
		} else if (rand < 90) {
			return generateRandomName(2);
		} else {
			int length = random.nextInt(3) + 4;
			return generateRandomName(length);
		}
	}

	// 무작위 성씨와 이름을 조합하여 이름 생성
	private static String generateRandomName(int length) {
		String[] names = { "김", "이", "박", "최", "정", "강", "조", "윤", "장", "임" };
		String[] firstName = { "민", "서", "영", "준", "현", "지", "우", "아", "리", "도" };
		Random random = new Random();

		StringBuilder nameBuilder = new StringBuilder();
		for (int i = 0; i < length; i++) {
			if (i == 0) {
				nameBuilder.append(names[random.nextInt(names.length)]); // 성씨
			} else {
				nameBuilder.append(firstName[random.nextInt(firstName.length)]); // 이름
			}
		}

		return nameBuilder.toString();
	}

	// 무작위 숫자로 이루어진 문자열 생성
	private static String getRandomNumericString(int length) {
		StringBuilder numericString = new StringBuilder();
		Random random = new Random();

		for (int i = 0; i < length; i++) {
			numericString.append(random.nextInt(10));
		}

		return numericString.toString();
	}

	// 무작위 비밀번호 생성
	private static String getRandomPassword(String email, String birth) {
		Random random = new Random();

		// 8 ~ 15 글자
		int length = random.nextInt(8) + 8;

		// 허용 문자열
		String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";
		String specials = "!@#$%^&*()-_=+";

		StringBuilder password = new StringBuilder();

		// 영어
		String emailPrefix = email.split("@")[0];
		password.append(emailPrefix);

		// 생년
		password.append(birth.substring(2, 4));

		// 특수 문자 추가
		password.append(specials.charAt(random.nextInt(specials.length())));

		// 90% 확률로 1~2개의 특수 문자 추가
		if (random.nextDouble() < 0.9) {
			password.append(specials.charAt(random.nextInt(specials.length())));
		}

		// 문자와 숫자를 셔플
		for (int i = password.length(); i < length; i++) {
			if (random.nextBoolean()) {
				password.append(letters.charAt(random.nextInt(letters.length())));
			} else {
				password.append(numbers.charAt(random.nextInt(numbers.length())));
			}
		}

		// 비밀번호의 특수 문자 위치를 무작위로 섞음
		List<Character> chars = password.chars().mapToObj(e -> (char) e).collect(ArrayList::new, ArrayList::add,
				ArrayList::addAll);
		Collections.shuffle(chars);

		return chars.stream().collect(StringBuilder::new, StringBuilder::append, StringBuilder::append).toString();
	}

	// 중복되지 않는 무작위 전화번호 생성
	private static String getRandomUniqueTelephone() {
		Random random = new Random();
		String tel;

		do {
			tel = "010-" + getRandomNumericString(4) + "-" + getRandomNumericString(4);
		} while (!generatedTelephoneNumbers.add(tel));

		return tel;
	}

	private static String generateRandomAddress(String zipCode) {
		String[] cities = { "서울", "부산", "대구", "인천", "광주", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "전북", "전남", "경북",
				"경남", "제주" };
		Random random = new Random();

		// 01층부터 시작하도록 수정
		String floor = String.format("%02d", random.nextInt(99) + 1); // 01 ~ 99
		String room = getRandomNumericString(3);

		return zipCode + " " + cities[random.nextInt(cities.length)] + " " + getRandomNumericString(2) + "동 " + floor
				+ "층 " + room + "호";
	}

	// 생년월일 생성
	private static String getRandomBirthdate() {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	    Random random = new Random();

	    // 80% 1995년 ~ 2005년
	    if (random.nextDouble() < 0.8) {
	        // 1995년 ~ 2005년
	        int year = random.nextInt(11) + 1995; // 1995 + 0 ~ 10
	        int month = random.nextInt(12) + 1;
	        int day = random.nextInt(28) + 1;

	        return dateFormat.format(new Date(year - 1900, month - 1, day));
	    } else {
	        int year = random.nextInt(50) + 1965; // 1965 + 0 ~ 49
	        int month = random.nextInt(12) + 1;
	        int day = random.nextInt(28) + 1;

	        return dateFormat.format(new Date(year - 1900, month - 1, day));
	    }
	}

	// 활동상태 Y or N
	private static String getRandomIng() {
		Random random = new Random();

		return random.nextDouble() < 0.88 ? "Y" : "N";
	}
}
