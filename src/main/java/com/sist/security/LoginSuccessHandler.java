package com.sist.security;

import java.io.IOException; 
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.sist.vo.*;
import com.sist.dao.*;
import lombok.Setter;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
    @Setter
	private String defaultUrl;
    @Autowired
    private MemberDAO dao;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		MemberVO vo=dao.memberSessionData(authentication.getName());
		
		session.setAttribute("id", vo.getId());
		session.setAttribute("name", vo.getName());
		session.setAttribute("sex", vo.getSex());
		
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        boolean isAdmin = authorities.stream()
                .anyMatch(role -> role.getAuthority().equals("ROLE_ADMIN"));

        if (isAdmin) {
            response.sendRedirect(request.getContextPath() + "/admin/main.do");
        } else {
            response.sendRedirect(request.getContextPath() + "/main/main.do");
        }
	}

}