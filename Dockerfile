FROM cgr.dev/chainguard/go:latest as builder
WORKDIR /work
COPY . .
RUN go mod tidy \
	&& go build .

FROM cgr.dev/chainguard/glibc-dynamic:latest
COPY --from=builder /work/go-https /go-https
EXPOSE 8443
CMD [ "/go-https" ]
