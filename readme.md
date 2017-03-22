Sample of Laravel 5.3 Application
===

## How to create

```sh
# generate laravel application from template
composer create-project --prefer-dist laravel/laravel laravel-sample "5.3.*"
# prepare homestead
vagrant box add laravel/homestead
composer require laravel/homestead --dev
```
