# Define global variables
:global AddressList "example_list_a"
:global ForwardTo "example_dns_a"
:global DryRun "true"
:global VerboseLimit 0

# List of resources corresponding to RSC files
:global resources {
  "openai";
  "google-gemini";
  "claude";
  "xai";
  "notion";
  "netflix";
  "twitch";
  "intel";
  "canva";
  "spotify";
  "tidal";
  "tiktok";
  "atlassian";
  "deepl";
  "slack";
  "ubiquiti";
  "cisco";
  "xbox";
  "playstation"
}

# Base URL for RSC files
:local baseUrl "https://raw.githubusercontent.com/alexanderek/MikroTik_DNS_FWD/refs/heads/main/for_scripts"

:foreach resource in=$resources do={
  :local adopted 0
  :local wouldAdopt 0
  :local skipped 0
  :local logged 0
  :local tag ("dnsfwd:auto:" . $resource)
  :local contentAll ""

  :local url "$baseUrl/$resource.rsc"
  :do {
    :local r [/tool fetch url=$url mode=https output=user as-value]
    :if (($r->"status")="finished") do={
      :local content ($r->"data")
      :if ($contentAll = "") do={
        :set contentAll $content
      } else={
        :set contentAll ($contentAll . "\n" . $content)
      }
    }
  } on-error {}

  :local part 1
  :local continue true
  :while ($continue) do={
    :local url "$baseUrl/$resource_part$part.rsc"
    :do {
      :local r [/tool fetch url=$url mode=https output=user as-value]
      :if (($r->"status")="finished") do={
        :local content ($r->"data")
        :if ($contentAll = "") do={
          :set contentAll $content
        } else={
          :set contentAll ($contentAll . "\n" . $content)
        }
      }
      :set part ($part + 1)
    } on-error {
      :set continue false
    }
  }

  :if (([:find $contentAll "/ip dns static"] != -1) && ([:find $contentAll " add address-list="] != -1)) do={
    :local ids [/ip dns static find where address-list=$AddressList and type=FWD and forward-to=$ForwardTo]
    :foreach id in=$ids do={
      :local comment [/ip dns static get $id comment]
      :if ([:pick $comment 0 12] != "dnsfwd:auto:") do={
        :local name [/ip dns static get $id name]
        :local regexp [/ip dns static get $id regexp]
        :local found false

        :if ($name != "") do={
          :if ([:find $contentAll ("name=\"" . $name . "\"")] != -1) do={
            :set found true
          }
        } else={
          :if ($regexp != "") do={
            :if ([:find $contentAll ("regexp=\"" . $regexp . "\"")] != -1) do={
              :set found true
            }
          }
        }

        :if ($found) do={
          :local item $name
          :if ($item = "") do={ :set item $regexp }
          :if ($DryRun = "true") do={
            :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
              :log info ("WOULD ADOPT " . $item . " -> " . $tag)
              :set logged ($logged + 1)
            }
            :set wouldAdopt ($wouldAdopt + 1)
          } else={
            /ip dns static set $id comment=$tag
            :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
              :log info ("ADOPTED " . $item . " -> " . $tag)
              :set logged ($logged + 1)
            }
            :set adopted ($adopted + 1)
          }
        } else={
          :set skipped ($skipped + 1)
        }
      } else={
        :set skipped ($skipped + 1)
      }
    }
  }

  :if ($DryRun = "true") do={
    :log info ("adoption summary " . $resource . ": would_adopt=" . $wouldAdopt . " skipped=" . $skipped)
  } else={
    :log info ("adoption summary " . $resource . ": adopted=" . $adopted . " skipped=" . $skipped)
  }
}
