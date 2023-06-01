<div align="center">
    <a href="https://php.net">
        <img
            alt="PHP"
            src="https://www.php.net/images/logos/new-php-logo.svg"
            width="150">
    </a>
</div>

# The PHP Interpreter

[![Push](https://github.com/php/php-src/actions/workflows/push.yml/badge.svg)](https://github.com/php/php-src/actions/workflows/push.yml)
[![Build status](https://travis-ci.com/php/php-src.svg?branch=master)](https://travis-ci.com/github/php/php-src)
[![Build status](https://ci.appveyor.com/api/projects/status/meyur6fviaxgdwdy/branch/master?svg=true)](https://ci.appveyor.com/project/php/php-src)
[![Fuzzing Status](https://oss-fuzz-build-logs.storage.googleapis.com/badges/php.svg)](https://bugs.chromium.org/p/oss-fuzz/issues/list?sort=-opened&can=1&q=proj:php)

## Documentation

The PHP manual is available at [php.net/docs](https://php.net/docs).

## Installation

Using XAMPP to install PHP version ">= 8.2.0"
Clone the project with

    git clone https://github.com/ItsaMeChun/phpmvc.git
    
Then install composer

    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"

Then install all the dependencies with

    composer require

If you want to install more dependencies of your choice use

    composer require [name of the package you want to use]

Then add the thing you want like Firebase in 

    config/firebase-config.json.example

Installing Docker MySQL into this project by following this step below:

1.  Place the SQL script in the same directory as the Dockerfile, and add the following line to the Dockerfile
    
```
COPY your_script.sql /docker-entrypoint-initdb.d/
```

Remember to replace `your_script.sql` with the actual filename of your script.

2. Expose the MySQL port: By default, MySQL runs on port 3306. To allow access to the MySQL server from outside the container, expose this port by adding the following line to the Dockerfile:

```javascript
EXPOSE 3306
```

3. Build the Docker image: Open a terminal, navigate to the directory containing the Dockerfile, and run the following command to build the Docker image:

```javascript
docker build -t mysql-image .
```
Replace `mysql-image` with the desired name for your Docker image.

4. Run the Docker container: Once the image is built, you can run the MySQL container using the following command:

```javascript
docker run -d -p 3306:3306 --name mysql-container mysql-image
```

This command will start the container in detached mode `(-d)`, map the host's port 3306 to the container's port 3306 `(-p 3306:3306)`, and assign a name to the container `(--name mysql-container)`.

5. Connect to MySQL: You can now connect to the MySQL server using a MySQL client or application by specifying the host as `localhost` or `127.0.0.1`, port as `3306`, and appropriate credentials.

## Credits

For the list of people who've put work into PHP, please see the
[PHP credits page](https://php.net/credits.php). 
