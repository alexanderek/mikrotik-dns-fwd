:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="tdsdk.cpatrk.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:tendcloud@ads" match-subdomain=yes type=FWD name="tdsdk.cpatrk.net" }
