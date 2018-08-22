package demo.webmvc;

import java.nio.file.*;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

	public static void main(String[] args) {
    Path logPath = Paths.get("/app/log/app.log");
    String message = "Hello,world from Chennai";
    Files.write(logPath, message.getBytes());
		SpringApplication.run(Application.class, args);
	}
}
