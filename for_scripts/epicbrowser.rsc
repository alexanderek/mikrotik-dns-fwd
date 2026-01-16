:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="epicbrowser.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:epicbrowser" match-subdomain=yes type=FWD name="epicbrowser.com" }
