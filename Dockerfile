# 1
FROM alpine:3.6
# 2
LABEL maintainer=”jetherrodrigues@gmail.com>
# 3 - JAVA
RUN apk --update add openjdk8-jre-base
# 4 - JMETER
ENV JMETER_VERSION=4.0
RUN apk --update add wget
RUN wget http://mirror.nbtelecom.com.br/apache//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
RUN tar zxvf apache-jmeter-${JMETER_VERSION}.tgz
RUN apk del wget
RUN rm -f apache-jmeter-${JMETER_VERSION}.tgz
RUN rm -fr /apache-jmeter-${JMETER_VERSION}/docs
VOLUME /apache-jmeter-${JMETER_VERSION}
# 5
COPY launch.sh /
# 6
CMD ["/bin/true"]
ENTRYPOINT ["/launch.sh", "/usr/bin/java"]
