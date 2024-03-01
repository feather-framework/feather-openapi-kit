build:
	swift build

release:
	swift build -c release
	
test:
	swift test --parallel

test-with-coverage:
	swift test --parallel --enable-code-coverage

clean:
	rm -rf .build

check:
	./scripts/run-checks.sh

format:
	./scripts/run-swift-format.sh --fix

release: build
	swift build -c release

install: release
	install .build/release/feather-openapi-generator /usr/local/bin/feather-openapi-generator

uninstall:
	rm /usr/local/bin/feather-openapi-generator
