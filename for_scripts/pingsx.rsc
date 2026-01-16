:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="public-us-pingsx.api.clonoth.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:pingsx" type=FWD name="public-us-pingsx.api.clonoth.com" }
