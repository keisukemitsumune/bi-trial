FROM mysql:5.7

COPY mysql/my.cnf /etc/mysql/my.cnf

RUN set -eux && \
    chmod 644 /etc/mysql/my.cnf && \
    mkdir -p /var/log/mysql && \
    chmod 0750 /var/log/mysql && \
    chmod 0775 /var/log && \
    chmod 0755 /var && \
    chown mysql:root /var/log/mysql