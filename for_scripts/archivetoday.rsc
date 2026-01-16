:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="archive.fo"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:archivetoday" match-subdomain=yes type=FWD name="archive.fo" }
:if ([:len [find name="archive.today"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:archivetoday" match-subdomain=yes type=FWD name="archive.today" }
