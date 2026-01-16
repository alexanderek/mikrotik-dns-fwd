:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="quantil.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:quantil" match-subdomain=yes type=FWD name="quantil.com" }
