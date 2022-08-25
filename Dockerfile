# syntax=docker/dockerfile:1

FROM golang:1.18.4-alpine
WORKDIR /

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./
RUN go build -o /docker-gs-ping

EXPOSE 8080
CMD [ "/docker-gs-ping" ]
