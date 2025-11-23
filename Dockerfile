FROM postgres:13

ENV POSTGRES_PASSWORD=postgres
# TODO: CHANGE LATER!
ENV POSTGRES_DB=users

# https://github.com/docker-library/docs/blob/master/postgres/README.md#initialization-scripts
COPY init.sql /docker-entrypoint-initdb.d
