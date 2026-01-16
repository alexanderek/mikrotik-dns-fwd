:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="newtimes.ru"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:newtimes" match-subdomain=yes type=FWD name="newtimes.ru" }
