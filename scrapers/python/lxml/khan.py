import time

from selenium import webdriver

options = webdriver.ChromeOptions()
options.add_argument("headless")

browser = webdriver.Chrome("./chromedriver.exe", chrome_options=options)

browser.get("https://www.khanacademy.org/profile/JohnBampton/")

time.sleep(35)
energy_points = browser.find_element_by_xpath(
    "/html/body/div[2]/div[3]/div/div[2]/div/div/div[3]/div/div[2]/div/div[4]/div/div/div/div[1]/div[1]/div[2]/div/div[2]/table/tbody/tr[2]/td[2]/span"
)
print(int(energy_points.text.replace(",", "")))
