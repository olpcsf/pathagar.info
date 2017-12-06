
build:
	bundle exec jekyll build

serve:
	bundle exec jekyll serve

test:
	bundle exec htmlproofer _site

.PHONY: build serve
