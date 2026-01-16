:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="guokr.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:guokr" match-subdomain=yes type=FWD name="guokr.com" }
:if ([:len [find name="guokr.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:guokr" match-subdomain=yes type=FWD name="guokr.net" }
