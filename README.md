# MikroTik DNS FWD

This repo generates RouterOS `.rsc` files that manage `/ip dns static` rules of
`type=FWD`. It is meant for domain-based DNS forwarding (for example, steering
certain domains to a specific resolver).

## What gets generated

- Domain lists are built from:
  - `https://iplist.opencck.org`
  - `https://github.com/MetaCubeX/meta-rules-dat` (geosite)
- GitHub Actions produces RouterOS scripts in `for_scripts/*.rsc`.
- RouterOS downloads and applies those files; RouterOS is not the source of
  truth.

## Managed rule namespace

Automatically managed rules use a comment prefix:

```routeros
# comment format
# dnsfwd:auto:<resource>
```

Examples:

```routeros
comment="dnsfwd:auto:openai"
comment="dnsfwd:auto:tiktok"
```

Anything without the `dnsfwd:auto:` prefix is treated as manual and is not
modified or removed by the loader.

## SyncMode behavior

The loader supports two modes:

- `SyncMode="add"` (default)
  - Adds missing entries only.
  - Never deletes anything.
- `SyncMode="sync"`
  - Removes only entries that match `dnsfwd:auto:*` within the current
    `AddressList`.
  - Then applies the freshly downloaded list.
  - Manual rules are preserved.

## Multiple regions / forwarders

You can run multiple loaders with different parameters. This is useful when
separate domain sets should be forwarded to different resolvers.

## Loader example

```routeros
:global AddressList "dnsfwd_list_a"
:global ForwardTo "dns_example_a"
:global SyncMode "sync"

:local baseUrl "https://raw.githubusercontent.com/alexanderek/MikroTik_DNS_FWD/refs/heads/main/for_scripts"
```

## Scheduler example

```routeros
/system scheduler
add name=dnsfwd-a interval=7d on-event="/system/script/run loader_a"
```

## Index files

`for_scripts/` is large and GitHub may truncate directory listings. Use the
index files for a complete list:

- `for_scripts/index.md`
- `for_scripts/index.json`

## Notes

- Some `fetch` 404 logs are expected due to `partN` probing. This is normal and
  can be ignored.
