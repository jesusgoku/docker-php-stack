Docker PHP Stack
================

This image contain:

- PHP5.6
- composer
- NodeJS
- NPM
- Bower

For build image execute:

```sh
docker build -t image-name .
```

Enviroment vars avaialables:

- GIT_REPO (**Required**) Repository with the application
- SYMFONY_APP (**Optional**) Set when your app is a Symfony2 application
- SILEX_APP (**Optional**) Set when your app is a Silex application

For run generate image, execute:

```sh
docker run -it --rm -e GIT_REPO="http://github.com/public/php-application.git" -p 80:80 -p 8080:8080 --name image-name container-name
```

> **Important:** replace *GIT_REPO* with your application code hosted on GitHub