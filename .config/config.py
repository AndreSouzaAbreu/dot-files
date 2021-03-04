import os
ENV = os.environ
HOME = ENV['HOME']

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

# whether to enable canvas
c.content.canvas_reading = False

# whether to enable webgl
c.content.webgl = False

# which cookies to accept
c.content.cookies.accept = 'no-3rdparty'

### BINDINGS

# tab navigation
config.bind('l', 'tab-next')
config.bind('h', 'tab-prev')

# open pages
config.bind(',,', 'open -t about:blank')
config.bind(',gm', 'open https://gmail.com')
config.bind(',gh', 'open https://github.com')
config.bind(',gl', 'open https://gitlab.com')
config.bind(',t', 'open https://web.telegram.org')
config.bind(',w', 'open https://web.whatsapp.com')
config.bind(',i', 'open https://api.invidious.tube')
config.bind(',y', 'open https://yewtu.be')
config.bind(',h', f'open {HOME}')

# open videos in mpv
config.bind(',m', 'spawn mpv {url}')
config.bind(',M', 'hint links spawn mpv {hint-url}')
