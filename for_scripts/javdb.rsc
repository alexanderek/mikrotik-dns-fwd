:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="jav.app"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:javdb" match-subdomain=yes type=FWD name="jav.app" }
:if ([:len [find name="javdb.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:javdb" match-subdomain=yes type=FWD name="javdb.com" }
:if ([:len [find name="jdbimgs.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:javdb" match-subdomain=yes type=FWD name="jdbimgs.com" }
:if ([:len [find name="jdbstatic.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:javdb" match-subdomain=yes type=FWD name="jdbstatic.com" }
:if ([:len [find regexp="javdb\\\\d+\\\\.com\$"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:javdb" type=FWD regexp="javdb\\\\d+\\\\.com\$" }
