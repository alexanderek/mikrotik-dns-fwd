:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="decrypt.day"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:decryptipastore" match-subdomain=yes type=FWD name="decrypt.day" }
