Code Authoring/Review Process
-----------------------------

### Code Style

When writing Ruby, please follow the [Github Ruby Style Guide](https://github.com/styleguide/ruby).
For any other langauges, follow the style guide preferred by that community.
As an example, Javascript is camelCase with four-space tabs; python is
snake_case with four-space tabs, and so on.


### Branching

Every body of work should be done within it's own branch.  Branches should be
named based on the type of work done.  The following are possible prefixes:
* bug
* chore
* feature

For example, a branch updating the Hipchat API key would be named `chore/new_hipchat_api_key`
Adding the ability for users to comment on blog posts would be named `feature/post_comments`
Fixing a css bug would be `bug/fix_css`


### Pull Requests

Each Pull Request should be reviewed by at least one person before merging to master.
It's a good practice to open pull requests as early as possible to increase visiblity
of work as its being done and to allow reviewers ample time to *understand* the commits.
Please follow the format below when creating a pull request:

```markdown
Status
------
**READY/IN DEVELOPMENT/HOLD**


Description
-----------
A few sentences describing the overall goals of the pull request's commits.


Purpose
-------
- [x] Checklist item describing completed technical detail
- [ ] Checklist item descibing incomplete technical detail


Deploy Notes
-----
Notes regarding deployment the contained body of work.  These should note any db migrations, etc.
```

