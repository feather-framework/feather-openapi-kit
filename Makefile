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

format:
	swift-format -i -r ./Sources && swift-format -i -r ./Tests

validate: test
	docker run -v ./Tests/FeatherOpenAPIKitTests/openapi.yaml:/openapi.yaml --rm pythonopenapi/openapi-spec-validator /openapi.yaml
