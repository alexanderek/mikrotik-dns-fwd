:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="heydoga.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:heyzo" match-subdomain=yes type=FWD name="heydoga.com" }
:if ([:len [find name="heyzo.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:heyzo" match-subdomain=yes type=FWD name="heyzo.com" }
