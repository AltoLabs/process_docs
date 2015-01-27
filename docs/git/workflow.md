Git Workflow
------------

### Clone the repo

Begin by cloning the repo to your machine.

```bash
$ git clone git@github.com:ymek/my_cool_repo.git
```

### Create a topic branch

All work should be done within a topic branch. This branch will be pushed
upstream, allows collaboration/comments, and is the backbone of our git
process.

```bash
$ git checkout -b feature/my_cool_feature
```

### Working with your branch

After making your changes, commit individual components as individual commits.
For example, messages for adding a model and it's API endpoints may look like:

```text
cff064c [7 weeks ago] (Myke Stubbs) Add Institution API endpoints
062fb28 [7 weeks ago] (Myke Stubbs) Add Institution model
```

Once all requisite changes are committed, push your branch to the remote.

> Note: The tracking branch must be set during first remote push. 

```bash
# First push only (sets remote tracking branch):
$ git push -u origin feature/my_cool_feature

# Subsequent pushes:
$ git push
```

### Creating a pull request

All changes should now exist upstream.  Create a pull request to initiate the
review/merge process.  Visit the github project page and follow their interface
prompts to create the pull request.

#### Commenting on pull requests

To provide feedback, open the SHA1 link for a commit and comment. Ensure you're
not commenting on the diff view pane. Commenting on the SHA itself will allow
the comments to follow the commit which they reference.

#### Responding to pull request comments

Make change suggested by the reviewer and commit them as a `--fixup` commit. As
an example, assume the following log represents changesets for an open pull
request:

```text
cff064c [7 weeks ago] (Myke Stubbs) Add Institution API endpoints
062fb28 [7 weeks ago] (Myke Stubbs) Add Institution model
```

Let's assume the reviewer's changes relate to the Institution model. Commit all
changes via the following:

```bash
$ git commit -a --fixup 062fb28
```

Now the log should look similar to:

```bash
a6bc846 [2 seconds ago] (Myke Stubbs) fixup! Add Institution model
cff064c [7 weeks ago] (Myke Stubbs) Add Institution API endpoints
062fb28 [7 weeks ago] (Myke Stubbs) Add Institution model
```

### Preparing to merge

> Note: The pull request's author is responsible for rebasing the branch
> and handling conflicts.

After changes have been reviewed and comments addressed, the branch must be
rebased against master. Rebasing will ensure any upstream changes are applied 
*before* the topic branch's changes, which ensures any merge conflicts regard
introducing the topic branch rather than adding previously-working changes atop
the topic branch.

To rebase the current branch with master and squash all fixup commits, issue
the following command and ensure the correct responses in the interactive
editor:

```bash
$ git rebase -i --autosquash master
```

After rebasing and adressing any conflicts, force-push the topic branch to the
remote.

```bash
$ git push -f origin feature/my_cool_feature:feature/my_cool_feature
```

### Merging a pull request

> One should **never** force-push to master!

Merging pull requests is straight forward. Simply issue a merge command from
master and push to the origin. 

```bash
$ git checkout master
$ git merge feature/my_cool_feature
$ git push
```
