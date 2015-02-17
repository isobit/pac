pac
===

A simple bash wrapper for pacman.

## Why?

I found the flags for pacman hard to remember, and my fingers were used to
apt-get/homebrew.

## Installation

Clone this repository `git clone https://github.com/joshglendenning/pac.git`
and then put the `bin` folder on your PATH.

```
PATH=$PATH:{PATH_TO_PAC}/bin
```

## Usage

```
Usage: pac [options] <command> <args>...
  pac install <package>
  pac search <package>
  pac remove <package>
  pac update [args]...
  pac upgrade [args]...

Options:
  -h | --help		Show this screen.
  -v | --verbose 	Display the command to be passed through.
  --yaourt		Use yaourt instead of pacman.
  --aur			See --yaourt above.
```

### Commands (under the hood)

`pac install {ARGS}` == `pacman -S {ARGS}`

`pac search {ARGS}`  == `pacman -Ss {ARGS}`

`pac update {ARGS}`  == `pacman -Sy {ARGS}`

`pac upgrade {ARGS}` == `pacman -Syu {ARGS}`

`pac remove {ARGS}`  == `pacman -R {ARGS}`

## Config

*pac* will look for an optional config file at `~/.pacrc`.

Available options:
```
use_sudo={true|false}	# Whether or not to auto-prefix pacman with sudo
use_yaourt={true|false}	# Use yaourt instead of pacman by default
```
