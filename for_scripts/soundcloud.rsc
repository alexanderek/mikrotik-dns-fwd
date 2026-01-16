:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="sndcdn.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:soundcloud" match-subdomain=yes type=FWD name="sndcdn.com" }
:if ([:len [find name="soundcloud.cloud"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:soundcloud" match-subdomain=yes type=FWD name="soundcloud.cloud" }
:if ([:len [find name="soundcloud.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:soundcloud" match-subdomain=yes type=FWD name="soundcloud.com" }
