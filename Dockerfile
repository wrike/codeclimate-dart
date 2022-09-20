# Install dependencies:

FROM dart:2.14.4 as dart-runtime

WORKDIR /app

# TODO: RUN git clone --depth 1 --branch <version released with https://github.com/wrike/dart-code-metrics/pull/177> https://github.com/wrike/dart-code-metrics.git /app
RUN git clone --depth 1 --branch 4.16.0 https://github.com/dart-code-checker/dart-code-metrics.git /app
RUN pub get
RUN dart compile exe /app/bin/metrics.dart -o /app/metrics

# Install engine:

FROM bitnami/minideb

WORKDIR /usr/src/app/

COPY engine.json /
COPY --from=dart-runtime /app/metrics bin/metrics
# --sdk-path requirement
# https://github.com/dart-code-checker/dart-code-metrics/issues/385
COPY --from=dart-runtime /usr/lib/dart/ /usr/lib/dart/

RUN adduser -u 9000 --disabled-password app
USER app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/metrics", "--sdk-path=/usr/lib/dart", "--reporter=codeclimate", "./"]
