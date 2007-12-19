
# families
.macro_const AF_UNSPEC  0 # unspecified
.macro_const AF_UNIX    1 # local to host (pipes)
.macro_const AF_INET    2 # internetwork: UDP, TCP, etc.
.macro_const AF_INET6  30 # IPv6


# types
.macro_const SOCK_STREAM    1 # stream socket
.macro_const SOCK_DGRAM     2 # datagram socket
.macro_const SOCK_RAW       3 # raw-protocol interface
.macro_const SCOK_SEQPACKET 5 # sequenced packet stream


# protocols (RFC 1700)
.macro_const IPPROTO_IP      0 # dummy for IP
.macro_const IPPROTO_ICMP    1 # control message protocol
.macro_const IPPROTO_TCP     6 # tcp
.macro_const IPPROTO_UDP    17 # user datagram protocol
.macro_const IPPROTO_IPV6   41 # IP6 header
.macro_const IPPROTO_RAW   255 # raw IP packet
.macro_const IPPROTO_MAX   256
