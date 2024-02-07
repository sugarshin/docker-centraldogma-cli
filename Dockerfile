FROM golang:1.22 AS builder

LABEL maintainer "Shingo Sato <shinsugar@gmail.com>"

ENV CENTRALDOGMA_GO_VERSION "0.0.1"
WORKDIR /usr/src
RUN git clone -b $CENTRALDOGMA_GO_VERSION --depth 1 https://github.com/line/centraldogma-go.git
WORKDIR /usr/src/centraldogma-go/internal/app/dogma
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o dogma .

FROM alpine:3.17 AS runner

COPY --from=builder /usr/src/centraldogma-go/internal/app/dogma/dogma /usr/local/bin
ENTRYPOINT ["dogma"]
CMD ["--help"]
