install:
	gem install bundler
	bundle install
	. ~/.nvm/nvm.sh && nvm install && nvm use
	npm install -g less

uninstall:
	rm -rf .vendor

serve:
	bundle exec jekyll serve

build:
	bundle exec jekyll build

.PHONY: install uninstall serve build