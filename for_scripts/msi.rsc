:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="msi.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:msi" match-subdomain=yes type=FWD name="msi.com" }
