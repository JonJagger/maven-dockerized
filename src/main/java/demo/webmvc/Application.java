package demo.webmvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
    private static final Logger logger = LoggerFactory.getLogger(Application.class);
		SpringApplication.run(Application.class, args);
    logger.debug("--Application Started--");
	}
}
