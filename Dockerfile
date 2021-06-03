FROM golang:1.16.4 AS builder

LABEL maintainer "Shingo Sato <shinsugar@gmail.com>"
ENV REVISION "adb65daca23be3b1d706f5743cf78908d15d4fe0"

WORKDIR /usr/src
RUN git clone --depth 1 https://github.com/line/centraldogma-go.git
WORKDIR /usr/src/centraldogma-go
RUN git reset --hard $REVISION
WORKDIR /usr/src/centraldogma-go/internal/app/dogma
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o dogma .

FROM alpine:3.13.5 AS runner

COPY --from=builder /usr/src/centraldogma-go/internal/app/dogma/dogma /usr/local/bin
ENTRYPOINT ["dogma"]
