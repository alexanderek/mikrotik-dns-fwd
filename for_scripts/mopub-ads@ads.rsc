:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="mopub.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:mopub-ads@ads" match-subdomain=yes type=FWD name="mopub.com" }
