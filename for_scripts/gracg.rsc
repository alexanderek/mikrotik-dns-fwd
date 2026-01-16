:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="gracg.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:gracg" match-subdomain=yes type=FWD name="gracg.com" }
