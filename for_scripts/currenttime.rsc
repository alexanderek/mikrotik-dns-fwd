:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="currenttime.tv"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:currenttime" match-subdomain=yes type=FWD name="currenttime.tv" }
