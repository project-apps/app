package com.app.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.entity.dto.UserDto;

@RestController
@RequestMapping("/login")
public class LoginController extends AbstractGenericController {
	@GetMapping(path = { "/oauth2/{provider}" })
	public void login(@PathVariable(required = true) String provider, @RequestBody(required = false) UserDto user, HttpServletResponse response) {
		try {
			//String targetUrl = getPropValue(USER_API_URL) + "/login/oauth2/authorize/" + provider;
			String targetUrl = getPropValue(API_GATEWAY_URL) + "/oauth2/authorization/" + provider;
			logger.trace("Redirecting to: "+targetUrl);
			response.addHeader("Host", "authservice");
			response.sendRedirect(targetUrl);
		} catch (IOException e) {
			logger.error(e.getMessage());
		}
		
	}
}
