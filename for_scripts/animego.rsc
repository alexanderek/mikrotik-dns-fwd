:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="animego.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:animego" match-subdomain=yes type=FWD name="animego.org" }
