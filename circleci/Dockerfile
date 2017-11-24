FROM dsexton/rails-ci:latest
# SEE: https://github.com/circleci/circleci-images/blob/master/shared/images/Dockerfile-basic.template

# make Apt non-interactive
RUN echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90circleci \
  && echo 'DPkg::Options "--force-confnew";' >> /etc/apt/apt.conf.d/90circleci

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; apt-get update \
    && apt-get install -y \
    git mercurial xvfb \
    locales sudo openssh-client ca-certificates tar gzip parallel \
    net-tools netcat unzip zip bzip2 \
    --no-install-recommends && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install dockerize for CircleCI
RUN DOCKERIZE_URL="https://circle-downloads.s3.amazonaws.com/circleci-images/cache/linux-amd64/dockerize-latest.tar.gz" \
  && curl --silent --show-error --location --fail --retry 3 --output /tmp/dockerize-linux-amd64.tar.gz $DOCKERIZE_URL \
  && tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64.tar.gz \
  && rm -rf /tmp/dockerize-linux-amd64.tar.gz \
  && dockerize --version

RUN groupadd --gid 3434 circleci \
  && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
  && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
  && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

USER circleci

CMD ["/bin/sh"]
