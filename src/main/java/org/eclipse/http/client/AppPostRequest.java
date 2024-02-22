package org.eclipse.http.client;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.core.MediaType;

public class AppPostRequest {
	
	public static String API_URL = "http://localhost:8080/cours-jersey/webapi";

	public static void main(String[] args) {
		
		getUsers();
	}

	private static void getUsers() {
		Client client = ClientBuilder.newClient() ;
		String response = client.target(API_URL).path("/personnes")
				.request(MediaType.APPLICATION_JSON)
				.get(String.class);
		System.out.println(response);
	}
}