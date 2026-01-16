:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="huya.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:huya" match-subdomain=yes type=FWD name="huya.com" }
:if ([:len [find name="msstatic.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:huya" match-subdomain=yes type=FWD name="msstatic.com" }
