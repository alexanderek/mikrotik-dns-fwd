:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="citizenlab.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:citizenlab" match-subdomain=yes type=FWD name="citizenlab.org" }
