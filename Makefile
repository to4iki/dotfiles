AGENT ?= claude-code

default: apply

setup: setup-gh-extensions setup-gh-skills setup-yazi-packages setup-npm

apply:
	chezmoi apply -v

secrets-apply:
	CHEZMOI_WITH_SECRETS=1 chezmoi apply -v

setup-gh-extensions:
	gh extension install to4iki/gh-openpr
	gh extension install babarot/gh-infra

setup-gh-skills:
	gh skill install vercel-labs/opensrc opensrc --agent $(AGENT) --scope user

setup-yazi-packages:
	ya pkg add BennyOe/tokyo-night
	ya pkg add yazi-rs/plugins:smart-enter
	ya pkg add yazi-rs/plugins:git

setup-npm:
	npm install -g czg
	npm install -g opensrc

update-gh-skills:
	gh skill update vercel-labs/opensrc opensrc
