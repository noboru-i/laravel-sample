Sample of Laravel 5.3 Application
===

## How to create

```sh
# generate laravel application from template
composer create-project --prefer-dist laravel/laravel laravel-sample "5.3.*"
# prepare homestead
vagrant box add laravel/homestead
composer require laravel/homestead --dev
# generate auth from template
php artisan make:auth
```

## How to run

```
composer install
php vendor/bin/homestead make
# up vagrant
vagrant up
vagrant ssh
cd Code/laravel-sample
php artisan migrate
yarn install
yarn run dev # or yarn run prod
```
