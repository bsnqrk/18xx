FROM postgres:14

ENV POSTGRES_USER postgres
ENV POSTGRES_MAX_CONNECTIONS 100
ENV POSTGRES_SHARED_BUFFERS "256MB"

COPY entrypoint.sh /startup/

RUN chown -R postgres:postgres /var/lib/postgresql

ENTRYPOINT ["/startup/entrypoint.sh"]

