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

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    awful.key({ modkey            }, "`",      function() shifty.add({ rel_index = 1, name = "* temp *" }) end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

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
    ["web"]      = { exclusive = true, position = 2, layout = awful.layout.suit.max, spawn = "luakit"                },
    ["mail"]     = { exclusive = true, position = 2, layout = awful.layout.suit.max, spawn = "luakit"                },
    ["com"]      = { exclusive = true, position = 3, layout = awful.layout.suit.spiral, spawn = terminal .. " -e mutt" },
    ["emacs"]    = { exclusive = true, position = 4, layout = awful.layout.suit.spiral                               },
    ["office"]   = { position = 5, layout = awful.layout.suit.max                          },
    ["pdf"]      = { exclusive = true, position = 6, layout = awful.layout.suit.tile.bottom                          },
    ["gimp"]     = { exclusive = true, position = 7, layout = awful.layout.suit.floating, spawn = "gimp"             },
    ["video"]    = { exclusive = true, position = 8, layout = awful.layout.suit.floating                             },
    ["music"]    = { exclusive = true, position = 9, layout = awful.layout.suit.tile.bottom                          },
    ["torrent"]  = { exclusive = true, layout = awful.layout.suit.max                                                },
    ["picture"]  = { exclusive = true, layout = awful.layout.suit.max                                                },
    ["dial"]     = { exclusive = true, layout = awful.layout.suit.max                                                },
    ["vbox"]     = { exclusive = true, layout = awful.layout.suit.max                                                },
    ["chainsaw"] = { exclusive = true, layout = awful.layout.suit.spiral                                             },
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
    --emacs
    { match = { "emacs"                              }, tag = "emacs",                                             },
    --office
    { match = { "VCLSalFrame", "abiword", "Gnumeric" }, tag = "office",                                            },
    { match = { "geany"                              }, tag = "office",                                            },
    { match = { "Zathura", "evince", "Acroread"      }, tag = "pdf",                                               },
    -- gimp
    { match = { "Gimp"                               }, tag = "gimp",                                              },
    { match = { "gimp%-image%-window"                }, geometry = {175,15,930,770}, border_width = 0              },
    { match = { "^gimp%-toolbox$"                    }, geometry = {0,15,175,770}, slave = true, border_width = 0  },
    { match = { "^gimp%-dock$"                       }, geometry = {1105,15,175,770}, slave = true, border_width = 0 },
    --video
    { match = { "MPlayer", "Vlc", "Audacity"         }, tag = "video",                                             },
    { match = { "MPlayer"                            }, geometry = {0,15,nil,nil}, float = true                    },
    -- music
    { match = { "ncmpcpp"                            }, tag = "music",                                             },
    -- miscellaneous
    { match = { "rtorrent"                           }, tag = "torrent",                                           },
    { match = { "Geeqie", "sxiv", "feh", "qiv"       }, tag = "picture",                                           },
    { match = { "wicd%-curses", "wvdial"             }, tag = "dial",                                              },
    { match = { "VirtualBox"                         }, tag = "vbox",                                              },
    { match = { "org-apache-log4j-chainsaw-LogUI"    }, tag = "chainsaw"                                           },
    { match = { "Guake.py"                           }, transient_for = true, float = true, intrusive = true       },
    { match = { ""                                   }, maximized_horizontal = false, maximized_vertical = false, buttons = clientbuttons  },
}

-- shifty: defaults
shifty.config.defaults = {layout = awful.layout.suit.max}
shifty.config.layouts = layouts
-- Set keys
root.keys(globalkeys)
shifty.config.globalkeys = globalkeys
shifty.config.clientkeys = clientkeys

shifty.init()
