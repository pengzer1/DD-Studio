package com.ddstudio.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String encoding;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		this.encoding = filterConfig.getInitParameter("encoding");
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		// 인코딩 처리
		req.setCharacterEncoding(encoding);
		
		// 필터 호출 > 서블릿 호출
		chain.doFilter(req, resp); // forward() 역할
		
	}
	
	@Override
	public void destroy() {
		
		
		
	}
	
}
