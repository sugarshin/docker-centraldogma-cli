FROM golang:1.16 AS builder

LABEL maintainer "Shingo Sato <shinsugar@gmail.com>"

ENV CENTRALDOGMA_GO_COMMIT_HASH "89f1649b6ed3700690a32942c6a886e6eb08b3d5"
WORKDIR /usr/src
RUN git clone https://github.com/line/centraldogma-go.git
WORKDIR /usr/src/centraldogma-go
RUN git reset --hard $CENTRALDOGMA_GO_COMMIT_HASH
WORKDIR /usr/src/centraldogma-go/internal/app/dogma
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o dogma .

FROM alpine:3.13 AS runner

COPY --from=builder /usr/src/centraldogma-go/internal/app/dogma/dogma /usr/local/bin
ENTRYPOINT ["dogma"]
CMD ["--help"]
