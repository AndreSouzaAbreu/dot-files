#############################
# CONFIGURATION             #
#############################

# load default configuration
config.load_autoconfig()

# show status bar only if not in normal mode
c.statusbar.show = 'in-mode'

# put status bar on the bottom of the screen
c.statusbar.position = 'bottom'

# shows tabs only if there are two or more
c.tabs.show = 'multiple'

# open pdf with pdfjs
c.content.pdfjs = False

# show blank page when opening new page
c.url.default_page = 'about:blank'

# add some search engines
search_engines = {
  'ak': 'https://wiki.archlinux.org/?search={}',
  'ar': 'https://archlinux.org/packages/?q={}',
  'aur': 'https://aur.archlinux.org/packages/?K={}',
  'dg': 'https://duckduckgo.com/?q={}',
  'gh': 'https://github.com/search?q={}',
  'sp': 'https://www.startpage.com/do/asearch?query={}.',
  'sx': 'https://searx.info/search?q={}&language=en-US',
  'wi': 'https://wiby.me/?q={}',
  'wk': 'https://en.wikipedia.org/w/index.php?search={}',
  'wkp': 'https://pt.wikipedia.org/w/index.php?search={}',
}

# default search engine
search_engines['DEFAULT'] = search_engines['dg']

# set custom serach engines
c.url.searchengines = search_engines

# video autoplay
c.content.autoplay = False

# geolocation
c.content.geolocation = False

# canvas
c.content.canvas_reading = False

# webgl
c.content.webgl = False

# wbrtc
c.content.webrtc_ip_handling_policy = 'default-public-interface-only'

# cookies
c.content.cookies.accept = 'no-3rdparty'

# random user agent
# c.content.headers.user_agent = random_user_agent()

# command
c.editor.command = ["termite", "--class=floatcenter", "-e", "nvim {file}"]

# file handler
c.fileselect.handler = 'external'
c.fileselect.folder.command = ['termite', '--class=Ranger', '-e', 'ranger --choosedir={}']
c.fileselect.single_file.command = ['termite', '--class=Ranger', '-e', 'ranger --choosefile={}']
c.fileselect.multiple_files.command = ['termite', '--class=Ranger', '-e', 'ranger --choosefiles={}']

#############################
# ALIASES                   #
#############################

# aliases for commands
c.aliases['echo'] = 'message-info'
c.aliases['clear'] = 'clear-messages'
c.aliases['print'] = 'message-info'
c.aliases['proxy'] = 'set content.proxy'
c.aliases['javascript'] = 'set content.javascript.enabled'
c.aliases['darkmode'] = 'set colors.webpage.darkmode.enabled'

# aliases for user scripts
c.aliases['untrack-url'] = 'spawn --userscript untrack-url'

#############################
# BINDINGS                  #
#############################

# bind commands
def bind(key, command):
    config.bind(key, command)

# bind many commands at once
def bind_many(key, commands):
    config.bind(key, ' ;; '.join(commands))

# print the command that was executed
def bind_show(key, command):
    commands = [command, f'message-info "{command}"', "later 1000 clear-messages"]
    bind_many(key, commands)

# zoom
bind('<ctrl-=>', 'zoom-in')
bind('<ctrl-->', 'zoom-out')

# open pages
bind(',.', 'open about:blank')
bind(',,', 'open -t about:blank')
bind('\\h', 'open qute://history')

# edit current url
bind('\\o', 'set-cmd-text :open {url:domain}/')
bind('\\O', 'set-cmd-text :open -t {url:domain}')

# devtools
bind('ww', 'devtools window')
bind('wh', 'devtools left')
bind('wj', 'devtools bottom')
bind('wk', 'devtools top')
bind('wl', 'devtools right')

# open videos in mpv
bind('\\M', 'spawn mpv {clipboard}')
bind('\\m', 'hint links spawn mpv {hint-url}')

# open untracked url
bind('\\u', 'hint links spawn -u untrack-url -O {hint-url}')
bind('\\U', 'spawn -u untrack-url {clipboard}')

# print current urly
bind('su', 'message-info {url}')

# other stuff
bind('\\l', 'clear-messages')

# restart the browser
bind('<alt-r>', 'restart')

# go to command mode by pressing ç
bind('ç', 'fake-key -g :')

# enable/disable tor proxy
bind_show('<alt-t>', 'proxy socks://localhost:9050/')
bind_show('<alt-shift-t>', 'proxy none')

# disable/enable javascript
bind_show('<alt-j>', 'javascript false')
bind_show('<alt-shift-j>', 'javascript true')

#############################
# PRIVATE CONFIG            #
#############################

# load private config
import config_private
config_private.load_config(c, config)
