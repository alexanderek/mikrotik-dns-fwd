:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="lihkg.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:lihkg" match-subdomain=yes type=FWD name="lihkg.com" }
