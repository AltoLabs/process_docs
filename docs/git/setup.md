Git Configuration
-----------------

### Prerequisites

* You have created a github account and generated an SSH key for it
* You have been granted access to the appropriate github orgranization

### Configure Git

Configure git to play well with others.

```bash
$ git config --global merge.ff only
$ git config --global push.default tracking
```

Set your preferred editor for commit messages. Replace "vim" with "mate -w" or "subl -n" if that's your thing.

```bash
$ git config --global core.editor "vim"
```

Add some nice command shortcuts.

```bash
$ git config --global alias.st status
$ git config --global alias.co checkout
$ git config --global alias.ci commit
```

Colorized output.

```bash
$ git config --global color.ui auto
```

Prettier git log output.

```bash
$ git config --global format.pretty "%Cblue%h%Creset %Cgreen[%ar]%Creset (%an) %s"
```

Setup git to use FileMerge for diffs/merges.

```bash
$ git config --global merge.tool opendiff
$ git config --global diff.tool opendiff
```


