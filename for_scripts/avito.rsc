:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="avito.ru"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:avito" match-subdomain=yes type=FWD name="avito.ru" }
