:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="younettranslate.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:younettranslate" match-subdomain=yes type=FWD name="younettranslate.com" }
