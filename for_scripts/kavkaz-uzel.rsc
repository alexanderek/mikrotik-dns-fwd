:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="kavkaz-uzel.eu"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:kavkaz-uzel" match-subdomain=yes type=FWD name="kavkaz-uzel.eu" }
