package com.sist.security;

import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.authentication.DisabledException;

public class AuthenticationProvider extends DaoAuthenticationProvider {
    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails,
                                                  org.springframework.security.authentication.UsernamePasswordAuthenticationToken authentication)
                                                  throws AuthenticationException {
        super.additionalAuthenticationChecks(userDetails, authentication);
        boolean banned = userDetails.getAuthorities().stream()
                       .anyMatch(a -> a.getAuthority().equals("ROLE_BANNED"));
        if (banned) {
            throw new DisabledException("접근이 제한된 계정입니다!");
        }
    }
}
