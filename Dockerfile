FROM eclipse-temurin:11-jdk

WORKDIR /build

RUN apt update \
    && apt install -y --no-install-recommends git
RUN git clone https://github.com/vast-data/vast-db-connectors.git \
    && cd vast-db-connectors \
    && git checkout -b spark3-vast-3.5.1-fb45e3c6f75c spark3-vast-3.5.1-fb45e3c6f75c
RUN cd vast-db-connectors \
    && ./mvnw -pl plugin/spark3/spark35-scala212 -am clean package
