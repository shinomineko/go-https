FROM cgr.dev/chainguard/go:latest as builder
WORKDIR /work
COPY . .
RUN go mod tidy \
	&& CGO_ENABLED=0 go build .

FROM cgr.dev/chainguard/static:latest
COPY --from=builder /work/go-https /go-https
EXPOSE 8443
CMD [ "/go-https" ]
