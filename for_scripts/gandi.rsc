:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="gandi.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:gandi" match-subdomain=yes type=FWD name="gandi.net" }
