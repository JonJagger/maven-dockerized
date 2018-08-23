package demo.webmvc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogController {
	Logger logger = LoggerFactory.getLogger(LogController.class);
	@RequestMapping("/logger")
	public String loghandler() {
		logger.warn("Log link has been clicked again");
		return "log";
	}
}
