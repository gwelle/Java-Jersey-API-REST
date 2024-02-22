package org.eclipse.security;

import java.security.Principal;

import org.eclipse.model.User;

import jakarta.ws.rs.core.SecurityContext;

public class JerseySecurityContext implements SecurityContext{
	
	private final User user ;
	
	public JerseySecurityContext(final User user) {
		this.user = user ;
	}

	@Override
	public Principal getUserPrincipal() {
		return user ;
	}

	@Override
	public boolean isUserInRole(String role) {
		return user.getRole().contains(role);
	}

	@Override
	public boolean isSecure() {
		return true ;
	}

	@Override
	public String getAuthenticationScheme() {
		return SecurityContext.BASIC_AUTH;
	}

}
