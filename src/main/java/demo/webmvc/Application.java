package demo.webmvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class Application {

  private static final Logger logger = LoggerFactory.getLogger(Application.class);

	public static void main(String[] args) {
    logger.debug("--Hello-from-Chennai--");
		SpringApplication.run(Application.class, args);
	}
}
