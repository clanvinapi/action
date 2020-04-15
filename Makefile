build:
	docker build -t pullpreview/pullpreview .

shell:
	docker run -e GITHUB_TOKEN -e GITHUB_EVENT_PATH=/app/test/fixtures/github_event_push.json -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY --entrypoint /bin/sh -it --rm -v $(shell pwd):/app pullpreview/pullpreview


bundle:
	docker run --rm -v $(shell pwd):/app -w /app ruby:2-alpine bundle

release: build
	docker push pullpreview/pullpreview
