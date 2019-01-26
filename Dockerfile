FROM golang:latest as builder
#Get the postgress driver
RUN go get github.com/lib/pq
WORKDIR /go/src/gitlab.corp.local/knuth/lemonade
ADD . /go/src/gitlab.corp.local/knuth/lemonade
# Statically build the executable
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main main.go


FROM scratch
# copy the statically built executables and all HTML
COPY --from=builder /go/src/gitlab.corp.local/knuth/lemonade/main .
COPY /templates /templates 
COPY /sass /templates 
COPY /public /public
EXPOSE 8000
# run the binary
CMD ["./main"]