package by.bsuir.piris;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@EnableAutoConfiguration
@SpringBootApplication(scanBasePackages = "by.bsuir.piris")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
