FROM php:8.0-alpine

ENV PATH=${PATH}:/root/.composer/vendor/bin
RUN apk add --no-cache \
		                   git \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && composer global require phpcompatibility/php-compatibility squizlabs/php_codesniffer \
 && phpcs --config-set installed_paths /root/.composer/vendor/phpcompatibility/php-compatibility \
 && phpcs --config-set default_standard PHPCompatibility

WORKDIR /app

ENTRYPOINT ["phpcs --standard=PHPCompatibility --runtime-set testVersion 7.4 ."]
CMD ["--version"]