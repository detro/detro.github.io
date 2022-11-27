install:
	gem install bundler
	bundle install
	. ~/.nvm/nvm.sh && nvm install && nvm use
	npm install -g less

uninstall:
	rm -rf .vendor

serve:
	bundle exec jekyll serve --incremental --open-url

build:
	bundle exec jekyll build --incremental

commit:
	git -C ../gh-pages add .
	git -C ../gh-pages commit -m "From 'main' branch: $$(git log -1 --oneline)"

push:
	git -C ../gh-pages push

.PHONY: install uninstall serve build commit push