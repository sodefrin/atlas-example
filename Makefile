.PHONY: atlas-hash
atlas-hash:
	atlas migrate hash

.PHONY: atlas-lint
atlas-lint:
	atlas migrate lint --env test --latest 10

.PHONY: atlas-apply
atlas-apply:
	atlas schema apply --env test --to "file://migrations?format=golang-migrate" --auto-approve

.PHONY: migrate-create
migrate-create:
	 migrate create -ext .sql -dir migrations $(name)

.PHONY: migrate-up
migrate-up:
	migrate -source "file://migrations" -database "postgres://test:test@localhost:5432/test?sslmode=disable" up