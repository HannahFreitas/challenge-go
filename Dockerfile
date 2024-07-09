FROM golang:1.22 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go mod download && go mod verify

RUN go build -v -o /usr/local/bin/app ./...

FROM scratch

COPY --from=builder /usr/local/bin/app /usr/local/bin/app

CMD ["/usr/local/bin/app"]
