ARG MYSQL_IMAGE
FROM ${MYSQL_IMAGE:-mysql:8.0}
#FROM mysql:${MYSQL_VERSION:-5.7}
ARG USER_ID
ENV USER_ID=$USER_ID
ARG USER_GID
ENV USER_GID=$USER_GID
USER root
RUN groupmod --gid $USER_GID mysql  && \
    usermod --uid $USER_ID mysql && \
    chown -R mysql:mysql /var/run/mysqld && \
    id mysql && \
    ls -aln /var/run/mysqld; \
    mkdir -p /var/lib/mysql && \
    chown -R mysql:mysql /etc/mysql; \
    chown -R mysql:mysql /var/lib/mysql
USER mysql
