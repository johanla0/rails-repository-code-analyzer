annotate-models:
	bundle exec annotate --models
ci-setup:
	bundle install
	bin/rails db:create db:migrate
	yarn install --cache-folder .yarn-cache
	bin/rails assets:precompile
check: lint test
env:
	[ -f .env.example ] && (cp .env.example .env) || (touch .env)
	echo '.env' >> .gitignore
esbuild:
	yarn build --watch
eslint:
	npx eslint app/javascript --ext .js
eslint!:
	npx eslint app/javascript --ext .js --fix
install:
	bundle install
	bundle exec bin/rails db:create
	bundle exec bin/rails db:migrate
	bundle exec bin/rails db:fixtures:load
lint:
	make style
	make slimlint
	make eslint
	make stylelint
logs:
	tail -f log/development.log
open:
	@ echo open http://localhost:3000
sidekiq:
	bundle exec sidekiq
slimlint:
	bundle exec slim-lint app/views/
style:
	bundle exec rubocop
style!:
	bundle exec rubocop -A
stylelint:
	npx stylelint "**/*.scss" "!**/vendor/**"
webpack: esbuild
