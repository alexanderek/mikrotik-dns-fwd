:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="divar.cloud"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:divar" match-subdomain=yes type=FWD name="divar.cloud" }
:if ([:len [find name="divar.ir"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:divar" match-subdomain=yes type=FWD name="divar.ir" }
:if ([:len [find name="divarcdn.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:divar" match-subdomain=yes type=FWD name="divarcdn.com" }
