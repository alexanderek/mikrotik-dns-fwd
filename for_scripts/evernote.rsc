:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="evernote.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:evernote" match-subdomain=yes type=FWD name="evernote.com" }
