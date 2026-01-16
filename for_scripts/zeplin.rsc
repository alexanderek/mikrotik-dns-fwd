:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="zeplin.dev"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:zeplin" match-subdomain=yes type=FWD name="zeplin.dev" }
:if ([:len [find name="zeplin.io"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:zeplin" match-subdomain=yes type=FWD name="zeplin.io" }
