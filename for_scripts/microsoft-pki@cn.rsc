:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="www.microsoft.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:microsoft-pki@cn" type=FWD name="www.microsoft.com" }
