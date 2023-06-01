FROM mysql:5.7.42-debian
ENV MYSQL_ROOT_PASSWORD Docker123
COPY nhatro.sql /docker-entrypoint-initdb.d/