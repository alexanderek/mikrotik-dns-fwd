:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="7k.casino"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:7k" match-subdomain=yes type=FWD name="7k.casino" }
