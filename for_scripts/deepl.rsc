:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="deepl.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:deepl" match-subdomain=yes type=FWD name="deepl.com" }
