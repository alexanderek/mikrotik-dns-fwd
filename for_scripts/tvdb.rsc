:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="thetvdb.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:tvdb" match-subdomain=yes type=FWD name="thetvdb.com" }
