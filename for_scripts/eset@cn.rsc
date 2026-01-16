:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="cn.eset.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:eset@cn" match-subdomain=yes type=FWD name="cn.eset.com" }
