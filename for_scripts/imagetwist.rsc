:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="imagetwist.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:imagetwist" match-subdomain=yes type=FWD name="imagetwist.com" }
