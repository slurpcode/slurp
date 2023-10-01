from time import sleep

from selenium import webdriver
from selenium.webdriver.common.by import By


driver = webdriver.Firefox()

driver.get("https://slurpcode.github.io/slurp/")
driver.find_element(By.TAG_NAME, "body").send_keys("matrix")
sleep(10)

driver.quit()
