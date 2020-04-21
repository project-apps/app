package com.app.controller;

import java.net.MalformedURLException;
import java.net.URI;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestClientException;
public class RestTemplateURIExchange extends AbstractGenericController {
	private  List<HttpMessageConverter<?>> httpMessageConverter;
	private HttpHeaders headers;
	public RestTemplateURIExchange() {
		HttpMessageConverter stringHttpMessageConverter = new StringHttpMessageConverter(Charset.forName("UTF-8"));
        httpMessageConverter = new ArrayList<HttpMessageConverter<?>>();
        httpMessageConverter.add(stringHttpMessageConverter);
		headers = new HttpHeaders();
        MediaType mediaType = new MediaType(MediaType.TEXT_HTML, StandardCharsets.UTF_8);
        headers.setContentType(mediaType);

	}
	public String exchange(URI targetUri) throws RestClientException, MalformedURLException {
		//restTemplate.setMessageConverters(httpMessageConverter);
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
        ResponseEntity<String> responseEntity = restTemplate.exchange(targetUri.toURL().toString(), HttpMethod.GET, entity, String.class);
        String result = responseEntity.getBody();
        return result;
	}

}
