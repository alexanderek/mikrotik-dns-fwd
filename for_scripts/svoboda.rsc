:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="svoboda.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:svoboda" match-subdomain=yes type=FWD name="svoboda.org" }
