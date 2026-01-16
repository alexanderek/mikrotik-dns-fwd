:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="filmitorrent.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:filmitorrent" match-subdomain=yes type=FWD name="filmitorrent.net" }
