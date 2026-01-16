:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="rainclassroom.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:yuketang" match-subdomain=yes type=FWD name="rainclassroom.com" }
