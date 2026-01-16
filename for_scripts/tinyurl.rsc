:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="tinyurl.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:tinyurl" match-subdomain=yes type=FWD name="tinyurl.com" }
