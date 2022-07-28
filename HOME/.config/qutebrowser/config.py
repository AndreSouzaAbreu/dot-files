from os import environ as env
from user_agent import generate_user_agent as random_user_agent

################################################################################
# GLOBALS
HOME = env['HOME']

################################################################################
# HELPERS

def get_path(str):
  return str.replace('~', HOME)

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

################################################################################
#          ╭──────────────────────────────────────────────────────────╮        #
#          │                      CONFIGURATION                       │        #
#          ╰──────────────────────────────────────────────────────────╯        #
################################################################################

# load default configuration
config.load_autoconfig()

# how to show statusbar
c.statusbar.show = 'always'

# put status bar on the bottom of the screen
c.statusbar.position = 'bottom'

# shows tabs only if there are two or more
c.tabs.show = 'multiple'

# open pdf with pdfjs
c.content.pdfjs = False

# show blank page when opening new page
initial_page = get_path('~/pictures/wallpapers/qutebrowser.jpg')

c.url.default_page = initial_page
c.url.start_pages = [initial_page]

# add some search engines
search_engines = {
  'amz':  'https://www.amazon.com.br/s?k={}',
  'aw':   'https://wiki.archlinux.org/?search={}',
  'ar':   'https://archlinux.org/packages/?q={}',
  'aur':  'https://aur.archlinux.org/packages/?K={}',
  'cd':   'https://tube.cadence.moe/search?q={}',
  'ddg':  'https://duckduckgo.com/?q={}',
  'ddgl': 'https://duckduckgo.com/html/?q={}',
  'doc':  'https://devdocs.io/#q={}',
  'gh':   'https://github.com/search?q={}',
  'gd':   'https://drive.google.com/drive/search?q={}',
  'go':   'https://www.google.com/search?q={}',
  'qw':   'https://qwant.com/?q={}',
  'qwl':  'https://lite.qwant.com/?q={}',
  'mo':   'https://www.mojeek.com/search?q={}',
  'ml':   'https://lista.mercadolivre.com.br/{}',
  'sp':   'https://startpage.com/do/asearch?query={}',
  'sx':   'https://searx.be/search?q={}',
  'sw':   'https://swisscows.com/web?query={}',
  'ya':   'https://yandex.com/search/?text={}',
  'yt':   'https://yewtu.be/search?q={}',
  'wi':   'https://wiby.me/?q={}',
  'wk':   'https://wikiless.org/w/index.php?lang=en&search={}',
  'wkp':  'https://wikiless.org/w/index.php?lang=pt&search={}',
  'img':     'https://yandex.com/images/search?text={}',
  'img-ddg': 'https://duckduckgo.com/?ia=images&q={}',
  'img-qw':  'https://qwant.com/?t=images&q={}',
}

# default search engine
search_engines['DEFAULT'] = search_engines['sx']

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
c.editor.command = [
    'alacritty', '--class', 'termfloatcenter', '-e', 'nvim', '{file}', '-c', 'normal {line}G{column}l'
]

# file picker
c.fileselect.handler = 'external'
c.fileselect.folder.command = ['fp', '--choosedir', '{}']
c.fileselect.single_file.command = ['fp', '--choosefile', '{}']
c.fileselect.multiple_files.command = ['fp', '--choosefiles', '{}']

#############################
# ALIASES                   #
#############################

# aliases for commands
c.aliases['echo'] = 'message-info'
c.aliases['clear'] = 'clear-messages'
c.aliases['print'] = 'message-info'
c.aliases['proxy'] = 'set content.proxy'
c.aliases['dark'] = 'set colors.webpage.darkmode.enabled'
c.aliases['javascript'] = 'set content.javascript.enabled'

# aliases for user scripts
c.aliases['untrack-url'] = 'spawn --userscript untrack-url'

################################################################################
# BINDINGS                                                                     #
################################################################################

# zoom
bind('<ctrl-=>', 'zoom-in')
bind('<ctrl-->', 'zoom-out')

# open pages
bind(',.', 'open ' + initial_page)
bind(',,', 'open -t ' + initial_page)
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
try:
  import config_private
  config_private.load_config(c, config)
except:
  print("Private config not found")
