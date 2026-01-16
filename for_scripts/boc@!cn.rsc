:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="bochk.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:boc@!cn" match-subdomain=yes type=FWD name="bochk.com" }
