:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="reddxxx.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:reddxxx" match-subdomain=yes type=FWD name="reddxxx.com" }
