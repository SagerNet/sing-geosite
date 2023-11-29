fmt:
	@gofumpt -l -w .
	@gofmt -s -w .
	@gci write --custom-order -s standard -s "prefix(github.com/sagernet/)" -s "default" .

fmt_install:
	go install -v mvdan.cc/gofumpt@latest
	go install -v github.com/daixiang0/gci@latest

lint:
	golangci-lint run ./...

lint_install:
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

test:
	go test -v ./...