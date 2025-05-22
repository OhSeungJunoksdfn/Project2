package com.sist.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class LoginCheckAspect {
	@Around("@annotation(com.sist.aop.LoginCheck)")
    public Object checkLogin(ProceedingJoinPoint joinPoint) throws Throwable {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attr.getRequest();
        HttpServletResponse response = attr.getResponse();

        HttpSession session = request.getSession(false);
        String id = session != null ? (String)session.getAttribute("id") : null;

        if (id == null) {
            response.sendRedirect(request.getContextPath() + "../member/login.do");
            return null; // 더 이상 컨트롤러로 가지 않음
        }

        return joinPoint.proceed(); // 로그인된 경우 원래 컨트롤러 실행
    }
}
