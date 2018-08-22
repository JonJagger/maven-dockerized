package demo.webmvc;

import java.nio.file.*;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
    String message = "Hello,world from Chennai";
    Path logPath = Paths.get("/app/log/app.log");
    try {
        Files.write(logPath, message.getBytes());
    }
    catch (java.io.IOException error) {
        System.out.println(error.getMessage());
    }

		SpringApplication.run(Application.class, args);
	}
}
