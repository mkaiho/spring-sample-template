package com.template.sample.spring.templateapp.application.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class EchoHelloService {
    private final Logger LOGGER = LoggerFactory.getLogger(EchoHelloService.class);

    @Scheduled(fixedDelayString = "1000")
    public void echo() {
        LOGGER.info("HELLO WORLD!");
    }
}
