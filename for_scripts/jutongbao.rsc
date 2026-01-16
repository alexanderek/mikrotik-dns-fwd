:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="jutongbao.online"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:jutongbao" match-subdomain=yes type=FWD name="jutongbao.online" }
:if ([:len [find name="jutongbao.top"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:jutongbao" match-subdomain=yes type=FWD name="jutongbao.top" }
