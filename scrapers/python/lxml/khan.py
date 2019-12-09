"""Broken Khan energy points scraper."""

import re
import requests
from lxml import html  # pylint:disable=import-error


def get_energy_points(user):
    """Return the wonderful energy points."""
    page = requests.get('https://www.khanacademy.org/profile/%s/' % user)
    tree = html.fromstring(page.content)
    text = tree.xpath('//script[contains(.,"prefersReducedMotion")]/text()')
    points = 'Not found'
    for t in text:  # pylint:disable=invalid-name
        m = re.search(r'points":(\d+),"prefersReducedMotion', t)  # pylint:disable=invalid-name
        if m:
            points = m.group(1)
    return points


print(get_energy_points('XSLTGod'))  # pylint:disable=superfluous-parens
