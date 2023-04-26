.PHONY: init
init:
	composer config --no-interaction allow-plugins.php-http/discovery true
	composer config --no-interaction allow-plugins.pestphp/pest-plugin true
	composer require laravel/pint pestphp/pest rector/rector driftingly/rector-laravel --dev --with-all-dependencies
	./vendor/bin/pest --init --no-interact

.PHONY: analyse
analyse:
	./vendor/bin/phpstan analyse src/ --memory-limit=512M
	./vendor/bin/rector process src/

.PHONY: format
format:
	./vendor/bin/pint

.PHONY: test
test:
	./vendor/bin/pest