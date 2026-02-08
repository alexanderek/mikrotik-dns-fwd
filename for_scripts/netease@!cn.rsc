:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="easebar.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:netease@!cn" match-subdomain=yes type=FWD name="easebar.com" }
