FROM golang:1.17.8 AS builder

WORKDIR /usr/src/app

COPY ./fullcycle.go ./

RUN go build fullcycle.go

FROM scratch

COPY --from=builder /usr/src/app/fullcycle /

ENTRYPOINT [ "./fullcycle" ]