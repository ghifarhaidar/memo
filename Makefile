PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
BASHCOMPDIR ?= /etc/bash_completion.d
ZSHDIR ?= $(PREFIX)/share/zsh/site-functions
FISHDIR ?= $(PREFIX)/share/fish/vendor_completions.d

# Track what we install
INSTALLED_FILES := $(DESTDIR)$(BINDIR)/memo

install:
	install -Dm755 src/memo $(DESTDIR)$(BINDIR)/memo
	@if [ -d $(DESTDIR)$(BASHCOMPDIR) ]; then \
		install -Dm644 completions/memo.bash $(DESTDIR)$(BASHCOMPDIR)/memo && \
		echo "Installed bash completion" && \
		INSTALLED_FILES="$$INSTALLED_FILES $(DESTDIR)$(BASHCOMPDIR)/memo"; \
	else \
		echo "Bash completion directory not found, skipping"; \
	fi
	# zsh - only install if directory exists  
	@if [ -d $(DESTDIR)$(ZSHDIR) ]; then \
		install -Dm644 completions/memo.zsh $(DESTDIR)$(ZSHDIR)/_memo && \
		echo "Installed zsh completion" && \
		INSTALLED_FILES="$$INSTALLED_FILES $(DESTDIR)$(ZSHDIR)/_memo"; \
	else \
		echo "Zsh completion directory not found, skipping"; \
	fi
	# fish - only install if directory exists
	@if [ -d $(DESTDIR)$(FISHDIR) ]; then \
		install -Dm644 completions/memo.fish $(DESTDIR)$(FISHDIR)/memo.fish && \
		echo "Installed fish completion" && \
		INSTALLED_FILES="$$INSTALLED_FILES $(DESTDIR)$(FISHDIR)/memo.fish"; \
	else \
		echo "Fish completion directory not found, skipping"; \
	fi
	@echo "Installation complete. Installed files:"
	@for file in $(INSTALLED_FILES); do \
		if [ -f "$$file" ]; then echo "  $$file"; fi; \
	done

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/memo
	echo "Removed $(DESTDIR)$(BINDIR)/memo"
	@if [ -f $(DESTDIR)$(BASHCOMPDIR)/memo ]; then \
		rm -f $(DESTDIR)$(BASHCOMPDIR)/memo && \
		echo "Removed bash completion"; \
	fi
	@if [ -f $(DESTDIR)$(ZSHDIR)/_memo ]; then \
		rm -f $(DESTDIR)$(ZSHDIR)/_memo && \
		echo "Removed zsh completion"; \
	fi
	@if [ -f $(DESTDIR)$(FISHDIR)/memo.fish ]; then \
		rm -f $(DESTDIR)$(FISHDIR)/memo.fish && \
		echo "Removed fish completion"; \
	fi

.PHONY: install uninstall