# load default configuration
config.load_autoconfig()

### CONFIGURATION

# show status bar only if not in normal mode
c.statusbar.show = 'in-mode'

# put status bar on the bottom of the screen
c.statusbar.position = 'bottom'

# shows tabs only if there are two or more
c.tabs.show = 'multiple'

# open pdf with pdfjs
c.content.pdfjs = True

# show blank page when opening new page
c.url.default_page = 'about:blank'

# add some search engines
c.url.searchengines = {
  'DEFAULT': 'https://duckduckgo.com/?q={}',
  'aw': 'https://wiki.archlinux.org/?search={}',
  'ddg': 'https://duckduckgo.com/?q={}',
  'sp': 'https://www.startpage.com/do/asearch?query={}.',
  'wi': 'https://en.wikipedia.org/w/index.php?search={}&title=Special:Search',
  'gh': 'https://github.com/search?q={}'
}

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

c.editor.command = ['vim', '{}']

### BINDINGS

# tab navigation
config.bind('l', 'tab-next')
config.bind('h', 'tab-prev')

# zoom
config.bind('<ctrl-=>', 'zoom-in')
config.bind('<ctrl-->', 'zoom-out')

# js

# open pages
config.bind(',,', 'open -t about:blank')
config.bind(',gm', 'open https://gmail.com')
config.bind(',gh', 'open https://github.com')
config.bind(',gl', 'open https://gitlab.com')
config.bind(',do', 'open https://cloud.digitalocean.com')
config.bind(',t', 'open https://web.telegram.org')
config.bind(',w', 'open https://web.whatsapp.com')
config.bind(',y', 'open https://yewtu.be')
config.bind(',i', 'open https://api.invidious.io')

# open videos in mpv
config.bind(',m', 'spawn mpv {clipboard}')
config.bind(',M', 'hint links spawn mpv {hint-url}')

# load private config
import config_private
config_private.load_config(c, config)

