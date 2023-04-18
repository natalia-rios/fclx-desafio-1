FROM golang:1.18-bullseye as base

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .

FROM scratch

COPY --from=base /main .

CMD ["./main"]