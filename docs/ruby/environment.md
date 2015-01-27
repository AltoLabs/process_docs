Ruby Environment Setup
----------------------

OS X (Yosemite) ships with a workable version of Ruby. However, it's still lagging behind current recommended versions. To manage local installations, using `ruby-install` and `chruby` is recommended. There are other tools available, but you're on your own.

### Install `ruby-install` From Homebrew

```bash
$ brew install ruby-install
```

### Install `chruby` From Homebrew

```bash
$ brew install chruby
```

### Install Ruby using `ruby-install`

Invoking `ruby-install` without arguments will list available, stable versions of Ruby. Please note this is not a comprehensive list. For the examples, the current Heroku-recommended version is used.

Install Ruby, use 6 threads during compilation, and clean up after installation:

```bash
$ ruby-install -c -j6 ruby 2.2.0
```
> Note: For a full list of `ruby-install` options, see `man ruby-install`

### Configure `chruby`

`chruby` expects the configuration file `~/.ruby-version` to specify the default Ruby version. 

```bash
$ echo  "ruby-2.2.0" > ~/.ruby-version
```

After creating/updating this file, a new shell session must be started. In OSX's Terminal.app, creating a new window/tab is sufficient. Test to ensure the correct version is referenced.

```bash
$ ruby --version
ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14]
```
