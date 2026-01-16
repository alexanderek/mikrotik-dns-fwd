:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="echofm.online"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:echofm" match-subdomain=yes type=FWD name="echofm.online" }
