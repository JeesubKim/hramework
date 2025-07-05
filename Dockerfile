FROM hhvm/hhvm:latest

RUN apt update && apt install -y git unzip curl


WORKDIR /var/www
COPY . .

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer global require hhvm/hhvm-autoload

ENV PATH="/root/.composer/vendor/bin:${PATH}"

RUN hh-autoload

CMD ["hhvm", "src/main.hack"]