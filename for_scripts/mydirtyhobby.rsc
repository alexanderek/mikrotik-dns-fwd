:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="mdhcdn.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:mydirtyhobby" match-subdomain=yes type=FWD name="mdhcdn.com" }
:if ([:len [find name="mydirtyhobby.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:mydirtyhobby" match-subdomain=yes type=FWD name="mydirtyhobby.com" }
