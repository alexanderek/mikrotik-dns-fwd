:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="cloudinary.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:cloudinary" match-subdomain=yes type=FWD name="cloudinary.com" }
:if ([:len [find name="cloudinary.net"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:cloudinary" match-subdomain=yes type=FWD name="cloudinary.net" }
