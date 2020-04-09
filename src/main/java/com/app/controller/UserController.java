package com.app.controller;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.app.config.MessageConverter;
import com.app.entity.dto.JSONResponse;
import com.app.entity.dto.UserDto;

@RestController
@RequestMapping("/user")
public class UserController extends AbstractGenericController {
	@Autowired
	RestTemplate restTemplate;

	@GetMapping(path = { "/signinup" })
	public ModelAndView showSigninupForm(HttpServletRequest request, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.addObject(new UserDto());
		mv.setViewName("signinup");
		return mv;
	}

	@GetMapping(path = { "/signup" })
	public ModelAndView showSignupForm(HttpServletRequest request, Model model) {
		ModelAndView mv = new ModelAndView();

		mv.addObject(new UserDto());
		mv.setViewName("signup");
		return mv;
	}

	@PostMapping(path = { "/signup" })
	public HttpEntity<?> addUser(@ModelAttribute("user") @Validated UserDto user) throws URISyntaxException {

		HttpEntity<?> responseEntity = ResponseEntity.EMPTY;
		try {
			responseEntity = restTemplate.postForEntity(getPropValue("url.service.user"), user, UserDto.class);
		} catch (HttpClientErrorException httpEx) {
			httpEx.printStackTrace();
		} catch (Exception ex) {
			if (ex instanceof ResourceAccessException) {
				logger.error(ex.getMessage());
			}
			ex.printStackTrace();
		}
		return responseEntity;
	}

	public String getDefaultRole() throws Exception {
		String url = "http://localhost:8761/user-management/role/default";
		try {
			ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
			return response.getBody();
		} catch (HttpClientErrorException httpEx) {
			httpEx.printStackTrace();
			throw httpEx;
		} catch (Exception ex) {
			if (ex instanceof ResourceAccessException) {
				System.out.println(ex.getMessage());
			}
			ex.printStackTrace();
			throw ex;
		}
	}
	public String getUser() {
		String uri = "http://localhost:8080/user-mngmt/users/{email}";

		restTemplate.setMessageConverters(new MessageConverter().getMessageConverters());

		Map<String, String> param = new HashMap<String, String>();
		param.put("email", "Rajanmishra@gmail.com");

		ResponseEntity<UserDto> responseEntity = restTemplate.getForEntity(uri, UserDto.class, param);
		ResponseEntity<String> res = restTemplate.postForEntity(uri, responseEntity.getBody(), String.class);
		return res.getBody();
	}
}
