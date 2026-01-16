:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="deribit.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:deribit" match-subdomain=yes type=FWD name="deribit.com" }
:if ([:len [find name="deribit.cdn.prismic.io"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:deribit" type=FWD name="deribit.cdn.prismic.io" }
