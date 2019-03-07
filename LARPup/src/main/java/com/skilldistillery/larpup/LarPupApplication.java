package com.skilldistillery.larpup;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;


@SpringBootApplication
@EntityScan("com.skilldistillery.larpup")
public class LarPupApplication {

	public static void main(String[] args) {
		SpringApplication.run(LarPupApplication.class, args);
	}

}
