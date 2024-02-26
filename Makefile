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

openapi-validate:
	docker run --rm -v "$(PWD)/OpenAPI/openapi.yaml:/openapi.yaml" pythonopenapi/openapi-spec-validator /openapi.yaml

openapi-security-check:
	docker run -v "$(PWD)/OpenAPI:/app/config" -t owasp/zap2docker-weekly zap-api-scan.py -t /app/config/openapi.yaml -f openapi

openapi-server:
	docker run -it --rm -p 8888:80 --name openapi -v "$(PWD)/OpenAPI:/usr/share/nginx/html" nginx

release: build
	swift build -c release

install: release
	install .build/release/feather-openapi-generator /usr/local/bin/feather-openapi-generator

uninstall:
	rm /usr/local/bin/feather-openapi-generator
