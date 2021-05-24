package com.soo.projectuser;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class Soo_Edu_UserController {

	@Autowired
	private Soo_Edu_UserService service;

	// 회원가입 get
	@RequestMapping(value = "/register.do")
	public String getRegister() throws Exception {

		return "views/edu/soo_edu_user_insert";
	}

	// 회원가입 post
	@RequestMapping(value = "/registers.do", method = RequestMethod.POST)
	public String postRegister(Soo_Edu_UserVO uservo) throws Exception {

		service.user_insert(uservo);

		//return "views/edu/index";
		return "redirect:/edu/index.do";
	}

	// 주소검색
	@RequestMapping(value = "/jusoPopup.do")
	public String josoPopup() throws Exception {

		return "views/edu/jusoPopup";
	}

	// 이메일 중복 체크
	@RequestMapping(value = "/getMail.do")
	public @ResponseBody String getEmail(@RequestParam String user_mail) throws Exception {

		try {

			Long res = service.get_mail(user_mail);

			if (res > 1) {

				return "mail exists";
			} else {

				return "ok";
			}

		} catch (Exception e) {
			return e.getMessage();
		}

	}

	// 핸드폰 중복체크
	@RequestMapping(value = "/getPhone.do")
	public @ResponseBody String getPhone(@RequestParam String user_phone) throws Exception {

		try {

			int res = service.get_phone(user_phone);
			// String data = service.get_phone(user_phone);

			if (res > 1) {

				// if (data.equals(user_phone)) {
				return "phone exists";
			} else {

				return "ok";
			}

		} catch (Exception e) {
			return e.getMessage();
		}
	}

	// 로그인 체크
	@RequestMapping(value = "/login.do")
	//public String userCheck(@RequestParam("soo_user_mail") String user_mail, Soo_Edu_UserVO vo, 
	public String userCheck(Soo_Edu_UserVO vo, HttpSession session, Model model) throws Exception {
		
		Soo_Edu_UserVO res = service.selectUser(vo.getSoo_user_mail()); //
		
		System.out.println("res==>" + res);
		
	    if( res.getSoo_user_pw().equals(vo.getSoo_user_pw()) ) {

		
		
			session.setAttribute("email", vo.getSoo_user_mail());
			session.setAttribute("name",  res.soo_user_name);
			session.setAttribute("usertype", res.soo_user_type);
			
			System.out.println("이메일 확인====>    "+vo.getSoo_user_mail());
			System.out.println("네임 확인====>      "+ res.soo_user_name);
			System.out.println("타입 확인=====>    "+ res.soo_user_type);
			
			
			
			return "redirect:/index.do";

		} else {
			
			return "redirect:/index.do";
		}
		
	}
	
	
	//로그아웃
		@RequestMapping(value = "/logout.do")
		public String logout(HttpSession session)throws IOException {
		   System.out.println("logout");
		   System.out.println("세션 : "+ (String)session.getAttribute("email"));
		   session.removeAttribute("email");
		   session.removeAttribute("name");
		   session.removeAttribute("usertype");
	

		   System.out.println("세션삭제후 email : "+ (String)session.getAttribute("email"));
		   System.out.println("세션삭제후 name : "+ (String)session.getAttribute("name"));
			              
		   return "redirect:/index.do";
		}
		
	/*
	 * @RequestMapping(value = "/user/getPhone.do") public @ResponseBody
	 * HashMap<String,String> getPhone(@RequestParam String user_phone) throws
	 * Exception {
	 * 
	 * HashMap<String,String> map = new HashMap<String,String>(); try {
	 * 
	 * Map<?,?> data = service.get_phone(user_phone); //System.out.print("ddddd" +
	 * user_phone); if
	 * (user_phone.contentEquals(String.valueOf(data.get("soo_user_phone")))) {
	 * map.put("RESULT", "phone exists"); return map; } else { map.put("RESULT",
	 * "ok"); return map; } } catch (Exception e) { map.put("RESULT",
	 * "e.getMessage()"); return map; }
	 * 
	 * }
	 */
	/*
	 * @RequestMapping(value = "/sendUserID", method = RequestMethod.POST)
	 * public @ResponseBody String sendUserID(@RequestParam("email") String
	 * email, @RequestParam("id") String id) throws UnsupportedEncodingException,
	 * MessagingException {
	 * 
	 * mailSend.sendUserID(email, id);
	 * 
	 * return ""; }
	 */
	/*
	 * @RequestMapping(value="/user/papago", method = RequestMethod.POST,
	 * produces="application/text;charset=utf8") public @ResponseBody String
	 * convertToData(@RequestParam("before_lang") String
	 * before_lang, @RequestParam("source") String before, @RequestParam("target")
	 * String after) {
	 * 
	 * 
	 * System.out.println("before_lang" + before_lang); System.out.println("before"
	 * + before); System.out.println("after" + after);
	 * 
	 * String text = before_lang+before+after;
	 * 
	 * return getTransSentence(text); }
	 */
	// 파파고api
	// 번역 할 문자 받아옴

	// @RequestMapping(value="/user/papago", method = RequestMethod.POST,
	// produces="application/text;charset=utf8")

	/*
	 * public String getTransSentence(String str) { String clientId =
	 * "DXEojOadrMjY0IyV_V9d";//애플리케이션 클라이언트 아이디값"; String clientSecret =
	 * "JuCxbc6_Uj";//애플리케이션 클라이언트 시크릿값";
	 * 
	 * String apiURL = "https://openapi.naver.com/v1/papago/n2mt"; String text; try
	 * { text = URLEncoder.encode(str, "UTF-8"); } catch
	 * (UnsupportedEncodingException e) { throw new RuntimeException("인코딩 실패", e); }
	 * 
	 * Map<String, String> requestHeaders = new HashMap<>();
	 * requestHeaders.put("X-Naver-Client-Id", clientId);
	 * requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	 * 
	 * String responseBody = post(apiURL, requestHeaders, text);
	 * 
	 * System.out.println("responseBody" + responseBody);
	 * 
	 * return convertToData(responseBody); }
	 */
	// post방식으로 요청을 보내서 결과를 받아오는 역할
	private static String post(String apiUrl, Map<String, String> requestHeaders, String text) {
		HttpURLConnection con = connect(apiUrl);
		String postParams = "source=ko&target=en&text=" + text; // 원본언어: 한국어 (ko) -> 목적언어: 영어 (en)
		try {
			con.setRequestMethod("POST");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			con.setDoOutput(true);
			try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
				wr.write(postParams.getBytes());
				wr.flush();
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
				return readBody(con.getInputStream());
			} else { // 에러 응답
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}
