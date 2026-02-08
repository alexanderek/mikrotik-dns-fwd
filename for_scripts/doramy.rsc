:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="doramy.club"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:doramy" match-subdomain=yes type=FWD name="doramy.club" }
