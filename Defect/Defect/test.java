package com.example.tests;

import com.thoughtworks.selenium.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.regex.Pattern;

public class test {
	private Selenium selenium;

	@Before
	public void setUp() throws Exception {
		selenium = new DefaultSelenium("localhost", 4444, "*chrome", "https://sit2-eoms.caremark.com/");
		selenium.start();
	}

	@Test
	public void testTest() throws Exception {
		selenium.open("/CEEConsole/");
		selenium.click("xpath=(//a[contains(text(),'SIT')])[8]");
		selenium.waitForPageToLoad("30000");
		selenium.click("name=isc_1Yisc_IButton_5$4u");
	}

	@After
	public void tearDown() throws Exception {
		selenium.stop();
	}
}
