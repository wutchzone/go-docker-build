FROM golang:alpine

# Install package manager
RUN apk update
RUN apk add curl git
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Copy Go files
WORKDIR /go
COPY ./script .

# Run script
CMD ["sh", "./script.sh"]
