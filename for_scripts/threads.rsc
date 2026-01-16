:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="threads.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:threads" match-subdomain=yes type=FWD name="threads.com" }
:if ([:len [find name="threads.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:threads" match-subdomain=yes type=FWD name="threads.net" }
