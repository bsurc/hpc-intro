FROM ruby:3.3-bullseye

# System deps for Jekyll & common plugins
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git build-essential nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work

# Local (project) gem install path for caching
ENV BUNDLE_PATH=/work/vendor/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

# Ensure a recent Bundler is present
RUN gem install bundler

# Tiny entrypoint with helper commands
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["help"]

