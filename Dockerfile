FROM golang:1.22.4-alpine

WORKDIR /planner

COPY go.mod go.sum ./

RUN go mod download && go mod verify

COPY . .

WORKDIR /planner/cmd/main

RUN go build -o /planner/bin/main .

EXPOSE 8080
ENTRYPOINT [ "/planner/bin/main" ]