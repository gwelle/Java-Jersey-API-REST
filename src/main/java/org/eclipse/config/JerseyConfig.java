package org.eclipse.config;

import org.eclipse.security.AuthenticationFilter;
import org.glassfish.jersey.server.ResourceConfig;

import jakarta.ws.rs.ApplicationPath;

//specifier le contextPath de l’application
@ApplicationPath("webapi")
public class JerseyConfig extends ResourceConfig {
	
	public JerseyConfig() {
		packages("org.eclipse.resource");
		register(CorsResponseFilter.class);
	}

}
