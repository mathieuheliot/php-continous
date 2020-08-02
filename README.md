<h1 align="center">PHP Continous</h1>
<h3 align="center">Continous deployment with Docker, PHP, Composer and GitLab CI/CD.</h3>

<p align="center">
  <img src="https://gitlab.com/mheliot/lab/php-continous/badges/master/pipeline.svg?style=flat-square" alt="Build Status" />
</p>

PHP Continous is a sample application to illustrate how to continous integrate and deploy a PHP application with Docker, Composer and GitLab CI/CD.

It also supports XDebug for debugging mode, and multiple environment (staging and production).
Check it out at :
- https://lab.mathieuheliot.com/php-continous/ (production)
- http://test.lab.mathieuheliot.com/php-continous/ (staging)

## Installation
Note for Windows users: source code must be in c:/Users/\<Nom>
- `docker-compose build app`
- `docker-compose up -d`
- `docker-compose exec app composer install`

## Development (local environment)
- `docker-compose up -d`
- `docker-compose exec app composer update`
- `docker-compose down`

### Tools for Visual Studio Code

#### Autocompletion with PHP Intellisense
Firstly, install the PHP Intellisense extension and get PHP binaries for Windows at https://windows.php.net.
PHP >=7.4 needs also VCRuntime 15 ; you can download PHP 7.2 to keep it simple.

In your `settings.json` (File > Preferences > Settings), add the following line:
```json
{
  ...
  "php.validate.executablePath": "C:\\Program Files\\Php\\php.exe"
}
```

#### Debug mode with PHP Debug
Install first the PHP Debug extension.
Add to your IDE's launch.json file the following configuration:
```json
{
  "name": "Listen for XDebug",
  "type": "php",
  "request": "launch",
  "port": 9000,
  "log": true,
  "pathMappings": {
      "/opt/application/src": "${workspaceFolder}/src"
  },
  "ignore": [
      "**/vendor/**/*.php"
  ]
}
```

## Deployment (prod or remote environment)
- `docker build -t php-continous:latest .`
- `docker run -p <PORT>:80 -d --name php-continous php-continous:latest`
- `docker rm --force php-continous`