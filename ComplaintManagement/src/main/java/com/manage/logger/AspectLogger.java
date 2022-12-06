package com.manage.logger;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AspectLogger {

	/*
	 * private static Logger logger = Logger.getLogger(AspectLogger.class);
	 * 
	 * @Pointcut("execution(* com.manage.controller..*.*(..)) || execution(* com.manage.services..*.*(..))||execution(* com.manage.entity..*.*(..))"
	 * ) public void poc() { // Do nothing because of X and Y.
	 * 
	 * }
	 * 
	 * // Adding Controller logger
	 * 
	 * @Around(value = "poc()") public Object intercept(ProceedingJoinPoint pjp)
	 * throws Throwable {
	 * 
	 * Signature name = pjp.getSignature(); try { logger.info("started " + name);
	 * Object obj = pjp.proceed(); logger.info("finished " + name +
	 * " successfully"); return obj; } catch (Throwable t) { logger.error(name +
	 * " finished with Exception - " + t.getMessage()); throw t; } finally { // Do
	 * nothing because of X and Y. } }
	 */
}
