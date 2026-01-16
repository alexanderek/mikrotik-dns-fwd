:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="jiemian.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:jiemian" match-subdomain=yes type=FWD name="jiemian.com" }
