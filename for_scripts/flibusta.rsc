:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="flisland.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:flibusta" match-subdomain=yes type=FWD name="flisland.net" }
