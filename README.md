pac
===

A simple bash wrapper for pacman.

Pros:
* Really easy to use
* No dependencies, 100% bash script
* Works with `yaourt` if installed

Cons:
* Doesn't cover all of `pacman`'s capabilities

## Why?

I found the flags for pacman hard to remember, and my fingers were used to
apt-get/homebrew.

## Installation

### Quickstart
Do you trust me?
```
bash <(curl -s https://raw.githubusercontent.com/isobit/pac/master/quickstart.sh)
```

### Manual
Clone this repository `git clone https://github.com/isobit/pac.git`
and then put the `bin` folder on your PATH.

```
PATH=$PATH:{PATH_TO_PAC}/bin
```

## Usage

```
Usage: pac [options] <command> <args>...
  pac install <package>
  pac install-tarball <file>
  pac search <package>
  pac info <package>
  pac remove <package>
  pac update [args]...
  pac upgrade [args]...
  pac list-installed                    List locally installed packages
  pac locate <file>                     Query the package which provides <file>

Options:
  -h | --help           Show this screen.
  -v | --verbose        Display the command to be passed through.
  --yaourt              Use yaourt instead of pacman.
  --pacman              Force pacman if use_yaourt is enabled
```

Pac will automatically use `yaourt` if it is installed, and will automatically use `sudo` if running pacman while not root.

### Commands (under the hood)

`pac install {ARGS}` == `pacman -S {ARGS}`

`pac install-tarball {ARGS}` == `pacman -U {ARGS}`

`pac search {ARGS}`  == `pacman -Ss {ARGS}`

`pac info {ARGS}` == `pacman -Si {ARGS}`

`pac remove {ARGS}`  == `pacman -Rs {ARGS}`

`pac update {ARGS}`  == `pacman -Sy {ARGS}`

`pac upgrade {ARGS}` == `pacman -Syu {ARGS}`

`pac list-installed {ARGS}` == `pacman -Q {ARGS}`

`pac locate {ARGS}` == `pacman -Qo {ARGS}`
