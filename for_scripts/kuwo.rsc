:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="koowo.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:kuwo" match-subdomain=yes type=FWD name="koowo.com" }
