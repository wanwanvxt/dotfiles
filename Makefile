HOSTNAME := $(shell hostnamectl hostname)
PKGS     := $(shell bash pkgs/$(HOSTNAME))
PACMAN   := $(shell command -v yay || command -v paru || echo 'sudo pacman')

.PHONY: all pkgs dots

all: pkgs dots

pkgs:
	@if [ -n '$(PKGS)' ]; then \
		$(PACMAN) -S --needed $(PKGS);     \
		$(PACMAN) -D --asexplicit $(PKGS); \
		\
		_unlisted=$$(comm -23 <($(PACMAN) -Qeq | sort) <(printf '%s\n' $(PKGS) | sort)); \
		if [ -n "$$_unlisted" ]; then \
			printf 'Unlisted packages:\n%s\n' "$$_unlisted";       \
			read -rp '>> Set unlisted as deps? [yes/NO]: ' _conf;  \
			_conf=$$(echo "$$_conf" | tr '[:upper:]' '[:lower:]'); \
			if [ "$$_conf" = 'y' ] || [ "$$_conf" = 'yes' ]; then  \
				$(PACMAN) -D --asdeps $$_unlisted; \
			fi \
		fi \
	fi

dots:
	@command -v chezmoi && chezmoi apply -vS ./dots || true
