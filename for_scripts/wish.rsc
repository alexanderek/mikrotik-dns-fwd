:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="wish.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:wish" match-subdomain=yes type=FWD name="wish.com" }
