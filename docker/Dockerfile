FROM debian:stable-slim as builder

RUN apt-get update && apt-get install -y curl
RUN curl -L -o /hosts 'https://github.com/StevenBlack/hosts/blob/master/hosts?raw=true' 

FROM coredns/coredns:latest
COPY --from=builder /hosts /hosts

EXPOSE 53 53/udp
ENTRYPOINT ["/coredns"]