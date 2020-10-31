# Install dependencies:

FROM google/dart AS dart-runtime

WORKDIR /app

RUN git clone --depth 1 --branch 2.1.0 https://github.com/wrike/dart-code-metrics.git /app
RUN pub get
RUN dart2native /app/bin/metrics.dart -o /app/metrics

# Install engine:

FROM bitnami/minideb
LABEL maintainer="Zennon Gosalvez <1798166+zgosalvez@users.noreply.github.com>"

WORKDIR /usr/src/app/

COPY engine.json /
COPY --from=dart-runtime /app/metrics bin/metrics

RUN adduser -u 9000 --disabled-password app
USER app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/metrics", "--reporter=codeclimate", "./"]
