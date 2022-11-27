install:
	gem install bundler
	bundle install
	. ~/.nvm/nvm.sh && nvm install && nvm use
	npm install -g less

uninstall:
	rm -rf .vendor

serve:
	bundle exec jekyll serve --incremental --open-url

ghp.build:
	bundle exec jekyll build --incremental

ghp.commit:
	git -C ../gh-pages add .
	git -C ../gh-pages commit -m "From 'main' branch: $$(git log -1 --oneline)"
	git -C ../gh-pages status

ghp.push:
	git -C ../gh-pages push
	git -C ../gh-pages status

.PHONY: install uninstall serve ghp.build ghp.commit ghp.push