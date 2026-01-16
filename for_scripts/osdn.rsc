:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="osdn.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:osdn" match-subdomain=yes type=FWD name="osdn.net" }
