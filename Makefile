.PHONY: atlas-hash
atlas-hash:
	atlas migrate hash

.PHONY: atlas-lint
atlas-lint:
	atlas migrate lint --env test --latest 10

.PHONY: atlas-apply
atlas-apply:
	atlas schema apply --env test --to "file://migrations?format=golang-migrate" --auto-approve