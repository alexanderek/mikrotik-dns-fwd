:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="ccbseoul.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:ccb@!cn" match-subdomain=yes type=FWD name="ccbseoul.com" }
