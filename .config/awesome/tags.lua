-- TAGS + TAG MATCHING

-- Table of layouts to cover with awful.layout.inc, order matters.
-- }}}

-- layouts
layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier
    awful.layout.suit.floating,
}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
--tags = {}
--for s = 1, screen.count() do
--    -- Each screen has its own tag table.
--    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
--end
-- }}}

-- shifty: predefined tags
shifty.config.tags = {
    ["* junk *"] = { init = true, position = 1, layout = awful.layout.suit.tile                    },
    ["web"]      = { position = 2, layout = awful.layout.suit.max, spawn = "luakit"                },
    ["mail"]     = { position = 2, layout = awful.layout.suit.max, spawn = "luakit"               },
    ["com"]      = { position = 3, layout = awful.layout.suit.max,  spawn = terminal .. " -e mutt" },
    ["office"]   = { position = 4, layout = awful.layout.suit.tile.bottom                          },
    ["pdf"]      = { position = 5, layout = awful.layout.suit.tile.bottom                          },
    ["gimp"]     = { position = 6, layout = awful.layout.suit.floating, spawn = "gimp"             },
    ["video"]    = { position = 7, layout = awful.layout.suit.floating                             },
    ["music"]    = { position = 8, layout = awful.layout.suit.tile.bottom                          },
    ["torrent"]  = { layout = awful.layout.suit.max                                                },
    ["picture"]  = { layout = awful.layout.suit.max                                                },
    ["dial"]     = { layout = awful.layout.suit.max                                                },
    ["vbox"]     = { layout = awful.layout.suit.max                                                },
}

-- shifty: tags matching and client rules
shifty.config.apps = {
    -- web
    { match = { "Firefox", "luakit"                  }, tag = "web",                                               },
    -- mail
    { match = { "Evolution"                          }, tag = "mail",                                              },
    -- communications
    { match = { "mutt", "Lanikai"                    }, tag = "com",                                               },
    { match = { "canto"                              }, tag = "com",                                               },
    { match = { "irssi"                              }, tag = "com",                                               },
    { match = { "Pidgin"                             }, tag = "com",                                               },
    { match = { "Skype"                              }, tag = "com",                                               },
    { match = { "xchat"                              }, tag = "com",                                               },
    --office
    { match = { "VCLSalFrame", "abiword", "Gnumeric" }, tag = "office",                                            },
    { match = { "geany"                              }, tag = "office",                                            },
    { match = { "Zathura", "evince", "Acroread"      }, tag = "pdf",                                               },
    -- gimp
    { match = { "Gimp"                               }, tag = "gimp",                                              },
    { match = { "gimp%-image%-window"                }, geometry = {175,15,930,770}, border_width = 0                },
    { match = { "^gimp%-toolbox$"                    }, geometry = {0,15,175,770}, slave = true, border_width = 0    },
    { match = { "^gimp%-dock$"                       }, geometry = {1105,15,175,770}, slave = true, border_width = 0 },
    --video
    { match = { "MPlayer", "Vlc", "Audacity"         }, tag = "video",                                             },
    { match = { "MPlayer"                            }, geometry = {0,15,nil,nil}, float = true                      },
    -- music
    { match = { "ncmpcpp"                            }, tag = "music",                                             },
    -- miscellaneous
    { match = { "rtorrent"                           }, tag = "torrent",                                             },
    { match = { "Geeqie", "sxiv", "feh", "qiv"       }, tag = "picture",                                             },
    { match = { "wicd%-curses", "wvdial"             }, tag = "dial",                                                },
    { match = { "VirtualBox"                         }, tag = "vbox",                                                },
}

-- shifty: defaults
shifty.config.defaults = {layout = awful.layout.suit.max}
shifty.config.layouts = layouts
-- Set keys
root.keys(globalkeys)
shifty.config.globalkeys = globalkeys
shifty.config.clientkeys = clientkeys

shifty.init()
