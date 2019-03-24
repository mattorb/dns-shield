#!/usr/local/bin/fish

if test (count $argv) = 0
    echo "run.sh <dns1> <dns2>"
    echo Pass in the dns servers to proxy unblocked requests to
    exit 1
end

curl -L -o ./hosts 'https://github.com/StevenBlack/hosts/blob/master/hosts?raw=true' 

docker run -e "DNS_SERVER1=$argv[1]" \
           -e "DNS_SERVER2=$argv[2]" \
           --privileged \
           --publish 53:53/tcp \
           --publish 53:53/udp \
           --publish 9153:9153/tcp \
           --volume (realpath ./Corefile):/Corefile \
           --volume (realpath ./hosts):/hosts \
           cds:latest
