FROM alpine:3.21.2 AS build
RUN apk add --update --no-cache binutils
COPY hello.S ./
RUN as hello.S -o hello.o && ld -s hello.o -o hello

FROM scratch
COPY --from=build hello hello
CMD ["/hello"]
