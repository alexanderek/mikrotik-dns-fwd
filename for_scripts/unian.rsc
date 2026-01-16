:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="unian.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:unian" match-subdomain=yes type=FWD name="unian.net" }
