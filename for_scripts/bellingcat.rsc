:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="bellingcat.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:bellingcat" match-subdomain=yes type=FWD name="bellingcat.com" }
