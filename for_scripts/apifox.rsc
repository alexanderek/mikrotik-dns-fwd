:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="apifox.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:apifox" match-subdomain=yes type=FWD name="apifox.com" }
