:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="btdig.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:btdig" match-subdomain=yes type=FWD name="btdig.com" }
