:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="thepoizon.ru"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:dewu@!cn" match-subdomain=yes type=FWD name="thepoizon.ru" }
