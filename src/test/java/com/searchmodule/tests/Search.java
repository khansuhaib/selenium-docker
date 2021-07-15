package com.searchmodule.tests;
import com.searchmodule.pages.SearchPage;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.testng.ITestContext;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;

import java.net.MalformedURLException;
import java.net.URL;

public class Search  {

    private WebDriver driver;

        /*@BeforeTest
        public void testSearch() throws InterruptedException {

            // Optional. If not specified, WebDriver searches the PATH for chromedriver.
            System.setProperty("webdriver.chrome.driver", "/Users/sanakhan/Documents/udemy/demo/chromedriver");
            driver = new ChromeDriver();
            //driver.get("http://www.google.com/");
            Thread.sleep(2000);  // Let the user actually see something!
        }*/

    @BeforeTest
    public void setupDriver(ITestContext ctx) throws MalformedURLException {

        String host ="localhost";
        ChromeOptions dc = new ChromeOptions();
        if (System.getProperty("HUB_HOST") != null){
            host = "http://" + System.getProperty("HUB_HOST") + ":4444/wd/hub";
        }
        String testName = ctx.getCurrentXmlTest().getName();
        dc.setCapability("name", testName);
        this.driver = new RemoteWebDriver(new URL(host),dc);
    }

    @AfterTest
    public void quitDriver(){
        this.driver.quit();
    }

        @Test
        @Parameters({"keyword"})
        public void searchTest(String keyword) throws InterruptedException {
            SearchPage searchPage = new SearchPage(driver);
            searchPage.goTo();
            searchPage.doSearch(keyword);
            searchPage.goToVideos();
            int size = searchPage.getResult();
       //     Thread.sleep(2000);
        }



}
