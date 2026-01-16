:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="miraheze.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:miraheze" match-subdomain=yes type=FWD name="miraheze.org" }
