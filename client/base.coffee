@INITIAL_SEARCH_LIMIT = INITIAL_SEARCH_LIMIT = 5

Meteor.Router.add
  '/':
    as: 'index'
    to: ->
      Session.set 'indexActive', true
      'index'

  '/p/:publicationId/:publicationSlug?':
    as: 'publication'
    to: (publicationId, publicationSlug) ->
      Session.set 'currentPublicationId', publicationId
      Session.set 'currentPublicationSlug', publicationSlug
      'publication'

  '/u/:personSlug':
    as: 'profile'
    to: (personSlug) ->
      Session.set 'currentPersonSlug', personSlug
      'profile'

  '/about':
    'about'

  '/help':
    'help'

  '/privacy':
    'privacy'

  '/terms':
    'terms'

  '/admin': ->
    Session.set 'adminActive', true
    'admin'

  '*':
    'notfound'

Meteor.Router.beforeRouting = ->
  Session.set 'indexActive', false
  Session.set 'indexHeader', $(window).scrollTop() < $(window).height()
  Session.set 'currentSearchQuery', null
  Session.set 'currentSearchQueryCountPublications', 0
  Session.set 'currentSearchQueryCountPersons', 0
  Session.set 'currentSearchQueryLoading', false
  Session.set 'currentSearchQueryReady', false
  Session.set 'currentSearchLimit', INITIAL_SEARCH_LIMIT
  Session.set 'searchActive', false
  Session.set 'searchFocused', false
  Session.set 'adminActive', false
  Session.set 'currentPublicationId', null
  Session.set 'currentPublicationSlug', null
  Session.set 'currentPublicationProgress', null
  Session.set 'currentPersonSlug', null

  # Overlays are special and we do not clear them while routing

  # Close login buttons dialog box when moving between pages
  Accounts._loginButtonsSession.closeDropdown()

# TODO: Use real parser (arguments can be listed multiple times, arguments can be delimited by ";")
parseQuery = (qs) ->
  query = {}
  for pair in qs.replace('?', '').split '&'
    [k, v] = pair.split('=')
    query[k] = v
  query