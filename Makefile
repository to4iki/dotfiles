CHEZMOI := chezmoi

.PHONY: apply secrets-apply

apply:
	$(CHEZMOI) apply -v

secrets-apply:
	CHEZMOI_WITH_SECRETS=1 $(CHEZMOI) apply -v
