pac
===

A simple bash wrapper for pacman.

# Why?

I found the flags for pacman hard to remember, and my fingers were used to apt-get/homebrew, so I created this tiny bash script to wrap pacman.

# Installation

Just put the `bin` folder on your PATH.

```
PATH=$PATH:{PATH_TO_PAC}/bin
```

# Usage

`pac install {ARGS}` == `pacman -S {ARGS}`

`pac search {ARGS}`  == `pacman -Ss {ARGS}`

`pac update {ARGS}`  == `pacman -Sy {ARGS}`

`pac upgrade {ARGS}` == `pacman -Syu {ARGS}`

`pac remove {ARGS}`  == `pacman -R {ARGS}`
