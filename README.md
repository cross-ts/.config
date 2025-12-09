# .config

## Install

```bash
git clone git@github.com:cross-ts/.config.git
ln -fnsv .config/zsh/.zshenv ~/.zshenv

ln -fnsv .config/claude ~/.claude
ln -fnsv .config/gemini ~/.gemini

# Temporary workaround for Serena MCP Server.
# See: https://github.com/oraios/serena/pull/818
ln -fnsv .config/serena ~/.serena
```
