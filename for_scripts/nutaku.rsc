:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="nutaku.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:nutaku" match-subdomain=yes type=FWD name="nutaku.com" }
:if ([:len [find name="nutaku.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:nutaku" match-subdomain=yes type=FWD name="nutaku.net" }
