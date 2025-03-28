# How to manage the dotfiles with `chezmoi`

## 1. Install `chezmoi`

Follow the [installation instructions](https://www.chezmoi.io/install/) corresponding to your
operating system, distribution and package manager.

On Arch Linux:

```bash
$ pacman -S chezmoi
```

On Debian and Ubuntu, see [Download a pre-built Linux package](https://www.chezmoi.io/install/#download-a-pre-built-linux-package)

On macOs:

```shell
$ brew install chezmoi
```

## 2. Initialize `chezmoi`
Initialize `chezmoi` for a new machine:

```shell
chezmoi init git@github.com:virtualtam/dotfiles.git
```

## 3. Apply changes
Preview the changes that would be made:

```shell
chezmoi diff
```

Apply the changes:

```shell
chezmoi apply
```
