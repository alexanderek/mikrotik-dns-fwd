:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="huanghuagang.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:huanghuagang" match-subdomain=yes type=FWD name="huanghuagang.org" }
