"""GitHub spider which scrapes five stats."""
import scrapy


class GithubSpider(scrapy.Spider):
    """Lets crawl."""

    name = "githubspider"
    start_urls = ["https://github.com/jbampton"]

    def parse(self, response):
        """Grab the 5 stats."""
        output = {}
        for repos in response.xpath(
                "//a[contains(@href,'tab=repositories')]/span"):
            output["repositories"] = repos.css("::text").get().strip()
        for stars in response.xpath("//a[contains(@href,'tab=stars')]/span"):
            output["stars"] = stars.css("::text").get().strip()
        yield output
