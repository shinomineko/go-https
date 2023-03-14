FROM golang:1.19 as builder
WORKDIR /src
COPY . .
RUN go mod tidy \
	&& go build .

FROM ubuntu:jammy
COPY --from=builder /src/go-https /go-https
EXPOSE 8443
ENTRYPOINT [ "/go-https" ]
