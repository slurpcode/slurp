import chromedriver_autoinstaller
from selenium import webdriver

# Check if the current version of chromedriver exists
chromedriver_autoinstaller.install()
# and if it doesn't exist, download it automatically,
# then add chromedriver to path


def get_energy_points(user):
    """Return the wonderful energy points."""
    driver = webdriver.Chrome()
    driver.implicitly_wait(20)
    driver.get(f"https://www.khanacademy.org/profile/{user}/")
    try:
        energy_points_elem = driver.find_element_by_css_selector(".energy-points-badge")
        return energy_points_elem.text
    except NoSuchElementException as nosee:
        return "Could not find Energy Points Element. "


if __name__ == "__main__":
    user = "johnbampton"
    profile_energy = get_energy_points(user)
    print(f"User => {user} ; Energy Point => {profile_energy} ;")
