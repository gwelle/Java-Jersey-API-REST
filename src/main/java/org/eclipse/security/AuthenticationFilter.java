package org.eclipse.security;

import java.io.IOException;
import java.util.Base64;
import java.util.StringTokenizer;

import org.eclipse.model.User;

import jakarta.annotation.Priority;
import jakarta.ws.rs.Priorities;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;

@Provider
@Priority(Priorities.AUTHENTICATION)//Indiquer qu'il s'agit d'un filtre d'authentification
public class AuthenticationFilter implements ContainerRequestFilter {
	
	private static final String AUTHENTICATION_SCHEME = "Basic";

	@Override
	public void filter(ContainerRequestContext requestContext) throws IOException {
		
		String authentication = requestContext.getHeaderString(HttpHeaders.AUTHORIZATION);
		
		if (authentication == null || authentication.isEmpty()) {
			requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED)
					.entity("IDentifiants manquants.").build());
			return;
		}
		
		String encodedUserPassword = authentication.replaceFirst(AUTHENTICATION_SCHEME + " ", "");
		String usernamePassword = new String(Base64.getDecoder().decode(encodedUserPassword.getBytes()));
		
		StringTokenizer tokenizer = new StringTokenizer(usernamePassword, ":");
		String email = tokenizer.nextToken();
		String password = tokenizer.nextToken();
		
		User user = new User(email, password);
		System.out.println(user);
		
		requestContext.setSecurityContext(new JerseySecurityContext(user));
		
		if (!isUserAllowed(user)) {
		requestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED)
				.entity("Identifiantsvincorrects.").build());
		return;
		}
	}
	
	private boolean isUserAllowed(User user) {
		return user.getEmail().equals("guillaume.welle@gmail.com") 
				&& user.getPassword().equals("password");
		}

}
