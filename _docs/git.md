---
title: Git
permalink: /docs/git/
---

# Essential Git commands

So you have just cloned your `fork` from GitHub and the first Git command you
should try is

```
$ git branch
* master
```

Now you want to submit a patch or new feature so you can create a new branch by
using

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

## Sync your fork

Refer to the GitHub help article on
**[Syncing a fork](https://help.github.com/articles/syncing-a-fork/)**.

```
git checkout master
git fetch upstream
git merge upstream/master
git push
```

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
