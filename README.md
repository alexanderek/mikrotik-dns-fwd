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

## Quick start

1) Pick loaders and edit variables  
Use the example loaders in `routeros/` as a starting point (copy/rename as
needed) and set:
`AddressList`, `ForwardTo`, `SyncMode` (`add` or `sync`), `baseUrl`, and the
resources list inside the loader.

2) Import the loader script(s) into RouterOS  
```routeros
/import file-name=loader_eu.rsc
```

3) Run once manually  
```routeros
/system script run dns_fwd_auto_eu
```

4) Add scheduler (weekly)  
```routeros
/system scheduler
add name=dnsfwd-eu interval=7d on-event="/system/script/run dns_fwd_auto_eu"
```

5) Verify  
```routeros
/ip dns static print where comment~"dnsfwd:auto:"
/ip dns static print count-only where comment~"dnsfwd:auto:"
```

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
  - Removes only entries whose comment starts with `dnsfwd:auto:` and only
    within the current `AddressList`.
  - Then applies the freshly downloaded list.
  - Manual rules are not touched.

## Multiple regions / forwarders

You can run multiple loaders with different parameters. This is useful when
separate domain sets should be forwarded to different resolvers.

Prebuilt example loaders (copy/rename and adjust):

- `routeros/loader_eu.rsc`
- `routeros/loader_ru.rsc`

## Loader example

```routeros
:global AddressList "dnsfwd_list_a"
:global ForwardTo "dns_example_a"
:global SyncMode "sync"

:local baseUrl "https://raw.githubusercontent.com/alexanderek/MikroTik_DNS_FWD/main/for_scripts"
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
