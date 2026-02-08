:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="proxyline.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:proxyline" match-subdomain=yes type=FWD name="proxyline.net" }
