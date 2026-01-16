:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="taboola.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:taboola" match-subdomain=yes type=FWD name="taboola.com" }
