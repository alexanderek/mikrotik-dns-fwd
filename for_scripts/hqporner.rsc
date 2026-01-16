:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="hqporner.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:hqporner" match-subdomain=yes type=FWD name="hqporner.com" }
