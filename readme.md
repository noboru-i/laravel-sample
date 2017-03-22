Sample of Laravel 5.3 Application
===

## How to create

```sh
# generate laravel application from template
composer create-project --prefer-dist laravel/laravel laravel-sample "5.3.*"
# prepare homestead
vagrant box add laravel/homestead
composer require laravel/homestead --dev
php vendor/bin/homestead make
# up vagrant
vagrant up
vagrant ssh
cd Code/laravel-sample
# generate auth from template
php artisan make:auth
php artisan migrate
```

## How to run

Clone this repository, and `cd` to repository root directory.

```sh
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
