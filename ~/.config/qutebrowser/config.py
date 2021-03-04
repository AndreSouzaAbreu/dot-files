# load default configuration
config.load_autoconfig()

## CONFIGURATION

c.statusbar.show = 'in-mode'
c.statusbar.position = 'bottom'
c.tabs.show = 'multiple'
c.url.default_page = 'about:blank'
c.url.searchengines = {
  'DEFAULT': 'https://duckduckgo.com/?q={}',
  'aw': 'https://wiki.archlinux.org/?search={}',
  'ddg': 'https://duckduckgo.com/?q={}',
  'sp': 'https://www.startpage.com/do/asearch?query={}.',
  'wi': 'https://en.wikipedia.org/w/index.php?search={}&title=Special:Search',
}

## BINDINGS

# tab navigation
config.bind('l', 'tab-next')
config.bind('h', 'tab-prev')

# open pages
config.bind(',,', 'open -t about:blank')
config.bind(',i', 'open https://invidious.tube')
config.bind(',y', 'open https://invidio.us')

