# config
Dot files and other config to make me happy

## Maximum Awesome

```
# Install Powerline-compatible fonts
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh

cd..
git clone git@github.com:bethadele/maximum-awesome.git
cd maximum-awesome
rake
```

1. Config iTerm2
  * iTerm2 > Preferences > General > Preferences
  * Check *Load preferences from a custom folder or URL*
  * Browse to `com.googlecode.iterm2.plist` in this dir
2. Copy dot files to `~/`
3. Source `~/.zshrc.local` in `~/.zshrc`

## Tooling

* `brew install fzf`
* [kns](https://github.com/blendle/kns)
* [zsh-kubectl-prompt](https://github.com/superbrothers/zsh-kubectl-prompt)
