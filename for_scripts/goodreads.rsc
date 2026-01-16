:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="goodreads.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:goodreads" match-subdomain=yes type=FWD name="goodreads.com" }
:if ([:len [find name="gr-assets.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:goodreads" match-subdomain=yes type=FWD name="gr-assets.com" }
