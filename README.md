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
```
curl -s https://raw.githubusercontent.com/joshglendenning/pac/master/quickstart.sh | bash -s
```

### Manual
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
  --pacman    Use pacman instead of yaourt.
```

Pac will automatically use `yaourt` if it is installed, and will automatically use `sudo` if running pacman while not root.

### Commands (under the hood)

`pac install {ARGS}` == `pacman -S {ARGS}`

`pac search {ARGS}`  == `pacman -Ss {ARGS}`

`pac update {ARGS}`  == `pacman -Sy {ARGS}`

`pac upgrade {ARGS}` == `pacman -Syu {ARGS}`

`pac remove {ARGS}`  == `pacman -R {ARGS}`
