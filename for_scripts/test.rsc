:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="test.example.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:test" type=FWD name="test.example.com" }
