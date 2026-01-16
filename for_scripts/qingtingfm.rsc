:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="qingting.fm"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:qingtingfm" match-subdomain=yes type=FWD name="qingting.fm" }
