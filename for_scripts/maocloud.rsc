:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="maoyun.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:maocloud" match-subdomain=yes type=FWD name="maoyun.com" }
:if ([:len [find name="maoyuncloud.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:maocloud" match-subdomain=yes type=FWD name="maoyuncloud.com" }
