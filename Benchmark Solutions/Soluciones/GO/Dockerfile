FROM golang:1.20-alpine AS build
WORKDIR /app
COPY solve.go .

# Compilamos solve.go y generamos un binario llamado "fibonacci"
RUN go build -o fibonacci solve.go
FROM alpine:3.17
WORKDIR /app
COPY --from=build /app/fibonacci .
CMD ["./fibonacci"]
