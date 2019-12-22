---
title: 🖥️ Git
permalink: /docs/git/
logo: git
---

# Essential Git commands

So you have just cloned your `fork` from GitHub and the first Git command you
should try is

```
$ git branch
* master
```

Now you want to submit a patch or new feature so you can create a new branch and
switch to it by using

```
$ git checkout -b feature-branch
Switched to a new branch 'feature-branch'
```

And now the `git branch` command lists two local branches with the current
branch highlighted by the `*`

```
$ git branch
* feature-branch
  master
```

When creating a pull request you need to create a new branch or more technically
a `feature branch`. In the above example the `feature-branch` is a new branch,
but you should try to be more descriptive when naming the new feature branch.

A more verbose version of `git branch` is

```
$ git branch -v
* improve-docs-2 3d55e793 Merge pull request #244 from fuchsia-programming/pull-243-restyled
  master         3d55e793 Merge pull request #244 from fuchsia-programming/pull-243-restyled
```

You can also show the branches in column format

```
$ git branch --column
* codewars   master
```

Another way to create a new branch is

```
git branch test-branch
```

The difference between using `git branch` and `git checkout -b` to create a
branch is that `git checkout -b` will switch to the branch. Running `git branch`
again shows this

```
$ git branch
* codewars
  master
  test-branch
```

To checkout a branch you can use `git checkout`

```
$ git checkout test-branch
Switched to branch 'test-branch'
```

Another useful command is `git status`

```
$ git status
  On branch docs
  Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

          modified:   CONTRIBUTING.md

  no changes added to commit (use "git add" and/or "git commit -a")
```

A very short version of `git status` is

```
$  git status -s
M _docs/git.md
```

You can see your changes with `git diff`

```
$ git diff
diff --git a/_data/docs_nav.yml b/_data/docs_nav.yml
index f7abb8fe..54db1374 100644
--- a/_data/docs_nav.yml
+++ b/_data/docs_nav.yml
@@ -15,5 +15,7 @@
       link: /docs/sql-file/
     - title: 📄 Eclipse cheat sheets (XML) to DITA with Ruby, XSL, Nokogiri
       link: /docs/eclipse-cheat-sheets-to-dita-with-ruby-xsl-nokogiri/
+    - title: 🖨️ DITA TO PDF WITH ECLIPSE
+      link: /docs/dita-to-pdf-with-eclipse/
     - title: 🔗 Links
       link: /docs/links/
diff --git a/_docs/dita-to-pdf-with-eclipse.md b/_docs/dita-to-pdf-with-eclipse.md
index e69de29b..b15f58fc 100644
--- a/_docs/dita-to-pdf-with-eclipse.md
+++ b/_docs/dita-to-pdf-with-eclipse.md
@@ -0,0 +1,126 @@
+---
+title: DITA TO PDF WITH ECLIPSE
+permalink: /docs/dita-to-pdf-with-eclipse/
+---
+
+# Overview
```

A very compact version of `git diff` is

```
$ git diff --compact-summary
_docs/git.md | 15 +++++++++++++++
1 file changed, 15 insertions(+)
```

To only see which files are changed run

```
$ git diff --name-only
_docs/git.md
```

The `origin` and the `upstream` are displayed below for a GitHub user. You
should think of the `upstream` as the `source` and the `origin` as your `fork`

```
$ git remote -v
origin  https://github.com/jbampton/fuchsia-programming.github.io.git (fetch)
origin  https://github.com/jbampton/fuchsia-programming.github.io.git (push)
upstream        https://github.com/fuchsia-programming/fuchsia-programming.github.io.git (fetch)
upstream        https://github.com/fuchsia-programming/fuchsia-programming.github.io.git (push)
```

The `git log` command is shown below and it contains the history of the past
commits

```
$ git log
commit a5cdeaba94db770797fe84bc8666116a97a06d3f (HEAD -> ruby-cheat-sheets, upstream/master, origin/master, origin/HEAD, master)
Merge: b4e0ff91 08c5dac7
Author: John Bampton <jbampton@users.noreply.github.com>
Date:   Sat Dec 14 08:46:16 2019 +1000

    Merge pull request #240 from fuchsia-programming/pull-239-restyled

    Restyle Add documentation to the website.

commit 08c5dac76558c2ad01e964537c76a31cc9e222b5
Author: Restyled.io <commits@restyled.io>
Date:   Fri Dec 13 22:23:37 2019 +0000

    Restyled by whitespace
```

A more compact version of `git log` is seen below

```
$ git log --oneline
cde978e9 (HEAD -> improve-docs, upstream/master, origin/master, origin/HEAD, master) Merge pull request #242 from fuchsia-programming/pull-241-restyled
17b1d497 Restyled by prettier-markdown
cdfe2158 Add more documentation.
a5cdeaba Merge pull request #240 from fuchsia-programming/pull-239-restyled
08c5dac7 Restyled by whitespace
9c63aff1 Restyled by prettier-yaml
561d38b3 Restyled by prettier-markdown
1b5e30b4 Add documentation to the website.
b4e0ff91 Merge pull request #238 from jbampton/configure-percy
13a2afe3 Add percy config file.
6d1050f7 Merge pull request #237 from fuchsia-programming/pull-236-restyled
fcd730b0 Restyled by whitespace
```

Once your feature branch has been merged into the upstream you should delete it

```
git branch -D overcommit
Deleted branch overcommit (was 00e2413).
```

To list your own `local` branches, your remote `origin` branches and all the
remote `upstream` branches

```
$ git branch -a
  master
* ruby-cheat-sheets
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
  remotes/upstream/master
  remotes/upstream/pull-183-restyled
  remotes/upstream/pull-190-restyled
  remotes/upstream/pull-196-restyled
  remotes/upstream/pull-199-restyled
  remotes/upstream/pull-212-restyled
  remotes/upstream/pull-218-restyled
```

To list your remote branches

```
$ git branch -r
  origin/HEAD -> origin/master
  origin/master
  upstream/master
  upstream/pull-183-restyled
  upstream/pull-190-restyled
  upstream/pull-196-restyled
  upstream/pull-199-restyled
  upstream/pull-212-restyled
  upstream/pull-218-restyled
```

You can edit or `amend` your previous commit

```
git commit --amend
```

You can check your git `version`

```
$ git --version
git version 2.21.0 (Apple Git-122.2)
```

[&#8595;](#watch-this-space) [&#8593;](#git)

## Sync your fork

Refer to the GitHub help article on
**[Syncing a fork](https://help.github.com/articles/syncing-a-fork/)**.

```
git checkout master
git fetch upstream
git merge upstream/master
git push
```

[&#8595;](#watch-this-space) [&#8593;](#git)

## Squashing Commits

You may be asked by a maintainer to squash your commits before it will be
merged.

```
git checkout your-feature-branch
git rebase -i HEAD~n
# n is the number of commits in the pull request.
# Set commits (except the one in the first line) from 'pick' to 'squash', save and quit.
# On the next screen, edit/refine commit messages.
# Save and quit.
git push -f # (force push to GitHub)
```

## Contributor Workflow

To contribute a patch, the workflow is as follows:

- Fork repository
- Create topic branch
- Commit patches
- Push changes to your fork
- Create pull request

If a commit references an issue, please add the reference. For example:
`refs #351` or `fixes #123`. Using the `fixes` or `closes` keywords will cause
the applicable issue to be closed when the pull request is merged.

[&#8595;](#watch-this-space) [&#8593;](#git)

## Watch This Space

[&#8593;](#git)
