:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="anandtech.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:anandtech" match-subdomain=yes type=FWD name="anandtech.com" }
