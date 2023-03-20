from time import sleep

from selenium import webdriver


driver = webdriver.Firefox()

driver.get("https://slurpcode.github.io/slurp/")
sleep(10)

driver.quit()
