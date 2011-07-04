-- {{{ Autorun
autorun = true
autorunApps =
{
"/home/ezh/bin/local.start"
}
if autorun then
   for app = 1, #autorunApps do
       awful.util.spawn(autorunApps[app])
       --os.execute(autorunApps[app])
   end
end
