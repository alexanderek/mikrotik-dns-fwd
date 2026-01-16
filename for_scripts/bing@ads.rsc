:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="bingads.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:bing@ads" match-subdomain=yes type=FWD name="bingads.com" }
