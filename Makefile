default: apply

apply:
	chezmoi apply -v

secrets-apply:
	CHEZMOI_WITH_SECRETS=1 chezmoi apply -v

install-gh-extensions:
	gh extension install to4iki/gh-openpr
	gh extension install babarot/gh-infra

install-yazi-packages:
	ya pkg add BennyOe/tokyo-night
	ya pkg add yazi-rs/plugins:smart-enter
	ya pkg add yazi-rs/plugins:git