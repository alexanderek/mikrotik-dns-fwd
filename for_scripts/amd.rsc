:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="amd.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:amd" match-subdomain=yes type=FWD name="amd.com" }
:if ([:len [find name="amdfanstore.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:amd" match-subdomain=yes type=FWD name="amdfanstore.com" }
:if ([:len [find name="radeon.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:amd" match-subdomain=yes type=FWD name="radeon.com" }
:if ([:len [find name="www.amd.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:amd" type=FWD name="www.amd.com" }
