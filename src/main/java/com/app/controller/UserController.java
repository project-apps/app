package com.app.controller;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.parser.model.AuthUser;
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
import com.app.entity.dto.AppProperties;
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

	@PostMapping
	public JSONResponse addUser(@RequestBody AuthUser user, HttpServletResponse response, HttpSession session) throws URISyntaxException {
		JSONResponse jsonResponse = new JSONResponse();
		try {
			String targetUrl =  new StringBuffer(getPropValue(API_GATEWAY_HOST)).append("/userservice/user").toString();
			ResponseEntity<AuthUser> responseEntity = restTemplate.postForEntity(targetUrl, user, AuthUser.class);
			logger.debug("Ressponse from user-authentication:\n \t ResponseEntity:\n\t\t StatsCode: "
					+ responseEntity.getStatusCodeValue());
			if (responseEntity.getStatusCode() == HttpStatus.CREATED) {
				String jwtToken = responseEntity.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
				jsonResponse.setStatus(responseEntity.getStatusCode());
				response.setHeader(HttpHeaders.AUTHORIZATION, jwtToken);
				user = responseEntity.getBody();
				user.setName(user.getFirstName()+" "+user.getLastName());
				jsonResponse.setValue(user);
				session.setAttribute(AppProperties.AUTH_USER.value(), user);
			} else {
				logger.info("Response received: " + responseEntity);
				jsonResponse.setValue("Unable to add user!");
			}
		} catch (HttpClientErrorException httpEx) {
			httpEx.printStackTrace();
		} catch (Exception ex) {
			if (ex instanceof ResourceAccessException) {
				logger.error(ex.getMessage());
			}
			ex.printStackTrace();
			logger.error(ex.getMessage());
			jsonResponse.setValue("Some error occured, please try after sometime.");
		}
		return jsonResponse;
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
