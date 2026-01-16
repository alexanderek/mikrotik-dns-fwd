:global AddressList
:global ForwardTo
/ip dns static
:if ([:len [find name="kc.kexinshe.com"]] = 0) do={ add address-list=$AddressList forward-to=$ForwardTo comment="dnsfwd:auto:kechuang@cn" type=FWD name="kc.kexinshe.com" }
