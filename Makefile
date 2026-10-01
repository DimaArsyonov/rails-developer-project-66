setup: install env-prepare db-setup build
install:
	bundle install
	yarn install --frozen-lockfile
env-prepare:
	test -f .env || cp .env.example .env
db-setup:
	bundle exec rails db:create db:migrate db:seed
build:
	yarn build
	yarn build:css
start:
	bundle exec rails s -p 3000
test:
	bin/rails test
test-system:
	bin/rails test:system