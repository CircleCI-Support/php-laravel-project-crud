<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

# Laravel and CircleCI

Laravel is a web application framework which is accessible, powerful, and provides tools required for large, robust applications.

CircleCI is a tool that will help test, build and deploy your web applications. 

## Saving your Environment Variables from your .env in CircleCI

The CircleCI Support team has provided a script which you can find in the .circleci folder named `env-script.sh`. 

### Prerequisites 

1. The `.env` file, which will be found at the root of your PHP Laravel project.
2. The organization ID from your organization in CircleCI, found in your org settings: https://app.circleci.com/settings/organization/github/YOURORG/overview
3. [A personal API token](https://circleci.com/docs/managing-api-tokens/#creating-a-personal-api-token) saved locally as an envionment variable named $CIRCLE_TOKEN.


This script will create a context for your organization. 