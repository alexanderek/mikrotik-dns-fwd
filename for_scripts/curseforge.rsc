:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="curseforge.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:curseforge" match-subdomain=yes type=FWD name="curseforge.com" }
:if ([:len [find name="forgecdn.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:curseforge" match-subdomain=yes type=FWD name="forgecdn.net" }
