:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="adblockplus.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:adblockplus" match-subdomain=yes type=FWD name="adblockplus.org" }
