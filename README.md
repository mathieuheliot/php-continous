<h1 align="center">PHP Continous</h1>
<h3 align="center">Continous deployment with Docker, PHP, Composer and GitLab CI/CD.</h3>

<p align="center">
  <img src="https://gitlab.com/mheliot/lab/php-continous/badges/master/pipeline.svg?style=flat-square" alt="Build Status" />
</p>

PHP Continous is a sample application to illustrate how to continous integrate and deploy a PHP application with Docker, Composer and GitLab CI/CD.
This example supports multiple environment (staging and production).
Check it out at :
- https://lab.mathieuheliot.com/php-continous/ (production)
- http://test.lab.mathieuheliot.com/php-continous/ (staging)

## Installation
Note for Windows users: source code must be in c:/Users/\<Nom>
- docker-compose build app
- docker-compose up -d
- docker-compose exec app composer install

## Usage
- docker-compose up -d
- docker-compose exec app composer update
- docker-compose down

## Deployment
- docker build -t php-continous:latest .
- docker run -p \<PORT>:80 -d --name php-continous php-continous:latest
- docker rm --force php-continous