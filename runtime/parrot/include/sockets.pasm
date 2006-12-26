
# families
.constant AF_UNSPEC  0 # unspecified
.constant AF_UNIX    1 # local to host (pipes)
.constant AF_INET    2 # internetwork: UDP, TCP, etc.
.constant AF_INET6  30 # IPv6


# types
.constant SOCK_STREAM    1 # stream socket
.constant SOCK_DGRAM     2 # datagram socket
.constant SOCK_RAW       3 # raw-protocol interface
.constant SCOK_SEQPACKET 5 # sequenced packet stream


# protocols (RFC 1700)
.constant IPPROTO_IP      0 # dummy for IP
.constant IPPROTO_ICMP    1 # control message protocol
.constant IPPROTO_TCP     6 # tcp
.constant IPPROTO_UDP    17 # user datagram protocol
.constant IPPROTO_IPV6   41 # IP6 header
.constant IPPROTO_RAW   255 # raw IP packet
.constant IPPROTO_MAX   256
