install:
	gem install bundler
	bundle install
	. ~/.nvm/nvm.sh && nvm install && nvm use
	npm install -g less

uninstall:
	rm -rf .vendor

update:
	bundle update

serve:
	bundle exec jekyll serve --drafts --open-url

ghp.build:
	bundle exec jekyll build

ghp.commit:
	git -C ../gh-pages add .
	git -C ../gh-pages commit -m "From 'main' branch: $$(git log -1 --oneline)"
	git -C ../gh-pages status

ghp.push:
	git -C ../gh-pages push
	git -C ../gh-pages status

ghp.build_commit_push: ghp.build ghp.commit ghp.push

.PHONY: install uninstall update serve ghp.build ghp.commit ghp.push ghp.build_commit_push