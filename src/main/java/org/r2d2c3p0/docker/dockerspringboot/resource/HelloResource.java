package org.r2d2c3p0.docker.dockerspringboot.resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/docker/hello")
public class HelloResource {

    @GetMapping
    public String hello() {
        return "Hello docker container";
    }
}
