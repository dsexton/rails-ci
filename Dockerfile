FROM dsexton/rails-ci:ruby-2.4

RUN /scripts/install-postgres-client
RUN /scripts/install-mysql-client
