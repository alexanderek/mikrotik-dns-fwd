:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="vim.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:vim" match-subdomain=yes type=FWD name="vim.org" }
