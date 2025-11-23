# git

## `~/.gitconfig`

```ini
[user]
    email = user@domain.tld
    name = User Name

[core]
    excludesfile = ~/<dotfiles>/git/exclude

[include]
    path = ~/.dots/git/main
```

## Reference
### Good defaults
- [How Core Git Developers Configure Git](https://blog.gitbutler.com/how-git-core-devs-configure-git), Scott Chacon, 2025
- [A better Git log](https://coderwall.com/p/euwpig/a-better-git-log), Filipe Kiss, 2014

### Rants
- [Confusing git terminology](https://jvns.ca/blog/2023/11/01/confusing-git-terminology/), Julia Evans, 2023

### `.gitignore`
- [Explain which gitignore rule is ignoring my file](https://stackoverflow.com/questions/12144633/explain-which-gitignore-rule-is-ignoring-my-file)

### `git-commit`
- [Signing Git Commits with Your SSH Key](https://calebhearth.com/sign-git-with-ssh), Caleb Hearth, 2021

### `git-config`
- [git-config](https://git-scm.com/docs/git-config)
- [include, includeIf](https://git-scm.com/docs/git-config#Documentation/git-config.txt-includepath)
    - [Git with Multiple E-Mail Addresses](https://www.paedubucher.ch/articles/git-with-multiple-email-addresses/),
      Patrick Bucher, 2022
- [pull.ff](https://git-scm.com/docs/git-config#Documentation/git-config.txt-pullff)
- [pull.rebase](https://git-scm.com/docs/git-config#Documentation/git-config.txt-pullrebase)

### `git-log`
- [--follow](https://git-scm.com/docs/git-log#Documentation/git-log.txt---follow)
    - [Is there a trick to git log --follow a directory which has been renamed?](https://stackoverflow.com/questions/38870925/is-there-a-trick-to-git-log-follow-a-directory-which-has-been-renamed)

### `git-pull`
- [git-pull](https://git-scm.com/docs/git-pull)

### `git-push`
- [git-push](https://git-scm.com/docs/git-push)
- [--force-if-includes](https://git-scm.com/docs/git-push#Documentation/git-push.txt---force-if-includes)
  - [When should I use "git push --force-if-includes"](https://stackoverflow.com/questions/65837109/when-should-i-use-git-push-force-if-includes)
- [--force-with-lease](https://git-scm.com/docs/git-push#Documentation/git-push.txt---force-with-lease)
  - [push --force-with-lease by default](https://stackoverflow.com/questions/30542491/push-force-with-lease-by-default)

### `git-remote`
- [git-remote](https://git-scm.com/docs/git-remote)
  - [Pushing code to two remotes](https://stackoverflow.com/questions/14290113/git-pushing-code-to-two-remotes)
