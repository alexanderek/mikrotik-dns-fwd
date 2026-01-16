:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="tube8.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:tube8" match-subdomain=yes type=FWD name="tube8.com" }
