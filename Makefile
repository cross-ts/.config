.DEFAULT_GOAL := help

# Variables
DOTFILES_DIR := $(shell pwd)
HOME_DIR     := $(HOME)

LEGACY_DIRS  := claude gemini

## install: Create symbolic links for legacy tools and .zshenv
.PHONY: install
install:
	@echo "🚀 Creating symbolic links..."
	@# Claude, Gemini
	@$(foreach dir, $(LEGACY_DIRS), \
		ln -sfn $(DOTFILES_DIR)/$(dir) $(HOME_DIR)/.$(dir); \
		echo "Linked: $(HOME_DIR)/.$(dir) -> $(DOTFILES_DIR)/$(dir)"; \
	)
	@# Zsh (.zshenv)
	@ln -sfn $(DOTFILES_DIR)/zsh/.zshenv $(HOME_DIR)/.zshenv
	@echo "Linked: $(HOME_DIR)/.zshenv -> $(DOTFILES_DIR)/zsh/.zshenv"
	@echo "✨ Done."

## uninstall: Remove symbolic links using unlink
.PHONY: uninstall
uninstall:
	@echo "🧹 Unlinking symbolic links..."
	@$(foreach dir, $(LEGACY_DIRS), \
		if [ -L $(HOME_DIR)/.$(dir) ]; then \
			unlink $(HOME_DIR)/.$(dir) && echo "Unlinked: $(HOME_DIR)/.$(dir)"; \
		fi; \
	)
	@if [ -L $(HOME_DIR)/.zshenv ]; then \
		unlink $(HOME_DIR)/.zshenv && echo "Unlinked: $(HOME_DIR)/.zshenv"; \
	fi
	@echo "✨ Cleaned up."

## help: Show this help message
.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^##' $(MAKEFILE_LIST) | sed -e 's/## //g' | awk 'BEGIN {FS = ": "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'
