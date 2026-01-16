:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="zotero.org"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:zotero" match-subdomain=yes type=FWD name="zotero.org" }
