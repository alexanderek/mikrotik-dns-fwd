:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="fonts.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:fonts" match-subdomain=yes type=FWD name="fonts.com" }
:if ([:len [find name="fonts.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:fonts" match-subdomain=yes type=FWD name="fonts.net" }
