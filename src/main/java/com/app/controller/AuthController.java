package com.app.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.parser.Base64Parser;
import org.parser.model.AuthUser;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.app.entity.dto.AppProperties;
import com.app.entity.dto.JSONResponse;
import com.app.entity.dto.UserDto;

@RestController
@RequestMapping("/auth")
public class AuthController extends AbstractGenericController {

	@GetMapping(path = { "/login/{provider}" })
	public String getLoginURL(@PathVariable(required = true) String provider, @RequestBody(required = false) UserDto user, HttpServletRequest request) {
		String targetUri = null;
		try {
			StringBuffer url = new StringBuffer();//"http://localhost:8080/app/login/callback"
			url.append(request.getScheme()).append("://").append(request.getServerName());
			int serverPort = request.getServerPort();
			if (serverPort != 80 && serverPort != 443) {
				url.append(":").append(serverPort);
			}
			url.append(request.getContextPath()).append("/auth/login/callback");
			//targetUrl.append(getPropValue(API_GATEWAY_HOST)).append("/authservice/oauth2/authorization/").append(provider);
			targetUri= UriComponentsBuilder.fromUriString(getPropValue(API_GATEWAY_HOST))
					.path("/authservice/oauth2/authorization/").path(provider)
					.queryParam("callback", url).build().toUri().toString();
		} catch (IOException e) { logger.error(e.getMessage()); }
		return targetUri;
	}

	@GetMapping(path = {"/login/callback/{encUser}"})
	public ModelAndView login(@PathVariable String encUser, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		AuthUser user = Base64Parser.deserialize(encUser, AuthUser.class);


		session.setAttribute(AppProperties.AUTH_USER.value(), user);
		logger.trace("Parsed user: "+user);
		mv.addObject(AppProperties.AUTH_USER_FIRST_LAST_NAME.value(), user.getName());
		mv.setViewName("closeSSOLoginWindow");
		return mv;

	}
	@PostMapping
	public JSONResponse login(@RequestBody AuthUser user, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		JSONResponse jsonResponse = new JSONResponse();
		try {
			StringBuffer targetUrl = new StringBuffer(getPropValue(API_GATEWAY_HOST)).append("/authservice/user/authenticate");
			logger.debug("Calling auth service: "+targetUrl +" with username:"+user.getUsername());
			ResponseEntity<AuthUser> responseEntity = restTemplate.postForEntity(targetUrl.toString(), user, AuthUser.class);
			logger.debug("Ressponse from user-authentication:\n \t ResponseEntity:\n\t\t StatsCode: "
					+ responseEntity.getStatusCodeValue());
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
				String jwtToken = responseEntity.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
				jsonResponse.setStatus(responseEntity.getStatusCode());
				response.setHeader(HttpHeaders.AUTHORIZATION, jwtToken);
				user = responseEntity.getBody();
				user.setName(user.getFirstName()+" "+user.getLastName());
				jsonResponse.setValue(user);
				session.setAttribute(AppProperties.AUTH_USER.value(), user);
			} else {
				logger.info("Response received: " + responseEntity);
				jsonResponse.setValue("Invalid credentials!");
			}
		} catch (Exception e) {
			if (e instanceof ResourceAccessException) {
			}
			logger.error(e.getMessage());
			jsonResponse.setValue("Some error occured, please try after sometime.");
		}
		return jsonResponse;
	}

}
