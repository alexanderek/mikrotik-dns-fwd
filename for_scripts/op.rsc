:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="op.gg"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:op" match-subdomain=yes type=FWD name="op.gg" }
:if ([:len [find name="opgg-static.akamaized.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:op" type=FWD name="opgg-static.akamaized.net" }
