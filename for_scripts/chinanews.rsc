:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="chinanews.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:chinanews" match-subdomain=yes type=FWD name="chinanews.com" }
