:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="vgtime.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:vgtime" match-subdomain=yes type=FWD name="vgtime.com" }
