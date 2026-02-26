HOSTNAME := $(shell hostnamectl hostname)
PKGS     := $(shell sh pkgs/$(HOSTNAME))
PACMAN   := $(shell command -v yay || command -v paru || echo 'sudo pacman')

.PHONY: all pkgs dots cachyos-repo

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
	@command -v chezmoi && chezmoi apply -S ./dots || true

cachyos-repo:
	@if ! grep -q "cachyos" /etc/pacman.conf; then \
		_tmpdir=$$(mktemp -d); \
		curl -L https://mirror.cachyos.org/cachyos-repo.tar.xz -o $$_tmpdir/cachyos-repo.tar.xz; \
		tar -xvf $$_tmpdir/cachyos-repo.tar.xz -C $$_tmpdir; \
		cd $$_tmpdir/cachyos-repo && sudo ./cachyos-repo.sh; \
		rm -rf $$_tmpdir; \
	fi
