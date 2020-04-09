package com.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(path="/")
public class HomeController extends AbstractGenericController {

	@GetMapping(path = { "/", "/home"})
	public ModelAndView home(HttpSession session) {
		ModelAndView mv = new ModelAndView("home"); 
		return mv;
	}
	@GetMapping(path= {"/error"})
	public ModelAndView error() {
		ModelAndView mv = new ModelAndView("error"); 
		return mv;
	}
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse resposne, HttpSession session) {
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.set(HttpHeaders.AUTHORIZATION, session.getAttribute(HttpHeaders.AUTHORIZATION).toString());
			HttpEntity<?> httpEntity = new HttpEntity<>(headers);
			ResponseEntity<String> responseEntity = restTemplate.exchange(getPropValue("url.service.auth")+"/user/logout", HttpMethod.GET, httpEntity,
					String.class);

		} catch (HttpClientErrorException httpEx) {
			httpEx.printStackTrace();
		} catch (Exception ex) {
			if (ex instanceof ResourceAccessException) {
				System.out.println(ex.getMessage());
			}
			ex.printStackTrace();
		}
		finally {
			session.removeAttribute("user");
			session.invalidate();
		}
		return new ModelAndView("home");
	}
	
}
