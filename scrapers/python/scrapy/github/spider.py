#!/usr/bin/env python3
"""
GitHub spider which scrapes five stats.
Command for running this script:
    scrapy runspider spider.py -a username=<username>
Example:
    scrapy runspider spider.py -a username=ihasidul
After running the script it will ask for your github username.
Insert your github username.
"""
import scrapy


class GithubSpider(scrapy.Spider):
    """Lets crawl."""

    name = "githubspider"

    def __init__(self, username="", **kwargs):
        self.start_urls = [f"https://github.com/{username}"]
        super().__init__(**kwargs)  # python3

    def parse(self, response):  # pylint: disable=W0221
        """
        Grab the 5 stats.
        Stats it grabs are:
        - Stars
        - Followers
        - Following
        - Repositories
        - Contributions in the last year
        """
        output = {}
        repos = response.xpath("//a[contains(@href,'tab=repositories')]/span")
        output["repositories"] = repos.attrib["title"]
        stars = response.xpath("//a[contains(@href,'tab=stars')]/span")
        output["stars"] = stars.attrib["title"]
        followers = response.xpath("//a[contains(@href,'tab=followers')]/span")
        output["followers"] = followers.css("::text").get().strip()
        following = response.xpath("//a[contains(@href,'tab=following')]/span")
        output["following"] = following.css("::text").get().strip()
        contributions_in_the_last_year = response.xpath(
            "//h2[@class='f4 text-normal mb-2']/text()"
        )
        output["contributions_in_the_last_year"] = (
            contributions_in_the_last_year.get().strip().split("\n")[0]
        )
        yield output
