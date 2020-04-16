FROM openjdk:11-jdk-buster as builder
WORKDIR /home/work/spring-sample-template
COPY ./gradle /home/work/spring-sample-template/gradle
COPY ./gradlew /home/work/spring-sample-template
COPY ./settings.gradle /home/work/spring-sample-template
COPY ./build.gradle /home/work/spring-sample-template
COPY ./src /home/work/spring-sample-template/src
RUN ./gradlew clean build -x test

FROM openjdk:11-jre-buster
WORKDIR /home/spring-sample-template
COPY --from=builder \
/home/work/spring-sample-template/build/libs/spring-sample-template-0.0.1-SNAPSHOT.jar \
/home/spring-sample-template/build/libs/spring-sample-template-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "./build/libs/spring-sample-template-0.0.1-SNAPSHOT.jar"]