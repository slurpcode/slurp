# Contributor Guidelines - How to Contribute to slurp

## **Reporting a bug you found?**

- :bug: **Ensure the bug was not already reported** by searching on GitHub under
  [Issues](https://github.com/slurpcode/slurp/issues).

- If you're unable to find an open issue addressing the problem,
  [open a new one](https://github.com/slurpcode/slurp/issues/new). Be sure to
  include a **title and clear description**, as much relevant information as
  possible, and a **code sample**, or an **executable test case** demonstrating
  the expected behavior that is not occurring.

## **Submitting a patch that fixes a bug?**

- Open a new GitHub pull request with the patch.

- Ensure the PR description clearly describes the problem and solution. Include
  the relevant issue number if applicable.

## pre-commit

A framework for managing and maintaining multi-language pre-commit hooks.
Pre-commit can be [installed](https://pre-commit.com/#installation) with `pip`,
`curl`, `brew` or `conda`. You need to first install pre-commit and then install
the pre-commit hooks with `pre-commit install`.

Now pre-commit will run automatically on git commit! It's usually a good idea to
run the hooks against all the files when adding new hooks (usually pre-commit
will only run on the changed files during git hooks). Use
`pre-commit run --all-files` to check all files.

## **General Contributor Guidelines**

- [**Github Help Article** - guidelines for repository contributors](https://help.github.com/en/github/building-a-strong-community/setting-guidelines-for-repository-contributors#examples-of-contribution-guidelines)

_And always remember, **have fun!**_
