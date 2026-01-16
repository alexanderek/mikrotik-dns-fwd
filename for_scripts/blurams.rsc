:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="blurams.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:blurams" match-subdomain=yes type=FWD name="blurams.com" }
