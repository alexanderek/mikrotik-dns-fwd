:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="garmin.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:connect.garmin" match-subdomain=yes type=FWD name="garmin.com" }
