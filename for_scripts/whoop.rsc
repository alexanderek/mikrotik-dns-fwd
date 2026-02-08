:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="whoop.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:whoop" match-subdomain=yes type=FWD name="whoop.com" }
