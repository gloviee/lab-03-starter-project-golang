FROM golang:1.24.2-alpine3.21 AS builder

WORKDIR /app

COPY . .

RUN go build -o build/fizzbuzz

FROM scratch

COPY --from=builder /app/build/fizzbuzz /fizzbuzz
COPY --from=builder /app/templates/index.html /templates/index.html

EXPOSE 8080

CMD ["./fizzbuzz", "serve"]