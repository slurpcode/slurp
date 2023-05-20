import chromedriver_autoinstaller
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By

chromedriver_autoinstaller.install()


def get_energy_points(user):
    """Return the wonderful energy points."""
    driver = webdriver.Chrome()
    driver.implicitly_wait(20)
    driver.get(f"https://www.khanacademy.org/profile/{user}/")
    try:
        energy_points_elem = driver.find_element(
            By.CSS_SELECTOR, ".energy-points-badge")
        return energy_points_elem.text
    except NoSuchElementException as nosee:
        print(str(nosee))
        return "Could not find Energy Points Element."


def main():
    """
    Main method
    Update the 'user' here, to get their Energy Score
    """
    user = "johnbampton"
    profile_energy = get_energy_points(user)
    print(f"User => {user} ; Energy Point => {profile_energy} ;")


if __name__ == "__main__":
    main()
