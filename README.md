Docker PHP Stack
================

For build image execute:

```sh
docker build -t image-name .
```

For run generate image, execute:

```sh
docker run -it --rm -e GIT_REPO="http://github.com/public/php-application.git" -p 80:80 --name image-name container-name
```

> **Important:** replace *GIT_REPO* with your application code hosted on GitHub