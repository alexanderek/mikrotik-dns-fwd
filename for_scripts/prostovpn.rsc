:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="prostovpn.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:prostovpn" match-subdomain=yes type=FWD name="prostovpn.org" }
