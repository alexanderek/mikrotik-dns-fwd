:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="okko.sport"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:okko" match-subdomain=yes type=FWD name="okko.sport" }
:if ([:len [find name="okko.tv"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:okko" match-subdomain=yes type=FWD name="okko.tv" }
:if ([:len [find name="playfamily.ru"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:okko" match-subdomain=yes type=FWD name="playfamily.ru" }
