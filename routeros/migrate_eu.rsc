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
  :local debugLogged false
  :local tag ("dnsfwd:auto:" . $resource)

  :local url "$baseUrl/$resource.rsc"
  :do {
    :local r [/tool fetch url=$url mode=https output=user as-value]
    :if (($r->"status")="finished") do={
      :local content ($r->"data")
      :if (([:find $content "/ip dns static"] != -1) && ([:find $content " add address-list="] != -1)) do={
        :local seenNames "|"
        :local seenRegex "|"

        :local pos 0
        :while (true) do={
          :local idx [:find $content "name=\"" $pos]
          :if ($idx = -1) do={ :break }
          :local start ($idx + 6)
          :local end [:find $content "\"" $start]
          :if ($end = -1) do={ :break }
          :local name [:pick $content $start $end]

          :if (($VerboseLimit > 0) && (!$debugLogged)) do={
            :log info ("DEBUG extracted name=" . $name)
            :set debugLogged true
          }

          :if ([:find $seenNames ("|" . $name . "|")] = -1) do={
            :set seenNames ($seenNames . $name . "|")
            :local ids [/ip dns static find where name=$name and address-list=$AddressList and type=FWD and forward-to=$ForwardTo]
            :if ([:len $ids] > 0) do={
              :foreach id in=$ids do={
                :local comment [/ip dns static get $id comment]
                :if ([:pick $comment 0 12] != "dnsfwd:auto:") do={
                  :if ($DryRun = "true") do={
                    :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                      :log info ("WOULD ADOPT " . $name . " -> " . $tag)
                      :set logged ($logged + 1)
                    }
                    :set wouldAdopt ($wouldAdopt + 1)
                  } else={
                    /ip dns static set $id comment=$tag
                    :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                      :log info ("ADOPTED " . $name . " -> " . $tag)
                      :set logged ($logged + 1)
                    }
                    :set adopted ($adopted + 1)
                  }
                } else={
                  :set skipped ($skipped + 1)
                }
              }
            } else={
              :set skipped ($skipped + 1)
            }
          }

          :set pos ($end + 1)
        }

        :set pos 0
        :while (true) do={
          :local idx [:find $content "regexp=\"" $pos]
          :if ($idx = -1) do={ :break }
          :local start ($idx + 8)
          :local end [:find $content "\"" $start]
          :if ($end = -1) do={ :break }
          :local regexp [:pick $content $start $end]

          :if (($VerboseLimit > 0) && (!$debugLogged)) do={
            :log info ("DEBUG extracted regexp=" . $regexp)
            :set debugLogged true
          }

          :if ([:find $seenRegex ("|" . $regexp . "|")] = -1) do={
            :set seenRegex ($seenRegex . $regexp . "|")
            :local ids [/ip dns static find where regexp=$regexp and address-list=$AddressList and type=FWD and forward-to=$ForwardTo]
            :if ([:len $ids] > 0) do={
              :foreach id in=$ids do={
                :local comment [/ip dns static get $id comment]
                :if ([:pick $comment 0 12] != "dnsfwd:auto:") do={
                  :if ($DryRun = "true") do={
                    :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                      :log info ("WOULD ADOPT " . $regexp . " -> " . $tag)
                      :set logged ($logged + 1)
                    }
                    :set wouldAdopt ($wouldAdopt + 1)
                  } else={
                    /ip dns static set $id comment=$tag
                    :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                      :log info ("ADOPTED " . $regexp . " -> " . $tag)
                      :set logged ($logged + 1)
                    }
                    :set adopted ($adopted + 1)
                  }
                } else={
                  :set skipped ($skipped + 1)
                }
              }
            } else={
              :set skipped ($skipped + 1)
            }
          }

          :set pos ($end + 1)
        }
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
        :if (([:find $content "/ip dns static"] != -1) && ([:find $content " add address-list="] != -1)) do={
          :local seenNames "|"
          :local seenRegex "|"

          :local pos 0
          :while (true) do={
            :local idx [:find $content "name=\"" $pos]
            :if ($idx = -1) do={ :break }
            :local start ($idx + 6)
            :local end [:find $content "\"" $start]
            :if ($end = -1) do={ :break }
            :local name [:pick $content $start $end]

            :if (($VerboseLimit > 0) && (!$debugLogged)) do={
              :log info ("DEBUG extracted name=" . $name)
              :set debugLogged true
            }

            :if ([:find $seenNames ("|" . $name . "|")] = -1) do={
              :set seenNames ($seenNames . $name . "|")
              :local ids [/ip dns static find where name=$name and address-list=$AddressList and type=FWD and forward-to=$ForwardTo]
              :if ([:len $ids] > 0) do={
                :foreach id in=$ids do={
                  :local comment [/ip dns static get $id comment]
                  :if ([:pick $comment 0 12] != "dnsfwd:auto:") do={
                    :if ($DryRun = "true") do={
                      :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                        :log info ("WOULD ADOPT " . $name . " -> " . $tag)
                        :set logged ($logged + 1)
                      }
                      :set wouldAdopt ($wouldAdopt + 1)
                    } else={
                      /ip dns static set $id comment=$tag
                      :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                        :log info ("ADOPTED " . $name . " -> " . $tag)
                        :set logged ($logged + 1)
                      }
                      :set adopted ($adopted + 1)
                    }
                  } else={
                    :set skipped ($skipped + 1)
                  }
                }
              } else={
                :set skipped ($skipped + 1)
              }
            }

            :set pos ($end + 1)
          }

          :set pos 0
          :while (true) do={
            :local idx [:find $content "regexp=\"" $pos]
            :if ($idx = -1) do={ :break }
            :local start ($idx + 8)
            :local end [:find $content "\"" $start]
            :if ($end = -1) do={ :break }
            :local regexp [:pick $content $start $end]

            :if (($VerboseLimit > 0) && (!$debugLogged)) do={
              :log info ("DEBUG extracted regexp=" . $regexp)
              :set debugLogged true
            }

            :if ([:find $seenRegex ("|" . $regexp . "|")] = -1) do={
              :set seenRegex ($seenRegex . $regexp . "|")
              :local ids [/ip dns static find where regexp=$regexp and address-list=$AddressList and type=FWD and forward-to=$ForwardTo]
              :if ([:len $ids] > 0) do={
                :foreach id in=$ids do={
                  :local comment [/ip dns static get $id comment]
                  :if ([:pick $comment 0 12] != "dnsfwd:auto:") do={
                    :if ($DryRun = "true") do={
                      :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                        :log info ("WOULD ADOPT " . $regexp . " -> " . $tag)
                        :set logged ($logged + 1)
                      }
                      :set wouldAdopt ($wouldAdopt + 1)
                    } else={
                      /ip dns static set $id comment=$tag
                      :if (($VerboseLimit > 0) && ($logged < $VerboseLimit)) do={
                        :log info ("ADOPTED " . $regexp . " -> " . $tag)
                        :set logged ($logged + 1)
                      }
                      :set adopted ($adopted + 1)
                    }
                  } else={
                    :set skipped ($skipped + 1)
                  }
                }
              } else={
                :set skipped ($skipped + 1)
              }
            }

            :set pos ($end + 1)
          }
        }
      }
      :set part ($part + 1)
    } on-error {
      :set continue false
    }
  }

  :if ($DryRun = "true") do={
    :log info ("adoption summary " . $resource . ": would_adopt=" . $wouldAdopt . " skipped=" . $skipped)
  } else={
    :log info ("adoption summary " . $resource . ": adopted=" . $adopted . " skipped=" . $skipped)
  }
}
