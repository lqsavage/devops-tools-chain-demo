#coding=utf-8
from selenium import webdriver
chrome_capabilities ={
    "browserName": "chrome",
    "version": "65.0.3325.181",#注意版本号一定要写对
    "platform": "ANY",
    "javascriptEnabled": True,
    "marionette": True,
}

browser=webdriver.Remote("http://114.115.170.21:5555/wd/hub",desired_capabilities=chrome_capabilities)  #注意端口号5555是我们上文中映射的宿主机端口号

browser.get("http://114.115.170.21:9080/")

browser.get_screenshot_as_file("/website-1/devops.png")

browser.close()
