:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="ej.ru"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:ej" match-subdomain=yes type=FWD name="ej.ru" }
