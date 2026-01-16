:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="navalny.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:navalny" match-subdomain=yes type=FWD name="navalny.com" }
