:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="make.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:make" match-subdomain=yes type=FWD name="make.com" }
